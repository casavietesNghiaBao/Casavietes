<%@ Page Title="Danh sách các liên hệ" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPageAdmin.master" CodeFile="ListContact.aspx.cs" Inherits="Admin_QLContact_ListContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    Danh sách các liên hệ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <h2 style="margin-top: 20px; font-size: 24px; text-align: center" id="headerOrderDetail">Danh sách các liên hệ</h2>
    <table class="table table-bordered table-hover table-striped" style="margin-top: 20px;">
        <tr>
            <th>#</th>
            <th>Người liên hệ</th>
            <th>Email người liên hệ</th>
            <th>Nội dung</th>
            <th>Thời gian gửi liên hệ</th>
            <th>Tình trạng trả lời</th>
            <th>Thời gian trả lời</th>
            <th>Nội dung trả lời</th>
            <th></th>
        </tr>
        <tbody id="DSLienHe">
            <%   
                var listLH = new DataUtil().GetDSContact();
                int i = 1;
                foreach (var item in listLH)
                {
                    Response.Write("<tr>");
                    Response.Write("<td>" + i + "</td>");
                    Response.Write("<td>" + item.name + "</td>");
                    Response.Write("<td>" + item.email + "</td>");
                    Response.Write("<td>" + item.message + "</td>");
                    Response.Write("<td>" + item.thoigiangui + "</td>");
                    if (item.tinhtrangTraloi == true)
                    {
                        Response.Write("<td>Đã trả lời</td>");
                    }
                    else
                    {
                        Response.Write("<td><button onclick='openModalReplyLienHe(" + item.idContact + ",\"" + item.email + "\",\"" + item.name + "\")' class='btn btn-sm' type='button' style='background:#ffc107;padding:5px 10px'>Trả lời</button></td>");
                    }
                    if (item.thoigianTraloi != new DateTime())
                        Response.Write("<td>" + item.thoigianTraloi + "</td>");
                    else
                    {
                        Response.Write("<td></td>");
                    }
                    if (item.noidungTraloi != null)
                        Response.Write("<td>" + item.noidungTraloi + "</td>");
                    else
                    {
                        Response.Write("<td></td>");
                    }
                    Response.Write("<td><button type='button' style='height: 30px; padding: 0px 5px; border: 1px solid #ccc; border-radius: 5px; background: #ccc' title='Xóa liên hệ' onclick='XoaContact(" + item.idContact + ")'>Xóa</button></td>");
                    Response.Write("</tr>");
                    i++;
                }
            %>
        </tbody>
    </table>

    <div class="modal fade" id="ModalReplyLienHe">
        <div class="modal-dialog" role="dialog" style="min-width: 700px">
            <!-- Modal content-->
            <div class="modal-content " style="width: 700px">
                <div class="modal-header" style="background: #ffc107; padding: 10px">
                    <h4 class=" modal-title">Gửi Email trả lời liên hệ</h4>
                    <button type="button" class="close" onclick="closeModalReplyLienHe()">&times;</button>
                </div>
                <div class="modal-body" style="padding: 0px">
                    <div class="row" style="padding: 10px;">
                        <div class="col-md-6">
                            <input type="hidden" id="idLienHe" />
                            <p>Tên người nhận: <span style="font-weight: bold" id="TenLienHe"></span></p>
                            <p>Email người nhận: <span style="font-weight: bold; color: red" id="EmailLienHe"></span></p>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="SbEmail">Tiêu đề <span style="color: red">*</span></label><br />
                                <input id="SbEmail" type="text" style="display: block; width: 100%; height: 30px; padding-left: 5px; border: 1px solid #ccc; border-radius: 5px;" placeholder="Tiêu đề trả lời" />
                            </div>
                            <div class="form-group">
                                <label for="ContentEmail">Nội dung trả lời <span style="color: red">*</span></label>
                                <br />
                                <textarea id="ContentEmail" style="display: block; width: 100%; height: 80px; resize: none; padding-left: 5px; border: 1px solid #ccc; border-radius: 5px;" placeholder="Nội dung trả lời liên hệ"></textarea>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer" style="padding: 10px">
                    <button type="button" style="height: 30px; padding: 0px 10px; border: 1px solid #ccc; border-radius: 5px; background: #4e9ae2" onclick="SubmitReply()">Trả lời</button>
                    <button type="button" style="margin-left: 20px; height: 30px; padding: 0px 5px; border: 1px solid #ccc; border-radius: 5px; background: white" onclick="closeModalReplyLienHe()">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function closeModalReplyLienHe() {
            $("#ModalReplyLienHe").modal("hide");
        }

        function openModalReplyLienHe(idLienHe, EmailLienHe, TenLienHe) {
            $("#ModalReplyLienHe #idLienHe").val(idLienHe);
            $("#ModalReplyLienHe #EmailLienHe").text(EmailLienHe);
            $("#ModalReplyLienHe #TenLienHe").text(TenLienHe);

            $("#ModalReplyLienHe #SbEmail").val("");
            $("#ModalReplyLienHe #ContentEmail").val("");

            $("#ModalReplyLienHe").modal("show");
        }

        function SubmitReply() {
            if ($("#SbEmail").val().trim() == "" || $("#ContentEmail").val().trim() == "") {
                $.notify("Không được để trống nội dung trả lời", "error");
            } else {
                $.ajax({
                    type: "post",
                    url: "/Admin/QLContact/ListContact.aspx/ReplyLienHe",
                    data: "{idLienHe:'" + parseInt($("#idLienHe").val()) + "',EmailLienHe:'" + $("#EmailLienHe").text() + "', SbEmail:'" + $("#SbEmail").val().trim() + "', ContentEmail:'" + $("#ContentEmail").val().trim() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (rs) {
                        if (rs.d) {
                            $.notify("Trả lời liên hệ thành công", "success");
                            $("#ModalReplyLienHe").modal("hide");
                            setTimeout(function () {
                                location.reload();
                            }, 1500);
                        }
                        else {
                             $.notify("Lỗi không gửi được Email", "error");
                        }
                    }
                });
            }
        }
        function XoaContact(idContact) {
            var kt = confirm("Bạn có thực sự muốn xóa liên hệ này ?");
            if (kt) {
                $.ajax({
                    type: "post",
                    url: "/Admin/QLContact/ListContact.aspx/XoaLienHe",
                    data: "{idLienHe:'" + idContact + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (rs) {
                        $.notify("Xóa liên hệ thành công", "success");
                        setTimeout(function () {
                            location.reload();
                        }, 1500);
                    }
                });
            }
        }
    </script>
</asp:Content>
