<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/GitlabMonitor/static/css/base.css">
<title>listManager:单列表简易渲染</title>
<style>
/* html, body{ */
/* 	overflow-x:hidden; */
/* } */
/* h2{ */
/* 	font-size:22px; */
/* 	padding:10px 30px; */
/* 	color:#333; */
/* } */
/* p{ */
/* 	font-size:14px; */
/* 	padding:10px 30px; */
/* 	color:#333; */
/* 	text-indent:2em; */
/* } */
/* hr{     */
/* 	margin-top: 18px; */
/*     margin-bottom: 18px; */
/*     border: 0; */
/*     border-top: 1px solid #eee; */
/* } */
</style>
</head>

<body>
<h2>listManager:单列表简易渲染</h2>
<p>存在.json文件，谷歌需要放到环境中效果才能展现</p>
<hr/>
<div style="width:95%;margin:0px auto;">
    <table width="100%" cellspacing="1" cellpadding="0" list-manager="demoOne">
        <thead>
            <tr>
                <th th-name="th-one" remind="the one" sorting="up" width="200px">One</th>
                <th th-name="th-two" remind="the tow" sorting  width="200px">Tow</th>
                <th th-name="th-three" remind="the three" sorting width="300px">Three</th>
                <th th-name="th-four" remind="the four">Four</th>
            </tr>
        </thead>
        <tbody>
            <tr>
              <td>1言毕，眼闭</td>
              <td>遥想星空满目</td>
              <td>日升，起身</td>
              <td>淡看今日如故</td>
            </tr>
            <tr>
              <td>心欲近、心愈远</td>
              <td>近于咫尺犹如远在天边</td>
              <td>心欲静、心愈乱</td>
              <td>静如止水却似心乱如麻</td>
            </tr>
            <tr>
              <td>1言毕，眼闭</td>
              <td>遥想星空满目</td>
              <td>日升，起身</td>
              <td>淡看今日如故</td>
            </tr>
            <tr>
              <td>心欲近、心愈远</td>
              <td>近于咫尺犹如远在天边</td>
              <td>心欲静、心愈乱</td>
              <td>静如止水却似心乱如麻</td>
            </tr>
            <tr>
              <td>1言毕，眼闭</td>
              <td>遥想星空满目</td>
              <td>日升，起身</td>
              <td>淡看今日如故</td>
            </tr>
            <tr>
              <td>心欲近、心愈远</td>
              <td>近于咫尺犹如远在天边</td>
              <td>心欲静、心愈乱</td>
              <td>静如止水却似心乱如麻</td>
            </tr>
            <tr>
              <td>1言毕，眼闭</td>
              <td>遥想星空满目</td>
              <td>日升，起身</td>
              <td>淡看今日如故</td>
            </tr>
            <tr>
              <td>心欲近、心愈远</td>
              <td>近于咫尺犹如远在天边</td>
              <td>心欲静、心愈乱</td>
              <td>静如止水却似心乱如麻</td>
            </tr>
            <tr>
              <td>1言毕，眼闭</td>
              <td>遥想星空满目</td>
              <td>日升，起身</td>
              <td>淡看今日如故</td>
            </tr>
            <tr>
              <td>心欲近、心愈远</td>
              <td>近于咫尺犹如远在天边</td>
              <td>心欲静、心愈乱</td>
              <td>静如止水却似心乱如麻</td>
            </tr>
            <tr>
              <td>1言毕，眼闭</td>
              <td>遥想星空满目</td>
              <td>日升，起身</td>
              <td>淡看今日如故</td>
            </tr>
            <tr>
              <td>心欲近、心愈远</td>
              <td>近于咫尺犹如远在天边</td>
              <td>心欲静、心愈乱</td>
              <td>静如止水却似心乱如麻</td>
            </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="/GitlabMonitor/static/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/GitlabMonitor/static/js/listManager.js"></script>
<script type="text/javascript" >
$(function(){
	//单列表简易渲染
	var table = $('[list-manager]');
	$.fn.listManager.defaults = {
		isDevelopMode: true, 
		autoLoadCss:true  //自动加载CSS文件，无需在页面中引用
	}
	table.listManager({
		supportRemind: true
		,disableCache:false
		,supportSorting: true
		,supportDrag:true
		,supportAjaxPage:true
		,isCombSorting: false
		,pageSize:30
		,query: {ex: '用户自定义的查询参数,格式:{key:value}'}
		,pageCallback:function(query){
			//在该callback中 对列表数进行重新请求 并对列表及分页进行数据重填
            console.log('------------分页回调参数------------')
            console.log(query)
            //1、请求后端数据
            // $.ajax() ....
            //2、列表数据重填
            var _demoFive = $('[list-manager="demoFive"] tbody'),
            _firstChild = _demoFive.find('tr:first-child');
            _demoFive.append(_firstChild);
            _firstChild.fadeIn(500);
                        
            //3、分页数据重新渲染				
            this.resetPageData(table, getPageData(query.pSize, 1000, query.cPage));
            return query;
		}
		,sortingCallback: function(query){
			console.log('------------排序回调参数------------')
			console.log(query)
		}
	},function(query){
        console.log('------------init方法回调query参数------------')
		console.log(query)
		//ajax get page data
		console.log('========================================================================')	
		table.listManager('resetTd',false)	
		console.log('========================================================================')	
		table.listManager('resetPageData', getPageData(query.pSize, 1000, 1));
	});
	
	//计算分页数据
	function getPageData(pSize, tSize, cPage){
		return {
			 tPage: Math.ceil(tSize / pSize),				//总页数
	         cPage: cPage,				//当前页	
	         pSize: pSize,				//每页显示条数
	         tSize: tSize		
		}
	}
});
</script>
</body>
</html>
