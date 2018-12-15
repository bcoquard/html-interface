<!DOCTYPE html>

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addClient">Ajouter client</button>

<?php include './clients-add.modal.html.php'?>

<div>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">type</th>
        <th scope="col">nom</th>
        <th scope="col">prenom</th>
        <th scope="col">email</th>
        <th scope="col">agence</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <?php
foreach ($clients as $iter) {
    echo '<tr>';
    echo '<td>' . $iter->type . '</td>';
    echo '<td>' . $iter->nom . '</td>';
    echo '<td>' . $iter->prenom . '</td>';
    echo '<td>' . $iter->email . '</td>';
    echo '<td>' . $iter->description . '</td>';
    echo '<td><a href="client.php?client=' . $iter->id_client . '"><i class="far fa-edit"></i></td>';
    echo '</tr>';
}
?>
    </tbody>
  </table>
</div>

</div>