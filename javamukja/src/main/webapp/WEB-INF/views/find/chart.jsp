<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#chartdiv {
  width: 50%;
  height: 350px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//www.amcharts.com/lib/4/core.js"></script>
<script src="//www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/spiritedaway.js"></script>
<script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var queryObject = "";
var queryObjectLen = "";
$.ajax({
    type : 'POST', 
    url : '${root}/find/list2',
    dataType : 'json',
    success : function(data) {
    	console.log(data)
    	console.log(queryObjectLen)
        
        queryObject = eval('(' + JSON.stringify(data,null, 2) + ')');  
    	queryObjectLen = queryObject.length;
        // stringify : 인자로 전달된 자바스크립트의 데이터(배열)를 JSON문자열로 바꾸기.   
        // eval: javascript 코드가 맞는지 검증하고 문자열을 자바스크립트 코드로 처리하는 함수 
        // queryObject.barlist[0].city ="korea"
        // queryObject.empdetails 에는 4개의 Json 객체가 있음 
        
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_spiritedaway);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.XYChart3D);

queryObjectLen = queryObject.length;
for (var i = 0; i < queryObjectLen; i++) {
    var fstr = queryObject[i].fstr;
    var fcnt = queryObject[i].fcnt;
    
// Add data
chart.data.push({
		"country":fstr,
		"visits": fcnt
});
}
// Create axes
let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.labels.template.rotation = 270; //country Column의 텍스트 기울기
categoryAxis.renderer.labels.template.hideOversized = false;
categoryAxis.renderer.minGridDistance = 5;
categoryAxis.renderer.labels.template.horizontalCenter = "right";
categoryAxis.renderer.labels.template.verticalCenter = "middle";
categoryAxis.tooltip.label.rotation = 270;
categoryAxis.tooltip.label.horizontalCenter = "right";
categoryAxis.tooltip.label.verticalCenter = "middle";

let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.title.text = "Countries";
valueAxis.title.fontWeight = "bold";

// Create series
var series = chart.series.push(new am4charts.ColumnSeries3D());
series.dataFields.valueY = "visits";
series.dataFields.categoryX = "country";
series.name = "Visits";
series.tooltipText = "{categoryX}: [bold]{valueY}[/]";
series.columns.template.fillOpacity = .8;

var columnTemplate = series.columns.template;
columnTemplate.strokeWidth = 2;
columnTemplate.strokeOpacity = 1;
columnTemplate.stroke = am4core.color("#FFFFFF");

columnTemplate.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
})

columnTemplate.adapter.add("stroke", function(stroke, target) {
  return chart.colors.getIndex(target.dataItem.index);
})

chart.cursor = new am4charts.XYCursor();
chart.cursor.lineX.strokeOpacity = 0;
chart.cursor.lineY.strokeOpacity = 0;

}); // end am4core.ready()
        
        
    },
    error : function(xhr, type) {
        alert('server error occoured')
    }
});

</script>

<!-- HTML -->
<div class="container">
<h2 style="color:#fac564">검색순위 차트</h2>
<br>
<div id="chartdiv" style="background-color:#ffffff2b;"></div>
<br>
	<button type="button" class="btn btn-primary"
					onclick="history.back()">뒤로</button>
</div>
</body>

</html>