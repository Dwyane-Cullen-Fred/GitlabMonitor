var team = $("#team").text();
var startDay = $("#startDay").text();
var endDay = $("#endDay").text();
function projectMember(team,startDay,endDay){
	//repositories per user
	var url = "/GitlabMonitor/project/teammember"
		$.ajax(url, {
			type : 'POST',
			data : {
				"team" : team,
				"dayStart": startDay,
				"dayEnd": endDay,
			},
			success : function(data, textStatus) {
				$('#chart').highcharts({
					chart: {
			            type: 'column'
			        },
			        title: {
			            text: 'Team Member'
			        },
			        subtitle: {
			            text: 'gitlab.com'
			        },
			        xAxis: {
			            categories: data.statistics
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: 'Count'
			            }
			        },
			        tooltip: {
			            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
			            footerFormat: '</table>',
			            shared: true,
			            useHTML: true
			        },
			        plotOptions: {
			            column: {
			                pointPadding: 0.2,
			                borderWidth: 0
			            }
			        },
			        series: [{
			            name: data.stu0,
			            data: data.data0

			        }, {
			            name: data.stu1,
			            data: data.data1

			        }, {
			            name: data.stu2,
			            data: data.data2

			        }, {
			            name: data.stu3,
			            data: data.data3
			        }, {
			            name: data.stu4,
			            data: data.data4
			        }, {
			            name: data.stu5,
			            data: data.data5
			        }, {
			            name: data.stu6,
			            data: data.data6
			        }, {
			            name: data.stu7,
			            data: data.data7
			        }, {
			            name: data.stu8,
			            data: data.data8
			        }]
			    });}
			});}
