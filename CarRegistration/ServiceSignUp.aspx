<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceSignUp.aspx.cs" Inherits="CarRegistration.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="intro">
        <asp:Image CssClass="racingImage" runat="server" ImageUrl="~/Assets/racing.svg" />
        <h2>Regular service</h2>
        <p>Sign up for regular car service to extend lifetime of your car!</p>
        <hr />
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mb-3">
                <div class="text-left">
                    <asp:Label runat="server">Manufacturer</asp:Label>
                </div>
                <div>
                    <asp:DropDownList class="form-control" runat="server" ID="ddlSelectProizvođac" AutoPostBack="true" OnSelectedIndexChanged="Selection_Change">
                        <asp:ListItem Value="-1" Selected="true">Select manufacturer</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select car manufacturer" ForeColor="Red" InitialValue="-1" ControlToValidate="ddlSelectProizvođac"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-sm-6 mb-3 text-left">
                <div>
                    <asp:Label runat="server">Model</asp:Label>
                </div>
                <div>
                    <asp:DropDownList ID="ddlCarModel" runat="server" CssClass="form-control disabled" Enabled="false" title="Select manufacturer first!">
                        <asp:ListItem Value="-1" Selected="True">Select model</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select car model" ForeColor="Red" InitialValue="-1" ControlToValidate="ddlCarModel"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-6 mb-3 text-left">
                <div>
                    <asp:Label runat="server">Year of make</asp:Label>
                </div>
                <div>
                    <asp:DropDownList ID="ddlGodina" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0" Selected="true">Seleect year of make</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please select year" ForeColor="Red" ControlToValidate="ddlGodina" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-sm-6 mb-3 text-left">
                <div>
                    <asp:Label runat="server">Engine type</asp:Label>
                </div>
                <div>
                    <asp:DropDownList ID="ddlVrstaMotora" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0" Selected="true">Select engine type</asp:ListItem>
                        <asp:ListItem Value="1" Text="Petrol"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Diesel"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Gas"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please select car manufacturer" ForeColor="Red" InitialValue="0" ControlToValidate="ddlVrstaMotora"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-sm-6 mb-3 text-left">
                <div>
                    <asp:Label runat="server">Name on the card</asp:Label>
                    <asp:TextBox ID="txbImePrezime" runat="server" CssClass="form-control" placeholder="Tony Stark"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter first and last name" ForeColor="red" ControlToValidate="txbImePrezime"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label runat="server">Card number</asp:Label>
                    <asp:TextBox ID="txbBrojKred" runat="server" CssClass="form-control" placeholder="123456789101112" MaxLength="16" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter your card number" ForeColor="red" ControlToValidate="txbBrojKred"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-sm-6 mb-3 text-left">
                <div>
                    <asp:Label runat="server">MM/GG:</asp:Label>
                    <asp:TextBox ID="txbExpire" runat="server" CssClass="form-control" placeholder="12/20" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter card expiration date" ForeColor="red" ControlToValidate="txbExpire"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label runat="server">CVV:</asp:Label>
                    <asp:TextBox ID="txbCvv" runat="server" CssClass="form-control" MaxLength="3" placeholder="123" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter 3 digit number from back of the card" ForeColor="red" ControlToValidate="txbCvv"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-sm-6 text-left" style="width: 20%; margin: auto; padding-left: 8%;">
                <asp:Label runat="server">Select date of service</asp:Label>
                <br />
                <asp:TextBox runat="server" ID="dateOfService" TextMode="DateTimeLocal"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredDateOfService" runat="server" ErrorMessage="Please select time of service" ForeColor="Red" ControlToValidate="dateOfService"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <div runat="server" ID="InvalidInput">

    </div>
    <div>
        <div class="submitForm">
            <asp:Button runat="server" ID="registerCar" Text="Sign up for regular service" OnClick="button_registerCar" />
        </div>
    </div>
</asp:Content>

<script runat="server">

    void Selection_Change(Object sender, EventArgs e) {
        if (ddlSelectProizvođac.SelectedValue != "-1") {
            GetCarManufacturerModels(ddlSelectProizvođac.SelectedValue);
            ddlCarModel.CssClass.Replace("disabled", "enabled");
            ddlCarModel.Enabled = true;
            ddlCarModel.Attributes.Remove("Title");
        }
        else {
            ddlCarModel.Items.Clear();
            ddlCarModel.Items.Insert(0, "Select model");
            ddlCarModel.CssClass.Replace("enabled", "disabled");
            ddlCarModel.Enabled = false;
            ddlCarModel.Attributes.Add("Title", "Select manufacturer first!");
        }
    }

</script>
