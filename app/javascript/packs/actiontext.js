const initActionText = () => {
  document.addEventListener('click', (event) => {
    let element = event.target.closest('.paragraph-content')
    if (!element) return;

    element.classList.add('d-none')
    element.nextElementSibling.classList.remove('d-none')
  })

  document.addEventListener('click', (event) => {
    if (!event.target.matches('.cancel')) return;

    event.preventDefault();

    let element = event.target.closest('.paragraph-form')

    element.classList.add('d-none')
    element.previousElementSibling.classList.remove('d-none')
  })
}

export { initActionText };
