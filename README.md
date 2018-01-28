#Superpoderes iOS

###**Ejercicio 1: Ocultar el *scrollview* y mostrar un *activity indicator* mientras se cargan los contenidos de la pantalla de Featured.**

En la clase *FeaturedViewController* se implementa:

```
if loading {
    scrollView.isHidden = true
    loadingView.startAnimating()
} else {
    scrollView.isHidden = false
    loadingView.stopAnimating()
}

```

que es llamado desde el *FeaturedPresenter* en el momento que empieza la carga (```didLoad()```).

<br>

###**Ejercicio 2: Hacer presenter para person detail.**

Se crea el *Endpoint* para persona usando el parámetro ```append\_to\_response``` para realizar la búsqueda con ```tagged_images``` y recoger la primera imagen con ratio 16:9 para usarla como *backdrop*.
<br><br>
Se crea la estructura *PersonDetail* que implementa *Decodable* y así poder parsear la respuesta directamente.
<br><br>
Se crea el *PersonRepository* desde donde se realiza la petición al servidor.
<br><br>
Se crea el *PersonPresenter*. Cuando la vista llama al *presenter* realiza la petición a servidor y mediante programación reactiva recoge los eventos para crear las distintas secciones del detalle de persona.

<br>

###**Ejercicio 3: Navegación de cast a detalle de persona.**

En *SearchResultsPresenter* se contempla el nuevo caso para personas. Es en *MoviePresenter* que se implementa el método ```didSelect(item: PosterStripItem)``` que es el encargado de que se produzca la navegación al detalle de persona.

<br>

###**Ejercicio 4: Navegación a *Show*.**

Se ha implementado el acceso a *Show* desde la búsqueda y desde la pantalla de *Feature*.