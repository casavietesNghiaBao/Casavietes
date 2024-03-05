<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="AddMember.aspx.cs" Inherits="Admin_QlMembers_AddMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    DDHT || Add new user
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                    <h4 class="header-title">Add User Account</h4>
                    <asp:Label ID="msg" runat="server" />

                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">
                            Full Name
                            <label style="color: red">(*)</label></label>
                        <asp:TextBox runat="server" ID="txtfullname" placeholder="Ex: Jonathan" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="refullname" runat="server" ErrorMessage="FullName is required" ControlToValidate="txtfullname" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-search-input" class="col-form-label">
                            Username
                            <label style="color: red">(*)</label></label>
                        <asp:TextBox runat="server" ID="txtusername" placeholder="Ex: jonathan123" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="reusername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtusername" Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="regusername" runat="server" ErrorMessage="Username from 6 to 15 characters" ControlToValidate="txtusername" ValidationExpression=".{6,15}" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="example-email-input" class="col-form-label">
                            Email
                            <label style="color: red">(*)</label></label>
                        <asp:TextBox runat="server" ID="txtemail" placeholder="Ex: name@example.com" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="reemail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="regemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Wrong format" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="example-tel-input" class="col-form-label">
                            Phone Number
                            <label style="color: red">(*)</label></label>
                        <asp:TextBox runat="server" ID="txtphone" placeholder="Ex: 0336745871" CssClass="form-control" TextMode="Phone" />
                        <asp:RegularExpressionValidator ID="regphone" runat="server" ErrorMessage="Số điện thoại yêu cầu từ 9 đến 11 chữ số" Display="Dynamic" ControlToValidate="txtphone" ForeColor="Red" ValidationExpression=".{9,11}" />
                        <asp:RequiredFieldValidator ID="rephone" runat="server" ErrorMessage="The field is required" Display="Dynamic" ControlToValidate="txtphone" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="">Password</label>
                        <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="repassword" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="txtpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regpassword" runat="server" ErrorMessage="Password from 6 to 15 characters" ControlToValidate="txtpassword" ValidationExpression=".{6,15}" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="">Confirm Password</label>
                        <asp:TextBox runat="server" ID="txtconfirmpassword" CssClass="form-control" TextMode="Password" />
                        <asp:CompareValidator ID="compassword" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirmpassword" ErrorMessage="Passwords do not match" ForeColor="Red"></asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Classify</label>
                        <asp:DropDownList ID="ddltype" runat="server" CssClass="form-control">
                            <asp:ListItem Enabled="true" Text="Member" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button CssClass="btn btn-primary mt-4 pr-4 pl-4" runat="server" ID="btnsubmit" Text="Add User" OnClick="btnsubmit_Click" />
            </div>

        </div>
    </div>
</asp:Content>

