<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>    



<head>
    <title></title>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2021.3.1207/styles/kendo.default-v2.min.css"/>

    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2021.3.1207/js/kendo.all.min.js"></script>
    
    

</head>
<body>
    <div id="example">
    <div id="filemanager"></div>

    <script>

  
 
 var baseUrl = "<%=request.getContextPath()%>/test/";

       
   $("#filemanager").kendoFileManager({
            dataSource: {
            transport: {
             
            	
            	 read: function(options) {
                     var that = this;
                 
                     $.ajax({
                         url: baseUrl + "Read",
                         dataType: "json", 
                         method: "POST",
                         data: that.parameterMap ? that.parameterMap(options.data, "read") : options.data,
                       
                         success: function(result) {
                             options.success(result);
                            
                         }
                     });
                 },
                 update: function(options) {
                	 var that = this;
                	
                     $.ajax({
                         url: baseUrl + "Update",
                         dataType: "json", 
                         method: "POST",
                         data: that.parameterMap ? that.parameterMap(options.data, "read") : options.data,
                         success: function(result) {
							
                             options.success(result);
                            
                         }
                     });
                 },
                 create: function(options) {
                     var that = this;
                    
                     $.ajax({
                         url: baseUrl + "Create",
                         dataType: "json", 
                         method: "POST",
                         data: that.parameterMap ? that.parameterMap(options.data, "read") : options.data,
                         success: function(result) {
                             options.success(result);
                            
                            
			                 
                         }
                     });
                     
                 },
                 destroy: function(options) {
                     var that = this;
                   
                     $.ajax({
                         url: baseUrl + "Destroy",
                         dataType: "json", 
                         method: "POST",
                         data: that.parameterMap ? that.parameterMap(options.data, "read") : options.data,
                         success: function(result) {
                             options.success(result);
                             
                         }
                     });
                 }

            }

            
        },
        uploadUrl: "<%=request.getContextPath()%>/test/doc",
            toolbar: {
                items: [
                	{ name: "download"},
                	/* { template: "<button class='k-button' onclick=''><span class='k-button-text'>저장하기</span></button>"}, */
                    { name: "createFolder" },
                    { name: "upload" },
                    { name: "sortDirection" },
                    { name: "sortField" },
                    { name: "changeView" },
                    { name: "spacer" },
                    { name: "details" },
                    { name: "search" }
                ]
            },
            contextMenu: {
                items: [
                    { name: "rename" },
                    { name: "delete" }
                ]
            },
            
            model: {
                id: "path",
                hasChildren: "hasDirectories",
                fields: {
                	DOC_NO: {editable: true, type: "String"},
                    name: {editable: true, type: "String", defaultValue: "New Folder" },
                    size: {editable: false, type: "Number"},
                    path: {editable: false, type: "String"},
                    extension: {editable: false, type: "String"},
                    isDirectory: {editable: false, defaultValue: true, type: "Boolean"},
                    hasDirectories: {editable: false, defaultValue: false, type: "Boolean"},
                    created: { from: "created", type: "Date", editable: false},
                    createdUtc: { from: "createdUtc", type: "Date", editable: false },
                    modified: { from: "modified", type: "Date", editable: false},
                    modifiedUtc: { from: "modifiedUtc", type: "Date", editable: false }
                }
            },
            
            draggable: true,
            resizable: true
            


    });
  
   
    </script>

  

</div>
</body>

<script></script>



 
 
 
 
 
 