var cprojNo = getParameterByName("cprojNo");
console.log(cprojNo);

function getTemplate(url,templateId,appendTarget) {

	$.ajax({
	    type : 'GET',
	    url : url,
	    dataType : "JSON",
	    data : {"cprojNo" : cprojNo },
	    success : function(data) {
	    	console.log("Handlebars success!!");
	    	var formTemplate = document.getElementById(templateId).innerText;
	    	var bindTemplate = Handlebars.compile(formTemplate);
	    	var appe = document.getElementById(appendTarget);
	    	var html = bindTemplate(data);
	    	console.log(html);
	    	appe.innerHTML = html;
	    },
	    error : function(error) {
	    	console.log("Handlebars error!!");
	    },
	});
}

//업무수정 템플레이트
function getTaskTemplate(url,taskNo,templateId,appendTarget) {

	var formTemplate = "";
	var bindTemplate = "";
	var appe = "";
	var html = "";
	var data = "";

	$.ajax({
	    type : 'GET',
	    url : url,
	    dataType : "JSON",
	    data : {"taskNo" : taskNo,"cprojNo" :cprojNo },
	    success : function(data) {
	    	console.log("Handlebars success!!");
	    	formTemplate = document.getElementById(templateId).innerText;
	    	console.log(formTemplate)
	    	bindTemplate = Handlebars.compile(formTemplate);
	    	appe = document.getElementById(appendTarget);
	    	html = bindTemplate(data);
	    	console.log(html);

	    	appe.innerHTML = html;
	    	document.getElementById('taskDetail-tab').click();
	    },
	    error : function(error) {
	    	console.log("Handlebars error!!");
	    },
	});
}


//콜라보 업무 상세 출력폼
function getCollaboTaskTemplate(url,taskNo,templateId,appendTarget) {

	var collaboTaskVO = {"taskNo" : taskNo,"cprojNo" : cprojNo };
	
	console.log(templateId + "/" + appendTarget);
	document.getElementById(templateId);
	
	$.ajax({
	    type : 'GET',
	    url : url,
	    dataType : "JSON",
	    data : collaboTaskVO,
	    success : function(data) {
	    	console.log("Handlebars success!!");
	    	var formTemplate = document.getElementById(templateId).innerText;
	    	var bindTemplate = Handlebars.compile(formTemplate);
	    	var appe = document.getElementById(appendTarget);
	    	var html = bindTemplate(data);
	    	console.log(html);
	    	appe.innerHTML = html;
	    	
	    	document.getElementById('taskDetail-tab').click();
	    },
	    error : function(error) {
	    	console.log("Handlebars error!!");
	    },
	});
}

//-----------------------------------

Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {

    switch (operator) {
        case '==':
            return (v1 == v2) ? options.fn(this) : options.inverse(this);
        case '===':
            return (v1 === v2) ? options.fn(this) : options.inverse(this);
        case '!=':
            return (v1 != v2) ? options.fn(this) : options.inverse(this);
        case '!==':
            return (v1 !== v2) ? options.fn(this) : options.inverse(this);
        case '<':
            return (v1 < v2) ? options.fn(this) : options.inverse(this);
        case '<=':
            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
        case '>':
            return (v1 > v2) ? options.fn(this) : options.inverse(this);
        case '>=':
            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
        case '&&':
            return (v1 && v2) ? options.fn(this) : options.inverse(this);
        case '||':
            return (v1 || v2) ? options.fn(this) : options.inverse(this);
        default:
            return options.inverse(this);
    }
});

Handlebars.registerHelper('formatTime', function (date, format) {
    var mmnt = moment(date);
    return mmnt.format(format);
});

function getParameterByName(name) {
  	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
   	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
   	results = regex.exec(location.search);
   	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}