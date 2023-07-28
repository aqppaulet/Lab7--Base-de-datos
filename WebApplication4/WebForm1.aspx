<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
body {
background-color: skyblue;
}
h1 {
color: black;
text-align: left;
}
p {
font-family: 'Times New Roman';
font-size: 15px;
color: black;
}
Label {
font-family: 'Times New Roman';
font-size: 15px;
color: black;
}
span {
font-family: verdana;
font-size: 20px;
color: #84c754;
}

#Button1 {
color: antiquewhite;
background-color: midnightblue;
padding: 10px 24px;
}
#Button2 {
color: antiquewhite;
background-color: midnightblue;
padding: 10px 24px;
}

.alerta {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 10px 20px;
  background-color: #f0f0f0;
  border: 5px solid #ccc;
  border-radius: 4px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  font-family: Arial, sans-serif;
  font-size: 16px;
  color: #333;
}
.amplioTextBox {
    width: 200px; /* Define el ancho deseado */
    height:150px;
}
</style>

<title>Registro de Alumno</title>
        <script type="text/javascript">
            var vacio = "";
            function limpiarcontenido() {

                document.getElementById("TextBoxNombre").value = vacio;
                document.getElementById("TextBoxApellidos").value = vacio;
                document.getElementById("RadioButtonM").checked = false;
                document.getElementById("RadioButtonF").checked = false;
                document.getElementById("TextBoxEmail").value = vacio;
                document.getElementById("TextBoxDireccion").value = vacio;
                document.getElementById("TextBoxRequerimiento").value = vacio;
                document.getElementById("DropDownListCiudad").value = 0;

                return false;
            }

            function Enviarcontenido() {
                var nombre = document.getElementById("TextBoxNombre").value;
                var apellidos = document.getElementById("TextBoxApellidos").value;
                var regex = /^[a-zA-Z\s]*$/;

                var email = document.getElementById("TextBoxEmail").value;
                var direccion = document.getElementById("TextBoxDireccion").value;
                var sexM = document.getElementById("RadioButtonM").checked;
                var sexF = document.getElementById("RadioButtonF").checked;
                var ciudad = document.getElementById("DropDownListCiudad").value;
                //var regmail = /^[a-zA-Z0-9_.+-]+@[unsa]+\.[edu]+\.[pe]+$/;
                var regmail = /^[a-zA-Z0-9_.+-]+@[unsa]+\.[edu]+\.[pP][eE]$/;

                //hora actual
                var today = new Date();
                //var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
                // options.timeZone = 'UTC';
                //options.timeZoneName = 'short';
                //var now = today.toLocaleString('en-US', { hour12: true });

                if (nombre == vacio || apellidos == vacio) {
                    mostrarAlerta("Error", "Por favor, rellene los campos de nombre y apellidos.");
                    return false;
                }

                if (!regex.test(nombre) || !regex.test(apellidos)) {
                    mostrarAlerta("Error", "Por favor, introduzca solo letras en los campos de nombre y apellidos.");
                    return false;
                }
                if (sexM == false && sexF == false) {
                    mostrarAlerta("Error", "Por favor, introduzca el sexo");
                    return false;
                }
                if (!regmail.test(email)) {
                    mostrarAlerta("Error", "Por favor, introduzca solo el correo institucional de la Universidad Nacional de San Agustin.");
                    return false;
                }

                if (direccion == vacio) {
                    mostrarAlerta("Error", "Por favor, rellene la direccion.");
                    return false;
                }

                if (ciudad == 0) {
                    mostrarAlerta("Error", "Por favor, seleccionar la ciudad");
                    return false;
                }

                else

                    mostrarAlerta("Enviado", "Registrado a las " + today + " hora estandar de Peru.");

                return false;


                // Resto del código para enviar el formulario o realizar otras acciones

            }

            //Funcion para mostrar alertas modificadas
            function mostrarAlerta(titulo, mensaje) {
                var alertaElement = document.createElement("div");
                alertaElement.className = "alerta";

                // Agregar título a la alerta
                var tituloElement = document.createElement("h2");
                tituloElement.textContent = titulo;
                alertaElement.appendChild(tituloElement);

                // Agregar mensaje a la alerta
                var mensajeElement = document.createElement("p");
                mensajeElement.textContent = mensaje;
                alertaElement.appendChild(mensajeElement);

                // Agregar el elemento de alerta al cuerpo del documento
                document.body.appendChild(alertaElement);

                // Opcional: Establecer un tiempo de espera para eliminar automáticamente la alerta
                setTimeout(function () {
                    alertaElement.remove();
                }, 3000); // Eliminar la alerta después de 3 segundos (3000 ms)
            }




        </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1> Registro de Alumno</h1>
                <p> Nombre: <asp:TextBox ID="TextBoxNombre" runat="server"></asp:TextBox>
                Apellidos: <asp:TextBox ID="TextBoxApellidos" runat="server"></asp:TextBox>
                </p>
                         
              <asp:RadioButton id="RadioButtonM" Text="Masculino" Checked="True" GroupName="RadioGroup1" runat="server" />
              <asp:RadioButton id="RadioButtonF" Text="Femenino" Checked="True" GroupName="RadioGroup1" runat="server" /><br />


            <p> Email: <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>&nbsp
              Direccion:<asp:TextBox ID="TextBoxDireccion" runat="server"></asp:TextBox>
            </p>
               <label for="city">Ciudad</label>
            
   <asp:DropDownList ID="DropDownListCiudad" runat="server">
       <asp:ListItem Text=""></asp:ListItem>
    
   </asp:DropDownList>
           </div>
        
          <p>Requerimiento:</p>  
             <asp:TextBox id="TextBoxRequerimiento" CssClass="amplioTextBox" rows="30" columns="30"  runat="server" ></asp:TextBox>
            <br/>   
            <asp:Button ID="Button1" runat="server" Text="Limpiar" OnClientClick="return limpiarcontenido()" />
            <asp:Button ID="Button2" runat="server" Text="Enviar" OnClientClick="Enviarcontenido()"   class="btn btn-success btn-lg" OnClick="ButtonEnviar_Click" />
              <br/> 


        <div>
         <asp:TextBox id="TextBox1"  TextMode="MultiLine" rows="30" columns="30"  runat="server" ></asp:TextBox>
        </div>
    </form>
</body>
</html>


































