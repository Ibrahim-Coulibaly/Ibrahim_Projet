<?php
session_start();

include "app/function.php";
include "app/bdd.php";


// Verifie si le formulaire est bien soumis
if (isset($_POST['submit'])) {
	if (isset($_POST['username']) && isset($_POST['password'])) {

		// Fonction qui permet d'eviter les attaques XSS (app/function.php)
		$username = noXSS($_POST['username']);
		$password = noXSS($_POST['password']);

		if (!empty($username) && !empty($password)) {
			if (strlen($username) >= 6) {

				// Requete pour savoir si l'utilsateur existe déjà 
				$req = $bdd->prepare("SELECT * FROM user WHERE username = :username");
				$req ->execute([":username" => $username]);
				$checkUser = $req->fetch(PDO::FETCH_ASSOC);

				//Verifie si le nom d'utilisateur existe
				if ($checkUser !== false) {
					//Verifie si le mot de passe hasher en BD correspond a celui entrer dans le formulaire
					if(password_verify($password,$checkUser['password'])){
						$_SESSION['id'] = $checkUser['id'];
						$_SESSION['username'] = $checkUser['username'];
						$success = "Vous etes bien connecté !";
					}else{
						$error = "Mot de passe incorrect !";
					}

				}else{
					$error = "Le nom d'utilisateur existe pas";

				}

			}else{
				$error = "Veuillez entrer un nom d'utilisateur avec au moins 6 caracteres !";

			}

		}
	}	
}


?>


<!DOCTYPE html>
<html>
<head>
	<title>Inscription</title>

	<?php 
	// Lien de mes fichier CSS/ JS etc..
	include "app/link.php";
	?>
</head>
<body>

	<?php include "partials/header.php" ?>


	<div class="container mt-5">
    	<div class="row vertical-offset-100 flex-center">
	        <div class="col-md-4 col-md-offset-4">
	    		<div class="panel panel-default">
				  	<div class="panel-heading">
				    	<h3 class="panel-title center">Connexion</h3>
				 	</div>
				  	<div class="panel-body">
				    	<form action="" method="POST" accept-charset="UTF-8" role="form">
		                    <fieldset>
					    	  	<div class="form-group">
					    		    <input class="form-control" placeholder="Entrer votre nom d'utilisateur" name="username" type="text">
					    		</div>
					    		<div class="form-group">
					    			<input class="form-control" placeholder="Entrer votre mot de passe" name="password" type="password" value="">
					    		</div>
					    		<input class="btn btn-lg btn-success btn-block" name="submit" type="submit" value="Connexion">
					    	</fieldset>
				      	</form>
				    </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html