let l0HttpServiceAvailable = false;
let activeXAvailable = false;
let captureInProgress = false;
let currentFingerId = null;
let capturedFingers = {};
let deviceConnected = false;
let deviceRetryCount = 0;
const MAX_RETRIES = 3;
const MIN_REQUIRED_FINGERS = 6;
const CAPTURE_TIMEOUT = 30000; // 30 seconds

// Initialize on page load
window.addEventListener('DOMContentLoaded', async () => {
  await initializeDeviceConnection();
  setupEventListeners();
  updateServiceStatusPanel();
});

async function initializeDeviceConnection() {
  try {
    await connectWithRetry();
    if (!deviceConnected) {
      showInlineError('Fingerprint device not found. Please connect your device and refresh the page.');
    }
  } catch (error) {
    console.error('Initialization error:', error);
    showInlineError('Failed to initialize fingerprint device: ' + error.message);
  }
}

async function connectWithRetry() {
  while (deviceRetryCount < MAX_RETRIES && !deviceConnected) {
    deviceRetryCount++;
    await Promise.all([
      checkL0Service(),
      checkActiveXSupport()
    ]);
    if (!deviceConnected) {
      await new Promise(resolve => setTimeout(resolve, 1000));
    }
  }
}

function setupEventListeners() {
  // Form submission validation
  document.getElementById('updateForm')?.addEventListener('submit', function(e) {
    validateFormSubmission(e);
  });

  // Hand missing checkboxes
  $('#left-hand-missing, #right-hand-missing').change(function() {
    handleHandMissingChange(this);
  });

  // Individual finger missing checkboxes
  $('.finger-missing').change(function() {
    handleFingerMissingChange(this);
  });

  // Fingerprint capture buttons
  $('.fingerprint-btn').click(function() {
    handleFingerprintCaptureClick(this);
  });

  // Device connection button
  $('#connect-device').click(function() {
    handleDeviceConnectClick(this);
  });
}

function validateFormSubmission(e) {
  const capturedCount = Object.keys(capturedFingers).length;
  const missingCount = document.querySelectorAll('.finger-missing:checked').length;

  if (capturedCount + missingCount < MIN_REQUIRED_FINGERS) {
    e.preventDefault();
    showInlineError(`At least ${MIN_REQUIRED_FINGERS} fingerprints must be captured or marked as missing`);
    return false;
  }

  ensureMissingFingersInput();
}

function ensureMissingFingersInput() {
  if (!document.getElementById('missing-fingers-input')) {
    const missingFingers = [];
    document.querySelectorAll('.finger-missing:checked').forEach(el => {
      missingFingers.push(el.dataset.fingerId);
    });

    const hiddenInput = document.createElement('input');
    hiddenInput.type = 'hidden';
    hiddenInput.id = 'missing-fingers-input';
    hiddenInput.name = 'missing_fingers';
    hiddenInput.value = missingFingers.join(',');
    document.getElementById('updateForm').appendChild(hiddenInput);
  }
}

function handleHandMissingChange(checkbox) {
  const isLeftHand = $(checkbox).attr('id') === 'left-hand-missing';
  const fingerIds = isLeftHand ? ['1', '2', '3', '4', '5'] : ['6', '7', '8', '9', '10'];

  fingerIds.forEach(fingerId => {
    const $missingCheckbox = $(`.finger-missing[data-finger-id="${fingerId}"]`);
    const $captureBtn = $(`.fingerprint-btn[data-finger-id="${fingerId}"]`);
    const $preview = $(`.finger-preview[data-finger-id="${fingerId}"]`);

    $missingCheckbox.prop('disabled', checkbox.checked);
    $captureBtn.prop('disabled', checkbox.checked);

    if (checkbox.checked) {
      $missingCheckbox.prop('checked', true);
      $preview.removeClass('show');
      delete capturedFingers[fingerId];
    }
  });

  updateMissingFingersInput();
}

function handleFingerMissingChange(checkbox) {
  const fingerId = $(checkbox).data('finger-id');
  const $captureBtn = $(`.fingerprint-btn[data-finger-id="${fingerId}"]`);
  const $preview = $(`.finger-preview[data-finger-id="${fingerId}"]`);

  if ($(checkbox).is(':checked')) {
    $captureBtn.prop('disabled', true);
    $preview.removeClass('show');
    delete capturedFingers[fingerId];
  } else {
    $captureBtn.prop('disabled', false);
  }
  updateMissingFingersInput();
}

