<html>
    <head>
        <title>Liga de Fútbol</title>
        <style>
           body&#123;
                font-family:Verdana;     
            &#125; 
            table&#123;
                     background-color:#CFD8DC;
                     margin:15px;
                     border-collapse: collapse;
                  &#125;
            td&#123;
                     border:solid 1px black;
                     text-align:right;
                     padding:5px;
                  &#125; 
             th&#123;                
                     background-color:#1DC6DF;
                  &#125;
             tr:nth-child(odd) &#123;
                     background-color:white;
                  &#125;     
             img&#123;
                     width:50px;
                     height:50px;
             &#125;
        </style>
    </head>
    <body>
        <h1>LIGA DE FÚTBOL 2019-2020</h1>
        En la liga hay { doc("futbol.xml")/count(//team) } equipos de fútbol.
        Los tres primeros clasificados son:
        <table>
        <th>
            Escudo
        </th>
        <th>
            Equipo
        </th>
        <th>
            Puntos
        </th>
        <th>
            Goles a favor
        </th>
        <th>
            Goles en contra
        </th>
            { for $x in doc("futbol.xml")//team[position()=(1,2,3)]
              return 
                <tr>
                  <td><img src="{$x/escudo/text()}"/></td>
                  <td>{$x/name/text()}</td>
                  <td>{$x/points/text()}</td>
                  <td>{$x/goals_scored/text()}</td>
                  <td>{$x/goals_conceded/text()}</td>
                </tr>
            }
        </table>
        Equipos que han ganado en la última jornada:
        <ul>
        { for $x in doc("futbol.xml")//evento
          return 
             if($x/resultadolocal > $x/resultadovisitante) then
                (<li>{$x/equipolocal}</li>)
             else
                 (<li>{$x/equipovisitante}</li>)    
         }
         </ul>
         Equipos que jugaron antes de las 19:00 ordenado por equipo local:
         <ul>
         { for $x in doc("futbol.xml")//evento
           where $x/fecha<"19/07/2020 19:00"
           order by $x/equipolocal
           return
           <li>
                {$x/equipolocal} - {$x/equipovisitante}
           </li>
         }
         </ul>
         Equipo que más goles ha marcado:
         <ul><li>{ doc("futbol.xml")//team[goals_scored=max(//team/goals_scored)]/name}</li></ul>
         
         Equipos que descienden:
        <table>
        <th>
            Escudo
        </th>
        <th>
            Equipo
        </th>
        <th>
            Puntos
        </th>
        <th>
            Goles a favor
        </th>
        <th>
            Goles en contra
        </th>
            { for $x in doc("futbol.xml")//team[position()=(18,19,20)]
              return
                  <tr>
                  {if ( doc("futbol.xml")//evento[equipolocal=$x/name]) then   
                      <td><img src="{ doc("futbol.xml")//evento[equipolocal=$x/name]/escudoLocal}"/></td>
                      else 
                          <td><img src="{ doc("futbol.xml")//evento[equipovisitante=$x/name]/escudoVisitante}"/></td>}
                  <td>{$x/name/text()}</td>
                  <td>{$x/points/text()}</td>
                  <td>{$x/goals_scored/text()}</td>
                  <td>{$x/goals_conceded/text()}</td></tr>     
            }
        </table>
        Resultados:
        <table>
        <th colspan="5" align="left">Jornada{ doc("futbol.xml")//string(jornada/@id)}</th>
        {
          for $x in doc("futbol.xml")//evento
          return
              <tr>
                <td style="border-right:none">
                  <img src="{$x/escudoLocal}"/>
                 </td><td style="border-left:none"><b>{$x/equipolocal/text()}</b></td>
                <td><b>{$x/resultadolocal/text()} - {$x/resultadovisitante/text()}</b></td>
                <td style="border-right:none">
                  <img src="{$x/escudoVisitante}"/>
                 </td><td style="border-left:none"><b>{$x/equipovisitante/text()}</b></td>
              </tr>
        }      
        </table>
    </body>
</html>