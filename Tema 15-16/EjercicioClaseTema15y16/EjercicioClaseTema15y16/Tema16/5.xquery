for $x in //libro
let $total:=sum($x/precio)
return
	if ($x/tipo="Tapa dura")
	   then
		   <libro tipo="tapa dura">
			 <titulo>{substring($x/titulo,1,15)}.....</titulo>
			 <descuento>{round($x/precio * 0.1)}</descuento>
		   </libro>
	else
		$x
       
       
       
       
       

