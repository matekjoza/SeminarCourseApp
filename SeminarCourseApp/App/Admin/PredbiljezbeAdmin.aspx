<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeFile="PredbiljezbeAdmin.aspx.cs" Inherits="Admin_PredbiljezbeAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="text-align: center; vertical-align: top; height: auto; width: auto" class="jumbotron">
        <h2>Predbilježbe</h2>
    </div>
    <div class="form-group">
        <table>
            <tr>
                <td>
                    <h4>Ključna riječ: </h4>
                </td>
                <td>
                    <asp:TextBox class="form-control input" ID="txtKljucnaRijec" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button class="btn btn-primary btn" ID="btnTrazi" runat="server" Text="Prikaži" OnClick="btnTrazi_Click" />
                </td>
            </tr>
        </table>
        <table>
          <tr>
              <td>
                   <h4>Mogućnosti prikaza predbilježbi: </h4>
              </td>
              <td>
                  <asp:DropDownList class="btn btn-primary dropdown-toggle" ID="ddlVrstaPredbiljezbi" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlVrstaPredbiljezbi_SelectedIndexChanged">
                      <asp:ListItem>-- Odaberite vrstu prikaza --</asp:ListItem>
                      <asp:ListItem>Neobrađene predbilježbe</asp:ListItem>
                      <asp:ListItem>Prihvaćene predbilježbe</asp:ListItem>
                      <asp:ListItem>Odbijene predbilježbe</asp:ListItem>
                  </asp:DropDownList>
              </td>
          </tr>
        </table>
    </div>
    <hr />
    <div class="row">
        <asp:GridView ID="gvPredbiljezbe" CssClass="table" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvPredbiljezbe_SelectedIndexChanged" DataKeyNames="Id">
            <Columns>
                <asp:CommandField SelectText="Odaberi" ShowSelectButton="True" />
                <asp:BoundField DataField="Ime" HeaderText="Ime" />
                <asp:BoundField DataField="Prezime" HeaderText="Prezime" />
                <asp:BoundField DataField="Adresa" HeaderText="Adresa" />
                <asp:BoundField DataField="Kontakt" HeaderText="Kontakt" />
                <asp:BoundField DataField="Email" HeaderText="E-mail" />
                <asp:BoundField DataField="NazivSeminara" HeaderText="Naziv seminara" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:Panel ID="pnPrijava" Visible="false" class="panel panel-default" runat="server">
        <div class="panel-heading">Obrada predbilježbe</div>
        <div class="panel-body">
            <table>
                <tr>
                    <td style="width: 173px">Ime:
                    </td>
                    <td style="width: 240px">
                        <asp:TextBox ID="txtIme" cssclass="form-control input" Enabled="false" runat="server" Width="240px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 173px">Prezime:
                    </td>
                    <td style="width: 240px">
                        <asp:TextBox ID="txtPrezime" cssclass="form-control input" Width="240px" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 173px">Adresa:
                    </td>
                    <td style="width: 240px">
                        <asp:TextBox cssclass="form-control input" ID="txtAdresa" Width="240px" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 173px">Kontakt:
                    </td>
                    <td style="width: 240px">
                        <asp:TextBox ID="txtKontakt" cssclass="form-control input" Width="240px" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 173px">E-mail:
                    </td>
                    <td style="width: 240px">
                        <asp:TextBox ID="txtEmail" cssclass="form-control input" Width="240px" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 173px">Naziv seminara:
                    </td>
                    <td style="width: 240px">
                        <asp:TextBox ID="txtNazivSeminara" cssclass="form-control input" Width="240px" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 173px">Status
                    </td>
                    <td style="width: 240px">
                        <asp:DropDownList class="btn btn-primary dropdown-toggle" Width="240px" ID="ddlStatus" runat="server">
                            <asp:ListItem>--- Status ---</asp:ListItem>
                            <asp:ListItem Value="1">Prihvaćena</asp:ListItem>
                            <asp:ListItem Value="2">Odbijena</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table style="width: 443px">
                <tr>
                    <td>
                        <asp:Button class="btn btn-primary sm" ID="btnSpremi" runat="server" Text="Spremi prijavu" OnClick="btnSpremi_Click" Width="169px" />
                    </td>
                    <td>
                        <asp:Button class="btn btn-primary btn" ID="btnObriši" runat="server" Text="Obriši prijavu" OnClick="btnObriši_Click" Width="156px" />
                    </td>
                    <td>
                        <asp:Button class="btn btn-primary btn" ID="btnOdustani" runat="server" Text="Odustani" OnClick="btnOdustani_Click" Width="112px" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>

