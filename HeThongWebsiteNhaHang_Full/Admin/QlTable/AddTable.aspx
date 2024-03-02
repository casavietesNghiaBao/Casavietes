<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddTable.aspx.cs" Inherits="Admin_OrderTable_AddTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <div style="display:flex;">
                    <h4 class="header-title" style="margin-right: 10px;">Thêm bàn</h4>
                    <asp:Label runat="server" ID="mss"/>
                    <asp:Label ID="msg" runat="server" />
                </div>

                <div class="form-group">
                    <label for="example-text-input" class="col-form-label">
                        Tên bàn:
                        <label style="color: red">(*)</label></label>
                    <asp:TextBox runat="server" ID="txtnametb" placeholder="Ví dụ: 10" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="renametb" runat="server" ErrorMessage="Vui lòng nhập tên bàn" ControlToValidate="txtnametb" Display="Dynamic" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label for="example-text-input" class="col-form-label">
                        Mô tả: (bàn dành cho mấy người)
                        <label style="color: red">(*)</label></label>
                    <asp:TextBox runat="server" ID="txtmato" placeholder="Ví dụ: 2 " CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="remota" runat="server" ErrorMessage="The field is required" ControlToValidate="txtmato" Display="Dynamic" ForeColor="Red" />
                </div>

                <asp:Button CssClass="btn btn-primary mt-4 pr-4 pl-4" runat="server" ID="btnsubmit" Text="Thêm bàn" OnClick="btnsubmit_Click" />


            </div>
            <a href="ListTable.aspx" style="text-align: center; font-size: 20px; padding-bottom: 10px;">-> Chuyển qua danh sách bàn</a>
        </div>
    </div>

</asp:Content>

