window.addEventListener('DOMContentLoaded', () => {
    const stepperEl = document.querySelector('.bs-stepper');
    const wizardValidation = document.querySelector('#wizard-validation');

    let currentStep = 0;

    stepperEl.addEventListener('show.bs-stepper', (event) => {
      const nextIndex = Number(event.detail.to);
      let isValid = true;
      
      if (nextIndex > currentStep) {
        isValid = validateCurrentStep();
      }

      if (!isValid) {
        event.preventDefault();
        return;
      }

      currentStep = nextIndex;
    })

    const validateCurrentStep = () => {
      // Get all inputs in the current step
      const currentStepEl = wizardValidation.querySelector('.content.active');
      const inputs = [].slice.call(currentStepEl.querySelectorAll('input, select, textarea'));
      
      let isValid = true;
      
      // Validate each input in the current step
      inputs.forEach(input => {
        if (!input.checkValidity()) {
          input.classList.add('is-invalid');
          isValid = false;
        } else {
          input.classList.remove('is-invalid');
        }
      });
      
      return isValid;
    };
});