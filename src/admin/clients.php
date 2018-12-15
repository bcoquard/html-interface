<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <?php include '../modules/includes.php';?>

    <title>Clients</title>
</head>

<body class="container">

    <?php
$PAGE_TYPE = 'CONSEILLER';
include '../modules/is-logged-in.php';?>

    <?php include '../modules/navbar-admin.php';?>

    <?php

$bdd = new PDO('mysql:host=localhost;dbname=pbp;charset=utf8', 'root', '');

if (isset( $_POST["email"],$_POST["password"], $_POST["type"], $_POST["nom"], $_POST["prenom"], $_POST["adresse"],
    $_POST["date_naissance"], $_POST["telephone"], $_POST["agence"])) {
    $reqInsertClient = $bdd->prepare(
        "INSERT INTO client" .
        "(login, password, `type`, nom, prenom, date_naissance, email, telephone, adresse, id_agence)" .
        "VALUES(:login, :password, :type, :nom, :prenom, :date_naissance, :email, :telephone, :adresse, :agence)");
        
    $reqInsertClient->execute([
        ":login" => $_POST["email"],
        ":password" => $_POST["password"],
        ":type" => $_POST["type"],
        ":nom" => $_POST["nom"],
        ":prenom" => $_POST["prenom"],
        ":email" => $_POST["email"],
        ":adresse" => $_POST["adresse"],
        ":date_naissance" => $_POST["date_naissance"],
        ":telephone" => $_POST["telephone"],
        ":agence" => $_POST["agence"],
    ]);
    header('Location:clients.php');
}

$reqClients = $bdd->prepare("SELECT client.*, agence.description FROM client as client JOIN agence as agence on agence.id_agence = client.id_agence ORDER BY client.id_client");
$reqClients->execute();
$clients = $reqClients->fetchAll(PDO::FETCH_OBJ);
?>



    <?php include './clients.html.php';?>

</body>

</html>