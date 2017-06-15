<?php 
$usuario ='root';
$senha = '';
$dbh = new PDO('mysql:host=localhost;dbname=escolacorleone', $usuario, $senha);
if(!$dbh) {
echo "Nao foi possivel estabelecer uma conexao ao mysql";
exit;
}
?>