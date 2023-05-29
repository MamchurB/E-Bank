let open = document.querySelectorAll('.message__title');
let close = document.querySelector('.popup__close');

const bodyContainer = document.body;
const popupContainer = document.querySelector('.popup__wrapper');

const idTableContainer = document.getElementById('id');
const balancePaidTableContainer = document.getElementById('balancePaid');
const installmentAmountTableContainer = document.getElementById('installmentAmount');
const totalBalanceTableContainer = document.getElementById('totalBalance');
const currencyTableContainer = document.getElementById('currency');
const creditStatusTableContainer = document.getElementById('creditStatus');

open.forEach(element => element.onclick = () => {

    detailCredit(element.getAttribute("value"));
    console.log(element.getAttribute("value"));
    bodyContainer.classList.add('popup_active');
    popupContainer.classList.add('popup_active');
}
);

close.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainer.classList.remove('popup_active');
};

function detailCredit(id) {
    $.ajax({
        type : "POST",
        url :  "/credits" + "/byId/" + id,
        success : function(data) {
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            idTableContainer.innerText =  data['id'];
            balancePaidTableContainer.innerText =  data['balancePaid'];
            installmentAmountTableContainer.innerText =  data['installmentAmount'];
            totalBalanceTableContainer.innerText =  data['totalBalance'];
            currencyTableContainer.innerText =  data['currency'];
            creditStatusTableContainer.innerText =  data['creditStatus'];

        }
    });
}
