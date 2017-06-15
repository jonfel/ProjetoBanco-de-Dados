<?php
include "conecta_banco.php";
$result = $dbh -> query("SELECT * FROM aluno");
if ($result) { 
	foreach ($result as $row) {
	
	echo "{$row['NOME']}";
	echo "<br />";
	echo "{$row['RA']}";
	echo "<br />";
	echo "{$row['GRAU']}";
	echo "<br />";
		# code...
	}
	# code...
}
else echo "erro de seleção.";

?>
	