function handleFingerprintCaptureClick(button) {
  if (captureInProgress) return;

  if (!deviceConnected) {
    showInlineError('Please connect your fingerprint device first');
    return;
  }

  const finger = $(button).data('finger');
  const fingerId = $(button).data('finger-id');
  const $btn = $(button);

  if ($(`#missing-${finger.toLowerCase().replace(' ', '-')}`).is(':checked')) {
    return;
  }

  currentFingerId = fingerId;
  $btn.html('<i class="icon-base ti tabler-circle-dotted icon-spin me-2"></i> Scanning...')
     .prop('disabled', true);

  captureFingerprint(finger, fingerId, $btn);
}

async function handleDeviceConnectClick(button) {
  const $btn = $(button);
  $btn.html('<i class="icon-base ti tabler-circle-dotted icon-spin me-2"></i> Connecting...')
     .prop('disabled', true);

  try {
    await connectWithRetry();
    updateServiceStatusPanel();
  } catch (error) {
    showInlineError('Failed to connect: ' + error.message);
  } finally {
    $btn.html('<i class="icon-base ti tabler-plug-connected me-2"></i> Connect Device')
       .prop('disabled', false);
  }
}

async function captureFingerprint(fingerName, fingerId, $button) {
  captureInProgress = true;
  const $preview = $(`.finger-preview[data-finger-id="${fingerId}"]`);
  const canvas = $preview.find('.finger-canvas')[0];
  const $quality = $preview.find('.finger-quality');
  const ctx = canvas.getContext('2d');

  ctx.clearRect(0, 0, canvas.width, canvas.height);
  $quality.text('');

  try {
    const timeoutPromise = new Promise((_, reject) => 
      setTimeout(() => reject(new Error('Capture timed out')), CAPTURE_TIMEOUT)
    );

    const captureData = await Promise.race([
      captureL0_MFS100(),
      timeoutPromise
    ]);

    if (captureData?.BitmapData) {
      processSuccessfulCapture(captureData, fingerId, fingerName, $button, $preview, canvas, $quality);
    } else {
      throw new Error('Invalid fingerprint data received');
    }
  } catch (error) {
    handleCaptureError(error, $button);
  } finally {
    captureInProgress = false;
  }
}

function processSuccessfulCapture(captureData, fingerId, fingerName, $button, $preview, canvas, $quality) {
  capturedFingers[fingerId] = {
    name: fingerName,
    bmpData: captureData.BitmapData,
    quality: captureData.Quality,
    timestamp: new Date().toISOString()
  };

  $(`#fingerprint-data-${fingerId}`).val(captureData.BitmapData);

  const img = new Image();
  img.onload = () => {
    const ctx = canvas.getContext('2d');
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
    updateQualityIndicator($quality, captureData.Quality);
    $preview.addClass('show');
  };
  img.src = `data:image/bmp;base64,${captureData.BitmapData}`;

  $button.removeClass('btn-outline-primary')
    .addClass('btn-success')
    .html('<i class="icon-base ti tabler-check me-2"></i> Captured')
    .prop('disabled', false);

  addRecaptureButton(fingerId, $button);
}

function updateQualityIndicator($quality, qualityScore) {
  $quality.text(`Quality: ${qualityScore}`);

  if (qualityScore < 60) {
    $quality.removeClass('good fair').addClass('low')
      .append(' (Poor - Recapture)');
  } else if (qualityScore < 80) {
    $quality.removeClass('good low').addClass('fair')
      .append(' (Fair - Recapture recommended)');
  } else {
    $quality.removeClass('low fair').addClass('good');
  }
}

function addRecaptureButton(fingerId, $button) {
  const $recaptureBtn = $(`
    <button type="button" class="btn btn-warning btn-sm btn-recapture ms-2" data-finger-id="${fingerId}">
      <i class="icon-base ti tabler-refresh me-1"></i> Recapture
    </button>
  `);

  $button.after($recaptureBtn);

  $recaptureBtn.click(() => {
    resetFingerCapture(fingerId);
    $(`.fingerprint-btn[data-finger-id="${fingerId}"]`).click();
  });
}

function resetFingerCapture(fingerId) {
  delete capturedFingers[fingerId];
  $(`.finger-preview[data-finger-id="${fingerId}"]`).removeClass('show');
  
  const $mainBtn = $(`.fingerprint-btn[data-finger-id="${fingerId}"]`);
  $mainBtn.removeClass('btn-success')
    .addClass('btn-outline-primary')
    .html('<i class="icon-base ti tabler-fingerprint"></i> Capture')
    .prop('disabled', false);

  $(`.btn-recapture[data-finger-id="${fingerId}"]`).remove();
}

function handleCaptureError(error, $button) {
  console.error('Capture error:', error);
  const errorMessage = error.message.includes('timed out') ? 
    'Device response timed out. Please try again.' : 
    'Failed to capture fingerprint. Please try again.';
  
  $button.html('<i class="icon-base ti tabler-fingerprint me-2"></i> Capture')
    .prop('disabled', false);
  
  showInlineError(errorMessage);
}

