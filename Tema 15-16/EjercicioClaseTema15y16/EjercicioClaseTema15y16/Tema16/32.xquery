<concesionario>
{
for $x in //coche
  return element coche{
      attribute matricula {$x/@matricula},
      $x/marca,
      $x/combustible,
      $x/precio,
      element precio_con_iva
      {attribute tipo {"16%"},
      round($x/precio*1.16)}
   }   
}     
</concesionario>

