<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_QlMembers_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    DDHT || Change password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <asp:Label ID="msg" runat="server" />
                <div class="form-group">
                    <label for="inputPassword" class="">old password</label>
                    <asp:TextBox runat="server" ID="txtoldpassword" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="reoldpassword" runat="server" ErrorMessage="The field is required" ForeColor="Red" ControlToValidate="txtoldpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regoldpassword" runat="server" ErrorMessage="Password in the range of 6 to 15 numbers" ControlToValidate="txtoldpassword" ValidationExpression=".{6,15}" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="">A new password</label>
                    <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="repassword" runat="server" ErrorMessage="The field is required" ForeColor="Red" ControlToValidate="txtpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regpassword" runat="server" ErrorMessage="Password in the range of 6 to 15 numbers" ControlToValidate="txtpassword" ValidationExpression=".{6,15}" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="">Confirm new password</label>
                    <asp:TextBox runat="server" ID="txtconfirmpassword" CssClass="form-control" TextMode="Password" />
                    <asp:CompareValidator ID="compassword" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirmpassword" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
                </div>
                <asp:Button CssClass="btn btn-primary mt-4 pr-4 pl-4" runat="server" ID="btnUpdate" Text="UPDATE" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </div>
</asp:Content>

