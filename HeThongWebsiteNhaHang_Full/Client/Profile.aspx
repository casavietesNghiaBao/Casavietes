<%@ Page Title="" Language="C#" MasterPageFile="~/Client/Profile.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Client_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tileProfile" runat="Server">
    DDHT || Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentProfile" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" style="margin-top: 100px;">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Profile</h3>
                    </div>
                    <div class="panel-body">
                        <asp:Label ID="msg" runat="server" />
                        <div class="row">
                            <div class="col-md-3 col-lg-3 " style="text-align: center;">
                                <asp:Image runat="server" CssClass="img-circle img-responsive" ID="avatarImage" />
                                <%--<img alt="User Pic" src="../Assets/images/avatar.jpg" class="img-circle img-responsive avatar-image" style="" runat="server" ID="avatar"/>--%>
                            </div>
                            <div class=" col-md-9 col-lg-9 table-user-information-showinfo">
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td>Full name</td>
                                            <td>
                                                <asp:Label runat="server" ID="lbfullname"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>Username</td>
                                            <td>
                                                <asp:Label runat="server" ID="lbusername"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>Phone</td>
                                            <td>
                                                <asp:Label runat="server" ID="lbphone"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><a href="" runat="server" id="amail">
                                                <asp:Label runat="server" ID="lbmail"></asp:Label></a></td>
                                        </tr>

                                    </tbody>
                                </table>

                                <a href="/Client/EditProfile.aspx" class="btn btn-primary btn-link-to">Edit profile</a>
                                <a href="/Client/ChangePassword.aspx" class="btn btn-primary btn-link-to">Change password</a>
                                <a href="/Client/ListOrderProfile.aspx" class="btn btn-primary btn-link-to">List orders</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>

