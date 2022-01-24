const data_doughnut = {
labels: [
 '진행',
 '완료',
 '대기'
],
datasets: [{
 label: 'My First Dataset',
 data: [3, 5, 3],
 backgroundColor: [
   '#3CB043',
   'rgb(54, 162, 235)',
   'rgb(255, 205, 86)'
 ],
 hoverOffset: 4,
 options: {legend : {position : 'right'}}
}]
};

const config_doughnut = {
type: 'doughnut',
data: data_doughnut,
};
const custom_doughnutChart = new Chart(
document.getElementById('custom_doughnutChart'),
config_doughnut
);