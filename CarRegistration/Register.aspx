<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CarRegistration.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <link rel="stylesheet" href="Content/Site.css" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container body-content signInBody">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="InvalidParameters">
                            <asp:Label runat="server" ID="InvalidParameters"></asp:Label>
                        </div>
                        <div class="col-sm-6 signIn">
                            <div>
                                <asp:Label runat="server">First name</asp:Label>
                            </div>
                            <div>
                                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" PlaceHolder="Enter first name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFirstName" runat="server" ErrorMessage="First name required!" ForeColor="Red" ControlToValidate="FirstName"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RirstNameRegex" runat="server" ValidationExpression="^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$" ControlToValidate="FirstName" ForeColor="Red" ErrorMessage="Letters only!"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-sm-6 signIn">
                            <div>
                                <asp:Label runat="server">Last name</asp:Label>
                            </div>
                            <div>
                                <asp:TextBox runat="server" ID="LastName" CssClass="form-control" PlaceHolder="Enter last name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ErrorMessage="Last name required!" ForeColor="Red" ControlToValidate="LastName"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="LastNameRegex" runat="server" ValidationExpression="^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$" ControlToValidate="LastName" ForeColor="Red" ErrorMessage="Letters only!"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-sm-6 signIn">
                            <div>
                                <asp:Label runat="server">Card number</asp:Label>
                            </div>
                            <div>
                                <asp:TextBox runat="server" ID="CardNumber" MaxLength="16" MinLength="16" CssClass="form-control" PlaceHolder="Enter card number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredCardNumber" runat="server" ErrorMessage="Card number required!" ForeColor="Red" ControlToValidate="CardNumber"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="CardNumberRegex" runat="server" ValidationExpression="^\d{16}$" ControlToValidate="CardNumber" ForeColor="Red" ErrorMessage="Must be 16 digits!"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-sm-6 signIn">
                            <div>
                                <asp:Label runat="server">Card expiration date</asp:Label>
                            </div>
                            <div>
                                <asp:TextBox runat="server" MinLength="5" MaxLength="5" ID="CardExpDate" CssClass="form-control" PlaceHolder="MM/YY ex. 10/20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredCardExpDate" runat="server" ErrorMessage="Card expiration date required!" Display="Static" ForeColor="Red" ControlToValidate="CardExpDate"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="CardExpDateRegex" runat="server" ValidationExpression="^\d{2}\/\d{2}$" ControlToValidate="CardExpDate" ForeColor="Red" ErrorMessage="Invalid date!"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-sm-6 signIn">
                            <div>
                                <asp:Label runat="server">CVV</asp:Label>
                            </div>
                            <div>
                                <asp:TextBox runat="server" MinLength="3" MaxLength="3" ID="CVV" CssClass="form-control" PlaceHolder="Enter 3 digits from back of the card"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredCVV" runat="server" ErrorMessage="CVV required!" ForeColor="Red" ControlToValidate="CVV"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="CVVRegex" runat="server" ValidationExpression="^\d{3}$" ControlToValidate="CVV" ForeColor="Red" ErrorMessage="Cvv must be 3 digits!"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-sm-6 signIn">
                            <div>
                                <asp:Label runat="server">Email</asp:Label>
                            </div>
                            <div>
                                <asp:TextBox runat="server" ID="Email" TextMode="Email" CssClass="form-control" PlaceHolder="Enter email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requiredEmail" runat="server" ErrorMessage="Email required!" ForeColor="Red" ControlToValidate="Email"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ForeColor="Red" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
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
                </div>
                <div class="row">
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
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-sm-6 signIn">
                            <div>
                                <asp:Label runat="server">Repeat password</asp:Label>
                            </div>
                            <div>
                                <asp:TextBox runat="server" TextMode="Password" ID="repPassw" CssClass="form-control" PlaceHolder="Enter password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="valRepPassw" runat="server" ErrorMessage="Password is required!" ForeColor="Red" ControlToValidate="repPassw"></asp:RequiredFieldValidator>
                                <br />
                                <asp:CompareValidator runat="server" ID="repPassVal" ControlToValidate="repPassw" ControlToCompare="Password" ForeColor="Red" ErrorMessage="Repeated password must be same as password!"></asp:CompareValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10">
                        <div class="col-lg-6 loginBtnDiv">
                            <asp:Button runat="server" CssClass="registerBtn" ID="register" Text="Register" Style="vertical-align: middle" OnClick="register_Click" />
                            <asp:Button runat="server" CssClass="loginBtn" ID="login" Text="Login" Style="vertical-align: middle" OnClick="login_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
