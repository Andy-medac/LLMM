xquery version "1.0" encoding "utf-8"; 
for $x at $i in doc("libros.xml")//libro
  where $x/precio > 50
  order by $x/titulo
  return 
    <libro id= '{$i}'>
      {$x/titulo}
      {$x/precio}
      <descuento>{round($x/precio*0.1)}</descuento>
    </libro>
