<!DOCTYPE html>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addClient">Ajouter client</button>

<?php include './clients-add.modal.html.php'?>

<div>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">login</th>
          <th scope="col">type</th>
          <th scope="col">nom</th>
          <th scope="col">prenom</th>
          <th scope="col">date de naissance</th>
          <th scope="col">email</th>
          <th scope="col">telephone</th>
          <th scope="col">agence</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
        <?php
foreach ($clients as $iter) {
    echo '<tr>';
    echo '<td>' . $iter->id_client . '</td>';
    echo '<td>' . $iter->login . '</td>';
    echo '<td>' . $iter->type . '</td>';
    echo '<td>' . $iter->nom . '</td>';
    echo '<td>' . $iter->prenom . '</td>';
    echo '<td>' . $iter->date_naissance . '</td>';
    echo '<td>' . $iter->email . '</td>';
    echo '<td>' . $iter->telephone . '</td>';
    echo '<td>' . $iter->description . '</td>';
    echo '<td><a href="client.php?client=' . $iter->id_client . '"><i class="far fa-edit"></i></td>';
    echo '</tr>';
}
?>
      </tbody>
    </table>
  </div>

</div>
