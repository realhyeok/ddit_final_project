$("#filemanager").kendoFileManager({
    dataSource: {
        schema: kendo.data.schemas.filemanager,
        transport: {
            read: {
                url: "/kendo-ui/service/FileManager/Read",
                method: "POST"
            },
            create: {
                url: "/kendo-ui/service/FileManager/Create",
                method: "POST"
            },
            update: {
                url: "/kendo-ui/service/FileManager/Update",
                method: "POST"
            },
            destroy: {
                url: "/kendo-ui/service/FileManager/Destroy",
                method: "POST"
            }
        }
    },
    uploadUrl: "/kendo-ui/service/FileManager/Upload",
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

$(document).ready(function () {
    var filemanager = $("#filemanager").getKendoFileManager();

    filemanager.executeCommand({ command: "TogglePaneCommand", options: { type: "preview" } });
    filemanager.toolbar.fileManagerDetailsToggle.switchInstance.toggle();
})