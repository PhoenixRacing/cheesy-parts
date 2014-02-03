$(document).ready(function() {
		$(":text:visible:enabled:first").focus();
});

function verifyPasswordMatch(form) {
	if (form.password.value == form.password2.value) {
		return true;
	} else {
		alert("The passwords do not match.");
		return false;
	}
}

// Global variables to store current filter state for auto-refresh.
var dashboardProjectId, dashboardStatus;

function changeDashboardFilter(projectId, status) {
	dashboardProjectId = projectId;
	dashboardStatus = status;
	loadParts();
}

function loadParts() {
	$.ajax({
		url: "/projects/" + dashboardProjectId + "/dashboard/parts?status=" + dashboardStatus,
		complete: function(response) {
			$("#dashboard-parts").html(response.responseText);
			$("#dashboard-parts").tooltip({
				selector: ".dashboard-part",
				placement: "bottom"
			});
		}
	});
}

function vendorAutoComplete(selector) {
	$(selector).typeahead({
		source: vendors
	});
}

// Only allow editing one item at a time.
var editingOrderItem = false;

function editOrderItem(projectId, orderItemId) {
	if (editingOrderItem) {
		alert("Can only edit one item at a time.");
		return;
	}
	editingOrderItem = true;
	$.ajax({
		url: "/projects/" + projectId + "/order_items/" + orderItemId + "/editable",
		complete: function(response) {
			$("#order-item-" + orderItemId).html(response.responseText);
			vendorAutoComplete("#edit-vendor");
			$("#edit-vendor").focus();
		}
	});
}

function addFabStep(){
	// create the fabmap
	fabmap = {}
	$("#fablist_choices option").each( function() {
		fabmap[$(this).val()] = $(this)[0].label;
	});

	// update #fablist
	if ($("#fablist").val().length > 0){
		key_list = $("#fablist").val().split(',');
		name_list = $("#");
	}
	else{
		key_list = [];
	}
	key_list.push($('#fablist_choices').val());
	$("#fablist").val(key_list.join(','));

	// update #fablist_show
	$("#fablist_show").empty();
	for (i=0; i<key_list.length; i++){
		$("#fablist_show").append('<div><span class="label label-status-' + key_list[i] + '">'+ fabmap[key_list[i]] +'</span></div>');
	}

	// other
}

$(function() {
	vendorAutoComplete("#vendor");
	$(".datepicker").datepicker();
});
