<trabajadores>
    {
        for $x in doc("departamentos.xml")//departamentos/departamento
          for $y in doc("trabajadores.xml")//trabajador[departamento=$x/@id]
        return            
              <trabajador>
                {$y/nombre}
                <departamento>{$x/nombre/text()}</departamento>
              </trabajador>
    }
</trabajadores>


       






