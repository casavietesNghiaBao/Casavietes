<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="detailOTable.aspx.cs" Inherits="Admin_QlTable_detailOTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Booked Table Details</h4>
                <div class="data-tables datatable-dark">
                    <div id="dataTable3_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
<%--                                <div class="dataTables_length" id="dataTable3_length">
                                    <label>
                                        Show
                                        <select name="dataTable3_length" aria-controls="dataTable3" class="custom-select custom-select-sm form-control form-control-sm">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        entries</label>
                                </div>--%>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div id="dataTable3_filter" class="dataTables_filter">
                                    <label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable3"></label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="dataTable3" class="text-center dataTable no-footer dtr-inline" role="grid" aria-describedby="dataTable3_info" style="width: 959px;">
                                    <thead class="text-capitalize">
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 111px;" aria-sort="ascending" >ID OrderTable</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 226px;" >Booking Date</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 226px;" >Reservation Time</th>
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 226px;" >Return Time</th>
                                            
                                            <th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 94px;" >Status</th>
                                            
                                            
                                           
                                            <%--<th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 109px;" aria-label="Type Date: activate to sort column ascending">Type</th>--%>
                                            <%--<th class="sorting" tabindex="0" aria-controls="dataTable3" rowspan="1" colspan="1" style="width: 77px;" aria-label="salary: activate to sort column ascending">salary</th>--%>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            var id = Request.QueryString["idotable"];
                                            var listOrderTableMa = new DataUtil().dsOrderTableMa(Convert.ToInt16(id));
                                            foreach (var tb in listOrderTableMa)
                                            {
                                                Response.Write("<tr role=row class=odd>");

                                                Response.Write("<td tabindex=0  class=sorting_1>"+tb.ordertable_id+"</td>");
                                                Response.Write("<td>"+tb.ordertable_dateset.ToString("yyyy-MM-dd")+"</td>");
                                                Response.Write("<td>"+tb.ordertable_timeset+"</td>");
                                                Response.Write("<td>"+tb.ordertable_timereturn+"</td>");
                                                
                                                if(tb.ordertable_status == true)
                                                {
                                                    Response.Write("<td>Paid</td>");
                                                }
                                                else
                                                {
                                                    Response.Write("<td>Unpaid</td>");
                                                }                                                
                                                
                                                                                                                                                
                                                Response.Write("</tr>");


                                            }
                                        %>
                                    </tbody>
                                    
                                </table>
                                <a  href="ListTable.aspx" style="text-align:center; font-size:30px; padding-bottom:10px;">List Table</a>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        function funcXoa(id) {
            var kt = confirm("Bạn có muốn xóa không ?")
            if (kt) {
                $.ajax({
                    type: "POST",
                    url: "/Admin/QlOrderTable/ListOrderTable.aspx/XoaTable",
                    data: "{idtable:"+id+"}",
                    contentType: "application/json; charset=utf-8",
                    //dataType: "json",
                    success: function (msg) {
                        alert(msg.d);
                        location.reload(); 
                    }
                });
            }
        }
     </script>
</asp:Content>

