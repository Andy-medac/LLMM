<coches>
{
  for $x in doc("concesionario.xml")/concesionario/coche
  where $x/combustible='Diesel'
  order by $x/marca
  return ($x/marca)
}
</coches>