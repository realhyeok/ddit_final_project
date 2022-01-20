function on() {
	$("#popoverlay").fadeIn(300);
	var nav = document.querySelector("body");
	nav.classList.add("nav-sm");
	nav.classList.remove("nav-md");
}

function off() {
	$("#popoverlay").fadeOut(300);
	var nav = document.querySelector("body");
	nav.classList.add("nav-md");
	nav.classList.remove("nav-sm");
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

function overlay(dist) {

	var data = {
		  	"dist" : dist
		};

	on();
	var template = document.querySelector("#formTemplate").innerText;
	var bindTemplate = Handlebars.compile(template);
	var appe = document.querySelector('#popoverlay');
	var html = bindTemplate(data);
	console.log(html);
	appe.innerHTML = html;
}
