<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Profile.master" AutoEventWireup="true" CodeFile="ListOrderProfile.aspx.cs" Inherits="Client_ListOrderProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tileProfile" runat="Server">
    DDHT || List orders
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentProfile" runat="Server">
    <div style="width: 100%; background: #F3F8FB;">
        <div class="container">
            <div class="row">
                <p style="color: red; font-size: 2rem;">Lưu ý (*): nếu hủy đơn hàng, bạn phải hủy trước tối thiểu 3h đồng hồ, nếu không bạn sẽ phải bồi thường thiệt hại cho nhà hàng!</p>
                <table class="table table-bordered table-hover table-striped" style="margin-top: 20px; font-size: 1.5rem">
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
                        <th>Hoạt động</th>
                    </tr>
                    <tbody id="DSHoaDon">
                        <%
                            var member = (Member)Session["User"];
                            var list = new DataUtil().GetListOrderVMByIdUser(member.member_id);
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
                                Response.Write("<td>" + item.TotalMoney + "</td>");
                                Response.Write("<td>" + item.ordertable_dateset.ToString("dd/MM/yyyy") + "</td>");
                                if (item.ordertable_status ?? false)
                                {
                                    Response.Write("<td>Đã thanh toán</td>");
                                    Response.Write("<td>" +
                                                    "<a title='Xem hóa đơn' class='' style='display:inline-block;padding:5px 5px;' href='javascript:void(0)' onclick='ModalDetailTable(" + item.ordertable_id + ")'>" +
                                                    "<i class='fa fa-eye fa-lg'></i>" +
                                                    "</a>" + "</td>");
                                Response.Write("</tr>");
                                }
                                else
                                {
                                    Response.Write("<td>Chưa thanh toán</td>");
                                    Response.Write("<td>" +
                                                    "<a title='Xem hóa đơn' class='' style='display:inline-block;padding:5px 5px;' href='javascript:void(0)' onclick='ModalDetailTable(" + item.ordertable_id + ")'>" +
                                                    "<i class='fa fa-eye fa-lg'></i>" +
                                                    "</a>" +
                                                    "&nbsp;<a title='Hủy hóa đơn' class='' style='display:inline-block;padding:5px 5px;' href='javascript:void(0)' onclick='HuyHoaDon()'>" +
                                                    "<i class='fa fa-times-circle' style='color:red'></i>" +
                                                    "</a>" +
                                                "</td>");
                                Response.Write("</tr>");
                                }
                                
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
                            <div class="modal-body" style="padding: 0px; max-height: 500px; overflow: auto">
                            </div>
                            <div class="modal-footer" style="padding: 10px">
                                <button type="button" class="btn btn-warning btn-sm" style="background: white; padding: 5px 10px;" onclick="closeModalDetaiTable()">Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <script>
        function closeModalDetaiTable() {
            $("#ModalDetaiTable").modal("hide");
        };
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
                                <table class="table" style="margin:0px; font-size: 1.5rem">
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
                                <table class="table table-bordered" style="margin:0px; font-size: 1.5rem"> 
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
        };
        function convertDate(para) {
            var DATE = new Date(parseInt(para.substr(6)));
            var month = (DATE.getMonth() + 1) < 10 ? "0" + (DATE.getMonth() + 1) : (DATE.getMonth() + 1);
            var day = DATE.getDate() < 10 ? "0" + DATE.getDate() : DATE.getDate();
            var year = DATE.getFullYear();
            var date = day + "/" + month + "/" + year;
            return date;
        };
        function HuyHoaDon() {
            alert("Vui lòng liên hệ với nhà hàng theo hotline: 333333333 để hủy đơn hàng!");
        }
    </script>
</asp:Content>

