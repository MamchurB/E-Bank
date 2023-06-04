let open = document.querySelectorAll('.popup_click');
let close = document.querySelector('.popup__close');
let openEdit = document.querySelectorAll('.message__title_edit');
let closeEdit = document.querySelector('.popup__close_edit');

const bodyContainer = document.body;
const popupContainer = document.querySelector('.popup__wrapper');
const popupContainerEdit = document.querySelector('.popup__wrapper_edit');

const editId = document.getElementById('id');
const editIdentifier = document.getElementById('identifier');
const editEmail = document.getElementById('email');
const editName = document.getElementById('name');
const editSurname = document.getElementById('surname');
const editPhone = document.getElementById('phone');
const editCity = document.getElementById('city');
const editAddressId = document.getElementById('addressId');

const detailIdentifier = document.getElementById('detailIdentifier');
const detailEmail = document.getElementById('detailEmail');
const detailName = document.getElementById('detailName');
const detailCity = document.getElementById('detailCity');

open.forEach(element => element.onclick = () => {
        template(element.getAttribute("value"));
        bodyContainer.classList.add('popup_active');
        popupContainer.classList.add('popup_active');
    }
);

close.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainer.classList.remove('popup_active');
};
openEdit.forEach(element => element.onclick = () => {
        editTemplate(element.getAttribute("value"));
        console.log(element.getAttribute("value"));
        bodyContainer.classList.add('popup_active');
        popupContainerEdit.classList.add('popup_active');
    }
);
closeEdit.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainerEdit.classList.remove('popup_active');
};

function editTemplate(id) {
    $.ajax({
        type : "POST",
        url :  "/user/byId/" + id,
        success : function(data) {
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            console.log(data);
            editAddressId.setAttribute('value', data['address']['id']);
            editId.setAttribute('value', data['id']);
            editIdentifier.setAttribute('value', data['identifier']);
            editEmail.setAttribute('value', data['email']);
            editName.setAttribute('value', data['address']['name']);
            editSurname.setAttribute('value', data['address']['surname']);
            editCity.setAttribute('value', data['address']['city']);
            editPhone.setAttribute('value', data['address']['phoneNumber']);

        }
    });
}

function template(id) {
    $.ajax({
        type : "POST",
        url :  "/user/byId/" + id,
        success : function(data) {
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            console.log(data);
            detailIdentifier.innerText = data['identifier'];
            detailEmail.innerText = data['email'];
            detailName.innerText = data['address']['name'] + " " +  data['address']['surname'];
            detailCity.innerText = data['address']['city'];


        }
    });
}

