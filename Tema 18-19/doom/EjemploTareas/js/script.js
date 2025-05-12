var boton = document.getElementById('btn');
boton.addEventListener('click', function () {//genero un evento desde el script

    var input = document.getElementById('entrada').value; //obtengo el valor que se introduce en el input
    if (input) { //si se introduce algo
        var tarea = document.createElement('div');//creo un elemento div
        var tareas = document.getElementsByClassName('tasks')[0]; // obtengo el div de clase tasks

        tareas.appendChild(tarea); //indico que el nuevo elemento div es hijo de tasks
        var parrafo = document.createElement('p');//creo un parrafo
        tarea.appendChild(parrafo); //indico que parrafo es hijo del nuevo div
        tarea.className = 'task'; // y que tarea es de clase task para que se aplique el css
        var equis = document.createElement('span'); //creo un elemto span
        tarea.appendChild(equis); //que será hijo de tarea
        equis.className = 'close'; //y será de clase close para que se aplique el css
        parrafo.innerHTML = input; //el valor del párrafo será lo que introduzca en el input
        equis.innerHTML = 'X'; //y el valor de equis es X

        document.getElementById('entrada').value = ''; //una vez de haga un input se borra lo introducido
        document.getElementById('entrada').style.backgroundColor = 'white';

        equis.addEventListener('click', function () { // creamos un evento al pulsar la X

            borrar(tarea); //se ejecutará la funcion borrar y le pasaremos el elemento tarea

        });

    } else {
        alert('Introduce una tarea'); 
        document.getElementById('entrada').style.backgroundColor = 'red';
    }

});

function borrar(tarea) { //la funcion borrar recibe una tarea
    var tareaRealizada = document.getElementById('tareas-realizadas'); //obtenemos el div de las tareas realizadas
    tarea.remove(); //eliminamos la tarea de pendientes
    tareaRealizada.appendChild(tarea); // y la introducimos como hijo de tareaRaalizada
}