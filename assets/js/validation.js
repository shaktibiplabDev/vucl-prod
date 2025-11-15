// Form validation before submission
document.getElementById('updateForm').addEventListener('submit', function(e) {
    const capturedCount = Object.keys(capturedFingers).length;
    const missingCount = document.querySelectorAll('.finger-missing:checked').length;

    if (capturedCount + missingCount < MIN_REQUIRED_FINGERS) {
      e.preventDefault();
      showInlineError('At least 6 fingerprints must be captured or marked as missing');
      return false;
    }

    // Additional field validation
    if (!document.getElementById('full-name').value.trim()) {
      e.preventDefault();
      showInlineError('Name is required', 'full-name-error');
      return false;
    }
    
    if (!document.getElementById('village').value.trim()) {
      e.preventDefault();
      showInlineError('Village is required', 'village-error');
      return false;
    }

    if (!document.getElementById('district').value.trim()) {
      e.preventDefault();
      showInlineError('Village is required', 'district-error');
      return false;
    }

    // Mobile number validation
    const mobileNo = document.getElementById('mobile-no').value;
    if (!/^\d{10}$/.test(mobileNo)) {
      e.preventDefault();
      showInlineError('Mobile number must be 10 digits', 'mobile-no-error');
      return false;
    }

    // Aadhar number validation
    const aadharNo = document.getElementById('aadhar-no').value;
    if (!/^\d{12}$/.test(aadharNo)) {
      e.preventDefault();
      showInlineError('Aadhar number must be 12 digits', 'aadhar-no-error');
      return false;
    }

    // Pin code validation
    const pincode = document.getElementById('pincode').value;
    if (!/^\d{6}$/.test(pincode)) {
      e.preventDefault();
      showInlineError('Pincode must be 6 digits', 'pincoder-error');
      return false;
    }

    if (!document.getElementById('post').value.trim()) {
      e.preventDefault();
      showInlineError('Post is required', 'post-error');
      return false;
    }
});

function showInlineError(message, elementId = 'form-error') {
    let errorElement = document.getElementById(elementId);
    if (!errorElement) {
      errorElement = document.createElement('div');
      errorElement.id = elementId;
      errorElement.className = 'alert alert-danger mt-3';
      document.querySelector('.bs-stepper-content').prepend(errorElement);
    }
    errorElement.textContent = message;
    errorElement.style.display = 'block';

    // Scroll to the error message
    errorElement.scrollIntoView({
      behavior: 'smooth',
      block: 'start'
    });
  }