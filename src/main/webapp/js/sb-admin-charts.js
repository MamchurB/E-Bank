
// -- Pie Chart Example
var bcLabels = $("#bcLabels").val();
console.log(bcLabels);
bcLabels = bcLabels.replace("[","")
    .replace("]","")
    .split(",");

var bcPercents = $("#bcPercents").val().trim();

console.log(bcPercents);
bcPercents = bcPercents.replace("[","")
    .replace("]","")
    .split(",");

var ctx2 = document.getElementById("myPieChart");

var myPieChart = new Chart(ctx2, {
  type: 'pie',
  data: {
    labels: bcLabels,
    datasets: [{
      data: bcPercents,
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)'
      ],
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)'
      ],
    }],
  },options: {
    events: []
  }
});
