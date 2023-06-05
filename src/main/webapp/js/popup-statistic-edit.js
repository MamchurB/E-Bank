let open = document.querySelectorAll('.popup_click');
let close = document.querySelector('.popup__close');
let openEdit = document.querySelectorAll('.message__title_edit');
let closeEdit = document.querySelector('.popup__close_edit');

const bodyContainer = document.body;
const popupContainer = document.querySelector('.popup__wrapper');
const popupContainerEdit = document.querySelector('.popup__wrapper_edit');

const idCurrency = document.getElementById('idCurrency');
const name = document.getElementById('name');
const exchangeRate = document.getElementById('exchangeRate');

const idAcc = document.getElementById('id');
const transactionComission = document.getElementById('transactionComission');
const exchangeCurrencyCommission = document.getElementById('exchangeCurrencyCommission');


open.forEach(element => element.onclick = () => {
    editCurrency(element.getAttribute("value"));
    bodyContainer.classList.add('popup_active');
    popupContainer.classList.add('popup_active');
    }
);

close.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainer.classList.remove('popup_active');
};
openEdit.forEach(element => element.onclick = () => {
        editAccount(element.getAttribute("value"));
        console.log(element.getAttribute("value"));
        bodyContainer.classList.add('popup_active');
        popupContainerEdit.classList.add('popup_active');
    }
);
closeEdit.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainerEdit.classList.remove('popup_active');
};

function editAccount(id) {
    $.ajax({
        type : "POST",
        url :  "/accountEdit/byId/" + id,
        success : function(data) {
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            console.log(data);
            idAcc.setAttribute('value', data['id']);
            transactionComission.setAttribute('value', data['transactionComission']);
            exchangeCurrencyCommission.setAttribute('value', data['exchangeCurrencyCommission']);


        }
    });
}
function editCurrency(id) {
    $.ajax({
        type : "POST",
        url :  "/currentEdit/byId/" + id,
        success : function(data) {
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            console.log(data);
            idCurrency.setAttribute('value', data['id'].toString());
            name.setAttribute('value', data['name']);
            exchangeRate.setAttribute('value', data['exchangeRate']);

        }
    });
}
