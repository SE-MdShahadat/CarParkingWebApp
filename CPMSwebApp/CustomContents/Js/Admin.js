$(function () {
    ClearForm();
    $(document).delegate('#btnSave', 'click', function (e) {
        e.preventDefault();
        FormValidation();
    });
    $(document).delegate('#btnShowAll', 'click', function (e) {
        e.preventDefault();
        LoadGridData();
    });
    $(document).delegate('#btnAddNew', 'click', function (e) {
        e.preventDefault();
        ClearForm();
        $("#modalAdmin").modal("toggle");
    });
    $(document).delegate('#btnClear', 'click', function (e) {
        e.preventDefault();
        ClearForm();
    });
    LoadGridData();
    //LoadCountryName();
});

//function FormValidation() {
//    var _isError = 0;
//    var _errorMsg = "";

//    $("#BuyerCreateForm").find('input:text, input:password, input:file, select, textarea')
//        .each(function () {
//            if ($(this).attr("data-required") == "1" && ($(this).val() == null || $(this).val() == "-1" || $(this).val() == "")) {
//                _isError = 1;
//                //_errorMsg += $(this).attr("placeholder") + "\n";
//                $(this).addClass("customError");
//            }
//            else {
//                $(this).removeClass("customError");
//            }
//        });


//    if (_isError == 1) {
//        if (_errorMsg != "") {
//            alert(_errorMsg);
//        }
//        return false;
//    }
//    else
//        SaveFormValue();
//}

//function LoadCountryName() {
//    $.ajax({
//        type: 'GET',
//        contentType: 'application/json; charset=utf-8',
//        url: "/Common/LoadAllCountry",
//        data: {},
//        async: false,
//        dataType: 'json',
//        success: function (data) {
//            $("#ddlCountryID").empty();
//            $("#ddlCountryID").append($("<option ></option>").val("-1").html("--Select Country Name--"));

//            $.each(data, function (i, item) {
//                $("#ddlCountryID").append($("<option ></option>").val(item.CountryID).html(item.CountryName));
//            });
//        }
//    });
//}
function LoadGridData() {
    $.ajax({
        type: "GET",
        url: "/Admin/LoadAllAdmin",
        data: {},
        contentType: "application/json",
        datatype: "json",
        success: function (data) {
            BindGridDataManual(data);
            //alert(data.length);
        }
    });
}

function BindGridDataManual(data) {
    $("#tblAdmin").empty();
    var txt = '<table class="table table-bordered table-striped ">'+
    '<thead>' +
        '<tr>' +
        '<th>AdminID</th>' +
        '<th>Name</th>' +
        '<th>Contact</th>' +
        '<th>Address</th>' +
        '</tr>' +
        '</thead>' +
        '<tbody>';
        $.each(data, function (i, item) {
            //$("#hdBuyerID").val(item.BuyerID);
             txt += '<tr>';
            $.each(item, function (i, item) {
                 txt += '<td>'+ item + '</td>';
            });
             txt += '</tr>';
        });
         txt += '</tbody></table>';
    //alert(txt);
    $("#tblAdmin").append(txt);
   
}
function BindGridData(data) {
    $("#tblBuyer").kendoGrid().empty();
    $("#tblBuyer").kendoGrid({
        dataSource: {
            data: data,
            dataType: "json",
        },
        toolbar: "<a id='btnAddNew' role='button' class='k-button k-button-icontext k-grid-add' href='javascript:void(0)'><span class='k-icon k-i-plus'></span>Add New Record</a>",
        columns: [

            { field: "AdminID", title: "BuyerID", hidden: true, filterable: true },
            { field: "Name", title: "Buyer Name", filterable: true },
            { field: "Contact", title: "Country Name", filterable: true },
            { field: "Address", title: "CM Margin", filterable: true },
            //{ field: "AverageCM", title: "Avg CM", filterable: true },
            //{ field: "LeadTime", title: "Lead Time", filterable: true },
            //{ field: "ExFactoryLead", title: "ExFactory Lead", filterable: true },
            //{ field: "PaymentDays", title: "Payment Days", filterable: true },
            //{ field: "ExcessShipAllow", title: "Excess Ship Allow (%)", filterable: true },
            //{ field: "AllowProductID", title: "Allow Product ID", filterable: true },
            {
                template: '<a role="button" class="k-button k-button-icontext k-grid-edit" href="javascript:void(0)" onclick=LoadEditData(#=BuyerID#)><span class="k-icon k-i-edit"></span>Edit</a>' +
                    '<a role="button" class="k-button k-button-icontext k-grid-delete" style="display:none;" href="javascript:void(0)" onclick=DeleteGridData(#=BuyerID#)><span class="k-icon k-i-close"></span>Delete</a>',
                field: "BuyerID",
                title: "Action",
                width: 170,
                headerAttributes: { style: "text-align: center" },
                attributes: { class: "text-center" },
                filterable: false
            },
        ],
        sortable: true,
        filterable: {
            extra: false, //do not show extra filters
            operators: { // redefine the string operators
                string: {
                    contains: "Contains",
                    startswith: "Starts With",
                    eq: "Is Equal To"
                }
            }
        },
        resizable: true,
        height: 450,
        pageable: false,
        scrollable: true
    });
}

