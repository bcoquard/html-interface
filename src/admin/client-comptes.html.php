<div>

    <h3>Comptes client</h3>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCompte">Ajouter compte</button>

    <?php include './client-add-compte.modal.html.php'?>

    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">type</th>
          <th scope="col">numero</th>
          <th scope="col">solde</th>
          <th scope="col">taux</th>
          <th scope="col">decouvert</th>
          <th scope="col">iban</th>
          <th scope="col">code banque</th>
          <th scope="col">code guichet</th>
          <th scope="col">code pays</th>
          <th scope="col">cle rib</th>
          <th scope="col">cle iban ?</th>
        </tr>
      </thead>
      <tbody>
        <?php
foreach ($comptes as $iter) {
    echo '<tr>';
    echo '<td>' . $iter->id_compte . '</td>';
    echo '<td>' . $iter->type . '</td>';
    echo '<td>' . $iter->numero . '</td>';
    echo '<td>' . $iter->solde . '€</td>';
    echo '<td>' . $iter->taux . '%</td>';
    echo '<td>' . ($iter->decouvert ? 'oui' : 'non') . '</td>';
    echo '<td>' . '' . '</td>';
    echo '<td>' . '' . '</td>';
    echo '<td>' . '' . '</td>';
    echo '<td>' . '' . '</td>';
    echo '</tr>';
}
?>
      </tbody>
    </table>
  </div>