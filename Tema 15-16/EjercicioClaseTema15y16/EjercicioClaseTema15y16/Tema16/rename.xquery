(: Cambiar precio por precio_sin_iva :)
for $x in //coche
return rename node $x/precio 
as "precio_sin_iva"

