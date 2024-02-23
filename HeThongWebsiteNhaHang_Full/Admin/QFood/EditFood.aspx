<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="EditFood.aspx.cs" Inherits="Admin_QFood_EditFood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    Chỉnh sửa món ăn
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Chỉnh sửa</h4>
                <%--<p class="text-muted font-14 mb-4">Here are examples of <code>.form-control</code> applied to each textual HTML5 <code>&lt;input&gt;</code> <code>type</code>.</p>--%>
                <%-- <form id="formEditFood" runat="server" action="/Admin/QFood/EditFood.aspx">--%>
                <div>
                    <h4 class="header-title">Edit Food </h4>
                    <asp:Label ID="msg" runat="server" />

                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Mã Món Ăn</label>
                        <asp:TextBox ID="txtFoodID" runat="server" ReadOnly="true" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Tên
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Tên món ăn..." class="form-control" />
                        <asp:RequiredFieldValidator ID="reName" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Giá
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtGia" runat="server" placeholder="Giá món ăn..." class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Khuyến mại
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtKhuyenmai" runat="server" placeholder="Khuyến mại..." class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                    </div>

                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Ảnh</label>
                        <%--<asp:TextBox ID="txtAvt" runat="server" placeholder="Ảnh món ăn..." class="form-control"/>--%>
                        <asp:Image ID="ImageEdit" Width="200px" runat="server" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Miêu tả sản phẩm</label>
                        <asp:TextBox ID="txtMieuta" runat="server" placeholder="Miêu tả sản phẩm..." class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Loại món</label>

                        <asp:DropDownList ID="ddlFoodTypeID" runat="server" />
                    </div>

                    <asp:Button runat="server" ID="btnSua" class="btn btn-primary mt-4 pr-4 pl-4" Text="Sửa" OnClick="btnSua_Click" />
                    <asp:Button runat="server" ID="btnLammoi" class="btn btn-primary mt-4 pr-4 pl-4" Text="Làm mới" OnClick="btnLammoi_Click" />

                </div>
                <%--</form>--%>
                <%--<div>
                    <h4 class="header-title">Edit Food </h4>
                    <asp:Label ID="msg" runat="server" />

                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Mã Món Ăn</label>
                        <asp:TextBox ID="txtFoodID" runat="server" ReadOnly="true" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Tên
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Tên món ăn..." class="form-control" />
                        <asp:RequiredFieldValidator ID="reName" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Giá
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtGia" runat="server" placeholder="Giá món ăn..." class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Khuyến mại
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtKhuyenmai" runat="server" placeholder="Khuyến mại..." class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Ảnh</label>
                        <asp:TextBox ID="txtAvt" runat="server" placeholder="Ảnh món ăn..." class="form-control" />
                        <%--<asp:FileUpload ID="UploadAvata" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Mieu tả sản phẩm</label>
                        <asp:TextBox ID="txtMieuta" runat="server" placeholder="Miêu tả sản phẩm..." class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Loại món</label>

                        <asp:DropDownList ID="ddlFoodTypeID" runat="server" />
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Select</label>
                        <select class="form-control" id="foodtype_id">
                            <option>Select</option>
                            <option>Large select</option>
                            <option>Small select</option>
                        </select>
                    </div>
                    <asp:Button runat="server" ID="btnSua" class="btn btn-primary mt-4 pr-4 pl-4" Text="Sửa" OnClick="btnSua_Click" />
                    <asp:Button runat="server" ID="btnLammoi" class="btn btn-primary mt-4 pr-4 pl-4" Text="Làm mới" />

                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>

