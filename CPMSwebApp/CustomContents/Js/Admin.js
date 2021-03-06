﻿$(function () {
    ClearForm();
    $(document).delegate('#btnSave', 'click', function (e) {
        e.preventDefault();
        //FormValidation();
        SaveFormValue();
        
    });
    $(document).delegate('#btnShowAll', 'click', function (e) {
        e.preventDefault();
        LoadGridData();
    });
    $(document).delegate('#ddlCountry', 'change', function (e) {
        e.preventDefault();
        var id = $("#ddlCountry").val();
        LoadDDLCityData(id);
        //alert(id);
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
    LoadDDLMasterData();
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
            //BindGridDataManual(data);
            BindGridData(data);
            //alert(data.length);
        }
    });
}
function LoadDDLMasterData() {
    $.ajax({
        type: "GET",
        url: "/Admin/LoadDDLMasterData",
        data: {},
        contentType: "application/json",
        datatype: "json",
        success: function (data) {
            $("#ddlCountry").empty();
            var txt = '';
            txt += '<option value="-1">--Select Country--</option>';
            $.each(data, function (i, item) {
                txt += '<option value="' + item.Code + '">' + item.Value+'</option>';
            });
            $("#ddlCountry").append(txt);
        }
    });
}
function LoadDDLCityData(CountryID) {
    var _dbModel = { 'CountryID': CountryID };
    $.ajax({
        type: "POST",
        url: "/Admin/LoadDDLCityData",
        data: JSON.stringify(_dbModel),
        contentType: "application/json",
        datatype: "json",
        async: false,
        success: function (data) {
            $("#ddlCity").empty();
            var txt = '';
            txt += '<option value="-1">-- Select City --</option>';
            $.each(data, function (i, item) {
                txt += '<option value="' + item.Code + '">' + item.Value+'</option>';
            });
            $("#ddlCity").append(txt);
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
        '<th>Country</th>' +
        '<th>City</th>' +
        '<th>Action</th>' +
        '</tr>' +
        '</thead>' +
        '<tbody>';
        $.each(data, function (i, item) {
            //$("#hdBuyerID").val(item.BuyerID);
             txt += '<tr>';
            $.each(item, function (i, item) {
                txt += '<td>' + item + '</td>';
                  
            });
            txt += '<td><button onclick=LoadEditData(' + item.AdminID + ') type="button" id="btnEdit" class="btn btn-info">Edit</button> <button onclick=DeleteData(' + item.AdminID + ')  type="button" id="btnDelete" class="btn btn-danger">Delete</button></td>';
            txt += '</tr>';
        });
         txt += '</tbody></table>';
    //alert(txt);
    $("#tblAdmin").append(txt);
   
}

//start bindwithgrid test
function BindGridData(data) {
    $("#tblAdmin").kendoGrid().empty();
    $("#tblAdmin").kendoGrid({
        dataSource: {
            data: data,
            dataType: "json",
        },
        toolbar: "<a id='btnAddNew' role='button' class='k-button k-button-icontext k-grid-add' href='javascript:void(0)'><span class='k-icon k-i-plus'></span>Add New Record</a>",
        columns: [

            { field: "AdminID", title: "Admin", hidden: true, filterable: true },
            { field: "Name", title: "Name", filterable: true },
            { field: "Contact", title: "Contact", filterable: true },
            { field: "Address", title: "Address", filterable: true },
            { field: "Country", title: "Country", filterable: true },
            { field: "City", title: "City", filterable: true },
            
            {
                field: "AdminID",
                template: '<a role="button" class="k-button k-button-icontext k-grid-edit" href="javascript:void(0)" onclick=LoadEditData(#=AdminID#)><span class="k-icon k-i-edit"></span>Edit</a>' +
                    '<a role="button" class="k-button k-button-icontext k-grid-delete" " href="javascript:void(0)" onclick=DeleteGridData(#=AdminID#)><span class="k-icon k-i-close"></span>Delete</a>',
                
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

//end bindwithgrid test
function SaveFormValue() {
    var _isError = 0;
    var AdminID = $("#hdAdminID").val();
    var Name = $("#txtName").val();
    var Contact = $("#txtContact").val();
    var Address = $("#txtAddress").val();
    var Country = $("#ddlCountry").val();
    var City = $("#ddlCity").val();
    alert(Country);
    alert(City);
    if (_isError == 1) {
        return false;
    }
    var _dbModel = {
        'AdminID': AdminID, 'Name': Name, 'Contact': Contact, 'Address': Address, 'Country':Country, 'City': City,
    };
    
    $.ajax({
        type: "POST",
        url: "/Admin/SaveAdmin",
        data: JSON.stringify(_dbModel),
        contentType: "application/json",
        datatype: "json",
        success: function (data) {
            if (data.success == true) {
                 LoadGridData();
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
function LoadEditData(AdminID) {
    var _dbModel = { 'AdminID': AdminID };
    $.ajax({
        type: "POST",
        url: "/Admin/LoadSelectedAdmin",
        data: JSON.stringify(_dbModel),
        contentType: "application/json",
        datatype: "json",
        async:true,
        success: function (data) {
            $.each(data, function (i, item) {
                $("#hdAdminID").val(item.AdminID);
                $("#txtName").val(item.Name);
                $("#txtContact").val(item.Contact);
                $("#txtAddress").val(item.Address);
                $("#ddlCountry").val(item.Country);
                $("#ddlCountry").trigger("change");
                //LoadDDLCityData(item.Country);
                //alert(item.City);
                $("#ddlCity").val(item.City);
                
                
            });
            $("#modalAdmin").modal("toggle");
        }
    });
}
//function DeleteGridData(BuyerID) {
//    var ans = confirm("Are you sure to delete a record");
//    if (ans == true) {
//        var _dbModel = { 'BuyerID': BuyerID };
//        $.ajax({
//            type: "POST",
//            url: "/Buyer/DeleteBuyer",
//            data: JSON.stringify(_dbModel),
//            contentType: "application/json",
//            datatype: "json",
//            success: function (data) {
//                if (data.success == true) {
//                    LoadGridData();
//                    $.notify("Data Deleted Successfully..", "success");
//                }
//                else {
//                    $.notify("Data Deleted Failed..!", "error");
//                }
//            }
//        });
//    }
//}
function DeleteData(AdminID) {
    var ans = confirm("Are you sure to delete a record");
    if (ans == true) {
        var _dbModel = { 'AdminID': AdminID };
        $.ajax({
            type: "POST",
            url: "/Admin/DeleteAdmin",
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
    $(".ddlMaster").val("-1");
}
