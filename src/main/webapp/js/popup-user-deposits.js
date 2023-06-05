let open = document.querySelectorAll('.message__title');
let close = document.querySelector('.popup__close');

const bodyContainer = document.body;
const popupContainer = document.querySelector('.popup__wrapper');

const idTableContainer = document.getElementById('id');
const balancePaidTableContainer = document.getElementById('startBalance');
const installmentAmountTableContainer = document.getElementById('currentBalance');
const totalBalanceTableContainer = document.getElementById('investmentType');
const currencyTableContainer = document.getElementById('creationDate');


open.forEach(element => element.onclick = () => {

        detailDeposit(element.getAttribute("value"));
        console.log(element.getAttribute("value"));
        bodyContainer.classList.add('popup_active');
        popupContainer.classList.add('popup_active');
    }
);

close.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainer.classList.remove('popup_active');
};

function detailDeposit(id) {
    $.ajax({
        type : "POST",
        url :  "/investments" + "/byId/" + id,
        success : function(data) {
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            console.log(data);
            idTableContainer.innerText =  data['id'];
            balancePaidTableContainer.innerText =  data['startBalance'];
            installmentAmountTableContainer.innerText =  data['currentBalance'];
            totalBalanceTableContainer.innerText =  data['investmentType']['investmentStatus'];
            currencyTableContainer.innerText =  data['creationDate'];


        }
    });
}
