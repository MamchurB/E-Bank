let openAccount = document.querySelectorAll('.message__title_account');
let openDeposit = document.querySelectorAll('.message__title_deposit');

let closeAccount = document.querySelector('.popup__close_account');
let closeDeposit = document.querySelector('.popup__close_deposit');

const bodyContainer = document.body;
const popupContainerAccount = document.querySelector('.popup__wrapper_account');
const popupContainerDeposit = document.querySelector('.popup__wrapper_deposit');

const idTableContainer = document.getElementById('id');
const numberTableContainer = document.getElementById('number');
const saldoTableContainer = document.getElementById('saldo');
const bankAccountTypeTableContainer = document.getElementById('bankAccountType');
const transactionComissionTableContainer = document.getElementById('transactionComission');
const exchangeCurrencyCommissionTableContainer = document.getElementById('exchangeCurrencyCommission');

openAccount.forEach(element => element.onclick = () => {

    detail(element.getAttribute("value"));
    console.log(element.getAttribute("value"));
    bodyContainer.classList.add('popup_active');
    popupContainerAccount.classList.add('popup_active');
}
);

openDeposit.forEach(element => element.onclick = () => {

        detail(element.getAttribute("value"), "deposit");
        console.log(element.getAttribute("value"));
        bodyContainer.classList.add('popup_active');
        popupContainerDeposit.classList.add('popup_active');
    }
);

closeAccount.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainerAccount.classList.remove('popup_active');
};

closeDeposit.onclick = () => {
    bodyContainer.classList.remove('popup_active');
    popupContainerDeposit.classList.remove('popup_active');
};

function detail(id) {
    $.ajax({
        type : "POST",
        url :  "/investments/employee/account"  +  "/byId/" + id,
        success : function(data) {
            //fetchList(type);
            toastr.success(data.message, "Notification", {
                closeButton:true
            });
            console.log(data);
            idTableContainer.innerText =  data['id'];
            numberTableContainer.innerText =  data['number'];
            saldoTableContainer.innerText =  listSaldoToString(data['saldos']);
            bankAccountTypeTableContainer.innerText =  data['bankAccType']['bankAccountType'];
            transactionComissionTableContainer.innerText =  data['bankAccType']['transactionComission'];
            exchangeCurrencyCommissionTableContainer.innerText =  data['bankAccType']['exchangeCurrencyCommission'];
        }
    });
}

function listSaldoToString(data){
    let res = "";
    data.forEach(function (d) {
        res += d.currencyType.name + ":" + d['balance'] + " ";
    });
    return res;
}
