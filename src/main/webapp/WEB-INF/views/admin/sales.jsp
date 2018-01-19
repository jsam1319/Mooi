
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<head>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-select.css" />



<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="/resources/js/moment.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="/resources/js/bootstrap-select.js"></script>

<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
  font-size: 11px;
}

.amcharts-pie-slice {
  transform: scale(1);
  transform-origin: 50% 50%;
  transition-duration: 0.3s;
  transition: all .3s ease-out;
  -webkit-transition: all .3s ease-out;
  -moz-transition: all .3s ease-out;
  -o-transition: all .3s ease-out;
  cursor: pointer;
  box-shadow: 0 0 30px 0 #000;
}

.amcharts-pie-slice:hover {
  transform: scale(1.1);
  filter: url(#shadow);
}							

.dropdown-toggle {
	height : 45px;
	font-size: 14px; 
	line-height: 18px; 
	text-transform: uppercase; 
	font-weight: 700; 
	color: #fff; 
	border: 2px #262626 solid; 
	background: #262626; 
	letter-spacing: 2px;
	transition : all 0.15s ease-out;
}
.dropdown-toggle:hover {
	background: #fff; 
	color: #262626;
}
</style>



<script>
$(document).ready(function () {
	var start = moment().subtract(29, 'days');
	var end = moment();
	
	$("#refresh").click(function() {
		refreshChart();
	})
	
	function cb(startDate, endDate) {
		start = startDate;
		end = endDate;
			   
		$('#reportrange span').html(startDate.format('YYYY년 MM월 D일 ') + ' - ' + endDate.format('YYYY년 MM월 D일 '));
	}
	
	$('#reportrange').daterangepicker({
	    startDate: start,
	    endDate: end,
     	ranges: {
	       '오늘': [moment(), moment()],
	       '어제': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
    	   '지난 7 일': [moment().subtract(6, 'days'), moment()],
	       '지난 30 일': [moment().subtract(29, 'days'), moment()],
	       '이번 달': [moment().startOf('month'), moment().endOf('month')],
	       '지난 달': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	    },
	    'opens' : 'center',
	    "locale": {
	        "format": "YYYY/MM/DD",
	        "separator": " - ",
	        "applyLabel": "적용",
	        "cancelLabel": "취소",
	        "fromLabel": "부터",
	        "toLabel": "까지",
	        "customRangeLabel": "임의선택",
	        "weekLabel": "주",
	        "daysOfWeek": [
	            "일",
	            "월",
	            "화",
	            "수",
	            "목",
	            "금",
	            "토"
	        ],
	        "monthNames": [
	            "1월",
	            "2월",
	            "3월",
	            "4월",
	            "5월",
	            "6월",
	            "7월",
	            "8월",
	            "9월",
	            "10월",
	            "11월",
	            "12월"
	        ],
	        "firstDay": 1
	    }
	}, cb);

	cb(start, end);
	
	var chart;
	var list;
	
	$.ajax({
		url : "/statis",
		dataType : "json",
		async : false,
		data : {
			start : start.format("YYYY/MM/DD"),
			end : end.format("YYYY/MM/DD")
		},
		success : function(data) {
			list = data.list;
			chartObj = {
				valueField : "sales",
				valueText : "[[value]] 원",
			}
			
			chart = makeChart(chartObj);
		}
	})
	
	function refreshChart() {
		chart.clear();
		
		var type = $(".selectpicker").val();
		
		switch(type) {
		case '판매량':
			chartObj = {
				valueField : "volume",
				valueText : "[[value]] 개",
			}
			break;
		case '매출액':
			chartObj = {
				valueField : "sales",
				valueText : "[[value]] 원",
			}
			break;
		case '순이익':
			chartObj = {
				valueField : "income",
				valueText : "[[value]] 원",
			}
			break;
		}
		
		$.ajax({
			url : "/statis",
			dataType : "json",
			async : false,
			data : {
				start : start.format("YYYY/MM/DD"),
				end : end.format("YYYY/MM/DD")
			},
			success : function(data) {
				list = data.list;
				
				if(list.length == 0) {
					alert("데이터가 없습니다.");
				}
				
				chart = makeChart(chartObj);
			}
		})
	}

	
	function makeChart(data) {
	/* 	var dataSet = [];
		
		for(var i in data) {
			var obj = {
				'name' : data[i].name,
				'sales' : data[i].sales
			}
			
			dataSet.push(obj);
		}
		
		console.log(dataSet); */
		
		var returnChart = AmCharts.makeChart("chartdiv", {
			"type": "pie",
			"startDuration": 0,
			"theme": "light",
		 	"addClassNames": true,
			"legend":{
			  "valueText" : data.valueText,
			  "position":"right",
			  "marginRight":50,
			  "autoMargins":false,
			  "fontSize" : 11
			},
			"innerRadius": "30%",
			"defs": {
				"filter": [{
			    "id": "shadow",
			    "width": "200%",
			    "height": "200%",
			    "feOffset": {
			      "result": "offOut",
			      "in": "SourceAlpha",
			      "dx": 0,
			      "dy": 0
			    },
			    "feGaussianBlur": {
			      "result": "blurOut",
			      "in": "offOut",
			      "stdDeviation": 5
			    },
	      		"feBlend": {
	      	 	  "in": "SourceGraphic",
			   	  "in2": "blurOut",
			      "mode": "normal"
				}
			  }]
		    },
			"dataProvider": list,
			"valueField": data.valueField,
			"titleField": "name",
			"export": {
			  "enabled": true
			}
		});
		
		returnChart.addListener("init", handleInit);
		returnChart.addListener("rollOverSlice", function(e) {
			handleRollOver(e);
		});

		return returnChart;
	}
	
	/* var chart = AmCharts.makeChart("chartdiv", {
		"type": "pie",
		"startDuration": 0,
		"theme": "light",
	 	"addClassNames": true,
		"legend":{
		  "position":"right",
		  "marginRight":100,
		  "autoMargins":false
		},
		"innerRadius": "30%",
		"defs": {
			"filter": [{
		    "id": "shadow",
		    "width": "200%",
		    "height": "200%",
		    "feOffset": {
		      "result": "offOut",
		      "in": "SourceAlpha",
		      "dx": 0,
		      "dy": 0
		    },
		    "feGaussianBlur": {
		      "result": "blurOut",
		      "in": "offOut",
		      "stdDeviation": 5
		    },
      		"feBlend": {
      	 	  "in": "SourceGraphic",
		   	  "in2": "blurOut",
		      "mode": "normal"
			}
		  }]
	    },
		"dataProvider": [{
		  "country": "Lithuania",
		  "litres": 501.9
		}],
		"valueField": "litres",
		"titleField": "country",
		"export": {
		  "enabled": true
		}
	});
 */
	

	function handleInit(){
		chart.legend.addListener("rollOverItem", handleRollOver);
	}

	function handleRollOver(e){
		var wedge = e.dataItem.wedge.node;
		wedge.parentNode.appendChild(wedge);
	}
}); //end ready


</script>

</head>

<body class='style-10'>

	<div class="information-blocks">
		<div class="row information-entry">
			<div class="col-md-9 col-md-push-3 col-sm-8 col-sm-push-4"  style="text-align:center;">
				<div id="reportrange" class='pull-center col-md-7' style="background: #fff; cursor: pointer; padding: 15px 10px; height : 45px; border: 2px solid #333;">
				    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
				    <span></span> <b class="caret"></b>
				</div>
				<div class="col-md-3 col-sm-4">
					<select class="selectpicker form-control" style="height: 45px">
				        <option>매출액</option>
				        <option>판매량</option>
				        <option>순이익</option>
				    </select>
				</div>
				
				<div class="col-md-1 col-sm-1">
					<a class='button style-10' id='refresh'>적용</a>
				</div>
				
				<div class="clear"></div>
			
			<div id="chartdiv" style="margin-top : 20px"></div>	
			</div>
			
			<!-- Left Side Menu -->
	        <div class="col-md-3 col-md-pull-9 col-sm-4 col-sm-pull-8 blog-sidebar">
	          <div class="information-blocks categories-border-wrapper">
	            <div class="block-title size-3">Admin Menu</div>
	            <div class="enterContent-2"></div>
	                <div class="article-container style-1">
	                <ul>
	                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/110"> EARRING</a></li>
	                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/120"> PIERCING</a></li>
	                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/130"> NECKLACE</a></li>
	                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/140"> BRACELET</a></li>
	                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/150"> RING</a></li>
	                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/210"> HAIR ITEM</a></li>
	                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/220"> ETC</a></li>
	                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/230"> ON SALE</a></li>
	                    </ul>
	                </div>
	          	</div>
	        </div>
       		 <!-- /.Left Side Menu -->
		
		</div>
	</div>
</body>