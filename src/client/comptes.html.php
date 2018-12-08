<!DOCTYPE html>

<div>

  <?php
  foreach ($comptesCheque as $key => $iter) {
      $compteType = $iter->type;
      $compteNumber = $iter->numero;
      $compteSolde = $iter->solde;

      include './compte.card.html.php';
  }

  foreach ($comptesEpargne as $key => $iter) {
      $compteType = $iter->type;
      $compteNumber = $iter->numero;
      $compteSolde = $iter->solde;

      include './compte.card.html.php';
  }
  ?>
</div>
