declare function local:variacion($tipo as xs:string,
$precio as xs:decimal) as xs:decimal
{   
      if ($tipo="Tapa blanda") then
        let $pre:= round($precio*1.10)
        return $pre 
      else
        let $pre:= round($precio*0.90)
        return $pre
};

<libreria>
      <numerolibros>{count(//libro)}
      </numerolibros>
      <precio_total>{sum(//libro/precio)}€</precio_total>
      {for $x in //libro
         return
            (<libro>{$x/titulo}
            <precio>{local:variacion($x/tipo,$x/precio)}€</precio>
            </libro>)
      }
</libreria>
      
       
       
       
       

 