/* VARIABLES DEL CARRITO */
var total = 0;
carrito = [];
precios = [];
productos = [];
let pagina;


function Tarjeta(){
    let tarjetaId = document.getElementById("inputNumero").value.replace(/\D/g,'');
    document.getElementById("inputNumero").value = tarjetaId
    let tarjetaIdFinal;

	if (tarjetaId.length == 16){
		let counter = 0; 
		tarjetaIdFinal = tarjetaId[0];
		for (let i = 1; i < tarjetaId.length; i++){
			counter++
			if (counter == 4){
				counter = 0;
				tarjetaIdFinal += "-" + tarjetaId[i];
			}else{
				tarjetaIdFinal += tarjetaId[i];
			}
		}
	}

	if(tarjetaId.length == 0 || tarjetaIdFinal == undefined){
		tarjetaIdFinal = "####-####-####-####";
	}

	document.getElementById('numerosTarjeta').innerHTML = tarjetaIdFinal;
	
	let tarjetaCad = document.getElementById("input").value;
	document.getElementById('tarjetaExpiraccion').innerHTML = "Fecha cad: " + tarjetaCad;
	
	let tarjetaTit = document.getElementById("inputNombre").value.replace(/\d+/g, '');
	document.getElementById("inputNombre").value = tarjetaTit;
	document.getElementById('nombreTitular').innerHTML = tarjetaTit.toUpperCase();
}

function finalizar(){
    let btn = document.getElementById('btnSubmint');
    btn.setAct

	ticket_id = Math.random();
	pagina = window.open("about:blank",'popup',"width=400,height=800");
	ticketText = "" +
	"<title>Fruterias Pérez</title>" +
	"<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH' crossorigin='anonymous'>" +
	"<div class='row' id='logoContainer'>" + 
	"<img class='w-25 img-thumbnail' src='../img/logos/LogoSinLetras.png'>" +
	"<h1 class='col'>Fruterias Perez</h1>"+
	"</div>" +
	"" 
	pagina.document.write(ticketText)
	pagina.document.write();
	pagina.document.write('Tiene el numero de orden: '+ ticket_id.toString().replace('.',''));
	restoreCart();
    pagina.document.write("<a href='https://www.youtube.com/embed/eh_xSyPsEVI?start=67'><p>Ver tu pedido</p></a");
}

/* --------------------------------------------------------- */
/*                    EXTRACION DE DATOS                     */
/* --------------------------------------------------------- */

counter = -1;

function fetchFrutas() {
    // Realizando la petición fetch para obtener los datos del archivo frutas.json
    fetch('../json/frutas.json')
        .then(response => {
            // Verifica si la respuesta es exitosa
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            // Convierte la respuesta a JSON
            return response.json();
        })
        .then(data => {
            // Iterando sobre cada fruta en el JSON y extrayendo su información
            data.frutas.forEach(fruta => {
                counter = counter + 1;
                let nombre = fruta.nombre;
                productos.push(nombre);
                let precio = fruta.precio;
                let imagen = fruta.imagen;
                precios.push(precio);
            });
        })
        .catch(error => console.error('Error fetching frutas.json:', error));
}
  
   // Llamando a las funciones para que se ejecuten cuando se cargue la página
   fetchFrutas();

   function fetchVerduras() {
    // Realizando la petición fetch para obtener los datos del archivo verduras.json
    fetch('../json/verduras.json')
        .then(response => {
            // Verifica si la respuesta es exitosa
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            // Convierte la respuesta a JSON
            return response.json();
        })
        .then(data => {
            // Iterando sobre cada verdura en el JSON y extrayendo su información
            data.verduras.forEach(verdura => {
                counter = counter + 1;
                let nombre = verdura.nombre;
                productos.push(nombre);
                let precio = verdura.precio;
                precios.push(precio);
                let imagen = verdura.imagen;
                // Creando y agregando un div por cada verdura a la página
            });
        })
        .catch(error => console.error('Error fetching verduras.json:', error));
}

// Llamando a la función para que se ejecute cuando se cargue la página
fetchVerduras();

function fetchZumos() {
    // Realizando la petición fetch para obtener los datos del archivo zumos.json
    fetch('../json/zumos.json')
        .then(response => {
            // Verifica si la respuesta es exitosa
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            // Convierte la respuesta a JSON
            return response.json();
        })
        .then(data => {
            // Iterando sobre cada zumo en el JSON y extrayendo su información
            data.zumos.forEach(zumo => {
                counter = counter + 1;
                let nombre = zumo.nombre;
                productos.push(nombre);
                let precio = zumo.precio;
                precios.push(precio);
                let imagen = zumo.imagen;
            });
        })
        .catch(error => console.error('Error fetching zumos.json:', error));
}
fetchZumos();

function count(){
    carrito.fill(0,0,counter);
}
count();

function restoreCart(){
    if(sessionStorage.getItem("prodList") != null){
        let ssProdList = sessionStorage.getItem("prodList").split("#")

		pagina.document.write("<ul>");
        console.log("Exsiste una lista de compra.");

        for (let i = 0; i < ssProdList.length; i++){
            console.log(ssProdList[i])
            let temp = ssProdList[i].split("!");
            let idProd = temp[0];
            let cantProd = temp[1];

            for (let i = 0; i < cantProd; i++){
                addToTicket(idProd);
                addToCart(idProd);
            }
        }
		pagina.document.write("</ul>");
        pagina.document.write("Total: " + total);
        sessionStorage.removeItem("prodList");
    }
}

function addToTicket(id){
	pagina.document.write("<li>" + productos[id] + " " + precios[id] + "€" + "</li>");
}

function addToCart(id){
    if (carrito[id] == null){
        carrito[id] = 1;
    }else{
        carrito[id] = carrito[id] + 1;
    }
    calc()
}

function calc(){
	total = 0
    for (let i = 0; i < carrito.length; i++){
        if (carrito[i] != null && carrito[i] != NaN && carrito[i] != 0){
            cantidad = 0;
            if(carrito[i] != null && carrito[i] != NaN && carrito[i] != 0){
                cantidad = carrito[i];
            }
            total += cantidad * precios[i];
        }
    }
}