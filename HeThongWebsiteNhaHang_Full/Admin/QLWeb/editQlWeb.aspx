<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="editQlWeb.aspx.cs" Inherits="Admin_QLWeb_editQlWeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
        <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <%--<h4 class="header-title">Chỉnh sửa</h4>--%>
                <%--<p class="text-muted font-14 mb-4">Here are examples of <code>.form-control</code> applied to each textual HTML5 <code>&lt;input&gt;</code> <code>type</code>.</p>--%>
                <%-- <form id="formEditFood" runat="server" action="/Admin/QFood/EditFood.aspx">--%>
                <div>
                    <h4 class="header-title">Chỉnh sửa thông tin Nhà Hàng </h4>
                    <asp:Label ID="msg" runat="server" />

                    
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Tên nhà hàng
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtName" runat="server"  class="form-control" />
                        <asp:RequiredFieldValidator ID="reName" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Địa chỉ
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtDiaChi" runat="server"  class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field is required" ControlToValidate="txtDiaChi" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Số điện thoại
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtSDT" runat="server"  class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field is required" ControlToValidate="txtSDT" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Email
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtmail" runat="server" class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="The field is required" ControlToValidate="txtmail" Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="regemail" runat="server" ControlToValidate="txtmail" ErrorMessage="Wrong format" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" />
                    </div>

                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label" style="width:100px;">Ảnh nhà hàng</label>
                        
                        <asp:Image ID="ImageEdit1" Width="200px" runat="server" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label" style="width:100px;">Ảnh banner</label>
                        
                        <asp:Image ID="ImageEdit2" Width="200px" runat="server" />
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Giới thiệu</label>
                        <asp:TextBox ID="txtMieuta" runat="server" class="form-control" />
                    </div>
                   

                    <asp:Button runat="server" ID="btnSuaif" class="btn btn-primary mt-4 pr-4 pl-4" Text="Sửa" OnClick="btnSua_Click" />
                    <asp:Button runat="server" ID="btnrs" class="btn btn-primary mt-4 pr-4 pl-4" Text="Hủy" OnClick="btnLammoi_Click" />

                </div>
               
            </div>
        </div>
    </div>
</asp:Content>

