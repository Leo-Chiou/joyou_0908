<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>後台報表</title>
<meta name="description" content="NumScroller - jQuery plugin for number increment rolling animation when it becomes visibile while scrolling">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body{background: #eeeeee;color: #333333;font-family: arial;font-size:14px;margin: 0;padding: 0;overflow-x:hidden;}
        .container{width: 800px;margin: 50px auto;max-width: 95%;}
        .section{background: #ffffff;border: 1px solid #dddddd;margin-top: 20px;margin-bottom: 20px; padding: 20px;}
        #content,#content2{background:#ddd;height:200px;}
        .t1{width:100px;height:100px;background:#ef8603;margin:20px;}
        .highlight{font-weight:bold;}
        .option-table tr{vertical-align:top;}
        table.option-table{border-width: 1px;border-spacing: 0px;border-style: outset;border-color: #f7f7f7;border-collapse: separate;background-color: white;}
        table.option-table th {border-width: 1px;padding: 5px;border-style: inset;border-color: #f7f7f7;background-color: white;}
        table.option-table td {border-width: 1px;padding: 5px;border-style: inset;border-color: #f7f7f7;background-color: white;}
        .footer{margin-top: 50px;margin-bottom: 50px;text-align: right;}
        .share{margin-top: 20px;}
        .clear{clear: both;}
        .half-left{float: left;width: 40%;}
        .half-right{float: right;width: 40%;}
        .numscroller-big-bottom{
            font-size: 44px;text-align: center;
        }
        .numscroller-info-top{
            font-size: 20px;margin-bottom: 10px;
        }
        </style>




<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="css/animsition.min.css" />
<link rel="stylesheet" href="css/drop-down.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/xsfx.css" />
<link rel="stylesheet" href="jedate/skin/jedate.css" />
<link rel="stylesheet" href="css/jquery-labelauty.css" />
<link rel="stylesheet" href="css/alertify/alertify.min.css" />
<link rel="stylesheet" href="css/alertify/default.min.css" />


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 
    <script src="js/numscroller-1.0.js"></script>
	  
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script src="layer/layer.js"></script>
	<script src="js/alertify.min.js"></script>
	<script src="js/alertify.min.js"></script>
	<script src="js/jquery-labelauty.js"></script>
	<script src="js/jquery.cityselect.js"></script>
	<script src="jedate/jquery.jedate.min.js"></script>
	<script src="http://www.jq22.com/jquery/jquery-ui-1.11.0.js"></script>
	<script src="js/select-widget-min.js"></script>
	<script src="js/jquery.animsition.min.js"></script>
	<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
	<script src="js/macarons .js"></script>
	<script src="js/common.js"></script>
</head>
<body>
<div id="Header" style="height:80px;text-align:center;line-height:80px;font-size:15px;color:#fffaf3;font-weight:bold;background-color:#f9c81e;">Header 欄位</div>
<div id="Sidebar" style="width:180px;float:left;text-align:center;line-height:1500px;font-size:15px;color:#ffffff;font-weight:bold;background-color:#cecece;" >Sidebar</div>
<div id="Body" style="text-align:center;line-height:50px;font-size:15px;color:#f9c81e;font-weight:bold;background-color:#fffaf3;">




　
	<div class="data_wrap"
		style="background: #efeff5; width: 1020px; padding: 10px;">
		<div class="animsition" style="overflow: hidden;">

			<div class="hg_title" style="margin-top: 10px;">
				<h2>桌遊銷售比</h2>
				<h2>會員性別比</h2>
			</div>
			<div id="main1" class="my_main2"
				style="width: 505px; height: 250px; float: left; margin: 10px 0;"></div>
			<div id="main2" class="my_main2"
				style="width: 505px; height: 250px; float: right; margin: 10px 0;"></div>


			<div class="my_duxs_time" style="margin: 0px;"></div>


		</div>

	</div>
	
	
	
	
	
	<div class='container'>
   
    <div class='section half-left'>

       <div class='numscroller-info-top'>銷售總額:</div>
        <div class='numscroller numscroller-big-bottom' data-slno='2' data-min='0' data-max='${countsell}' data-delay='6' data-increment='27'>0</div>
 		
    </div>
  
    <div class='section half-right'>

        <div class='numscroller-info-top'>會員人數:</div>
        <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='${countnumber}' data-delay='6' data-increment='3'>0</div>
		   
    </div>
          
    </div>
	
	
	
	</div>
	
	
	
	

	<script>
		$(document)
				.ready(
						function() {

						
							
							var xhr = new XMLHttpRequest();

							xhr.open("GET", "<c:url value='/orderlist.json'/>",
									true);
							xhr.send();
							xhr.onreadystatechange = function() {
								if (xhr.readyState == 4 && xhr.status == 200) {

									eight = JSON.parse(xhr.responseText);

								}
							}

							var xhr1 = new XMLHttpRequest();

							xhr1.open("GET",
									"<c:url value='/memberlist.json'/>", true);
							xhr1.send();
							xhr1.onreadystatechange = function() {
								if (xhr1.readyState == 4 && xhr1.status == 200) {

									gender = JSON.parse(xhr1.responseText);
									
								}
							
		
							}

							
							

							
							//插件初始化
							$(":checkbox").labelauty({
								checked_label : "",
								unchecked_label : "",
							});
							$(":radio").labelauty({
								checked_label : "",
								unchecked_label : "",
							});

							//调用日期
							var start = {
								format : 'YYYY-MM-DD',
								minDate : '2014-06-16 23:59:59', //设定最小日期为当前日期
								isinitVal : true,
								initAddVal : [ -90 ], //初始化日期加2小时
								festival : true,
								maxDate : $.nowDate(0), //最大日期
								choosefun : function(elem, datas) {
									end.minDate = datas; //开始日选好后，重置结束日的最小日期
								}
							};
							var end = {
								format : 'YYYY-MM-DD',
								minDate : $.nowDate(0), //设定最小日期为当前日期
								isinitVal : true,
								maxDate : '2099-06-16', //最大日期
								choosefun : function(elem, datas) {
									start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
								}
							};
							$("#inpstart").jeDate(start);
							$("#inpend").jeDate(end);

							//初始化切换
							$(".animsition")
									.animsition(
											{

												inClass : 'fade-in-right',
												outClass : 'fade-out',
												inDuration : 1500,
												outDuration : 800,
												linkElement : '.animsition-link',
												// e.g. linkElement   :   'a:not([target="_blank"]):not([href^=#])'
												loading : true,
												loadingParentElement : 'body', //animsition wrapper element
												loadingClass : 'animsition-loading',
												unSupportCss : [
														'animation-duration',
														'-webkit-animation-duration',
														'-o-animation-duration' ],
												//"unSupportCss" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
												//The default setting is to disable the "animsition" in a browser that does not support "animation-duration".

												overlay : false,

												overlayClass : 'animsition-overlay-slide',
												overlayParentElement : 'body'
											});

							// 路径配置
							require
									.config({
										paths : {
											echarts : 'http://echarts.baidu.com/build/dist'
										}
									});

							// 使用
							require(
									[ 'echarts', 'echarts/chart/bar',
											'echarts/chart/line',
											'echarts/chart/pie',
											'echarts/chart/map',// 使用柱状图就加载bar模块，按需加载
									],
									function(ec) {
										// 基于准备好的dom，初始化echarts图表
										var myChart = ec.init(document
												.getElementById('main1'),
												'macarons');
										var myChart2 = ec.init(document
												.getElementById('main2'),
												'macarons');
										var ecConfig = require('echarts/config');

										var option = {
											backgroundColor : 'white',
											tooltip : {
												trigger : 'item',
												formatter : '{a}' + '<br/>'
														+ '{b}:{d}%'

											},
											toolbox : {
												show : false,
												feature : {
													mark : {
														show : true
													},
													dataView : {
														show : true,
														readOnly : false
													},
													magicType : {
														show : true,
														type : [ 'pie',
																'funnel' ],
														option : {
															funnel : {
																x : '25%',
																width : '50%',
																funnelAlign : 'center',
																max : 1548
															}
														}
													}
												}
											},
											calculable : false,
											series : [ {
												name : '種類',
												type : 'pie',
												center : [ '50%', '50%' ],
												radius : [ '40%', '60%' ],
												itemStyle : {
													normal : {
														label : {
															show : true,
															formatter : function(
																	param) {
																return param.name
																		+ ':\n'
																		+ Math
																				.round(param.percent)
																		+ '%';
															},
															textStyle : {
																fontWeight : 'bolder'
															}
														}
													},
													emphasis : {
														label : {
															show : true,
															position : 'center',
															textStyle : {
																fontSize : '30',
																fontWeight : 'bold'
															}
														}
													}
												},
												data : [ {
													value : eight[0],
													name : '派對'
												}, {
													value : eight[1],
													name : '策略'
												}, {
													value : eight[2],
													name : '情境'
												}, {
													value : eight[3],
													name : '戰爭'
												}, {
													value : eight[4],
													name : '抽象'
												}, {
													value : eight[5],
													name : '交換卡片'
												}, {
													value : eight[6],
													name : '兒童'
												}, {
													value : eight[7],
													name : '家庭'
												} ]

											} ]
										};
										var option2 = {
											backgroundColor : 'white',
											tooltip : {
												trigger : 'item',
												formatter : '{a}' + '<br/>'
														+ '{b}:{d}%'

											},
											toolbox : {
												show : false,
												feature : {
													mark : {
														show : true
													},
													dataView : {
														show : true,
														readOnly : false
													},
													magicType : {
														show : true,
														type : [ 'pie',
																'funnel' ],
														option : {
															funnel : {
																x : '25%',
																width : '50%',
																funnelAlign : 'center',
																max : 1548
															}
														}
													}
												}
											},
											calculable : false,
											series : [ {
												name : '性別',
												type : 'pie',
												center : [ '50%', '50%' ],
												radius : [ '40%', '60%' ],
												itemStyle : {
													normal : {
														label : {
															show : true,
															formatter : function(
																	param) {
																return param.name
																		+ ' : '
																		+ Math
																				.round(param.percent)
																		+ '%';
															},
															textStyle : {
																fontWeight : 'bolder'
															}
														}
													},
													emphasis : {
														label : {
															show : true,
															position : 'center',
															textStyle : {
																fontSize : '30',
																fontWeight : 'bold'
															}
														}
													}
												},
												data : [ {
													value : gender[0],
													name : '男'
												}, {
													value : gender[1],
													name : '女'
												},

												]

											} ]
										};

										// 为echarts对象加载数据 
										myChart.setOption(option);
										myChart2.setOption(option2);

										//点击搜索
										$('#my_search').on('click', function() {

											myChart.clear();
											myChart.setOption(option, true);
										})

										$('input[name=num]').on('click',
												function() {

												});

									});

							

							});

		
	</script>
	


</body>

</html>