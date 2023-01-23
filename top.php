<?PHP

function displayLogin() {
header("WWW-Authenticate: Basic realm=\"Viking Management Platform\"");
header("HTTP/1.0 401 Unauthorized");
echo "<h2>Authentication Failure</h2>";
echo "La contrase�a que ha introducido no es v�lida. Refresque la p�gina e int�ntelo de nuevo.";
exit;
}

require "conexion.inc";
require "checklogin.inc";

?>
<html><body  bgcolor="#1C2D67">
     <table width="100%" align="left" border="0" nowrap="nowrap">
          <tr align="left">
               <td align="left" nowrap="nowrap" width="100px">
                    <!--<img src="images/binary_2.jpg"></img>-->
                    <img src="images/viking.png" width="100" height="100"></img>
               </td>
               <td valign="bottom" align="left" nowrap="nowrap">
                    <font face="Verdana" color="#33CC00" size="5">
                         Viking Management Platform<br>
                    </font>
                    <font face="Verdana" color="#33CC00" size="3">
                         Setup & Configuration
                    </font>
               </td>
          </tr>
     </table>
</body></html>
