function my-dash_doughnut() {
	if(typeof(Chart) === 'undefined'){
		return;
	}
    console.log('my-dash_doughnut');

    if($('.canvasDoughnut').length){
    	var chart_doughnut_settings = {
			type: 'doughnut',
			tooltipFillColor: "rgba(51, 51, 51, 0.55)",
			data: {
				labels: [
					"대기중",
					"진행중",
					"진행완료"
				],
				datasets: [{
					data: [
						15,
						30,
						55
					],
                    backgroundColor: [
                        "#ffc107",
                        "#007bff",
                        "#28a745"
                    ],
                    hoverBackgroundColor: [
                        "#ffd75f",
                        "#5aaaff",
                        "#74c687"
                    ]
                }]
            },
            options: {
                legend: false,
                responsive: false
            }
        }

        $('.canvasDoughnut').each(function(){
            var chart_element = $(this);
            var chart_doughnut = new Chart(chart_element, chart_doughnut_settings);
        });
    }
}