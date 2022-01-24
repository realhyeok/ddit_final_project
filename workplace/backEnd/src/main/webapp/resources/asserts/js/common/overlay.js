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
