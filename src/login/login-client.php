<?php
header('Content-Type:text/html; charset=UTF-8');

include './login-client.html';

// Accès à la base de données
$bdd = new PDO('mysql:host=localhost;dbname=pbp;charset=utf8', 'root', '');

if (isset($_POST["email"], $_POST["motdepasse"])) {
    echo "ok";
    if (empty($_POST["email"])) {
        die("Parametre Invalide !");
    }
    $req = $bdd->prepare("SELECT client(Mdp) WHERE EmailLogin = '" . $_POST["email"] . "'");
    $req->execute();

}
