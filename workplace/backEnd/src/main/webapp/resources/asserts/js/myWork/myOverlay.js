

function on() {
	$("#myPopOverlay").fadeIn(300);
}

function off() {
	$("#myPopOverlay").fadeOut(300);
}

var prevTarget = [];

function getOverlayMailRegistTemplate(userFrom) {
	on();
	$(".sendOverlayUserTo").val(userFrom);
	var appe = document.querySelector('#myPopOverlay');
	appe.innerHTML = html;
	$("#fadeInContent").fadeIn(300);
	
	summernote_go($('.overlaySendContent'));
}

