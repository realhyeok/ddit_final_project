$("#project-list").kendoGrid({
	toolbar: [
    	{ template: "<a class='k-button' href='javascript:overlay(\"이슈\");'>이슈 등록</a>" }
    	,"search","excel", "pdf" ],
  columns: [
	  { field: "title", hidden:true},
	    { field: "status", hidden:true },
	    { field: "startdate", hidden:true },
	{
	template: kendo.template($("#project-card-template").html())
	}],

  dataSource: {
      type: "json",
      transport: {
          read: "/app/project/getProjectList"
      },
      schema: {
          model: {
              fields: {
            	  title: { type: "string" },
            	  startdate: { type: "string" },
            	  endDate: { type: "date" },
            	  status: { type: "string" },
            	  updatedate: { type: "date" },
              }
          }
      },
  }
});