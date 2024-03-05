<%@ Page Title="List Bill" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPageAdmin.master" CodeFile="OrderPage.aspx.cs" Inherits="Admin_QLHoaDon_OrderPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    List Bill
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <h2 style="margin-top: 20px; font-size: 24px; text-align: center" id="headerOrderDetail">Danh sách hóa đơn
    </h2>
    <div style="padding: 5px 10px">
    </div>
    <table class="table table-bordered table-hover table-striped" style="margin-top: 20px;">
        <tr>
            <th>#</th>
            <th>Code Bill</th>
            <th>Customer Name</th>
            <th>Customer Email</th>
            <th>Customer Phone Number</th>
            <th>Total Amount (€)</th>
            <th>Time</th>
            <th>Status</th>
            <th>Function</th>
        </tr>
        <tbody id="DSHoaDon">
            <%
                var list = new DataUtil().GetListOrderVM();
                var i = 1;
                foreach (var item in list)
                {
                    Response.Write("<tr>");
                    Response.Write("<td>" + i + "</td>");
                    Response.Write("<td><a title='Xem hóa đơn' style='display:block' href='javascript:void(0)' onclick='ModalDetailTable(" + item.ordertable_id + ")'>" + item.ordertable_id + "</a></td>");
                    Response.Write("<td>" + item.tenKH + "</td>");
                    Response.Write("<td>" + item.emailKH + "</td>");
                    Response.Write("<td>" + item.dienthoaiKH + "</td>");
                    //Response.Write("<td>" + (item.loaiKH==true? "Có tài khoản":"Không có tài khoản" )+ "</td>");
                    //Response.Write("<td>" + (item.loaiHD==true? "Hóa đơn theo bàn":"Hóa đơn KH online" )+ "</td>");
                    Response.Write("<td>" + item.TotalMoney + " € </td>");
                    Response.Write("<td>" + item.ordertable_dateset.ToString("dd/MM/yyyy") + "</td>");
                    if (item.ordertable_status ?? false)
                    {
                        Response.Write("<td style='color: red'>Paid</td>");
                    }
                    else
                    {
                        Response.Write("<td><button onclick='Thanhtoan(" + item.ordertable_id + ")' class='btn btn-sm' type=button' style='background:#ffc107;padding:5px 10px'>Pay</button></td>");
                    }
                    Response.Write("<td>" +
                                        "<a title='Xem hóa đơn' class='' style='display:inline-block;padding:5px 5px;' href='javascript:void(0)' onclick='ModalDetailTable(" + item.ordertable_id + ")'>" +
                                        "<i class='fa fa-eye fa-lg'></i>" +
                                        "</a>" +
                                        "&nbsp;<a title='Xóa hóa đơn' class='' style='display:inline-block;padding:5px 5px;' href='javascript:void(0)' onclick='XoaHoaDon(" + item.ordertable_id + ")'>" +
                                        "<i class='fa fa-trash fa-lg' style='color:red'></i>" +
                                        "</a>"+
                                    "</td>");
                    Response.Write("</tr>");
                    i++;
                }
            %>
        </tbody>
    </table>
    <!-- Modal -->
    <div class="modal fade" id="ModalDetaiTable">
        <div class="modal-dialog" role="dialog" style="max-width: 1100px!important;">
            <!-- Modal content-->
            <div class="modal-content " style="width: 1100px;">
                <div class="modal-header" style="background: #303641; padding: 10px">
                    <h4 class=" modal-title" style="font-family: cambria,Sans-serif; color: #ffffff; font-weight: bold">Invoice Details</h4>
                    <button type="button" class="close text-danger" onclick="closeModalDetaiTable()">&times;</button>
                </div>
                <div class="modal-body" style="padding: 0px;max-height:500px;overflow:auto; font-family: cambria,Sans-serif">
                </div>
                <div class="modal-footer" style="padding: 10px">
                    <button type="button" class="btn btn-secondary btn-sm" style="background: white; padding: 5px 10px; background-color: #bbbbbb; color: #ffffff; font-weight: bold" onclick="closeModalDetaiTable()">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function XoaHoaDon(id) {
            let kt = confirm("Are You Sure Delete This Invoice?");
            if (kt) {
                $.ajax({
                    type: "post",
                    url: "/Admin/QLHoaDon/OrderPage.aspx/XoaHoaDon",
                    data: "{idodtbl:" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (rs) {
                        $.notify("Deleted", "success")
                        setTimeout(function () {
                            location.reload();
                        }, 1500);
                    }
                });
            }
        }
        function closeModalDetaiTable() {
            $("#ModalDetaiTable").modal("hide");
        }
        function Thanhtoan(id) {
            let kt = confirm("Are You Sure To Pay This Bill?");
            if (kt) {
                $.ajax({
                    type: "post",
                    url: "/Admin/QLHoaDon/OrderPage.aspx/ThanhToan",
                    data: "{idodtbl:" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (rs) {
                        $.notify("Payment Success", "success")
                        setTimeout(function () {
                            location.reload();
                        }, 1500);
                    }
                });
            }
        }
        function TatCaHoaDon() {
            location.reload();
        }
        function ModalDetailTable(idtable) {
            $.ajax({
                type: "post",
                url: "/Admin/QLHoaDon/OrderDetailPage.aspx/DetailOrderTable",
                data: "{idtable:" + idtable + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    var HD = rs.d;
                    console.log(HD);
                    var html = `                        
                            <div >
                                <table class="table" style="margin:0px;">
                                    <tr class="">
                                        <td class="" style="width:120px;"><span style="font-weight:bold">Code Bill:</span></td>    
                                        <td style="width:200px;"><span style="font-weight:bold">${HD.ordertable_id}</span></td>
                                        <td class="" style="width:100px; font-weight:bold">Time:</td><td style="width:250px;">${convertDate(HD.ordertable_dateset)}</td>
                                        <td class="" style="width:180px; font-weight:bold">Buying Method:</td><td style="color: #339900; font-weight: bold">${HD.loaiHD == true ? 'Book A Table At The Restaurant (' + HD.table_name + ')' : 'Shopping Online'}</td>
                                    </tr>
                                    <tr class="">
                                        <td class=""><span style="font-weight:bold">Customer:</span></td><td><span>${HD.tenKH}</span></td>    
                                        <td class="" style="font-weight: bold">Email:</td><td>${HD.emailKH}</td>
                                        <td style="font-weight: bold">Customer Type:</td><td >${HD.loaiKH == true ? 'Customers Have Accounts' : 'Customer Does Not Have An Account'}</td>
                                    </tr>
                                    <tr class="">
                                        <td class="" style="font-weight: bold">Phone Number:</td><td>${HD.dienthoaiKH}</td>    
                                        <td class="" style="font-weight: bold">Status:</td><td style="color: red; font-weight: bold">${HD.ordertable_status == true ? 'Paid' : 'Unpaid'}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr class="">
                                        <td class="" colspan="6"><span style="color:green;font-weight:bold;font-size: 18px;">Total Amount:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${HD.TotalMoney} (€)</span></td>                                        
                                    </tr>
                                </table>
                            </div>                             
                            <div >
                                <p style="color:#007bff;margin-bottom:15px;; font-weight:bold;text-align:center" >List Of Dishes<p>
                                <table class="table table-bordered" style="margin:0px;"> 
                                    <tr>
                                        <th>Numerical Order</th>
                                        <th>Food Name</th>
                                        <th>Unit Price (€)</th>
                                        <th>Quantity</th>
                                        <th>Discount (%)</th>
                                        <th>Total Amount (€)</th>                                        
                                    </tr>
                    `;

                    $.each(HD.ListOrderDetail, function (index, item) {
                        html += `
                            <tr>
                                <td>${index + 1}</td> 
                                <td>${item.food_name}</td>
                                <td>${item.food_price}</td>
                                <td>${item.quantity}</td>
                                <td>${item.food_sale}</td>
                                <td>${item.thanhtien}</td>                                        
                            </tr>
                            `;
                    })
                    html += '</table></div>'
                    $("#ModalDetaiTable .modal-body").html(html);
                    $("#ModalDetaiTable").modal("show");
                }
            });
        }
        function convertDate(para) {
            var DATE = new Date(parseInt(para.substr(6)));
            var month = (DATE.getMonth() + 1) < 10 ? "0" + (DATE.getMonth() + 1) : (DATE.getMonth() + 1);
            var day = DATE.getDate() < 10 ? "0" + DATE.getDate() : DATE.getDate();
            var year = DATE.getFullYear();
            var date = day + "/" + month + "/" + year;
            return date;
        }
        function TimHoaDon() {
            $.ajax({
                type: "post",
                url: "/Admin/QLHoaDon/OrderPage.aspx/TimHoaDon",
                data: "{ngaybd:'" + $("#formTimKiem #ngaybd").val() + "',ngaykt:'" + $("#formTimKiem #ngaykt").val() + "',ttthanhtoan:" + parseInt($("#formTimKiem #ttthanhtoan").val()) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (rs) {
                    let list = rs.d;
                    console.log(list)
                    if (list.length > 0) {
                        let html = '';
                        $.each(list, function (index, item) {
                            html += `
                                <tr>
                                    <td>${index + 1}</td>
                                    <td><a title='Xem hóa đơn' style='display:block' href='javascript:void(0)' onclick='ModalDetailTable(${item.ordertable_id})'>${item.ordertable_id} Chi tiết...</a></td>
                                    <td>${item.tenKH}</td>
                                    <td>${item.emailKH}</td>
                                    <td>${item.dienthoaiKH}</td>                                   
                                    <td>${item.TotalMoney}</td>
                                    <td>${convertDate(item.ordertable_dateset)}</td>
                            `;
                            if (item.ordertable_status == true) {
                                html += `<td>Đã thanh toán</td>`
                            }
                            else {
                                html += `<td><button onclick='Thanhtoan(${item.ordertable_id})' class='btn btn-sm' type=button' style='background:#ffc107;padding:5px 10px'>Thanh toán</button></td>`;
                            }
                            html += `
                                    <td>
                                        <a title='Xem hóa đơn' class='' style='display:block;padding:5px 15px;margin-right:5px;' href='javascript:void(0)' onclick='ModalDetailTable(${item.ordertable_id})'>
                                            <i class='fa fa-eye fa-lg'></i>
                                        </a>
                                    </td>
                                </tr>
                            `;
                        });
                        $("#DSHoaDon").html(html);
                        $.notify("Có " + list.length + " hóa đơn cho tìm kiếm này", "success");
                    }
                    else {
                        $("#DSHoaDon").html("<tr><td colspan='9' style='color:red;font-size:14px;'>Không có hóa đơn nào cho tìm kiếm này</td></tr>");
                        $.notify("Không có hóa đơn nào cho tìm kiếm này", "success");
                    }
                }
            });
        }
    </script>
</asp:Content>
