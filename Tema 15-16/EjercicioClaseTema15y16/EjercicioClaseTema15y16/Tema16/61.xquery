declare function local:incremento($precio as xs:integer, $porcentaje as xs:integer) as xs:integer
{
  let $incremento := $precio*(100+$porcentaje) div 100
  return $incremento
};

for $x in //coche
return 
  <coche matricula="{$x/@matricula}">
    <precio_incrementado>
      {local:incremento($x/precio,10)}
    </precio_incrementado>
  </coche>
