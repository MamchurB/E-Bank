let open = document.querySelector('.message__title');
let openCalculate = document.querySelector('.message__title_calculate');
let close = document.querySelector('.popup__close');
let closeCalculate = document.querySelector('.popup__close_calculate');

const bodyContainer = document.body;
const popupContainer = document.querySelector('.popup__wrapper');
const popupContainerCalculate = document.querySelector('.popup__wrapper_calculate');

const valueCalculate = document.getElementById('valueCalculate');

openCalculate.onclick = () => {
    const count = document.getElementById('count').value;
    const destCurrency = document.getElementById('destCurrency').value;
    const sourceCurrency = document.getElementById('sourceCurrency').value;

    calculate(count, destCurrency, sourceCurrency)

    bodyContainer.classList.add('popup_active');
    popupContainerCalculate.classList.add('popup_active');
};

open.onclick = () => {
    bodyContainer.classList.add('popup_active');
    popupContainer.classList.add('popup_active');
};

close.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainer.classList.remove('popup_active');
};
closeCalculate.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainerCalculate.classList.remove('popup_active');
};
function calculate(count, destCurrency, sourceCurrency) {
    $.ajax({
        type : "GET",
        url :  "/exchangecurrency" + "/calculate",
        data:{'count': count, 'sourceCurrency': sourceCurrency, 'destCurrency': destCurrency},
        success : function(data) {
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            valueCalculate.innerText = data;
        }
    });
}