window.addEventListener('DOMContentLoaded', async () => {
    // Initialize stepper
    const verticalIconsStepper = document.querySelector('.bs-stepper'),
      verticalIconsStepperInst = new Stepper(verticalIconsStepper, {
        linear: false
      });

    // Next button - simple navigation without validation
    verticalIconsStepper.querySelector('.btn-next').addEventListener('click', () => {
      currentStep++;
      verticalIconsStepperInst.next();
    });

    // Previous button - simple navigation
    verticalIconsStepper.querySelector('.btn-prev').addEventListener('click', () => {
      currentStep--;
      verticalIconsStepperInst.previous();
    });
  });