<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddFood.aspx.cs" Inherits="Admin_QFood_AddFood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    Thêm mới món ăn
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Add New Food</h4>
                <%--<p class="text-muted font-14 mb-4">Here are examples of <code>.form-control</code> applied to each textual HTML5 <code>&lt;input&gt;</code> <code>type</code>.</p>--%>


                <%--<form id="form1" runat="server" action="/Admin/QFood/AddFood.aspx">--%>

                <div>
                    <asp:Label ID="msg" runat="server" ForeColor="Red" />

                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Food Name
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Food Name..." class="form-control" />
                        <asp:RequiredFieldValidator ID="reName" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Price (€)
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtGia" runat="server" placeholder="Food Price..." class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field is required" ControlToValidate="txtGia" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Discount (%)
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtKhuyenmai" runat="server" placeholder="Discount... Ex: 10 (is 10%)" class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field is required" ControlToValidate="txtKhuyenmai" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Images</label>
                        <%--<asp:TextBox ID="txtAvt" runat="server" placeholder="Ảnh món ăn..." class="form-control"/>--%>

                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Product Description</label>
                        <asp:TextBox ID="txtMieuta" runat="server" placeholder="Product Description..." class="form-control" MaxLength="100" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Type Of Dish</label>

                        <asp:DropDownList ID="ddlFoodTypeID" runat="server" />
                    </div>

                    <asp:Button runat="server" ID="submit" class="btn btn-primary mt-4 pr-4 pl-4" Text="Add Food" OnClick="submit_Click" />
                    <asp:Button runat="server" ID="reset" class="btn btn-primary mt-4 pr-4 pl-4" Text="Refresh" OnClick="reset_Click" />

                    <%--<asp:Image ID="Image1" runat="server" Width="150px" />--%>
                </div>
                <%-- </form>--%>
                <%--<div>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The field is required" ControlToValidate="txtGia" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Khuyến mại
                                <label style="color: red">(*)</label>
                        </label>
                        <asp:TextBox ID="txtKhuyenmai" runat="server" placeholder="Khuyến mại..." class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="The field is required" ControlToValidate="txtKhuyenmai" Display="Dynamic" ForeColor="Red" />
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

                    <asp:Button runat="server" ID="submit" class="btn btn-primary mt-4 pr-4 pl-4" Text="Thêm mới" OnClick="submit_Click" />
                    <asp:Button runat="server" ID="reset" class="btn btn-primary mt-4 pr-4 pl-4" Text="Làm mới" />

                    <asp:Label ID="msg" runat="server" ForeColor="Red" />
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>

