// url 파라미터값 가져오기
function getParameterByName(name) {
  	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
   	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
   	results = regex.exec(location.search);
   	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var cprojNo = getParameterByName("cprojNo");

//콜라보 리스트 데이터소스
const cprojDataSource = new kendo.data.DataSource({
      type: "json",
      transport: {
          read: "/app/collabo/getCollaboList"
      },
      schema: {
          model: {
        	  id:"id",
              fields: {
            	  id: { type: "number"},
            	  title: { type: "string" },
            	  startdate: { type: "date" },
            	  enddate: { type: "date" },
            	  status: { type: "string" },
            	  updatedate: { type: "date" },
              }
          }
      }
});

const cprojList = $("#collabo-list").kendoGrid({
	pageable:true,
	toolbar: [
		{ template: "<a class='k-button' href='javascript:getOverlayTemplate(\"projRegistTypeTemplate\");'>프로젝트 등록</a>" }
		,{ template: "<div class='k-spacer'>&nbsp;</div>"},"search","pdf"
	],
    columns: [
    	{ field: "title", hidden:true},
    	{ field: "status",hidden:true },
		{ field: "startdate",hidden:true},
		{
			template: $("#collaboCardTemplate").html()
		},
	],
	dataSource: cprojDataSource,
});

