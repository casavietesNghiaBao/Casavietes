<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ListFood.aspx.cs" Inherits="Admin_QFood_ListFood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    Danh sách món ăn
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
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
                                                    <input type="text" id="txtkey" onchange="ABC()" class="form-control form-control-sm" placeholder="Search..." aria-controls="dataTable3">
                                                    <i class="ti-search"></i>
                                                </form>
                                    </label>

                                </div>
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
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 94px;" aria-label="Mail: activate to sort column ascending">Giá (vnđ)</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 54px;" aria-label="Username: activate to sort column ascending">Giảm giá (%)</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending">Ảnh</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 77px;" aria-label="salary: activate to sort column ascending">Miêu tả</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending">Loại</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending"></th>
                                    </tr>
                                </thead>
                                <tbody id="cud1">
                                        <%
                                            var listFoods = new DataUtil().getListFood();
                                            foreach (var f in listFoods)
                                            {
                                                Response.Write("<tr role=row class=odd>");
                                                Response.Write("<td tabindex=0  class=sorting_1>" + f.food_id + "</td>");
                                                Response.Write("<td>" + f.food_name + "</td>");
                                                Response.Write("<td>" + f.food_price.ToString("#,##0 VNĐ") + "</td>");
                                                Response.Write("<td>" + f.food_sale + "</td>");
                                                Response.Write("<td><img  src='../../Assets/images/" + f.food_avatar + "' height='100' width='100' /></td>");
                                                Response.Write("<td>" + f.food_description + "</td>");
                                                if (f.foodtype_id == 1)
                                                {
                                                    Response.Write("<td>Hải sản</td>");
                                                }
                                                else if (f.foodtype_id == 2)
                                                {
                                                    Response.Write("<td>Đặc sản</td>");
                                                }
                                                else
                                                {
                                                    Response.Write("<td>Tráng miệng</td>");
                                                }
                                                Response.Write("<td><a href='javascript:void(0)' onclick='funcXoa(" + f.food_id + ")'>Xóa</a> | <a href='/Admin/QFood/EditFood.aspx?IdFood=" + f.food_id + "'>Sửa</a></td>");

                                                Response.Write("</tr>");

                                            }
                                        %>
                                    </tbody>

                                    <tbody id="cud2"></tbody>

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
            var kt = confirm("Bạn chắc chắn xóa chứ ?")
            if (kt) {
                $.ajax({
                    type: "POST",
                    url: "/Admin/QFood/ListFood.aspx/XoaFood",
                    data: "{idFood:" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    //dataType: "json",
                    success: function (msg) {
                        alert(msg.d);
                        location.reload();
                    }
                });
            }
        }

        function ABC() {
            $.ajax({

                type: "POST",
                data: "{'keywords':'" + $("#txtkey").val() + "'}",
                url: "/Admin/QFood/ListFood.aspx/TimKiem",
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                //async: true,

                success: function (data) {
                    var f = data.d;

                    var html = '';
                    //var h = '';
                    //$("#txtkey").value() = $("#txtkey").val();
                    $.each(f, function (index, item) {

                        item.h = '';
                        if (item.food_id == 1) {
                            item.h = 'Hải sản';
                        }
                        else if (item.food_id == 2) {
                            item.h = `Đặc sản`
                        }
                        else {
                            item.h = `Tráng miệng`
                        }

                        //alert(h);

                        html += `

                            <tr role=row class ="odd">
	                            <td tabindex=0  class ="sorting_1">${item.food_id}</td>
	                            <td>${item.food_name}</td>
	                            <td>${item.food_price}</td>
	                            <td>${item.food_sale}</td>
	                            <td><img  src='../../Assets/images/${item.food_avatar}' height='100' width='100' /></td>
	                            <td>${item.food_description}</td>

                                <td>${item.h}</td>

	                            <td><a href='javascript:void(0)' onclick='funcXoa(${item.food_id})'>Xóa</a> | <a href='/Admin/QFood/EditFood.aspx?IdFood=${item.food_id}'>Sửa</a></td>");

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

