<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Admin_QlMembers_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleAdmin" runat="Server">
    DDHT || Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkPageAdmin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" style="margin: auto; margin-top: 50px;">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Profile</h3>
                        </div>
                        <asp:Label runat="server" ID="msg" />
                        <div class="panel-body" style="padding-top: 10px;">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 " style="text-align: center;">
                                    <asp:Image runat="server" CssClass="img-circle img-responsive" ID="avatarImage" />
                                    <%--<img alt="User Pic" src="../Assets/images/avatar.jpg" class="img-circle img-responsive avatar-image" style="" runat="server" ID="avatar"/>--%>
                                </div>
                                <div class=" col-md-9 col-lg-9 ">
                                    <table class="table table-user-information">
                                        <tbody>
                                            <tr>
                                                <td>Tên đầy đủ</td>
                                                <td>
                                                    <asp:Label runat="server" ID="lbfullname"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Username</td>
                                                <td>
                                                    <asp:Label runat="server" ID="lbusername"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại</td>
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

                                    <a href="/Admin/QlMembers/UpdateProfile.aspx" class="btn btn-primary">Chỉnh sửa thông tin</a>
                                    <a href="/Admin/QlMembers/ChangePassword.aspx" class="btn btn-primary">Thay đổi mật khẩu</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

