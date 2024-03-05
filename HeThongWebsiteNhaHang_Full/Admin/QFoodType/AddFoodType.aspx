<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddFoodType.aspx.cs" Inherits="Admin_QFoofType_AddFoodType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" Runat="Server">
    Thêm mới thể loại món ăn
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Add Types Of Dishes</h4>
                <asp:Label ID="msg" runat="server" ForeColor="Red" />

                <%--<p class="text-muted font-14 mb-4">Here are examples of <code>.form-control</code> applied to each textual HTML5 <code>&lt;input&gt;</code> <code>type</code>.</p>--%>
                    <%--<form id="form1" runat="server" action="/Admin/QFoodType/AddFoodType.aspx">
                    <div>--%>

                        <div class="form-group">
                            <label for="example-text-input" class="col-form-label">
                                Tên
                                <label style="color: red">(*)</label>
                            </label>
                            <asp:TextBox ID="txtName" runat="server" placeholder="Name Types Of Dishes..." class="form-control"/>
                            <asp:RequiredFieldValidator ID="reName" runat="server" ErrorMessage="The field is required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" />
                        </div>
                        

                    <asp:Button runat="server" ID="btnAddFoodType" class="btn btn-primary mt-4 pr-4 pl-4" Text="Add" OnClick="btnAddFoodType_Click" />
                    <asp:Button runat="server" ID="reset" class="btn btn-primary mt-4 pr-4 pl-4" Text="Refresh" OnClick="reset_Click" />

                        
                <%--</div>
                </form>--%>

            </div>
        </div>
    </div>
</asp:Content>

