<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ListTable.aspx.cs" Inherits="Admin_QlTable_ListTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
     <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">List Table</h4>
                <div class="data-tables datatable-dark">
                    <div id="dataTable3_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <%--<div class="dataTables_length" id="dataTable3_length">
                                    <label>
                                        Hiển thị
                                        <select name="dataTable3_length" aria-controls="dataTable3" class="custom-select custom-select-sm form-control form-control-sm">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        </label>
                                </div>--%>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div id="dataTable3_filter" class="dataTables_filter">
                                    <label>Table for a few people:
                                        <select name="" id="lb2" class="form-control" onchange="sltbl()">
                                            <option>All</option>
                                        <%
                                                        var listLTable = new DataUtil().dslb();
                                            
                                                        foreach (var tb in listLTable)
                                                        {
                                                            Response.Write("<option >" + tb.table_description + "</option>");

                                                        }
                                         %>
                                         </select>   
                                            </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="dataTable3" class="text-center dataTable no-footer dtr-inline" role="grid" aria-describedby="dataTable3_info" style="width: 959px;">
                                    <thead class="text-capitalize">
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 111px;" aria-sort="ascending" >ID Table</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 226px;" >Table Name</th>
                                            
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 54px;" >Seating</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 94px;" >Status</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 54px;" >Function</th>
                                            <%--<th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending">Type</th>--%>
                                            <%--<th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 77px;" aria-label="salary: activate to sort column ascending">salary</th>--%>
                                        </tr>
                                    </thead>
                                    <tbody id="tbl" >
                                        
                                            <%
                                            var listTable = new DataUtil().dsTable();
                                            foreach (var tb in listTable)
                                            {
                                                Response.Write("<tr role=row class=odd>");

                                                Response.Write("<td tabindex=0  class=sorting_1>"+tb.table_id+"</td>");
                                                Response.Write("<td>"+tb.table_name+"</td>");
                                                 

                                                Response.Write("<td>"+tb.table_description+"</td>");
                                                if(tb.table_status == true)
                                                {
                                                    Response.Write("<td>Reserved  | <a href='/Admin/QLTable/detailOTable.aspx?idotable="+tb.table_id+"'>Detail</a></td>");
                                                }
                                                else
                                                {
                                                    Response.Write("<td>Not Yet Booked</td>");
                                                }
                                                Response.Write("<td><a href='javascript:void(0)' style='color:red;' onclick='funcXoa("+tb.table_id+")'>Delete</a> | <a href='/Admin/QLTable/UpdateTable.aspx?idtable="+tb.table_id+"'>Edit</a></td>");
                                                Response.Write("</tr>");
                                               

                                               
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <%--<div class="col-sm-12 col-md-5">
                                <div class="dataTables_info" id="dataTable3_info" role="status" aria-live="polite">Showing 1 to 10 of 11 entries</div>
                            </div>--%>
                            <%--<div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable3_paginate">
                                    <ul class="pagination">
                                        <li class="paginate_button page-item previous disabled" id="dataTable3_previous"><a href="#" aria-controls="dataTable3" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
                                        <li class="paginate_button page-item active"><a href="#" aria-controls="dataTable3" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
                                        <li class="paginate_button page-item "><a href="#" aria-controls="dataTable3" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
                                        <li class="paginate_button page-item next" id="dataTable3_next"><a href="#" aria-controls="dataTable3" data-dt-idx="3" tabindex="0" class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function funcXoa(id) {
            var kq = confirm("Do You Want To Delete It?")
            if (kq) {
                $.ajax({
                    type: "POST",
                    url: "/Admin/QlTable/ListTable.aspx/XoaTable",
                    data: "{idtable:" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    //dataType: "json",
                    success: function (msg) {
                        alert(msg.d);
                        location.reload();
                    }
                });

            }
        };
        
        function sltbl () {
            var lb = $("#lb2").val();
            //alert(lb);

            
            $.ajax({
                type: "post",
                url: "/admin/qltable/listtable.aspx/sltable",
                data: "{'lb':'" + lb + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (dt) {
                    //alert(dt.d);
                    $("#tbl").html(dt.d);

                },
                error: function () {
                    alert("Error");
                }
            });
        };

        

    </script>
</asp:Content>

