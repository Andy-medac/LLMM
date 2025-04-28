for $x in //coche
return 
   <coche>
     {concat($x/marca," - ",
     $x/@matricula," - ",
     substring($x/combustible,1,3))}
   </coche>





