let open = document.querySelector('.message__title');
let close = document.querySelector('.popup__close');
let openEdit = document.querySelectorAll('.message__title_edit');
let closeEdit = document.querySelector('.popup__close_edit');

const bodyContainer = document.body;
const popupContainer = document.querySelector('.popup__wrapper');
const popupContainerEdit = document.querySelector('.popup__wrapper_edit');

const editId = document.getElementById('id');
const editSourceAccountNumber = document.getElementById('editSourceAccountNumber');
const editTransactionDirectionId = document.getElementById('editTransactionDirectionId');
const editSourceCurrency = document.getElementById('editSourceCurrency');
const editDestinedCurrency = document.getElementById('editDestinedCurrency');
const editDestinedAccountNumber = document.getElementById('editDestinedAccountNumber');
const editBalance = document.getElementById('editBalance');
const editTitle = document.getElementById('editTitle');


open.onclick = () => {
    bodyContainer.classList.add('popup_active');
    popupContainer.classList.add('popup_active');
};

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
        url :  "/transaction/template/byId/" + id,
        success : function(data) {
            //fetchList(type);
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            console.log(data);
            editId.setAttribute('value', data['id']);
            editSourceAccountNumber.setAttribute('value', data['sourceAccountNumber']);
            editTransactionDirectionId.setAttribute('value', data['transactionDirectionId']);
            editSourceCurrency.setAttribute('value', data['sourceCurrency']);
            editDestinedCurrency.setAttribute('value', data['destinedCurrency']);
            editDestinedAccountNumber.setAttribute('value', data['destinedAccountNumber']);
            editBalance.setAttribute('value', data['balance']);
            editTitle.setAttribute('value', data['title']);

        }
    });
}

