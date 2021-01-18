var searchOption = '';
var keyword = '';
var pieChart_payment={};
var pieChart_category={};
var lineChart_period={};

$(document).ready(function(){
		google.charts.load('current',{'packages':['corechart']});
		
		searchOption = $('#searchOption',opener.document).val();
		keyword = $('#keyword',opener.document).val();
		if($('#searchOption option:selected',opener.document).text()=='검색조건') $('#searchOption').css('color','black').text('없음').css('color','red');
		else $('#searchOption').css('color','black').text($('#searchOption option:selected',opener.document).text());
		if($('#keyword',opener.document).val()=='') $('#keyword').text('없음').css('color','red');
		else $('#keyword').text($('#keyword',opener.document).val());
	$.ajax({
		type : 'post',
		url : '/admin/shop/getChartRawData.do',
		data: {'searchOption':searchOption,'keyword':keyword},
		dataType: 'json',
		success: function(data){
			var period = data.periodicList;
			if(data.totalSalesData.length<=0 || data.totalSalesData==null) {
				$('#chart_div').empty();
				$('#chart_div').html('<h5 style="color:red;font-weight:bold;text-decoration:underline;text-undeline-position:under;">[해당하는 데이터가 없으므로 차트를 나타낼 수 없습니다]</h5>')
			}
			else{
			var order_total = 0;	var sales_total = 0;
			var cash_total = 0; 	var card_total = 0; 	var point_total = 0; 		
			var coupon_total = 0; 	var etc_total = 0;
			var coat_total = 0;		var suit_total = 0;		var shirt_total = 0;	var acc_total = 0;
			var bottom_total = 0;	var tee_total = 0;		var shoes_total = 0;
			var outer_total = 0;	var unknown_total = 0;
			
			var analysis = data.analysisData;
			$('#maxRevenueItem').append(analysis.maxRevenueItem);
			$('#maxSalesItem').append(analysis.maxSalesItem);
			$('#minRevenueItem').append(analysis.minRevenueItem);
			$('#minSalesItem').append(analysis.minSalesItem);
			$('#mostOrderedMember').append(analysis.mostOrderedMember);
			$('#mostBenefitMemeber').append(analysis.mostBenefitMemeber);	
			$('#salesDiffRatio').append(analysis.salesDiffRatio);	
			$('#mostViewedItem').append(analysis.mostViewedItem);
			$('#bestLikeitItem').append(analysis.bestLikeitItem);				
			
			$.each(data.totalSalesData,function(idx,data){				
				order_total++;
				sales_total += parseInt(data.sales_revenue,10);
				cash_total += parseInt(data.cash_total,10);	
				card_total += parseInt(data.card_total,10);			
				point_total += parseInt(data.point_total,10);			
				coupon_total += parseInt(data.coupon_total,10);	
				etc_total += parseInt(data.etc_total,10);	
				coat_total += parseInt(data.coat_total,10);	
				bottom_total += parseInt(data.bottom_total,10);	
				acc_total = parseInt(data.acc_total,10);	
				shirt_total += parseInt(data.shirt_total,10);	
				suit_total += parseInt(data.suit_total,10);	
				tee_total = parseInt(data.tee_total,10);	
				outer_total = parseInt(data.outer_total,10);	
				unknown_total = parseInt(data.unknown_total,10);					
			});
			
			pieChart_category={'cols':[
				{'id':'','label':'카테고리','pattern':'','type': 'string'},
				
				{'id':'','label':'매출액','pattern':'','type':'number'}],
			'rows':[
				{'c':[{'v':'COAT','f':null},{'v':coat_total,'f':null}]},
				{'c':[{'v':'BOTTOM','f':null},{'v':bottom_total,'f':null}]},
				{'c':[{'v':'ACC','f':null},{'v':acc_total,'f':null}]},
				{'c':[{'v':'SHIRT','f':null},{'v':shirt_total,'f':null}]},
				{'c':[{'v':'SUIT','f':null},{'v':suit_total,'f':null}]},
				{'c':[{'v':'TEE','f':null},{'v':tee_total,'f':null}]},
				{'c':[{'v':'OUTER','f':null},{'v':outer_total,'f':null}]},
				{'c':[{'v':'SHOES','f':null},{'v':shoes_total,'f':null}]},
				{'c':[{'v':'미상','f':null},{'v':unknown_total,'f':null}]}
				]};	
			
			pieChart_payment={'cols':[
				{'id':'','label':'결제방법','pattern':'','type': 'string'},
				
				{'id':'','label':'매출액','pattern':'','type':'number'}],
			'rows':[
				{'c':[{'v':'현금','f':null},{'v':cash_total,'f':null}]},
				{'c':[{'v':'카드','f':null},{'v':card_total,'f':null}]},
				{'c':[{'v':'포인트','f':null},{'v':point_total,'f':null}]},
				{'c':[{'v':'쿠폰','f':null},{'v':coupon_total,'f':null}]},
				{'c':[{'v':'기타','f':null},{'v':etc_total,'f':null}]},
				]};	
			

				lineChart_period = {'cols':[
					{'id':'','label':'기간','pattern':'','type': 'string'},
					{'id':'','label':'전체','pattern':'','type':'number'},				
					{'id':'','label':'SUIT','pattern':'','type':'number'},
					{'id':'','label':'SHIRT','pattern':'','type':'number'},
					{'id':'','label':'TEE','pattern':'','type':'number'},
					{'id':'','label':'BOTTOM','pattern':'','type':'number'},
					{'id':'','label':'ACC','pattern':'','type':'number'},
					{'id':'','label':'OUTER','pattern':'','type':'number'},
					{'id':'','label':'SHOES','pattern':'','type':'number'},					
					{'id':'','label':'COAT','pattern':'','type':'number'}],					
				'rows':[
					{'c':[{'v':'전전월','f':null},{'v':period.total_previousM,'f':null},
						{'v':period.suit_previousM,'f':null},{'v':period.outer_previousM,'f':null},{'v':period.acc_previousM,'f':null},{'v':period.coat_previousM,'f':null},
						{'v':period.shirt_previousM,'f':null},{'v':period.shoes_previousM,'f':null},{'v':period.bottom_previousM,'f':null},{'v':period.unknown_previousM,'f':null}]},
					{'c':[{'v':'전월','f':null},{'v':period.total_lastM,'f':null},
						{'v':period.suit_lastM,'f':null},{'v':period.outer_lastM,'f':null},{'v':period.acc_lastM,'f':null},{'v':period.coat_lastM,'f':null},
						{'v':period.shirt_lastM,'f':null},{'v':period.shoes_lastM,'f':null},{'v':period.bottom_lastM,'f':null}]},
					{'c':[{'v':'당월','f':null},{'v':period.total_thisM,'f':null},
						{'v':period.suit_thisM,'f':null},{'v':period.outer_thisM,'f':null},{'v':period.acc_thisM,'f':null},{'v':period.coat_thisM,'f':null},
						{'v':period.shirt_thisM,'f':null},{'v':period.shoes_thisM,'f':null},{'v':period.bottom_thisM,'f':null}]},
					]};
				
			google.charts.setOnLoadCallback(drawChart);
				drawChart();
			}

		}
	});	

	
});

function drawChart() {
	drawPieChart(pieChart_payment,pieChart_category);
	if(searchOption!='sales_date') drawLineChart(lineChart_period);
	
}

function drawPieChart(pieChart_payment){
    var data_payment = new google.visualization.DataTable(pieChart_payment);

    var options_payment = {'title':'[각 결제방법별 비중]'};

    var chart = new google.visualization.PieChart(document.getElementById('pieChart_payment_div'));
    chart.draw(data_payment, options_payment);
}

function drawPieChart(pieChart_category){
    var data_category = new google.visualization.DataTable(pieChart_category);
    
    var options_category = {'title':'[각 카테고리별 비중]'};

    var chart = new google.visualization.PieChart(document.getElementById('pieChart_category_div'));
    chart.draw(data_category, options_category);    
}

function drawLineChart(lineChart_period){

	var dataM = new google.visualization.DataTable(lineChart_period);
   
	var optionsM = {'title':'[기간별 매출액 추이]'};
		
    var chart = new google.visualization.LineChart(document.getElementById('lineChartM_div'));
    chart.draw(dataM, optionsM);
}

$('#resetBtn').click(function(){
	window.location.reload();
});
$('#closeBtn').click(function(){
	window.close();
});