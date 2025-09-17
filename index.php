<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro / Inscripción</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['agregar_alumno'])) {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "UACJ";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("La conexion fallo: " . $conn->connect_error);
    }

    $codigo = $_POST['codigo'];
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $edad = $_POST['edad'];
    $telefono = $_POST['telefono'];

    $sql = "INSERT INTO alumnos (Codigo, Nombre, Apellidos, Edad, Telefono)
            VALUES ('$codigo','$nombre','$apellidos','$edad','$telefono')";

    if ($conn->query($sql) === TRUE) {
        echo "<p style='color:green;'>El alumno fue agregado</p>";
    } else {
        echo "<p style='color:red;'>Error: " . $sql . "<br>" . $conn->error . "</p>";
    }

    $conn->close();
}
?>
    <!-- FORMULARIO AGREGAR ALUMNO -->
    <form class="formulario" action="" method="POST">
        <h1>Agregar alumno</h1>
        <label for="codigo">Codigo:</label>
        <input type="text" id="codigo" name="codigo" required><br><br>

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br><br>

        <label for="apellidos">Apellidos:</label>
        <input type="text" id="apellidos" name="apellidos" required><br><br>

        <label for="edad">Edad:</label>
        <input type="number" id="edad" name="edad" required><br><br>

        <label for="telefono">Telefono:</label>
        <input type="tel" id="telefono" name="telefono" required><br><br>

        <input type="submit" name="agregar_alumno" value="Agregar alumno">
    </form>

<?php
// NUEVA CONEXIÓN
$conn = new mysqli("localhost", "root", "", "UACJ");

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Consultar alumnos y carreras
$alumnos_query = "SELECT Codigo, Nombre, Apellidos FROM alumnos";
$alumnos_result = $conn->query($alumnos_query);

$carreras_query = "SELECT Codigo, Nombre FROM carreras";
$carreras_result = $conn->query($carreras_query);

// Registrar inscripción
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['registrar_inscripcion'])) {
    $codigoAlumno = isset($_POST['alumno']) ? $_POST['alumno'] : null;
    $codigoCarrera = isset($_POST['carrera']) ? $_POST['carrera'] : null;
    $fecha = date('Y-m-d');

    if ($codigoAlumno && $codigoCarrera) {
        $sql = "INSERT INTO inscripciones (Fecha, CodigoAlumno, CodigoCarrera)
                VALUES ('$fecha', '$codigoAlumno', '$codigoCarrera')";

        if ($conn->query($sql) === TRUE) {
            echo "<p style='color:green;'>Inscripción registrada correctamente</p>";
        } else {
            echo "<p style='color:red;'>Error: " . $sql . "<br>" . $conn->error . "</p>";
        }
    } else {
        echo "<p style='color:red;'>Debes seleccionar un alumno y una carrera.</p>";
    }
}
?>

    <!-- FORMULARIO INSCRIPCIÓN -->
    <form class="formulario" action="index.php" method="POST">
        <h1>Registrar Inscripción</h1>

        <label for="alumno">Selecciona Alumno:</label><br>
        <select name="alumno" id="alumno" required>
            <option value="">Seleccione un alumno</option>
            <?php
            if ($alumnos_result->num_rows > 0) {
                while ($alumno = $alumnos_result->fetch_assoc()) {
                    echo "<option value='{$alumno['Codigo']}'>{$alumno['Nombre']} {$alumno['Apellidos']} (Código: {$alumno['Codigo']})</option>";
                }
            }
            ?>
        </select><br><br>

        <label for="carrera">Selecciona Carrera:</label><br>
        <select name="carrera" id="carrera" required>
            <option value="">Seleccione una carrera</option>
            <?php
            if ($carreras_result->num_rows > 0) {
                while ($carrera = $carreras_result->fetch_assoc()) {
                    echo "<option value='{$carrera['Codigo']}'>{$carrera['Nombre']} (Código: {$carrera['Codigo']})</option>";
                }
            }
            ?>
        </select><br><br>

        <input type="submit" name="registrar_inscripcion" value="Registrar Inscripción">
    </form>

<?php
$conn->close();
?>
</body>
</html>
