// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener('DOMContentLoaded', function() {
  const objectiveInput = document.querySelector('[name="context[objective]"]');
  const budgetGroup = document.getElementById('budgetGroup');
  const budgetSelect = document.querySelector('[name="context[budget]"]');
  const submitButtonGroup = document.getElementById('submitButtonGroup');

  let budgetVisible = false;
  let budgetSelected = false;

  function showElement(element) {
    element.classList.remove('hidden');
    element.classList.add('fade-in');
    setTimeout(() => element.classList.remove('fade-in'), 300);
  }

  function hideElement(element) {
    element.classList.add('hidden');
  }

  objectiveInput.addEventListener('input', function() {
    const text = this.value.trim();

    if (text.length >= 10 && !budgetVisible) {
      showElement(budgetGroup);
      budgetVisible = true;
    }

    if (text.length === 0) {
      hideElement(submitButtonGroup);
      budgetSelected = false;
    }
  });

  budgetSelect.addEventListener('change', function() {
    if (this.value !== '') {
      showElement(submitButtonGroup);
      budgetSelected = true;
    } else {
      hideElement(submitButtonGroup);
      budgetSelected = false;
    }
  });
});
