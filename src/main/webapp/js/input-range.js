let slider1 = document.querySelector('.sum-range__input');
let current1 = document.querySelector('.sum-range__current');
let max1 = document.querySelector('.sum-range__max');
current1.innerHTML = slider1.value;  
max1.innerHTML = slider1.max;  
slider1.oninput = function() {
    current1.innerHTML = this.value;
}

let slider2 = document.querySelector('.pay-range__input');
let current2 = document.querySelector('.pay-range__current');
let max2 = document.querySelector('.pay-range__max');
current2.innerHTML = slider2.value;  
max2.innerHTML = slider2.max;  
slider2.oninput = function() {
    current2.innerHTML = this.value;
}