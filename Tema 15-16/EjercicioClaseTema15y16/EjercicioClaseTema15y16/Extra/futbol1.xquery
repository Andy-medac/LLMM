<html>
    <head>
        <title>Liga de Fútbol</title>
        <style>
            body&#123;
                font-family:Verdana;
            margin-top:80px;&#125; 
            table&#123;
                     width:450px;
                     margin:15px;
                     border-collapse: collapse;
                     box-shadow:10px 10px 10px gray;&#125;                
            td&#123;
                     border:solid 1px black;
                     text-align:right;
                     padding:5px;&#125;                   
             th&#123;                
                     border:solid 1px black;
                     background-color:#138293;
                     color:white;
                     text-align:left;&#125;                   
             tr&#123;
                     height:40px;&#125;               
             tr:nth-child(odd)&#123;
                     background-color:#EBF5FF;&#125;                        
             img&#123;
                     width:40px;
                     height:40px;
                     vertical-align:middle;&#125;              
             .marcado&#123;
                     background-color:black;
                     color:white;&#125;             
             .normal&#123;
                     background-color:#DFB596;
                     color:black;&#125;              
              #jugador&#123;
         width:800px;height:586px;
         position:absolute;
         margin-top:-40px;
         margin-left:300px;
         z-index:0;&#125; 
        </style>
    </head>
    <body>
    <img id="jugador" src="jugador1.png"></img>
       <table class="tg">
            <thead>
                <tr>
                    <th colspan="9" 
                    style="text-align:center;font-size:1.15rem">
                    <img src="logo.png"/><span style="font-weight:bold;"> 
                    Temporada: {doc("futbol1.xml")//temporada} 
                    - Jornada: {string(doc("futbol1.xml")//jornada/@id)}
                    </span></th>
                </tr>
            </thead>
      <tbody>
        { for $x at $i in  doc("futbol1.xml")//evento
        return
            <tr>
            <td style="text-align:center">{$i}</td>
            <td style="border-right:none;border-left:none;">
            <img src="{$x/escudoLocal}"/></td>
            <td style="text-align:left;border-right:none;border-left:none;">
            {$x/equipolocal/text()}</td>
            <td style="border-right:none;border-left:none;">-</td>
            <td style="border-right:none;border-left:none;">
            <img src="{$x/escudoVisitante}"/></td>
            <td style="text-align:left;border-left:none;border-right:none;">
            {$x/equipovisitante/text()}</td>
            {if ($x/resultadolocal>$x/resultadovisitante)then
                (<td class="marcado">1</td>,
                <td class="normal">x</td>,
                <td class="normal">2</td>
            )
            else(
                if ($x/resultadolocal=$x/resultadovisitante)then
                    (<td  class="normal">1</td>,
                    <td class="marcado">x</td>,
                    <td  class="normal">2</td>)
                    else
                        ( <td  class="normal">1</td>,
                        <td  class="normal">x</td>,
                        <td class="marcado">2</td>)
                )
            }
            </tr>
        }  
       </tbody>
       </table>
    </body>
</html>