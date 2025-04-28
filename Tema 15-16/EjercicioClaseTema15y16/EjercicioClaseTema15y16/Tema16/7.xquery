<concesionario>
{
  for $x in //coche
  return
    <coche>
      {$x/@*}
      {$x/* except $x/precio}
    </coche>
}
</concesionario>