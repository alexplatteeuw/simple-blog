const initCharts = () => {
  const uniqViewsChart = document.getElementById('uniqViews');
  const viewsChart = document.getElementById('views');
  const options = {
    scales: { yAxes: [{ ticks: { beginAtZero: true } }] },
    legend: { display: false } 
  }
  if (uniqViewsChart) { fillChart(uniqViewsChart, options) };
  if (viewsChart) { fillChart(viewsChart, options) };
}

const fillChart = (chart, options) => {
  new Chart(chart, {
    type: 'line',
    data: {
      labels: JSON.parse(chart.dataset.dates),
      datasets: [{
        data: JSON.parse(chart.dataset.views),
        borderWidth: 1
      }]   
    },
    options: options
  })
}

export { initCharts };
