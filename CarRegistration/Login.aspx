<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CarRegistration.Login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="containerBody">
        <div class="InvalidParameters">
            <asp:Label runat="server" ID="InvalidParameters"></asp:Label>
        </div>
        <div runat="server" id="LoggedIn">
        </div>
        <div runat="server" id="LoginInfo">
            <div class="col-lg-12">
                <div class="col-sm-6 signIn">
                    <div>
                        <asp:Label runat="server">Username</asp:Label>
                    </div>
                    <div>
                        <asp:TextBox runat="server" ID="Username" CssClass="form-control" PlaceHolder="Enter username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valUsername" runat="server" ErrorMessage="Username is required!" ForeColor="Red" ControlToValidate="Username"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="col-sm-6 signIn">
                    <div>
                        <asp:Label runat="server">Password</asp:Label>
                    </div>
                    <div>
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" PlaceHolder="Enter password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valPassw" runat="server" ErrorMessage="Password is required!" ForeColor="Red" ControlToValidate="Password"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="login">
                <asp:Button runat="server" CssClass="loginBtn" ID="Login" Text="Login" Style="vertical-align: middle" OnClick="login_Click" CausesValidation="false" />
            </div>
        </div>
    </div>
</asp:Content>
