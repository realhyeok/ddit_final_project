var projNo = getParameterByName("projNo");
console.log(projNo);

function getDefaultTemplate(templateId,appendTarget){
	var formTemplate = document.getElementById(templateId).innerText;
	var bindTemplate = Handlebars.compile(formTemplate);
	var appe = document.getElementById(appendTarget);
	var html = bindTemplate();
	appe.innerHTML = html;
	$("#fadeInContent").fadeIn(300);
}

function getTemplate(url,templateId,appendTarget) {

	$.ajax({
	    type : 'GET',
	    url : url,
	    dataType : "JSON",
	    data : {"projNo" : projNo },
	    success : function(data) {
	    	console.log("Handlebars success!!");
	    	var formTemplate = document.getElementById(templateId).innerText;
	    	var bindTemplate = Handlebars.compile(formTemplate);
	    	var appe = document.getElementById(appendTarget);
	    	var html = bindTemplate(data);
	    	appe.innerHTML = html;
	    },
	    error : function(error) {
	    	console.log("Handlebars error!!");
	    },
	});
}

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
	    data : {"taskNo" : taskNo,"projNo" : projNo },
	    success : function(data) {
	    	console.log("Handlebars success!!");
	    	formTemplate = document.getElementById(templateId).innerText;
	    	console.log(formTemplate)
	    	bindTemplate = Handlebars.compile(formTemplate);
	    	appe = document.getElementById(appendTarget);
	    	html = bindTemplate(data);
	    	appe.innerHTML = html;
	    	document.getElementById('taskDetail-tab').click();
	    },
	    error : function(error) {
	    	console.log("Handlebars error!!");
	    },
	});
}

function getIssueTemplate(url,issueNo,templateId,appendTarget) {

	var formTemplate = "";
	var bindTemplate = "";
	var appe = "";
	var html = "";
	var data = "";

	$.ajax({
	    type : 'GET',
	    url : url,
	    dataType : "JSON",
	    data : {"issueNo" : issueNo,"projNo" : projNo },
	    success : function(data) {
	    	console.log("Handlebars success!!");
	    	var formTemplate = document.getElementById(templateId).innerText;
	    	var bindTemplate = Handlebars.compile(formTemplate);
	    	var appe = document.getElementById(appendTarget);
	    	var html = bindTemplate(data);
	    	appe.innerHTML = html;
	    	document.getElementById('issueDetail-tab').click();
	    },
	    error : function(error) {
	    	console.log("Handlebars error!!");
	    },
	});
}


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