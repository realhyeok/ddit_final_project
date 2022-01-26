

function on() {
	$("#popoverlay").fadeIn(300);
}

function off() {
	$("#popoverlay").fadeOut(300);
}

var prevTarget = [];

function getOverlayModifyTemplate(templateId, url) {

	on();
	$.ajax({
		type : 'GET',
		url : url,
		dataType : "JSON",
		data : {
			"projNo" : projNo
		},
		success : function(data) {
			console.log("Handlebars success!!");
			var template = document.querySelector("#" + templateId).innerText;
			var bindTemplate = Handlebars.compile(template);
			var appe = document.querySelector('#popoverlay');
			var html = bindTemplate(data);
			console.log(html);
			appe.innerHTML = html;
			$("#fadeInContent").fadeIn(300);
			summernote_go($('.projSummnote'));
		},
		error : function(error) {
			console.log("Handlebars error!!");
		},
	});

}

function getOverlayTemplate(templateId) {

	on();
	var template = document.querySelector("#" + templateId).innerText;
	var bindTemplate = Handlebars.compile(template);
	var appe = document.querySelector('#popoverlay');
	var html = bindTemplate();
	console.log(html);
	appe.innerHTML = html;
	$("#fadeInContent").fadeIn(300);
	prevTarget.push(templateId);
	console.log(prevTarget);

	if (templateId == "projRegistFormTemplate")  {
		summernote_go($('.projSummnote'));
	}

}

function modifyProjectDetail() {
	var projectVO = $('#modifyProjectForm').serialize();
	projectVO += '&projNo='+projNo;
	console.log(projectVO);

	$.ajax({
		url : "/app/project/modifyProjectDetail",
		type : 'POST',
		datatype : 'text',
		data : projectVO,
		success : function(data) {
			alert("수정에 성공했습니다.");
			getTemplate('/app/project/getProjectByProjNo','projectDetailIntro','projectDetailIntroTarget');
			off();
		}, // success
		error : function(xhr, status) {
			alert("fail");
			alert(xhr + " : " + status);
		}
	});

}

function deleteProjectNotice() {

        pNotify()
            .confirm({
                title: '삭제 확인',
                text: '정말로 삭제하시겠습니까?'
            })
            .then(function onConfirm() {
                alert('삭제됨');
            },function onCancel() {
                alert('취소됨');
            });
}

function modifyProjectNotice() {

	console.log("hello");

	var noticeVal = $('#modifyProjectNotice [name="notice"]').val();

	if(noticeVal == ""){

		$('#modifyProjectNotice [name="notice"]').parents('div.custom-validate').attr('class','item form-group custom-validate error');

		return

	} else {
		$('#modifyProjectNotice [name="notice"]').parents('div.custom-validate').attr('class','item form-group custom-validate');
	}

	var projectVO = $('#modifyProjectNotice').serialize();

	projectVO += '&projNo='+projNo;

	$.ajax({
		url : "/app/project/modifyProjectNotice",
		type : 'POST',
		datatype : 'text',
		data : projectVO,
		success : function(data) {
			alert("요청이 완료되었습니다.");
			getTemplate('/app/project/getProjectByProjNo','projectDetailNotify','projectDetailNotifyTarget');
			off();
		}, // success
		error : function(xhr, status) {
			alert("요청에 실패했습니다.");
		}
	});

};



function registProject() {
	var projectVO = $('#registProjectForm').serialize();
	console.log(projectVO);

	 $.ajax({
         url : "/app/project/registProject",
         type : 'POST',
         datatype : 'text',
         data : projectVO,
         success : function(data) {
        	 alert("등록에 성공했습니다.");
        	 console.log(data.projNo);
        	 location.href="project/main?projNo="+data.projNo;
        	 off();
         }, // success
         error : function(xhr, status) {
        	 alert("등록에 실패하였습니다.");
         }
     });

}



function prev() {
	var currPage = prevTarget.pop();
	var prevPage = prevTarget.pop();
	console.log(prevPage);
	getOverlayTemplate(prevPage);
}

function checkInputs(inputId) {

	var inputValue = $('#'+inputId).val();

    if(inputValue === "") {

    } else {
    	$('#'+inputId).attr('cv','true');
    }

    document.querySelectorAll('')

}

function checkInputError() {
    let checkError = true;

    for (let i = 0; i < $('#register-form div').length; i++) {
      // console.log(i+"번쨰 => " + $('#register-form div:eq('+i+')').attr('class'));
      let temp = $('#register-form div:eq('+i+')').attr('class');
      if(temp === "form-group custom-validate error"){
        checkError = false;
      }
    }

    return checkError;
}

    // PNotify config
    PNotify.prototype.options.styling = "bootstrap4";

    // Event bind
    $('button').on('click', confirm);

    // PNotify wrapper
    function pNotify() {

        var defaultSettings = {
            icon: 'fa fa-question-sign'
        };

        var confirmSettings = {
            confirm: true,
            buttons: {
                closer: false,
                sticker: false
            },
            hide: false,
            history: {
                history: false
            }
        };

        var _api = {
            confirm: confirm
        };

        return _api;

        ////////////

        function factory(settings) {
            settings = $.extend({}, defaultSettings, settings);

            return new PNotify({
                title: settings.title,
                text: settings.text,
                icon: 'fa fa-question-sign',
                hide: false,
                confirm: {
                    confirm: true
                },
                buttons: {
                    closer: false,
                    sticker: false
                },
                history: {
                    history: false
                }
            });
        }

        function confirm(settings) {
            confirmSettings.title = settings.title;
            confirmSettings.text = settings.text;

            var result = factory(confirmSettings).get();

            return {
                then: function (onConfirm, onCancel) {
                    result.on('pnotify.confirm', onConfirm);
                    result.on('pnotify.cancel', onCancel);
                }
            };
        }
    }