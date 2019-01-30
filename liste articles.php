<?php
session_start();


$id = $_SESSION['id'];


include "app/function.php";
include "app/bdd.php";

$req = $bdd->prepare("SELECT article.id as article_id, article.title, user.username FROM article INNER JOIN user ON article.author = user.id WHERE author = :id ORDER BY article.id DESC" );
$req ->execute(['id' => $id]);
$articles = $req->fetchAll(PDO::FETCH_ASSOC);


?>


<!DOCTYPE html>
<html>
<head>
	<title>Mes articles</title>

	<?php 
	// Lien de mes fichier CSS/ JS etc..
	include "app/link.php";
	?>
</head>
<body>

	<?php include "partials/header.php" ?>


	<div class="container mt-5">
	<?php 
	if (count($articles) > 0) {
	    ?>
	    <h2>Mes Articles</h2>
	  	<p>Vous pouvez retrouvez ici tous vos articles, les voir en détails et egalement les modifier ou les supprimer</p>            
	  	<table class="table table-dark table-striped">
		    <thead>
		      <tr>
		        <th>Titre</th>
		        <th>Author</th>
		        <th>Action</th>
		      </tr>
		    </thead>
		    <tbody>
	     
	 
			<?php foreach ($articles as $article): ?>
				
			<tr>
		        <td><?=$article['title'] ?></td>
		        <td><?=$article['username'] ?></td>
		        <td>
		        	<a href="detailsArticle.php?id=<?=$article['article_id'] ?>" target="_blank">Details</a>
		        	<a href="editArticle.php?id=<?=$article['article_id'] ?>">Editer</a>
		        	<a href="deleteArticle.php?id=<?=$article['article_id'] ?>">Supprimer</a>
		        </td>
	      	</tr>

			<?php endforeach; ?>

	    	</tbody>
	  	</table>
	    <?php 
	}else{
		echo "Vous avez pas encore ecrit d'article !";
	}
	?> 
	  
	</div>
</body>
</html>