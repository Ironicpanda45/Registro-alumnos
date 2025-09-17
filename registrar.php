<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro / Inscripción</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <form class="formulario" action="index.php" method="POST">
        <h1>Registrar inscripción</h1>
        <label for="alumno">Selecciona alumno:</label>
        <select id="codigo" name="alumno" required>
            <option value="">Seleccione un alumno</option>
            <?php
                while ($alumno = $alumnos_result->fetch_assoc()) {
                    echo "<option value='{$alumno['Codigo']}'>{$alumno['Nombre']} (Código: {$alumno['Codigo']})</option>";
                }
            ?>
        </select><br><br>
        <input type="submit" name="registrar_inscripcion" value="Registrar">
    </form>

    <?php
    $conn->close();
    ?>
</body>
</html>