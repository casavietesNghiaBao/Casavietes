<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ListOrderTable.aspx.cs" Inherits="Admin_QLOrderTable_ListOrderTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
     <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">List Order Table</h4>
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
                                    <label>Booking Date:
                                        <select name="" id="n" class="form-control" onchange="slotbn()">
                                            <option>Tất cả</option>
                                        <%
                                                        var listngay = new DataUtil().dsngay();
                                            
                                                        foreach (var tb in listngay)
                                                        {
                                                            Response.Write("<option >" + tb.ordertable_dateset.ToString("yyyy-MM-dd") + "</option>");

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
                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 111px;" aria-sort="ascending" >ID Order Table</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 94px;" >Booking Name</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 226px;" >Booking date</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 226px;" >Reservation Time</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 226px;" >Check-out Time</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 94px;" >ID Table</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 94px;" >Status</th>                                    
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 54px;" >Function</th>
                                            <%--<th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending">Type</th>--%>
                                            <%--<th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 77px;" aria-label="salary: activate to sort column ascending">salary</th>--%>
                                        </tr>
                                    </thead>
                                    <tbody id="tbn">
                                        <%
                                            var listOrderTable = new DataUtil().dsOrderTable();
                                            foreach (var tb in listOrderTable)
                                            {
                                                Response.Write("<tr role=row class=odd>");

                                                Response.Write("<td tabindex=0  class=sorting_1>"+tb.ordertable_id+"</td>");
                                                Response.Write("<td>"+tb.tenKH+"</td>");
                                                Response.Write("<td>"+tb.ordertable_dateset.ToString("yyyy-MM-dd")+"</td>");
                                                Response.Write("<td>"+tb.ordertable_timeset+"</td>");
                                                Response.Write("<td>"+tb.ordertable_timereturn+"</td>");
                                                Response.Write("<td>"+tb.ordertable_idtable+"</td>");
                                                if(tb.ordertable_status == true)
                                                {
                                                    Response.Write("<td>Paid</td>");
                                                }
                                                else
                                                {
                                                    Response.Write("<td>Unpaid</td>");
                                                }                                                
                                                Response.Write("<td><a href='javascript:void(0)' style='color:red;' onclick='funcXoa("+tb.ordertable_id+")'>Delete</a> | <a href='/Admin/QLOrderTable/UpdateOrderTable.aspx?idotable="+tb.ordertable_id+"'>Edit</a></td>");
                                                                                                                                                
                                                Response.Write("</tr>");


                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function funcXoa(id) {
            var kt = confirm("Are You Sure You Want To Delete? ?")
            if (kt) {
                $.ajax({
                    type: "POST",
                    url: "/Admin/QlOrderTable/ListOrderTable.aspx/XoaTable",
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
        function slotbn() {
            var n = $("#n").val();
            //alert(lb);
            $.ajax({
                type: "post",
                url: "/Admin/QlOrderTable/ListOrderTable.aspx/slotable",
                data: "{'n':'" + n + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (dt) {
                    //alert(dt.d);
                    $("#tbn").html(dt.d);
                },
                error: function () {
                    alert("loi");
                }
            });
        };
    </script>
</asp:Content>

