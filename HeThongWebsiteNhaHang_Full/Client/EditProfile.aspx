<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Profile.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="Client_EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tileProfile" runat="Server">
    DDHT || Edit profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentProfile" runat="Server">
    <%--<div class="col-12 mt-5" style="background-image: url(/Assets/images/bg_3.jpg); margin: 0 !important; padding: 3rem!important;">--%>
    <div class="card">
        <div class="card-body">
            <h4 class="header-title">Update profile </h4>
            <asp:Label ID="msg" runat="server" />
            <div class="form-group">
                <label for="example-search-input" class="col-form-label">
                    User name
                            <label style="color: red">(*)</label></label>
                <asp:TextBox runat="server" ID="txtusername" placeholder="Example: duongtiendat" CssClass="form-control" ReadOnly="true" />
            </div>
            <div class="form-group">
                <label for="example-text-input" class="col-form-label">
                    Full name
                            <label style="color: red">(*)</label></label>
                <asp:TextBox runat="server" ID="txtfullname" placeholder="Example: Dương Tiến Đạt" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="refullname" runat="server" ErrorMessage="The field is required" ControlToValidate="txtfullname" Display="Dynamic" ForeColor="Red" />
            </div>
            <div class="form-group">
                <label for="example-email-input" class="col-form-label">
                    Email
                            <label style="color: red">(*)</label></label>
                <asp:TextBox runat="server" ID="txtemail" placeholder="Example: name@example.com" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="reemail" runat="server" ErrorMessage="The field is required" ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="regemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Wrong format" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" />
            </div>
            <div class="form-group">
                <label for="example-tel-input" class="col-form-label">
                    Telephone
                            <label style="color: red">(*)</label></label>
                <asp:TextBox runat="server" ID="txtphone" placeholder="Example: 0336515294" CssClass="form-control" TextMode="Number" />
                <asp:RegularExpressionValidator ID="regphone" runat="server" ErrorMessage="Phone in the range of 9 to 11 numbers" Display="Dynamic" ControlToValidate="txtphone" ForeColor="Red" ValidationExpression=".{9,11}" />
                <asp:RequiredFieldValidator ID="rephone" runat="server" ErrorMessage="The field is required" Display="Dynamic" ControlToValidate="txtphone" ForeColor="Red" />
            </div>
            <div class="form-group">
                <label for="example-tel-input" class="col-form-label">
                    Avatar
                </label>
                <div class="avatarDiv">
                    <asp:FileUpload ID="FileUpload" runat="server" />
                    <img src="" alt="Alternate Text" id="avatarUpdate" runat="server" class="avatarCss" style="width: 95px; height: 150px; float: left; margin: 10px;" />
                </div>
            </div>
            <asp:Button CssClass="btn btn-primary mt-4 pr-4 pl-4 btn-submit-css" runat="server" ID="btnUpdate" Text="UPDATE" OnClick="btnUpdate_Click" />
        </div>
    </div>
    <%--</div>--%>
</asp:Content>
