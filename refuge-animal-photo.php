<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


function open(
    $hostname = "127.0.0.1", 
    $database = "refuge",
    $username = "refuge",
    $password = "refuge",
    $charset = "utf8mb4"
) {
    $dsn = sprintf("mysql:host=%s;dbname=%s;charset=%s", $hostname, $database, $charset);
    $options = [
        \PDO::ATTR_ERRMODE            => \PDO::ERRMODE_EXCEPTION,
        \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_BOTH,
    ];
    $pdo = new PDO($dsn, $username, $password, $options);
    return $pdo;
}


function outputImage($id)
{
    $pdo = open();
    # query without arguments :
    $stmt = $pdo->query(sprintf("SELECT * FROM refuge_animals WHERE id=%d", (int) $id));
    if ($row = $stmt->fetch()) {
        $photo = $row["photo"];
        $photoContentType = $row["photoContentType"];
        $photoContentLength = $row["photoContentLength"];
        
        if (! $photo) {
            echo "no photo";
        }
        elseif (! $photoContentType) {
            echo "no photo content type";
        }
        else {
            //echo "$photoContentType";             exit();
            header("Content-Type: $photoContentType");
            echo $photo;
            exit();
        }
        print_r($row);
    } else {
        echo "not found $id";
    }
}

function listImages() {
    $pdo = open();
    # query without arguments :
    $stmt = $pdo->query("SELECT id, name, photoContentType, photoContentLength FROM refuge_animals WHERE photo IS NOT NULL ORDER BY id");
    while ($row = $stmt->fetch()) {
        $id = $row["id"];
        $name = $row["name"];
        $photoContentType = $row["photoContentType"];
        $photoContentLength = $row["photoContentLength"];
        ?>
        <a href="?id=<?php echo htmlentities($id); ?>"><?php echo htmlentities($name); ?></a>
        (<?php echo htmlentities($photoContentType); ?>, <?php echo htmlentities($photoContentLength); ?>)
        <br/>
        <?php
    }
}

$id = isset($_GET["id"]) ? trim(strip_tags($_GET["id"])) : null;

if ($id) {
    outputImage($id);
} else {
    listImages();
}


    



