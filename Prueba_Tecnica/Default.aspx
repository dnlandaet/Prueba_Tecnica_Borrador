<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Prueba_Tecnica._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <p class="lead">Por favor ingrese los datos que se solicitan a continuación:&nbsp;&nbsp;&nbsp; </p>

            
            <ul textmode="MultiLine">
                
                <asp:Label ID="NumDoc" runat="server" Text="Número documento" ></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                <p><asp:RequiredFieldValidator ID="rfv1" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBox1" runat="server"></asp:RequiredFieldValidator></p>

                <asp:Label ID="Label1" runat="server" Text="Primer Nombre" ></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                 <p><asp:RequiredFieldValidator ID="rvf2" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBox2" runat="server"></asp:RequiredFieldValidator></p>

                <asp:Label ID="Label2" runat="server" Text="Segundo Nombre"  ></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>

                <asp:Label ID="Label3" runat="server" Text="Primer Apellido"  ></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                 <p><asp:RequiredFieldValidator ID="rvf3" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBox4" runat="server"></asp:RequiredFieldValidator></p>

                <asp:Label ID="Label4" runat="server" Text="Segundo Apellido" ></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                <p></p>

                <asp:Label ID="Label5" runat="server" Text="Teléfono" ></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" TextMode="Phone" ></asp:TextBox>

                <asp:Label ID="Label6" runat="server" Text="Correo" ></asp:Label>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" TextMode="Email" ></asp:TextBox>

                <asp:Label ID="Label7" runat="server" Text="Dirección" ></asp:Label>
                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" TextMode="SingleLine" ></asp:TextBox>
                 <p><asp:RequiredFieldValidator ID="rvf4" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBox8" runat="server"></asp:RequiredFieldValidator></p>

                <asp:Label ID="Label8" runat="server" Text="Edad" ></asp:Label>
                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" TextMode="Number" ></asp:TextBox>
                 <p><asp:RequiredFieldValidator ID="rvf5" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="TextBox9" runat="server"></asp:RequiredFieldValidator></p>

                <asp:Label ID="Label9" runat="server" Text="Género"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Masculino</asp:ListItem>
                    <asp:ListItem>Femenino</asp:ListItem>
                    <asp:ListItem>Otro</asp:ListItem>
                </asp:DropDownList>
                 <p><asp:RequiredFieldValidator ID="rvf6" ErrorMessage="Este campo es obligatorio" ForeColor="Red" ControlToValidate="DropDownList1" runat="server"></asp:RequiredFieldValidator></p>
                
                </ul>   
                <ul><asp:Button ID="Button1" runat="server" Text="Registrar" CssClass="btn btn-primary   " BackColor="#336699"/></ul>
               
               


        </section>
            
        <div class="row">
            <br />
        </div>
    </main>

</asp:Content>
