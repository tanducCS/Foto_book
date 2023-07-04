items = document.querySelectorAll(".list-items__item .card .item__images img")
const myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {})
imageOfModal = document.querySelector('#exampleModal .modal-body img')

console.log(items)

items.forEach(item => {
    item.addEventListener('click', () => {

        imageOfModal.src = item.src;

        myModal.show();
    })
})