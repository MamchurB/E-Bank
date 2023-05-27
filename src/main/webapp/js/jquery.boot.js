$(function() {
	$("#userList").click(function() {
		fetchList("user");
	});

});
$(function() {
	$("#taskList").click(function() {
		fetchList("task");
	});

});
$(function() {
	$("#calendarList").click(function() {
		console.log("calendarList");
		modifyData("calendar");
	});

});
var pageConstant = "?page=1";

function addForm(type) {
	modifyData(type+"/form");
}

function editForm(type, id) {
	modifyData(type+"/edit/"+id);
}

function fetchList(type) {
	modifyData(type+"/list"+pageConstant);
}

function refresh(type) {
	modifyData(type+"/refresh"+pageConstant);
}

function list(type, page) {
	modifyData(type+"/list?page="+page);
}

function modifyData(suffix) {
	console.log("/todolist/"+suffix);
	$.ajax({
		type : "GET",
		url : "/todolist/"+suffix,
		success : function(data) {
			$(".inner-jsp").html(data);
		}
	});
}

function executedTask(type, id) {
	$.ajax({
		type : "GET",
		url : "/todolist/"+type+"/executed/"+id,
		success : function(data) {
			fetchList(type);
			toastr.success(data.message, "Notification", {
				closeButton:true
			});
			// window.location.reload(true);
		}
	});
}

// function languageChange() {
// 	$.ajax({
// 		type : "POST",
// 		url : "/todolist/user/languages",
// 		success : function(data) {
// 			fetchList(type);
// 			// toastr.success(data.message, "Notification", {
// 			// 	closeButton:true
// 			// });
// 			window.location.reload(true);
// 		}
//
// 	});
// 	window.location.reload(true);
// }
function addingTask(type, id) {
	console.log("/todolist/"+type+"/adding_sub_task/"+id);
	$.ajax({
		type : "GET",
		url : "/todolist/"+type+"/adding_sub_task/"+id,
		success : function(data) {
			console.log("/todolist/"+type+"/addTask/"+id);
			fetchList(type);
			toastr.success(data.message, "Notification", {
				closeButton:true
			});
			window.location.reload(true);
		}
	});
}


function deleteData(type, id) {
	toastr.warning("<div>Are you sure you want to delete this?</div>" +
			"<div style = 'margin-top:5px;' class='btn-group pull-right'>" +
			"<button style = 'padding:2px 5px' type='button' id='confirmationYes' class='btn btn-xs btn-default'><i class='glyphicon glyphicon-ok'></i> Yes </button> &nbsp &nbsp &nbsp" +
			"<button style = 'padding:2px 5px' type='button' class='btn btn-xs btn-default clear'><i class='glyphicon glyphicon-remove'></i> No</button>" +
			"</div>", "Delete Confirmation", {
		allowHtml:true,
		closeButton:true,

		onShown: function() {
			$("#confirmationYes").click(function() {
				$.ajax({
					type : "GET",
					url : "/todolist/"+type+"/delete/"+id,
					success : function(data) {
						console.log("/todolist/"+type+"/delete/"+id);
						fetchList(type);
						toastr.success(data.message, "Delete Confirmation", {
							closeButton:true
						});
						 window.location.reload(true);
					}
				});
			});
		}
	});
}