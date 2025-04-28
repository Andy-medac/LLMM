xquery version "1.0" encoding "utf-8"; 

(: //coche/marca :)

(: <consulta>El coche con matrícula 6732KPC
{//coche[@matricula="6732KPC"]/marca/text()}
</consulta> :)

(: for $x at $i in //coche
  return <coche>{$i}.-{$x/marca/text()}</coche> :)
  
(: for $x in (10 to 12)
  return <numero>{$x}</numero> :)
  
(: for $x in (10,12)
  return <numero>{$x}</numero> :) 
  
(: for $x in (5), $y in (1,2,3)
  return <tabla>{$x}*{$y}={$x*$y}</tabla> :)

(: for $x in (5)
  for $y in (1,2,3)
  return <tabla>{$x}*{$y}={$x*$y}</tabla> :)
  
(: let $x:=(1,3,5)
  return <impares>{$x}</impares> :)
  
(: for $x in (1,3,5)
  return <impares>{$x}</impares> :)
  
(: for $x in //coche
  where $x/combustible="Gasolina"
    return $x/@matricula :)
    
(: for $x in //coche
  order by $x/precio descending
    return ($x/@matricula,$x/precio) :)
    