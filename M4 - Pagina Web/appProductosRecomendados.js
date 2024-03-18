function fetchRecomendados() {
    // Realizando la petición fetch para obtener los datos del archivo recomendados.json
    fetch('../json/recomendados.json')
        .then(response => {
            // Verifica si la respuesta es exitosa
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            // Convierte la respuesta a JSON
            return response.json();
        })
        .then(data => {
            // Iterando sobre cada producto recomendado en el JSON y extrayendo su información
            data.recomendados.forEach(recomendado => {
                counter = counter + 1;
                let nombre = recomendado.nombre;
                productos.push(nombre);
                let precio = recomendado.precio;
                precios.push(precio);
                let imagen = recomendado.imagen;
                // Creando y agregando un div por cada producto recomendado a la página
                let recomendadosDiv = document.getElementById('infoRecomendados');
                let recomendadoDiv = document.createElement('div');
                recomendadoDiv.setAttribute("class", "col-lg-4 col-md-6 card mx-auto recomendados");
                //recomendadoDiv.innerHTML = `<h3 class="nombre">${nombre}</h3><img class="img" src="${imagen}" alt="Imagen del producto ${nombre}"><p>$${precio}</p> <button class="original-button4" data-product-id="1" onclick="location.href='productos.html'">Ver Productos</button>`;
                recomendadoDiv.innerHTML = `
                    <div class="">
                        <h3 class="card-title">${nombre}</h3>
                        <img class="card-img-top" src="${imagen}" alt="Imagen del producto ${nombre}">
                        <div class="card-body">
                            <p class="card-text">$${precio}</p>
                            <button class="btn original-button4" data-product-id="1" onclick="location.href='productos.html'">Ver Productos</button>
                        </div>
                    </div>
                    `;

                recomendadosDiv.appendChild(recomendadoDiv);
            });
        })
        .catch(error => console.error('Error fetching recomendados.json:', error));
}
fetchRecomendados();