<concesionario>
{
for $x in //coche
  return
      (<coche matricula="{$x/@matricula}">
      {$x/marca}
      {$x/combustible}
      {$x/precio}
      <precio_con_iva tipo="16%">
      {round($x/precio*1.16)}
      </precio_con_iva></coche>)
}     
</concesionario>
         
         