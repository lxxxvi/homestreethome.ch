// Entry point for the build script in your package.json

document.addEventListener("DOMContentLoaded", function(){
  Array.from(document.querySelectorAll('[data-url]')).forEach((element) => {
    element.addEventListener('click', (event) => {
      window.location.href = element.dataset.url;
    });
  });
});
