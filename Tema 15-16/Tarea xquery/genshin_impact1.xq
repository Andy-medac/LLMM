<html>
  <head>
    <title>Personajes de Genshin Impact</title>
    <style>
      body &#123;
        font-family: Segoe UI, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
      &#125;
      #fondo&#123;
        position: fixed;
        top: 0;
        left: 0;
        z-index: -1;
        width: 100%;
        height: 100%;
        opacity: 0.5;&#125;
      h1 &#123;
        text-align: center;
        color: #333;
      &#125;
      table &#123;
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: white;
        z-index: 5;
      &#125;
      th, td &#123;
        border: 1px solid #d1a17f;
        padding: 10px;
        text-align: center;
      &#125;
      th &#123;
        background-color: #F4BE97;
      &#125;
    </style>
  </head>
  <body>
    <img id="fondo" src="liyue.jpg" alt="Liyue"/>
    <h1>Personajes de Genshin Impact</h1>
    <table>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Elemento</th>
        <th>Arma</th>
        <th>Set de Artefactos</th>
      </tr>
      {
        for $p at $i in //personajes/personaje
        return
          <tr>
            <td>{$p/id/text()}</td>
            <td>{$p/nombre/text()}</td>
            <td>{$p/elemento/text()}</td>
            <td>{$p/arma/text()}</td>
            <td>{$p/set_de_artefactos/text()}</td>
          </tr>
      }
    </table>
  </body>
</html>