async function captureL0_MFS100() {
  if (l0HttpServiceAvailable) {
    try {
      return await captureViaHttpService();
    } catch (httpError) {
      console.warn('HTTP capture failed:', httpError);
    }
  }

  if (activeXAvailable) {
    try {
      return await captureViaActiveX();
    } catch (activeXError) {
      console.error('ActiveX capture failed:', activeXError);
      throw activeXError;
    }
  }

  throw new Error('No available capture methods. Please check device connection.');
}

async function captureViaHttpService() {
  const serviceUrl = window.location.protocol === 'https:' ?
    'https://localhost:8003/mfs100/capture' :
    'http://localhost:8004/mfs100/capture';

  const response = await fetch(serviceUrl, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      Quality: 60,
      TimeOut: 20,
      Format: "BMP"
    })
  });

  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`);
  }

  const data = await response.json();

  if (data.ErrorCode === "0") {
    return data;
  } else {
    throw new Error(data.ErrorDescription || 'Capture failed');
  }
}

function captureViaActiveX() {
  return new Promise((resolve, reject) => {
    try {
      const mfs = new ActiveXObject("Mantra.MFS100");
      mfs.Init();
      const res = mfs.AutoCapture(15, false, true);
      mfs.Uninit();

      if (res.ErrorCode === "0") {
        resolve({
          BitmapData: res.BMPBase64,
          Quality: res.Quality,
          ErrorCode: res.ErrorCode
        });
      } else {
        reject(new Error(res.ErrorDescription || 'Capture failed'));
      }
    } catch (err) {
      reject(err);
    }
  });
}

async function checkL0Service() {
  const serviceStatus = document.getElementById('serviceStatus');
  
  try {
    // Try HTTP first (port 8004)
    const httpResponse = await fetch('http://localhost:8004/mfs100/info', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    });

    if (httpResponse.ok) {
      l0HttpServiceAvailable = true;
      deviceConnected = true;
      serviceStatus.textContent = 'Connected to MFS100 L0 Device (HTTP port 8004)';
      serviceStatus.className = 'status-panel status-success';
      return;
    }
  } catch (httpError) {
    console.log('HTTP service not available on port 8004');
  }

  try {
    // Try HTTPS (port 8003) if HTTP failed
    const httpsResponse = await fetch('https://localhost:8003/mfs100/info', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    });

    if (httpsResponse.ok) {
      l0HttpServiceAvailable = true;
      deviceConnected = true;
      serviceStatus.textContent = 'Connected to MFS100 L0 Device (HTTPS port 8003)';
      serviceStatus.className = 'status-panel status-success';
      return;
    }
  } catch (httpsError) {
    console.log('HTTPS service not available on port 8003');
  }

  l0HttpServiceAvailable = false;
  if (!activeXAvailable) {
    deviceConnected = false;
    serviceStatus.textContent = 'MFS100 L0 Device: Not connected';
    serviceStatus.className = 'status-panel status-error';
  }
}

function checkActiveXSupport() {
  try {
    if (typeof ActiveXObject !== 'undefined') {
      try {
        new ActiveXObject("Mantra.MFS100");
        activeXAvailable = true;
        deviceConnected = true;
      } catch (e) {
        activeXAvailable = false;
      }
    } else {
      activeXAvailable = false;
    }
  } catch (e) {
    activeXAvailable = false;
  }
}

function updateServiceStatusPanel() {
  const statusPanel = document.getElementById('serviceStatus');

  if (deviceConnected) {
    let connectionMethod = '';
    if (l0HttpServiceAvailable) connectionMethod = 'HTTP Service';
    if (activeXAvailable) connectionMethod = 'ActiveX';

    statusPanel.innerHTML = `<strong>Connected to Device!</strong> Connection method: ${connectionMethod}`;
    statusPanel.className = 'status-panel status-success';
  } else {
    statusPanel.innerHTML = `<strong>Device Not Connected:</strong> Please connect your MFS100 device and try again`;
    statusPanel.className = 'status-panel status-error';
  }
}

function updateMissingFingersInput() {
  const missingFingers = [];
  document.querySelectorAll('.finger-missing:checked').forEach(el => {
    missingFingers.push(el.dataset.fingerId);
  });
  
  let input = document.getElementById('missing-fingers-input');
  if (!input) {
    input = document.createElement('input');
    input.type = 'hidden';
    input.id = 'missing-fingers-input';
    input.name = 'missing_fingers';
    document.getElementById('updateForm').appendChild(input);
  }
  input.value = missingFingers.join(',');
}