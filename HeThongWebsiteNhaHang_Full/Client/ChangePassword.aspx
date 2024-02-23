<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Profile.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Client_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tileProfile" runat="Server">
    DDHT || Change password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentProfile" runat="Server">
    <%--<div class="col-12 mt-5" style="background-image: url(/Assets/images/bg_3.jpg); margin: 0 !important; padding: 125px 3rem!important;">--%>
        <div class="card">
            <div class="card-body">
                <asp:Label ID="msg" runat="server" />
                <div class="form-group">
                    <label for="inputPassword" class="">Old password</label>
                    <asp:TextBox runat="server" ID="txtoldpassword" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="reoldpassword" runat="server" ErrorMessage="The field is required" ForeColor="Red" ControlToValidate="txtoldpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regoldpassword" runat="server" ErrorMessage="Password in the range of 6 to 15 numbers" ControlToValidate="txtoldpassword" ValidationExpression=".{6,15}" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="">New password</label>
                    <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="repassword" runat="server" ErrorMessage="The field is required" ForeColor="Red" ControlToValidate="txtpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regpassword" runat="server" ErrorMessage="Password in the range of 6 to 15 numbers" ControlToValidate="txtpassword" ValidationExpression=".{6,15}" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="">Confirm Password</label>
                    <asp:TextBox runat="server" ID="txtconfirmpassword" CssClass="form-control" TextMode="Password" />
                    <asp:CompareValidator ID="compassword" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirmpassword" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
                </div>
                <asp:Button CssClass="btn btn-primary mt-4 pr-4 pl-4 btn-submit-css" runat="server" ID="btnUpdate" Text="UPDATE" OnClick="btnUpdate_Click" />
            </div>
        </div>
    <%--</div>--%>
</asp:Content>
