<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="QLWeb.aspx.cs" Inherits="Admin_QLWeb_QLWeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Thông Tin Nhà Hàng </h4>
                <div class="data-tables datatable-dark">
                    <div id="dataTable3_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div id="dataTable3_filter" class="dataTables_filter" style="line-height: 30px;">
                                
                                <%--Search:<form action="#">
                                    <input type="search" class="form-control form-control-sm" placeholder="Search" aria-controls="dataTable3">
                                    <i class="ti-search"></i>
                                </form>
                                </label>--%>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="dataTable3" class="text-center dataTable no-footer dtr-inline" role="grid" aria-describedby="dataTable3_info" style="width: 959px;">
                                <thead class="text-capitalize">
                                    <tr role="row">
                                        
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 111px;" aria-label="Phone: activate to sort column ascending">Tên</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 94px;" aria-label="Mail: activate to sort column ascending">Địa Chỉ</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 54px;" aria-label="Username: activate to sort column ascending">Số điện thoại</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending">Email</th>
                                         <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending">Ảnh infor</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending">Ảnh Banner</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 77px;" aria-label="salary: activate to sort column ascending">Giới thiệu</th>
                                        
                                        <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 30px;" aria-label="Type Date: activate to sort column ascending"></th>
                                    </tr>
                                </thead>
                                <tbody id="cud1">
                                   
                                        <%
                                            var qlweb = new DataUtil().qlweb();
                                            
                                                Response.Write("<tr role=row class=odd>");
                                                Response.Write("<td tabindex=0  class=sorting_1>" + qlweb.ten_nh + "</td>");
                                                Response.Write("<td>" +  qlweb.diachi_nh + "</td>");
                                                Response.Write("<td>" + qlweb.sdt_nh + "</td>");
                                                Response.Write("<td>" + qlweb.email_nh + "</td>");
                                                
                                                Response.Write("<td><img  src='../../Assets/images/" +  qlweb.anh_nh + "' height='100' width='200' /></td>");
                                                Response.Write("<td><img  src='../../Assets/images/" +  qlweb.banner_nh + "' height='100' width='200' /></td>");
                                                Response.Write("<td>" +  qlweb.gt_nh+ "</td>");
                                                
                                                Response.Write(" <td><a href='/Admin/QLWeb/editQLWeb.aspx?id_nh=" +  qlweb.id_nh + "'>Sửa</a></td>");

                                                Response.Write("</tr>");

                                            
                                        %>
                                    

                                  
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

</asp:Content>

