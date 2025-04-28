
(

(: 1. Insertar un nuevo personaje :)
insert node 
  <personaje>
    <id>5</id>
    <nombre>Raiden</nombre>
    <elemento>Electro</elemento>
    <arma>Lanza Celestial</arma>
    <set_de_artefactos>Emblema del Destino</set_de_artefactos>
  </personaje> 
as last into doc("genshin_impact.xml")//personajes,  

(: 2. Reemplazar el set de artefactos de Lumine :)

  replace node 
  doc("genshin_impact.xml")//personaje[nombre = "Lumine"]/set_de_artefactos 
with 
  <set_de_artefactos>Sombra Verde Esmeralda</set_de_artefactos>,

(: 3. Renombrar el nodo arma de Zhongli :)
for $x in doc("genshin_impact.xml")//personaje[nombre = "Zhongli"]
return rename node $x/arma as "arma_especial",


(: 4. Eliminar el último personaje :)
delete node doc("genshin_impact.xml")//personaje[last()]

)
