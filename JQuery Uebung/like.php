<?php
$server = "localhost";
$username = "root";
$password = "";

$db = new PDO("mysql:host=$server;dbname=Lib4You_30092022", $username, $password);

$query = $db->prepare("SELECT * FROM books where isbn=:id;");
$query->execute([":id" => $_POST['id']]);
$value = $query->fetch();

$query2 = $db->prepare("UPDATE books SET likes = likes+1 where isbn=:id;");
$query2->execute([":id" => $_POST['id']]);
echo $value[1];