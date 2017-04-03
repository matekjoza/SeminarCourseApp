<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeFile="SeminariAdmin.aspx.cs" Inherits="Admin_SeminariAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="text-align: center; vertical-align: top; height: auto; width: auto" class="jumbotron">
        <h2>Seminari</h2>
    </div>
    <div class="form-group">
        <table>
            <tr>
                <td>
                    <h4>Pretraga seminara: </h4>
                </td>
                <td>
                    <asp:TextBox class="form-control input" ID="txtKeyWord" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button class="btn btn-primary btn" ID="btnTrazi" runat="server" Text="Pretraži" OnClick="btnTrazi_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <h4>Mogućnosti prikaza seminara: </h4>
                </td>
                <td>
                    <asp:DropDownList class="btn btn-primary dropdown-toggle" ID="ddlVrstaSeminara" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlVrstaSeminara_SelectedIndexChanged">
                        <asp:ListItem>-- Odaberite vrstu prikaza --</asp:ListItem>
                        <asp:ListItem>Aktivni seminari</asp:ListItem>
                        <asp:ListItem>Zatvoreni seminari</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <hr />
        <asp:Button class="btn btn-primary btn" ID="btnNoviSeminar" runat="server" Text="Kreiraj novi seminar" OnClick="btnNoviSeminar_Click" />
    </div>
    <hr />
    <div class="row">
        <asp:GridView CssClass="table" ID="gvSeminari" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnSelectedIndexChanged="gvSeminari_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="Odaberi" ShowSelectButton="True" />
                <asp:BoundField DataField="Naziv" HeaderText="Naziv" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" />
                <asp:BoundField DataField="DatumPocetka" HeaderText="Datum početka" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Predavac" HeaderText="Predavač" />
                <asp:BoundField DataField="BrojSati" HeaderText="Broj sati" />
                <asp:BoundField DataField="Cijena" HeaderText="Cijena" DataFormatString="{0:C2}"/>
                <asp:BoundField DataField="BrojPredbiljezbi" HeaderText="Broj predbilježbi" />
                <asp:CheckBoxField DataField="Zatvoren" HeaderText="Zatvoren" />
            </Columns>
        </asp:GridView>
    </div>
    <div>
        <asp:Panel ID="pnUpdateSeminar" Width="700px"  Visible="false" class="panel panel-default" runat="server">
            <div class="panel-heading">Uređivanje seminara</div>
            <div class="panel-body">
                <table>
                    <tr>
                        <td style="width: 114px">Naziv seminara:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox ID="txtNaziv_E" cssclass="form-control input" runat="server" Width="500px" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Opis seminara:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox class="form-control input" ID="txtOpis_E" Width="500px" runat="server" Rows="4" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Datum početka:
                        </td>
                        <td align="center"  style="width: 249px">
                            <asp:Calendar ID="calPocetak_E" Width="200px" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Predavač:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox class="form-control input" ID="txtPredavac_E" Width="500px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Broj sati:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox class="form-control input" ID="txtBrojSati_E" Width="500px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Cijena:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox cssclass="form-control input" ID="txtCijena_E" Width="500px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Broj predbilježbi:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox cssclass="form-control input" ID="txtBrojPredbiljezbi_E" Enabled="false" Width="500px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Zatvoren:
                        </td>
                        <td style="width: 249px">
                            <asp:CheckBox ID="chkZatvoren" runat="server" />
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Button class="btn btn-primary sm" Width="133px" ID="btnSpremi_E" runat="server" Text="Spremi promjene" OnClick="btnSpremi_E_Click" />
                        </td>
                        <td style="width: 103px">
                            <asp:Button ID="btnIzbrisi_E" runat="server" class="btn btn-primary btn" Text="Izbriši seminar" Width="124px" OnClick="btnIzbrisi_E_Click" />
                        </td>
                        <td style="width: 94px">
                            <asp:Button ID="btnOdustani_E" runat="server" class="btn btn-primary btn" Text="Odustani" Width="103px" OnClick="btnOdustani_E_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
    <div>
        <asp:Panel ID="pnNoviSeminar" Visible="false" class="panel panel-default" runat="server">
            <div class="panel-heading">Kreiranje novog seminara</div>
            <div class="panel-body">
                <table>
                    <tr>
                        <td style="width: 114px">Naziv seminara:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox cssclass="form-control input" ID="txtNaziv" runat="server" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Opis seminara:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox class="form-control input" ID="txtOpis" Width="240px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Datum početka:
                        </td>
                        <td style="width: 249px">
                            <asp:Calendar ID="calPocetak" CssClass="CalendarClass" TitleStyle-CssClass="TitleStyle" DayHeaderStyle-CssClass="DayHeaderStyle" Width="200px" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px">
                                <DayHeaderStyle BackColor="#CCCCCC" CssClass="DayHeaderStyle" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" CssClass="TitleStyle" Font-Bold="True" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Predavač:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox class="form-control input" ID="txtPredavac" Width="240px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Broj sati:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox class="form-control input" ID="txtBrojSati" Width="240px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 114px">Cijena:
                        </td>
                        <td style="width: 249px">
                            <asp:TextBox class="form-control input" ID="txtCijena" Width="240px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Button class="btn btn-primary sm" Width="182px" ID="btnSpremi" runat="server" Text="Spremi seminar" OnClick="btnSpremi_Click" />
                        </td>
                        <td style="width: 139px">
                            <asp:Button class="btn btn-primary btn" Width="181px" ID="btnOdustani" runat="server" Text="Odustani" OnClick="btnOdustani_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

