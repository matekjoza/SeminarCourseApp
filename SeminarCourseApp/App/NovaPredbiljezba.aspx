<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NovaPredbiljezba.aspx.cs" Inherits="NovaPredbiljezba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="glavninaStranice" visible="true" runat="server">
        <div style="text-align: center; vertical-align: top; height: auto; width: auto" class="jumbotron">
            <h2>Predbilježite se na seminar</h2>
            <p class="lead">Izaberite jedan od ponuđenih programa obrazovanja iz naše bogate ponude. Vrhunski predavači, odlične predavaonice i nova znanja čekaju na Vas.</p>
        </div>
        <div class="form-group">
            <table>
                <tr>
                    <td>
                        <h4>Pretraga: </h4>
                    </td>
                    <td>
                        <asp:TextBox class="form-control input" ID="txtNazivSeminara" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button class="btn btn-primary btn" ID="btnTrazi" runat="server" Text="Pretraži" OnClick="btnTrazi_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="row">
            <asp:GridView ID="gvSeminari" CssClass="table" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvSeminari_SelectedIndexChanged" DataKeyNames="Id">
                <Columns>
                    <asp:CommandField SelectText="Odaberi" ShowSelectButton="True" />
                    <asp:BoundField DataField="Naziv" HeaderText="Naziv" />
                    <asp:BoundField DataField="Opis" HeaderText="Opis" />
                    <asp:BoundField DataField="DatumPocetka" HeaderText="Datum početka" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="Predavac" HeaderText="Predavač" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:Panel ID="pnPrijava" Visible="false" class="panel panel-default" runat="server">
            <div class="panel-heading">Upišite svoje podatke</div>
            <div class="panel-body">
                <table>
                    <tr>
                        <td>Ime:
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control input" ID="txtIme" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Obavezan unos!" ControlToValidate="txtIme"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Prezime: 
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control input" ID="txtPrezime" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Obavezan unos!" ControlToValidate="txtPrezime"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Adresa:
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control input" ID="txtAdresa" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Obavezan unos!" ControlToValidate="txtAdresa" CssClass="field-validation-error"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>E-mail:
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control input" ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Obavezan unos!" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Neispravna e-mail adresa!" ControlToValidate="txtEmail" ValidationExpression="^\S+@\S+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Kontakt:
                        </td>
                        <td>
                            <asp:TextBox ID="txtKontakt" CssClass="form-control input" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button class="btn btn-primary btn" ID="btnPrijavi" runat="server" OnClick="btnPrijavi_Click" Text="Prijavi" />
                        </td>
                        <td>
                            <asp:Button class="btn btn-primary btn" ID="btnOdustani" runat="server" Text="Odustani" OnClick="btnOdustani_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    <div id="prijava" visible="false" runat="server">
        <hr />
       <h3>Uspješno ste prijavili seminar!</h3>
        <asp:Button class="btn btn-primary btn" ID="btnOk" runat="server" Text="U redu" OnClick="btnOk_Click" />
    </div>
</asp:Content>

