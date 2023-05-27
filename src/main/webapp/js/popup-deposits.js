let open = document.querySelector('.message__title');
let close = document.querySelector('.popup__close');

const bodyContainer = document.body;
const popupContainer = document.querySelector('.popup__wrapper');

open.onclick = () => {
    bodyContainer.classList.add('popup_active');
    popupContainer.classList.add('popup_active');
};

close.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainer.classList.remove('popup_active');
};
