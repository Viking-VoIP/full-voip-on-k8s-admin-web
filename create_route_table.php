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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
		"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-15">
	<title>ws_providers</title>
	<link rel="stylesheet" href="pages_style.css">
     <script> 
          function disable_table_insert(){ 
               document.getElementById('action').value = "table_create";
               document.getElementById('insert_table').disabled = true;
               document.getElementById('zaprecs').disabled = true;    
               document.getElementById('table').disabled = false;    
          } 
          function disable_table_create(){ 
               document.getElementById('action').value = "table_insert";
               document.getElementById('insert_table').disabled = false;
               document.getElementById('zaprecs').disabled = false;    
               document.getElementById('table').disabled = true;    
          } 
     </script>

     <script type="text/javascript">
          beforeSubmit = function()
          {

               if( document.getElementById('action').value  == "table_create" ) { 
                    if ( document.getElementById('table').value == "" || document.getElementById('uploaded').value == "" ){ 
                         alert("you must specify a TABLE TO CREATE and a FILE TO IMPORT");
                    } else {
                         if ( document.getElementById('table').value != document.getElementById('table').value.match(/[a-zA-Z0-9_-]*/)[0]) {
                              alert("The new TABLE NAME contains Non-standard characters. It can only contain a-A, A-Z, 0-9, '-' or '_'"); 
                         } else {
                              document.getElementById("new_route_table_form").submit();
                         }
                    }
               }
          }
     </script>
</head>
<body>
<h3>Create a new table from file</h3>
     <?php

          var_dump($_POST);
     
          if( isset($_FILES['uploaded']['name']) ){
          
               #    CREATE AND INSERT INTO A TABLE
               if($_POST['operation']=="create_table"){ 
                    if(!isset($_POST['table'])||$_POST['table']==""){ 
                         echo "<script>alert('No file specified!');</script>";
                    }else{
                         $table = "ws_route_table_" . $_POST['table'];
                         $stmt = $dbh->query("select 1 from " . $table . ";");
                         if($stmt){
                              print("<h1><font style='background-color:red;' color='white'>TABLE ALREADY EXISTS!</font></h1>");
                         }

                         
                         $stmt = $dbh->query("create table " . $table . " like ws_def_route_table;");
                         if (!$stmt) {
                              echo "\nPDO::errorInfo():\n";
                              print_r($dbh->errorInfo());
                              print("Could not create the new table! Make sure the default table (ws_def_route_table) exists");
                          }
                         MoveAndInsert($table,$dbh);
                    }
               }
               
               #    INSERT INTO A TABLE
               if($_POST['operation']=="insert_table"){ 
                    if(!isset($_POST['insert_table'])||$_POST['insert_table']==""){ 
                         echo "<script>alert('No table in which to insert specified!');</script>"; 
                    }else{
                         $table = $_POST['insert_table'];
                         //print "INSERTING INTO: $table<br>\n";
                         if( isset($_POST['zaprecs']) && $_POST['zaprecs'] ){ 
                              //print "But first i will remove all existing records<br>\n";
                              $stmt = $dbh->query("truncate table " . $table . ";");
                              if (!$stmt) {
                                   echo "\nPDO::errorInfo():\n";
                                   print_r($dbh->errorInfo());
                                   print("Could not truncate table!");
                               }     
                         }
                         MoveAndInsert($table);
                    }
               }

          }
     ?> 
     <form id="new_route_table_form" enctype="multipart/form-data" action="create_route_table.php" method="POST">
          <table>
               <tr>
                    <td>
                         <input type="hidden" id="action"/>
                         <input type="radio" id="operation" name="operation" value="create_table" onclick="disable_table_insert()">Create a new table
                    </td>
                    <td>
                         <input type="text" name="table" id="table">(The system will prepend "ws_route_table_" automatically)
                    </td>
               </tr>
          </table>
               <hr>
          <table>
               <tr>
                    <td>
                         <input type="radio" id="operation" name="operation" value="insert_table" onclick="disable_table_create()">Insert into table
                    </td>
                    <td>
                         <select name="insert_table" id="insert_table">
                              <option value="" SELECTED></option>
                         <?php
                              $sqldatetime = "show tables like 'ws_route_table_%';";
                              $stmt = $dbh->query($sqldatetime);
                              if (!$stmt) {
                                   echo "\nPDO::errorInfo():\n";
                                   print_r($dbh->errorInfo());
                                   print("Query failed!");
                              }     
                              while($row = $stmt->fetch()){                    	
                              	echo "<option value=\"" . $row[0] . "\">" . $row[0] . "</option>\n";
                              }
                         ?>
                         </select>
                    </td>
               </tr>
               <tr>
                    <td>
                         <input type="checkbox" name="zaprecs" id="zaprecs" checked>Delete all records before inserting</input>
                    </td>
               </tr>
               <tr>
                    <td>
                         Field Separator
                    </td>
                    <td>
                         <select name="separator" id="separator">
                              <option>;</option>
                         </select>
                    </td>
               </tr>
          </table>
          <hr>
          <table>
               <tr>
                    <td>
                         Select the file to import
                    </td>
                    <td>
                          <input name="uploaded" id="uploaded" type="file" />
                    </td>
               </tr>
               <tr>
                    <td>
                         <input type="checkbox" name="has_headers" id="has_headers" checked>File Contains Headers (Ignore forst line)</input>
                    </tr>
               </tr>
               <tr>
                    <td colspan="2">
                         <input type="button" value="Upload" onClick="beforeSubmit();"/>
                    </td>
               </tr>
          </table>
     </form> 
</body>
</html>

<?php

function MoveAndInsert($table,$dbh){
     $target = "/tmp/"; 
     $target = $target . basename( $_FILES['uploaded']['name']) ; 
     $ok=1; 
     if(move_uploaded_file($_FILES['uploaded']['tmp_name'], $target)) 
     {

          $separator = $_POST['separator'];
          if(isset($_POST['has_headers'])) { $headers = " IGNORE 1 LINES"; }else { $headers=""; }
          $sqldatetime = "LOAD DATA LOCAL INFILE '" . $target . "' INTO TABLE $table FIELDS TERMINATED BY '" . $separator . "' " . $headers . " (areacode, destination, provider_list);";
          print "<br>$sqldatetime<br>\n";
          system("chown www-data $target");
          $stmt = $dbh->query($sqldatetime);
          if (!$stmt) {
               echo "\nPDO::errorInfo():\n";
               print_r($dbh->errorInfo());
               print("No he podido insertar los datos, por favor verifique el archivo! ");
          }            
          
     } else {
          echo "<h1><font style='background-color:red;' color='white'>Sorry, there was a problem uploading your file.</font></h1>";
     }

}
?>
