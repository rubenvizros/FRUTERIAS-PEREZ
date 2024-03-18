/* VARIABLES DEL CARRITO */
var total = 0;
carrito = [];
precios = [];
productos = [];


/* ---------------------------------------------- */
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
                // Creando y agregando un div por cada fruta a la página
                let frutasDiv = document.getElementById('infoFrutas');
                let frutaDiv = document.createElement('div');
                frutaDiv.setAttribute("class", "col-lg-4 col-md-6 card frutas");
                //frutaDiv.innerHTML = `<h3 class="nombre">${nombre}</h3><img class="img" src="${imagen}" alt="Imagen de la fruta ${nombre}"><p>$${precio}</p> <button class="original-button" data-product-id="1" onclick="addToCart(${counter})">Agregar al carrito</button>`;
                frutaDiv.innerHTML = `
                <div class="">
                    <h3 class="card-title">${nombre}</h3>
                    <div class="mx-auto" id="imgRect">
                        <img class="img-thumbnail" src="${imagen}" alt="Imagen de la fruta ${nombre}">
                    </div>
                    <p class="card-text">$${precio}</p>
                    <button class="btn original-button mt-auto" onclick="addToCart(${counter})">Agregar al carrito</button>

                </div>
            `;

                frutasDiv.appendChild(frutaDiv);
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
                let verdurasDiv = document.getElementById('infoVerduras');
                let verduraDiv = document.createElement('div');
                verduraDiv.setAttribute("class", "col-lg-4 col-md-6 card verduras");
                //verduraDiv.innerHTML = `<h3 class="nombre">${nombre}</h3><img class="img" src="${imagen}" alt="Imagen de la verdura ${nombre}"><p>$${precio}</p> <button class="original-button1" data-product-id="1" onclick="addToCart(${counter})">Agregar al carrito</button>`;
                verduraDiv.innerHTML = `
                    <div class="">
                        <h3 class="card-title">${nombre}</h3>
                        <div class="mx-auto" id="imgRect">
                            <img class="img-thumbnail" src="${imagen}" alt="Imagen de la verdura ${nombre}">
                        </div>
                        <p class="card-text">$${precio}</p>
                        <button class="btn original-button1" data-product-id="1" onclick="addToCart(${counter})">Agregar al carrito</button>

                    </div>
                `;

                verdurasDiv.appendChild(verduraDiv);
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
                // Creando y agregando un div por cada zumo a la página
                let zumosDiv = document.getElementById('infoZumos');
                let zumoDiv = document.createElement('div');
                zumoDiv.setAttribute("class", "col-lg-4 col-md-6 card zumos");
                //zumoDiv.innerHTML = `<h3 class="nombre">${nombre}</h3><img class="img" src="${imagen}" alt="Imagen del zumo ${nombre}"><p>$${precio}</p> <button class="original-button2" data-product-id="1" onclick="addToCart(${counter})">Agregar al carrito</button>`;
                zumoDiv.innerHTML = `
                <div class="">
                    <h3 class="card-title" id="zumoTitCard">${nombre}</h3>
                    <div class="mx-auto" id="imgRect">
                        <img class="img-thumbnail" src="${imagen}" alt="Imagen del zumo ${nombre}">
                    </div>
                    <p class="card-text">$${precio}</p>
                    <button class="btn original-button2 mx-auto" data-product-id="1" onclick="addToCart(${counter})">Agregar al carrito</button>
                </div>
            `;

                zumosDiv.appendChild(zumoDiv);
            });
        })
        .catch(error => console.error('Error fetching zumos.json:', error));
}
fetchZumos();

function count(){
    carrito.fill(0,0,counter);
}
count();

/* -------------------------------------------------------------------------------- */
/*                          JS CARRITO                                              */
/* -------------------------------------------------------------------------------- */

let listProdsCookie;

function saveCart(){
    listProdsCookie = "";
    for (let i = 0; i < carrito.length; i++){
        if(carrito[i] != null && carrito[i] != 0){
            listProdsCookie += i + "!" + carrito[i] + "#";       //ID!CANTIDAD#
        }
    }
    sessionStorage.removeItem("prodList");
    sessionStorage.setItem("prodList", listProdsCookie);
}

function restoreCart(){
    if(sessionStorage.getItem("prodList") != null){
        let ssProdList = sessionStorage.getItem("prodList").split("#")

        console.log("Exsiste una lista de compra anterior.");
        for (let i = 0; i < ssProdList.length; i++){
            console.log(ssProdList[i])
            let temp = ssProdList[i].split("!");
            let idProd = temp[0];
            let cantProd = temp[1];

            for (let i = 0; i < cantProd; i++){
                addToCart(idProd);
            }
        }
    }
}

 // Devolver los datos del carrito anterior
 window.addEventListener('load', function() {
    restoreCart();
});

