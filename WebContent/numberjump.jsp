<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
       
        
        <title>NumScroller - jQuery number increment rolling plugin</title>
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
            font-size: 12px;margin-bottom: 10px;
        }
        </style>
        
    </head>
    <body>

        
<div class='container'>
   

    <div class='section half-left'>

        <div class='numscroller-info-top'>銷售總額</div>
        <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='9580' data-delay='3' data-increment="27">0</div>
    </div>
    <div class='section half-right'>
        <div class='numscroller-info-top'>會員人數</div>
        <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='23' data-delay='3' data-increment="2">0</div>
    </div>
      
                
    </div>
   
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="js/numscroller-1.0.js"></script>
    <script src="WEB-INF/lib/prism.js"></script>
    </body>
</html>