function SaveFormValue() {
    var _isError = 0;
    var AdminID = $("#hdAdminID").val();
    var Name = $("#txtName").val();
    var contact = $("#txtcontact").val();
    var Address = $("#txtAddress").val();

    if (_isError == 1) {
        return false;
    }
    var _dbModel = {
        'AdminID': AdminID, 'Name': Name, 'contact': contact, 'Address': Address,
    };
    $.ajax({
        type: "POST",
        url: "/Admin/SaveAdmin",
        data: JSON.stringify(_dbModel),
        contentType: "application/json",
        datatype: "json",
        success: function (data) {
            if (data.success == true) {
                // LoadGridData();
                $("#modalBuyer").modal("toggle");
                alert("OK");
                //$.notify("Data Save Successfully..", "success");
            }
            else {
                alert("Na");
            }
            //ClearForm();
        }
    });
}

function LoadEditData(BuyerID) {
    var _dbModel = { 'BuyerID': BuyerID };
    $.ajax({
        type: "POST",
        url: "/Buyer/LoadSelectedBuyer",
        data: JSON.stringify(_dbModel),
        contentType: "application/json",
        datatype: "json",
        success: function (data) {
            $.each(data, function (i, item) {
                $("#hdBuyerID").val(item.BuyerID);
                $("#txtBuyerName").val(item.BuyerName);
                $("#ddlCountryID").val(item.CountryID);
                $("#txtCMMargin").val(item.CMMargin);
                $("#txtAverageCM").val(item.AverageCM);
                $("#txtLeadTime").val(item.LeadTime);
                $("#txtExFactoryLead").val(item.ExFactoryLead);
                $("#txtPaymentDays").val(item.PaymentDays);
                $("#txtExcessShip").val(item.ExcessShipAllow);
                if (item.AllowProductID == true)
                    $("#chkIsProductIDAllow").prop("checked", true);
                else
                    $("#chkIsProductIDAllow").prop("checked", false);
            });
            $("#modalBuyer").modal("toggle");
        }
    });
}

function DeleteGridData(BuyerID) {
    var ans = confirm("Are you sure to delete a record");
    if (ans == true) {
        var _dbModel = { 'BuyerID': BuyerID };
        $.ajax({
            type: "POST",
            url: "/Buyer/DeleteBuyer",
            data: JSON.stringify(_dbModel),
            contentType: "application/json",
            datatype: "json",
            success: function (data) {
                if (data.success == true) {
                    LoadGridData();
                    $.notify("Data Deleted Successfully..", "success");
                }
                else {
                    $.notify("Data Deleted Failed..!", "error");
                }
            }
        });
    }
}

function ClearForm() {
    $("#hdAdminID").val("");
    $(".txt").val("");
}
