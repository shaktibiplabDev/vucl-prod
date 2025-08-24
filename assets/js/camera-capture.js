document.addEventListener('DOMContentLoaded', () => {
    const video = document.getElementById('camera');
    const canvas = document.getElementById('photo-canvas');
    const capturePreview = document.getElementById('capture-preview');
    const webcam = new Webcam(video, canvas);
    const cameraModal = new bootstrap.Modal(document.getElementById('cameraModal'));
    const type = 'jpeg';

    cameraModal._element.addEventListener('hidden.bs.modal', () => {
        webcam.stop();
        video.classList.remove('d-none');
        capturePreview.classList.add('d-none');
    
        document.getElementById('save-photo-btn').classList.add('d-none');
        document.getElementById('capture-retry').classList.add('d-none');
        document.getElementById('capture-btn').classList.remove('d-none');
        document.getElementById('capture-close').classList.remove('d-none');
    });
    
    document.getElementById('capture-photo').addEventListener('click', () => {
      cameraModal.show();
    
      webcam.start()
        .catch(err => {
          console.log(err);
        });
    });
    
    document.getElementById('capture-btn').addEventListener('click', () => {
      webcam.capture(type);
      video.classList.add('d-none');
      capturePreview.src = webcam.picture;
      capturePreview.classList.remove('d-none');
    
      document.getElementById('save-photo-btn').classList.remove('d-none');
      document.getElementById('capture-retry').classList.remove('d-none');
      document.getElementById('capture-btn').classList.add('d-none');
      document.getElementById('capture-close').classList.add('d-none');
    });
    
    document.getElementById('capture-retry').addEventListener('click', () => {
      video.classList.remove('d-none');
      capturePreview.classList.add('d-none');
      
      document.getElementById('save-photo-btn').classList.add('d-none');
      document.getElementById('capture-retry').classList.add('d-none');
      document.getElementById('capture-btn').classList.remove('d-none');
      document.getElementById('capture-close').classList.remove('d-none');
    });
    
    document.getElementById('save-photo-btn').addEventListener('click', () => {
      const base64 = webcam.picture;
      const file = base64ToFile(base64, `child-photo.${type}`);
      const fileInput = document.getElementById('child-photo');
      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          setFileInput(fileInput, file);
          document.getElementById('photo-preview').src = e.target.result;
        };
        reader.readAsDataURL(file);
      }
      document.getElementById('photo-preview').src = webcam.picture;
      cameraModal.hide();
    });
})