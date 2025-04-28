xquery version "1.0";

(: Insert -> Insertar un nuevo cliente:)
(: insert node 
  <cliente>
      <id>4</id>
      <nombre>Antonio</nombre>
      <apellidos>Torres</apellidos>
      <email>Antonio.Torres@example.com</email>
      <edad>32</edad>
      <total_gastado>240.32</total_gastado>
      <antiguedad>4</antiguedad>
  </cliente>
as last into /clientes :)  

(: Replace -> Cambio del primer cliente:)
(: replace node //cliente[last()]/apellidos 
with <apellidos>Pacheco</apellidos> :)

(: Rename -> Cambiar precio por precio_sin_iva :)

(: for $x in //cliente
  return rename node $x/edad as "ultima_edad" :)

(: for $x in //cliente
  return rename node $x/ultima_edad as "edad" :)

(: Delete -> Borrar el cliente creado antes :)
(: delete node //cliente[last()] :)

