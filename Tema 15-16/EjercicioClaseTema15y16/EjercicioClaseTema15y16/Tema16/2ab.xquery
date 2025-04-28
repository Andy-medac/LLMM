xquery version "1.0" encoding "utf-8"; 

(: for $x in //coche
return
  if($x/combustible="Diesel") then
    $x/@matricula
  else
    $x/marca :)

(: declare variable $importe:=24000;
for $x in //coche
    where $x/precio > $importe
      return $x :)
 