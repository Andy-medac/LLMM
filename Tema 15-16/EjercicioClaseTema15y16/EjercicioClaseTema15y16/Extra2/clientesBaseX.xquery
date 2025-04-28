xquery version "3.1";

(: Funcion para diferenciar clientes antiguos y nuevos :)
declare function local:cliente_habitual($antiguedad as xs:integer) as xs:string {
    if ($antiguedad >= 5) then
        "Habitual"
    else
        "Nuevo"
};

<html>
<head>
    <style>
        body &#123;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f7fc;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        &#125;

        .container &#123;
            width: 90%;
            max-width: 900px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        &#125;

        h2 &#123;
            color: #2c3e50;
            margin-bottom: 20px;
        &#125;

        table &#123;
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        &#125;

        th, td &#123;
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        &#125;

        th &#123;
            background-color: #34495e;
            color: white;
            font-weight: bold;
        &#125;

        tr:nth-child(even) &#123;
            background-color: #f8f9fa;
        &#125;

        tr:hover &#123;
            background-color: #e3f2fd;
        &#125;
    </style>
</head>
<body>
    <div class="container">
        <h2>Clientes</h2>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Email</th>
                <th>Edad</th>
                <th>Total Gastado</th>
                <th>Antigüedad</th>
                <th>Estado</th>
            </tr>
            { 
                for $cliente in //cliente
                return
                    <tr>
                        <td>{$cliente/nombre/text()}</td>
                        <td>{$cliente/apellidos/text()}</td>
                        <td>{$cliente/email/text()}</td>
                        <td>{$cliente/edad/text()}</td>
                        <td>{$cliente/total_gastado/text()}</td>
                        <td>{$cliente/antiguedad/text()}</td>
                        <td>{local:cliente_habitual(xs:integer($cliente/antiguedad))}</td> 
                    </tr>
          }
        </table>
   
        <h2>Clientes Ordenados por Antigüedad</h2>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Email</th>
                <th>Edad</th>
                <th>Total Gastado</th>
                <th>Antigüedad</th>
            </tr>
            { 
                for $cliente in //cliente
                order by $cliente/antiguedad descending
                return
                    <tr>
                        <td>{$cliente/nombre/text()}</td>
                        <td>{$cliente/apellidos/text()}</td>
                        <td>{$cliente/email/text()}</td>
                        <td>{$cliente/edad/text()}</td>
                        <td>{$cliente/total_gastado/text()}</td>
                        <td>{$cliente/antiguedad/text()}</td>
                    </tr>
            }
        </table>
        
        
        <h2>Cliente con Mayor Gasto</h2>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Email</th>
                <th>Edad</th>
                <th>Total Gastado</th>
                <th>Antigüedad</th>
            </tr>
            { 
                let $maxGasto := max(//cliente/total_gastado)
                for $cliente in //cliente
                where $cliente/total_gastado = $maxGasto
                return
                    <tr>
                        <td>{$cliente/nombre/text()}</td>
                        <td>{$cliente/apellidos/text()}</td>
                        <td>{$cliente/email/text()}</td>
                        <td>{$cliente/edad/text()}</td>
                        <td>{$cliente/total_gastado/text()}</td>
                        <td>{$cliente/antiguedad/text()}</td>
                    </tr>
            }
        </table>
        <br/>
        <h3>El total gastado es {sum(//cliente/total_gastado)} € por los clientes</h3>
        <br/>
    </div>
</body>
</html>