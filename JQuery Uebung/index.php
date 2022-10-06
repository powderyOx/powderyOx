<?php
$server = "localhost";
$username = "root";
$password = "";

$db = new PDO("mysql:host=$server;dbname=Lib4You_30092022", $username, $password);

$query = $db->prepare("SELECT * FROM books;");
$query->execute();
$ar = $query->fetchAll();
?>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <title>Prüfung</title>
</head>
<body class="container">
<h1>Verfügbare Bücher</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Titel</th>
        <th scope="col">Jahr</th>
        <th scope="col">Auflage</th>
        <th scope="col">Likes</th>
    </tr>
    </thead>
    <tbody>
    <?php
    foreach ($ar as $item){
    ?>
    <tr>
        <td><a href="?id=<?php echo $item[0]?>"><?php echo $item['title'];?></a></td>
        <td><?php echo $item['year'];?></td>
        <td><?php echo $item['edition'];?></td>
        <td><i value="<?php echo $item[0]?>" class="bi bi-heart heart" style="cursor: pointer;"></i> <span class="<?php echo $item[0]?>"><?php echo $item['likes'];?></span></td>
    </tr>
    <?php
    }
    ?>
    </tbody>
</table>
<?php
if(isset($_GET['id']) && !empty($_GET['id'])){
    $id = $_GET['id'];
    $query2 = $db->prepare("SELECT * FROM books where isbn=:id;");
    $query2->execute([":id" => $id]);
    $value = $query2->fetch();
?>
<div class="card">
    <div class="card-header">
        Buch
    </div>
    <div class="card-body">
        <h5 class="card-title"><?php echo $value['title']?></h5>
        <p class="card-text"><?php echo $value['description']?></p>
    </div>
</div>
<?php } ?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function (){
        $(".heart").click(function (){
            let value = $(this).attr('value');
            let likes = parseInt($('.' + value).html()) + 1;
            $('.' + value).html(likes)
            console.log(value);
            $.ajax({
                type: "POST",
                url: "like.php",
                data: {'id': value},
                success: function(msg){
                    console.log(msg)
                }
            });
        });
    });
</script>
</body>
</html>
