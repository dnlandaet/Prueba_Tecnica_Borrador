<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Prueba_Tecnica._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <p class="lead">Por favor ingrese los datos que se solicitan a continuación:&nbsp;&nbsp;&nbsp; </p>

            
            <ul textmode="MultiLine">
                
                <asp:Label ID="NumDoc" runat="server" Text="Número documento" ></asp:Label>
                <asp:TextBox ID="TextBoxNumDoc" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBoxNumDoc" runat="server"></asp:RequiredFieldValidator>
                 <br/>

                <asp:Label ID="Label1" runat="server" Text="Primer Nombre" ></asp:Label>
                <asp:TextBox ID="TextBoxPName" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvf2" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBoxPName" runat="server"></asp:RequiredFieldValidator>
                <br/>

                <asp:Label ID="Label2" runat="server" Text="Segundo Nombre"  ></asp:Label>
                <asp:TextBox ID="TextBoxSName" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                <br/>

                <asp:Label ID="Label3" runat="server" Text="Primer Apellido"  ></asp:Label>
                <asp:TextBox ID="TextBoxPriApe" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvf3" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBoxPriApe" runat="server"></asp:RequiredFieldValidator>
                <br/>

                <asp:Label ID="Label4" runat="server" Text="Segundo Apellido" ></asp:Label>
                <asp:TextBox ID="TextBoxSegApe" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                <br/>

                <asp:Label ID="Label5" runat="server" Text="Teléfono" ></asp:Label>
                <asp:TextBox ID="TextBoxTelf" runat="server" CssClass="form-control" TextMode="Phone" ></asp:TextBox>
                <br/>

                <asp:Label ID="Label6" runat="server" Text="Correo" ></asp:Label>
                <asp:TextBox ID="TextBoxCorreo" runat="server" CssClass="form-control" TextMode="Email" ></asp:TextBox>
                <br/>

                <asp:Label ID="Label7" runat="server" Text="Dirección" ></asp:Label>
                <asp:TextBox ID="TextBoxDir" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvf4" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBoxDir" runat="server"></asp:RequiredFieldValidator>
                <br/>

                <asp:Label ID="Label8" runat="server" Text="Edad" ></asp:Label>
                <asp:TextBox ID="TextBoxEdad" runat="server" CssClass="form-control" TextMode="Number" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvf5" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBoxEdad" runat="server"></asp:RequiredFieldValidator>
                <br/>

                <asp:Label ID="Label9" runat="server" Text="Género"></asp:Label>
                <asp:DropDownList ID="ListGen" runat="server">
                    <asp:ListItem>Masculino</asp:ListItem>
                    <asp:ListItem>Femenino</asp:ListItem>
                    <asp:ListItem>Otro</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rvf6" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="ListGen" runat="server"></asp:RequiredFieldValidator>
                <br/>

                </ul>   
                <ul><asp:Button ID="Button1" runat="server" Text="Registrar" CssClass="btn btn-primary   " BackColor="#336699" OnClick="Button1_Click"/>
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-secundary   " OnClick="Button3_Click" Text="Actualizar" Visible="false" />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </ul>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="lead" DataKeyNames="id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1203px" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Seleccionar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" />
                        <asp:BoundField DataField="numero_documento" HeaderText="Número documento" />
                        <asp:BoundField DataField="primer_nombre" HeaderText="Primer Nombre" />
                        <asp:BoundField DataField="segundo_nombre" HeaderText="Segundo Nombre" />
                        <asp:BoundField DataField="primer_apellido" HeaderText="Primer Apellido" />
                        <asp:BoundField DataField="segundo_apellido" HeaderText="Segundo Apellido" />
                        <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
                        <asp:BoundField DataField="correo" HeaderText="Correo" />
                        <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                        <asp:BoundField DataField="edad" HeaderText="Edad" />
                        <asp:BoundField DataField="genero" HeaderText="Género" />
                    </Columns>
                    <EmptyDataTemplate>
                        Tabla Vacia
                    </EmptyDataTemplate>
            </asp:GridView>
               


            <br />
               


            
            <asp:Label ID="Label10" runat="server" Text="Consultas: " Visible="False"></asp:Label>
               


            
            <asp:DropDownList ID="DropDownList1" runat="server" Visible="False" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Nombres Completos</asp:ListItem>
                <asp:ListItem>Conteo de Mujeres</asp:ListItem>
                <asp:ListItem>Conteo de Hombres</asp:ListItem>
                <asp:ListItem>Nombre Mayor Persona</asp:ListItem>
                <asp:ListItem>Promedio edades</asp:ListItem>
            </asp:DropDownList>
               


            <asp:Button ID="Button4" runat="server" Text="Consultar" OnClick="Button4_Click" />
               


            <br />
            <asp:Label ID="LabelRespuesta" runat="server"></asp:Label>
               


        </section>
    <div class="row">
            <br />
        </div>
    </main>

</asp:Content>
