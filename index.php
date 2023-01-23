<?PHP

function displayLogin() {
header("WWW-Authenticate: Basic realm=\"Viking Management Platform\"");
header("HTTP/1.0 401 Unauthorized");
echo "<h2>Authentication Failure</h2>";
echo "Invalid username or password, please try again.";
exit;
}

require "conexion.inc";
require "checklogin.inc";

?>


<HTML>
	<TITLE>
		Viking Management Platform
	</TITLE>
	<head>

		<link rel="stylesheet" href="menu.css">
		<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"><META HTTP-EQUIV="Expires" CONTENT="-1">
		<!-- some header data -->
		<link rel="stylesheet" href="menu.css">
		<link rel="stylesheet" href="style.css">

	</head>
	<FRAMESET ROWS=120px,100% frameborder='1' >
		<FRAME SRC='top.php' SCROLLING=NO  NAME=Frame1  frameborder='0' framespacing='0' noresize  height="160">
		<FRAMESET COLS=190px,100% frameborder='1' >
			<FRAME SRC='menu.php' SCROLLING=AUTO  NAME=Frame2  frameborder='0' framespacing='0' noresize>
			<FRAME SRC='blank.php' SCROLLING=AUTO  NAME=Frame3  frameborder='0' framespacing='0' noresize>
		</FRAMESET>
	</FRAMESET>
</HTML>