function verCarrito(){
    var contLista = document.getElementById("contenedorLista");

    if (document.getElementById("contenedorLista").style.display == "none"){
        contLista.style.display = "block";
    }else{
        contLista.style.display = "none";
    }
}

function addToCart(id){
    if (carrito[id] == null){
        carrito[id] = 1;
    }else{
        carrito[id] = carrito[id] + 1;
    }
    calc()
}

function remFromCart(id){
    carrito[id] = carrito[id] - 1;
    calc()
}

function emptyCart(){
    carrito.fill(0,0,carrito.length);
    calc();
    update();
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
    document.getElementById("total").innerHTML = "Importe total: " + total + "€";
    update()
}

function update(){
    carroLleno = document.getElementById("carroLleno");
    carroVacio = document.getElementById("carroVacio");
    payButton = document.getElementById("payCart");
    document.getElementById("contenedorLista").style.display = "block";
    saveCart();

    carrFull = false;

    for (let i = 0; i < carrito.length; i++){
        if (carrito[i] != 0 && carrito[i] != null) {
            carrFull = true;
        }
    }

    if (carrFull){
        carroVacio.style.display = "none";
        carroLleno.style.display = "block";
        payButton.disabled = false;
    }else{
        carroVacio.style.display = "block";
        carroLleno.style.display = "none";
        payButton.disabled = true;
    }

    while (list.firstChild) {
        list.removeChild(list.firstChild);
    }

    for (let i = 0; i < carrito.length; i++){
        if (carrito[i] != null && carrito[i] != NaN && carrito[i] != 0){         
            //document.getElementById("list").innerHTML += "<div class='itemList'><li id='wipe'>" + productos[i] + " x" + carrito[i] + "</li>" + "<button class='button1' type='button' onclick='remFromCart("+ i +")'><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash' viewBox='0 0 16 16'><path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z'/><path d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z'/></svg></button></div>";
            document.getElementById("list").innerHTML += `
    <div class="itemList">
        <li id="wipe" class="list-group-item">${productos[i]} x${carrito[i]}
        <button class="btn btn-danger button1" type="button" onclick="remFromCart(${i})">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>
            <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>
        </svg>
        </button>
        </li>

    </div>
`;


        }
    }
}

/* ---------------------------------------------------------------- */
/*                          EASTER EGG                              */
/* ---------------------------------------------------------------- */
document.addEventListener('DOMContentLoaded', function() {
    // Obtén el elemento del logo y del audio
    var footer = document.getElementById('audText');
    var audio = document.getElementById('audio');

    // Agrega un evento de clic al logo
    footer.addEventListener('click', function() {
        // Reproduce o pausa el audio al hacer clic en el logo
        if (audio.paused) {
            audio.play();
        } else {
            audio.pause();
            audio.currentTime = 0; // Reinicia el audio si está pausado
        }
    });
});


let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');

prevBtn.addEventListener('click', () => {   //ESTA LINEA GENERA UN ERROR REVISAR
    goToSlide(currentSlide - 1);
});

nextBtn.addEventListener('click', () => {
    goToSlide(currentSlide + 1);
});

function goToSlide(n) {
    slides[currentSlide].classList.remove('active');
    currentSlide = (n + slides.length) % slides.length;
    slides[currentSlide].classList.add('active');
}

/* ---------------------------------------------------------------- */
/*                          NINJA FRUIT                             */
/* ---------------------------------------------------------------- */

document.getElementById("reproducirBtn").addEventListener("click", function() {
    var Video = document.getElementById(" miVideo");
    Video.classList.toggle("invisible");
});

/* ---------------------------------------------------------------- */
/*                          SLIDE INDEX                             */
/* ---------------------------------------------------------------- */

document.addEventListener("DOMContentLoaded", function() {
    let currentSlide = 1;
  
    function showSlide(n) {
      const slides = document.getElementsByClassName("slide");
      if (n > slides.length) {
        currentSlide = 1;
      }
      if (n < 1) {
        currentSlide = slides.length;
      }
  
      for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
  
      slides[currentSlide - 1].style.display = "block";
    }
  
    function nextSlide() {
      showSlide(currentSlide + 1);
    }
  
    function prevSlide() {
      showSlide(currentSlide - 1);
    }
  
    // Show the first slide initially
    showSlide(currentSlide);
  });