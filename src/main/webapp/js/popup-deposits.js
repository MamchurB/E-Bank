let open = document.querySelectorAll('.message__title');
let close = document.querySelector('.popup__close');

const bodyContainer = document.body;
const popupContainer = document.querySelector('.popup__wrapper');

const idTableContainer = document.getElementById('id');
const startBalanceTableContainer = document.getElementById('startBalance');
const currentBalanceTableContainer = document.getElementById('currentBalance');
const investmentTypeTableContainer = document.getElementById('investmentType');
const creationDateTableContainer = document.getElementById('creationDate');

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
        url :  "/investments" + "/byId/" + id,
        success : function(data) {
            //fetchList(type);
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            idTableContainer.innerText =  data['id'];
            startBalanceTableContainer.innerText =  data['startBalance'];
            currentBalanceTableContainer.innerText =  data['currentBalance'];
            investmentTypeTableContainer.innerText =  data['investmentType']['investmentStatus'];
            creationDateTableContainer.innerText =  data['creationDate'];
            document.getElementById('close_deposit').action = "/investments/close-deposit/" + data['id'];
        }
    });
}
