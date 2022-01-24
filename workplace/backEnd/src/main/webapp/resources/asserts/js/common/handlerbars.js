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
	    	console.log(html);
	    	appe.innerHTML = html;
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