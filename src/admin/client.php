<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <?php include '../modules/includes.php';?>

    <title>Client</title>
</head>

<body class="container">
    <?php
$PAGE_TYPE = 'ADMIN';
include '../modules/is-logged-in.php';?>

    <?php include '../modules/navbar-admin.php';?>

    <?php
$bdd = new PDO('mysql:host=localhost;dbname=pbp;charset=utf8', 'root', '');

$idClient = $_GET['client'];

if (isset($_POST['dbObject']) && $_POST['dbObject'] == 'client') {
    $reqUpdateClient = $bdd->prepare(
        "UPDATE client" .
        "    SET login=:login, " .
        "    password=:password, " .
        "    `type`=:type, " .
        "    nom=:nom, " .
        "    prenom=:prenom, " .
        "    date_naissance=:date_naissance, " .
        "    email=:email, " .
        "    telephone=:telephone, " .
        "    adresse=:adresse, " .
        "    id_agence=:agence " .
        "    WHERE id_client=:idClient");

    $reqUpdateClient->execute([
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
        ":idClient" => $idClient,
    ]);
    header('Location:client.php?client=' . $idClient);
}

$reqClient = $bdd->prepare("SELECT client.*, agence.* FROM client as client JOIN agence as agence on agence.id_agence = client.id_agence WHERE client.id_client = :idClient");
$reqClient->execute([":idClient" => $idClient]);
$client = $reqClient->fetch(PDO::FETCH_OBJ);

if (isset($_POST['dbObject']) && $_POST['dbObject'] == 'compte') {
    $reqGetMax = $bdd->prepare("SELECT MAX(id_compte) FROM compte where id_agence = :idAgence");
    $reqGetMax->execute([":idAgence" => $client->id_agence]);
    $maxAccount = $reqGetMax->fetch();

    $numeroCompte = str_pad($maxAccount[0] . "", 11, "0", STR_PAD_LEFT);

    $cleRib = str_pad(rand(0, 99) . "", 2, "0", STR_PAD_LEFT);
    $cleIban = str_pad(rand(0, 99) . "", 2, "0", STR_PAD_LEFT);

    $iban = 'FR'
    . $cleIban
    . $client->cd_banque
    . $client->cd_guichet
        . $numeroCompte
        . $cleRib;

    error_reporting(E_ALL);
    ini_set("display_errors", 1);

    $reqInsertCompte = $bdd->prepare(
        "INSERT INTO compte" .
        " (`type`, numero, id_client, solde, taux, decouvert, iban, id_agence)" .
        " VALUES(:type, :numero, :idClient, :solde, :taux, :decouvert, :iban, :idAgence)");

    $decouvert = 0;
    if (isset($_POST['decouvert'])) {
        $decouvert = 1;
    }
    $res = $reqInsertCompte->execute([
        ":type" => $_POST["type"],
        ":numero" => $numeroCompte,
        ":idClient" => $idClient,
        ":solde" => $_POST["solde"],
        ":taux" => $_POST["taux"],
        ":decouvert" => $decouvert,
        ":iban" => $iban,
        ":idAgence" => $client->id_agence,
    ]);
}

$reqComptes = $bdd->prepare("SELECT * FROM compte WHERE id_client = :idClient");
$reqComptes->execute([":idClient" => $idClient]);
$comptes = $reqComptes->fetchAll(PDO::FETCH_OBJ);

$reqAgences = $bdd->prepare("SELECT * FROM agence");
$reqAgences->execute();
$agences = $reqAgences->fetchAll(PDO::FETCH_OBJ);
?>


    <?php include 'client.html.php';?>


</body>

</html>