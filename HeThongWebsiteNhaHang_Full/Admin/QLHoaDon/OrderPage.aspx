<%@ Page Title="Danh sách hóa đơn" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPageAdmin.master" CodeFile="OrderPage.aspx.cs" Inherits="Admin_QLHoaDon_OrderPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    Danh sách hóa đơn
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <h2 style="margin-top: 20px; font-size: 24px; text-align: center" id="headerOrderDetail">Danh sách hóa đơn
    </h2>
    <div style="padding: 5px 10px">
        <form id="formTimKiem">
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <span>Chọn thời gian hóa đơn trong khoảng</span>
                        <div style="margin-top: 20px;">
                            <span style="display: inline-block">Từ ngày: </span>
                            <input style="display: inline-block; height: 30px; border-radius: 5px; padding-left: 5px; border: 1px solid #ccc; width: 200px" name="ngaybd" id="ngaybd" type="date" />
                            <span style="display: inline-block">đến ngày:</span>
                            <input style="display: inline-block; height: 30px; border-radius: 5px; padding-left: 5px; border: 1px solid #ccc; width: 200px" name="ngaykt" id="ngaykt" type="date" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <span>Tình trạng thanh toán</span>
                    <select id="ttthanhtoan" style="margin-top: 20px; display: block; height: 30px; border-radius: 5px; width: 200px;">
                        <option value="-1">--Chọn tình trạng--</option>
                        <option value="1">Đã thanh toán</option>
                        <option value="0">Chưa thanh toán</option>
                    </select>
                </div>
            </div>
            <div style="justify-content: center; vertical-align: middle; display: flex">
                <button type="button" style="height: 30px; padding: 0px 5px; border: 1px solid #ccc; border-radius: 5px; background: #4e9ae2" onclick="TimHoaDon()">Tìm kiếm</button>
                <button type="button" style="margin-left: 20px; height: 30px; padding: 0px 5px; border: 1px solid #ccc; border-radius: 5px; background: #4ef179" onclick="TatCaHoaDon()">Xem tất cả</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped" style="margin-top: 20px;">
        <tr>
            <th>#</th>
            <th>Mã hóa đơn</th>
            <th>Tên khách hàng</th>
            <th>Email khách hàng</th>
            <th>Điện thoại khách hàng</th>
            <%--<th>Loại khách khách hàng</th>
            <th>Loại hóa đơn</th>--%>
            <th>Tổng tiền (vnđ)</th>
            <th>Thời gian</th>
            <th>Tình trạng</th>
            <th></th>
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
                    Response.Write("<td>" + item.TotalMoney + " VNĐ </td>");
                    Response.Write("<td>" + item.ordertable_dateset.ToString("dd/MM/yyyy") + "</td>");
                    if (item.ordertable_status ?? false)
                    {
                        Response.Write("<td>Đã thanh toán</td>");
                    }
                    else
                    {
                        Response.Write("<td><button onclick='Thanhtoan(" + item.ordertable_id + ")' class='btn btn-sm' type=button' style='background:#ffc107;padding:5px 10px'>Thanh toán</button></td>");
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
                <div class="modal-header" style="background: #ffc107; padding: 10px">
                    <h4 class=" modal-title">Chi tiết Hóa đơn</h4>
                    <button type="button" class="close" onclick="closeModalDetaiTable()">&times;</button>
                </div>
                <div class="modal-body" style="padding: 0px;max-height:500px;overflow:auto">
                </div>
                <div class="modal-footer" style="padding: 10px">
                    <button type="button" class="btn btn-warning btn-sm" style="background: white; padding: 5px 10px;" onclick="closeModalDetaiTable()">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function XoaHoaDon(id) {
            let kt = confirm("Bạn có chắc chắn Xóa hóa đơn này không");
            if (kt) {
                $.ajax({
                    type: "post",
                    url: "/Admin/QLHoaDon/OrderPage.aspx/XoaHoaDon",
                    data: "{idodtbl:" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (rs) {
                        $.notify("Xóa thành công", "success")
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
            let kt = confirm("Bạn có chắc chắn thanh toán hóa đơn này không");
            if (kt) {
                $.ajax({
                    type: "post",
                    url: "/Admin/QLHoaDon/OrderPage.aspx/ThanhToan",
                    data: "{idodtbl:" + id + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (rs) {
                        $.notify("Thanh toán thành công", "success")
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
                                        <td class="" style="width:120px;"><span style="font-weight:bold">Mã hóa đơn:</span></td>    
                                        <td style="width:300px;"><span style="color:red;font-weight:bold">${HD.ordertable_id}</span></td>
                                        <td class="" style="width:120px;">Thới gian:</td><td style="width:200px;">${convertDate(HD.ordertable_dateset)}</td>
                                        <td class="" style="width:130px;">Loại mua hàng:</td><td>${HD.loaiHD == true ? 'Đặt bàn tại nhà hàng (' + HD.table_name + ')' : 'Mua hàng online'}</td>
                                    </tr>
                                    <tr class="">
                                        <td class=""><span style="font-weight:bold">Khách hàng:</span></td><td><span style="font-weight:bold">${HD.tenKH}</span></td>    
                                        <td class="">Email:</td><td>${HD.emailKH}</td>
                                        <td >Loại khách hàng:</td><td >${HD.loaiKH == true ? 'KH có tài khoản' : 'KH không có tài khoản'}</td>
                                    </tr>
                                    <tr class="">
                                        <td class="">Điện thoại:</td><td>${HD.dienthoaiKH}</td>    
                                        <td class="">Tình trạng:</td><td>${HD.ordertable_status == true ? 'Đã thanh toán' : 'Chưa thanh toán'}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr class="">
                                        <td class="" colspan="6"><span style="color:green;font-weight:bold;font-size: 18px;">Tổng tiền:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${HD.TotalMoney} (vnđ)</span></td>                                        
                                    </tr>
                                </table>
                            </div>                             
                            <div >
                                <p style="color:#007bff;margin-bottom:15px;; font-weight:bold;text-align:center" >Danh sách các món<p>
                                <table class="table table-bordered" style="margin:0px;"> 
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên món</th>
                                        <th>Đơn giá (vnđ)</th>
                                        <th>Số lượng</th>
                                        <th>Giảm giá (%)</th>
                                        <th>Thành tiền (vnđ)</th>                                        
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
                                    <td><a title='Xem hóa đơn' style='display:block' href='javascript:void(0)' onclick='ModalDetailTable(${item.ordertable_id})'>${item.ordertable_id}</a></td>
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
                                        <a title='Xem hóa đơn' class='' style='display:block;padding:5px 10px;' href='javascript:void(0)' onclick='ModalDetailTable(${item.ordertable_id})'>
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
