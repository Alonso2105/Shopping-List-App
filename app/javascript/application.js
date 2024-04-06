// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
  const openModalButton = document.getElementById('open-modal-button');
  const modal = document.getElementById('modal');

  openModalButton.addEventListener('click', () => {
    modal.classList.add('is-active');
  });

  modal.addEventListener('click', (event) => {
    if (event.target === modal || event.target.classList.contains('modal-close')) {
      modal.classList.remove('is-active');
    }
  });

  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') {
      modal.classList.remove('is-active');
    }
  });
});


document.addEventListener('turbo:submit-end', (event) => {
  const modal = document.getElementById('modal');
  const [response] = event.detail;

  if (response.success) {
    modal.classList.remove('is-active');
  } else {
    modal.innerHTML = response.turbo_stream[0].data;
    modal.classList.add('is-active');
  }
});