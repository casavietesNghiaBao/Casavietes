<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="EditFoodType.aspx.cs" Inherits="Admin_QFoodType_EditFoodType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" Runat="Server">
    Chỉnh sửa thể loại món ăn
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Chỉnh sửa</h4>
                <asp:Label ID="msg" runat="server" ForeColor="Red" />

                <%--<p class="text-muted font-14 mb-4">Here are examples of <code>.form-control</code> applied to each textual HTML5 <code>&lt;input&gt;</code> <code>type</code>.</p>--%>
                    <%--<form id="form1" runat="server" action="/Admin/QFoodType/EditFoodType.aspx">
                    <div>--%>

                        <h4 class="header-title">Edit Food </h4>
                        <asp:Label ID="Label1" runat="server" />

                        <div class="form-group">
                            <label for="example-text-input" class="col-form-label">ID</label>
                            <asp:TextBox ID="txtId" runat="server" placeholder="Tên món ăn..." ReadOnly="true" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="example-text-input" class="col-form-label">
                                Tên
                                <label style="color: red">(*)</label>
                            </label>
                            <asp:TextBox ID="txtName" runat="server" placeholder="Tên món ăn..." class="form-control"/>
                            <asp:RequiredFieldValidator ID="reName" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                        </div>
                        

                    <asp:Button runat="server" ID="btnEditFoodType" class="btn btn-primary mt-4 pr-4 pl-4" Text="Cập nhật" OnClick="btnEditFoodType_Click"  />
                    <asp:Button runat="server" ID="reset" class="btn btn-primary mt-4 pr-4 pl-4" Text="Làm mới" OnClick="reset_Click" />

                        
                <%--</div>
                </form>--%>

            </div>
        </div>
    </div>
</asp:Content>

