<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ListFoodType.aspx.cs" Inherits="Admin_QFoofType_ListFoodType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" Runat="Server">
    Danh sách thể loại món ăn
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Danh sách món ăn</h4>
                <div class="data-tables datatable-dark">
                    <div id="dataTable3_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12 col-md-6"></div>
                            <div class="col-sm-12 col-md-6">
                                <div id="dataTable3_filter" class="dataTables_filter" style="line-height: 30px;">
                                    <label style="display: inline-flex;">
                                        Search:<form>
                                                    <input type="text" id="txtkey" onchange="ABCD()" class="form-control form-control-sm" placeholder="Search..." aria-controls="dataTable3">
                                                    <i class="ti-search" ></i>
                                                </form>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <table id="dataTable3" class="text-center dataTable no-footer dtr-inline" role="grid" aria-describedby="dataTable3_info" style="width: 959px;">
                                    <thead class="text-capitalize">
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 226px;" aria-sort="ascending" aria-label="Fullname: activate to sort column descending">ID</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 111px;" aria-label="Phone: activate to sort column ascending">Tên</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 94px;" aria-label="Mail: activate to sort column ascending"></th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody  id="cud1">
                                        <%
                                            var listFoodType = new DataUtil().getListFoodType();
                                            foreach (var ft in listFoodType)
                                            {
                                                Response.Write("<tr role=row class=odd>");
                                                Response.Write("<td tabindex=0  class=sorting_1>" + ft.foodtype_id + "</td>");
                                                Response.Write("<td>" + ft.foodtype_name + "</td>");

                                                Response.Write("<td><a href='javascript:void(0)' onclick='funcXoa("+ft.foodtype_id+")' >Xóa</a> | <a href='/Admin/QFoodType/EditFoodType.aspx?IdFoodType="+ft.foodtype_id+"'>Sửa</a></td>");

                                                Response.Write("</tr>");

                                            }
                                        %>
                                    </tbody>

                                    <tbody id="cud2">

                                    </tbody>

                                </table>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="col-sm-12 col-md-5">
                            </div>
                            <div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable3_paginate">
                                    <ul class="pagination">
                                        <li class="paginate_button page-item previous disabled" id="dataTable3_previous"><a href="#" aria-controls="dataTable3" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
                                        <li class="paginate_button page-item active"><a href="#" aria-controls="dataTable3" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
                                        <li class="paginate_button page-item "><a href="#" aria-controls="dataTable3" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
                                        <li class="paginate_button page-item next" id="dataTable3_next"><a href="#" aria-controls="dataTable3" data-dt-idx="3" tabindex="0" class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function funcXoa(id) {
            var kt = confirm("Bạn có chắc muốn xóa không?");
            if (kt) {
                $.ajax({
                    type: "POST",
                    url: "/Admin/QFoodType/ListFoodType.aspx/XoaFoodType",
                    data: "{IdFoodType:" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    //dataType: "json",
                    success: function (msg) {
                        alert(msg.d);
                        location.reload();
                    }
                });
            }
        }

        function ABCD() {
            $.ajax({

                type: "POST",
                data: "{'keywords':'" + $("#txtkey").val() + "'}",
                url: "/Admin/QFoodType/ListFoodType.aspx/TimKiemFType",
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                //async: true,

                success: function (data) {
                    var f = data.d;

                    var html = '';

                    $.each(f, function (index, item) {

                        html += `

                            <tr role=row class ="odd">
	                            <td tabindex=0  class ="sorting_1">${item.foodtype_id}</td>
	                            <td>${item.foodtype_name}</td>

	                            <td><a href='javascript:void(0)' onclick='funcXoa(${item.foodtype_id})'>Xóa</a> | <a href='/Admin/QFoodType/EditFoodType.aspx?IdFoodType=${item.foodtype_id}'>Sửa</a></td>");

                            </tr>
                        `
                    });
                    $("#cud2").html(html);
                    $("#cud1").hide();
                }

            });

        };
    </script>
</asp:Content>

