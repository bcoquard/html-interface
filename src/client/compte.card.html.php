<div class="card text-center">
    <h4 class="card-header"><?php echo $compteType ?></h4>
    <div class="card-body">
      <div class="d-flex justify-content-between d-flex align-items-center">
        <div class="card-left">
          <h5>n° <?php echo $compteNumber ?></h5>
          <?php
            if ($compteSolde >= 0) {
                echo '<p style="color:green; font-weight: bold">';
                echo $compteSolde;
                echo '</p>';
            } else {
                echo '<p style="color:red; font-weight: bold">';
                echo $compteSolde;
                echo '</p>';
            }
        ?>
        </div>

        <div class="card-right">
          <h6>Dernières opérations</h6>
          <table class="table table-card">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Libellé</th>
                <th scope="col">Montant</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">7</th>
                <td>Amazon</td>
                <td>- 10.00 €</td>
              </tr>
              <tr>
                <th scope="row">6</th>
                <td><3</td>
                <td>- 400.00 €</td>
              </tr>
              <tr>
                <th scope="row">5</th>
                <td>Salaire</td>
                <td>+ 1200.00 €</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="card-footer text-muted">
      <a href="./compte.php" class="btn btn-primary">Plus</a>
    </div>
  </div>
</div>