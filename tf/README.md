# Trabajo 2 - Lenguajes de programacion
---

- Enzo Lizama Paredes - u201618965

### Instrucciones para ejecutar la solucion web.

- Ejecutar el siguiente comando, en este caso usaremos el puerto 3030 para desplega nuestra web.

`swipl server.pl --port=3030 --pidfile=http.pid `

- Ahora podemos entrar a `http://localhost:3030/` y ver la solucion corriendo satisfactoriamente.

- Si deseamos acabar el proceso correremos el siguiente comando ` kill $(cat http.pid)`, de esta forma volvimos a liberar el puerto 3030.


### Instrucciones para ejecutar la solucion en consola.

- Ejecutar `swipl console.pl`
- Responder a las preguntas con `y.` y `n.`