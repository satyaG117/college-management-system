const deleteBtns = document.querySelectorAll('.delete-btn');


function generateLink(e) {
    const id = this.dataset.id;
    const name = this.dataset.name;
    const entity = this.dataset.entity;
    document.querySelector('.user-name').textContent = name;
    const confirmDeleteBtn = document.querySelector('.confirm-delete-btn');
    console.log(entity);
    if (entity === 'student') {
        confirmDeleteBtn.setAttribute('href', `delete-student?id=${id}`);

    } else if (entity === 'faculty') {
        confirmDeleteBtn.setAttribute('href', `delete-faculty?id=${id}`);
    }
}

deleteBtns.forEach(function (btn) {
    btn.addEventListener('click', generateLink);
});