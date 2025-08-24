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
  
    errorElement.scrollIntoView({
      behavior: 'smooth',
      block: 'start'
    });
}