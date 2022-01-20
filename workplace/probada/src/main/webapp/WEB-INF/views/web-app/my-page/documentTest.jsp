<!DOCTYPE html>
<html>
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

 var data = [
         {
           name: "Folder",
           isDirectory: true,
           hasDirectories: false,
           path: "folder",
           extension: "",
           size: 0,
           createdUtc: new Date(),
           items: [
               {
                 name: "Image.jpg",
                 isDirectory: false,
                 hasDirectories: false,
                 path: "Images/Folder/Image.jpg",
                 extension: ".jpg",
                 size: 20,
                 createdUtc: new Date(),
               },
               {
                 name: "Image2.jpg",
                 isDirectory: false,
                 hasDirectories: false,
                 path: "Images/Folder/Image2.jpg",
                 extension: ".jpg", 
                 size: 20,
                 createdUtc: new Date(),
               }
           ]        
         
         }
      ];
 
   

        $("#filemanager").kendoFileManager({
            dataSource: {
            transport: {
                read: function(options) {
                    var data = this;

                    $.ajax({	
                        url:  "Read",
                        dataType: "json", 
                        method: "POST",
                        data: data.parameterMap ? data.parameterMap(options.data, "read") : options.data,
                        success: function(result) {
                            options.success(result);
                        }
                    });
                },
                update: function(options) {
                    var that = this;

                    $.ajax({
                        url:"Update",
                        dataType: "json", 
                        method: "POST",
                        data: data.parameterMap ? data.parameterMap(options.data, "read") : options.data,
                        success: function(result) {
                            options.success(result);
                        }
                    });
                },
                create: function(options) {
                    var that = this;

                  
                    $.ajax({
                        url:"<%=request.getContextPath()%>/test/create",
                        dataType: "json", 
                        method: "POST",
                        data: data.parameterMap ? data.parameterMap(options.data, "read") : options.data,
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
                        data: data.parameterMap ? data.parameterMap(options.data, "read") : options.data,
                        success: function(result) {
                            options.success(result);
                        }
                    });
                },

            }

            
        },
        uploadUrl: "<%=request.getContextPath()%>/test/doc",
            toolbar: {
                items: [
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
            draggable: true,
            resizable: true


    });
    </script>

  

</div>
</body>
</html>


 
 
 
 
 
 