<?php
include "conecta_banco.php" ;
$result = $dbh -> query("SELECT * FROM servidor");
if ($result) { 
	foreach ($result as $row) {
	
	echo "{$row['ID']}";
	echo "<br />";
	echo "{$row['NOME']}";
	echo "<br />";
	echo "{$row['SALARIO']}";
	echo "<br />";
		# code...
	}
	# code...
}
else echo "erro de seleção.";

?>
	