#import "@preview/touying:0.8.0": *
#import themes.simple: *

#import "/utils.typ": *


= Extra

== _Scripting_

#[
  #let type(type) = fn("reference/foundations", type)
  #show raw.where(block: false): set raw(lang: "typc")

  - *Variables:* #rawc("let foo = \"bar\"")
    #pause
  - *Funciones:* #rawc("let f(a) = { return a }") / #rawc("(bar) => {..}").\
    Son *puras*.
    #pause
  - *Tipos:* #type("content"): `[..]`, #type("str"), #type("int"), #type(
      "float",
    ), `true`/`false`, #type("none"), #type("auto"), #type(
      "fraction",
    ): `1fr`, #type("lenght"): `1cm`
    #pause
  - *Estructuras:* #type("array"): `(1, "patata")`, #type("dictionary"):
    `(caca: "culo")`
    #pause
  - *Operaciones:* `+`, `-`, `*`, `/`; `==`, `!=`, `<`, `>`, `<=`, `>=`; `and`,
    `or`, `not`;`in`, `not in`; `=`, `+=`, `-=`, `*=`, `/=`, módulo #mod(
      "reference/foundations",
      "calc",
    )
    #pause
  - *Flujo:* `if`, `else if`, `else`;
    `while condition {..}`;`for value in arr {..}`,
    `for (key, value) in dict {..}`
]

---
#v(1fr)

*Ejemplo* -- generar tablas a partir de CSVs:
```typ
#table(
  columns: 2,
  table.header([*NIA*], [*Nota*]),
  ..for (NIA, nota) in csv("alumnos.csv") {
    ([#NIA], [#nota])
  }
)
```

#{
  set align(center)
  table(
    columns: 2,
    table.header([*NIA*], [*Nota*]),
    ..for (NIA, nota) in ((100429021, 10.0), (100429022, 0.2)) {
      ([#NIA], [#nota])
    },
  )
}


#v(1fr)


== Colocar cosas

#v(1fr)
Para colocar cosas:
- #fn("reference/layout", "v") (espaciado #[*v*]ertical) y #fn(
    "reference/layout",
    "h",
  ) (espaciado #[*h*]orizontal)
- #fn("reference/layout", "box")
- #fn("reference/layout", "grid")
- #fn("reference/layout", "align") (#rawc("set align(center)"))
- #fn("reference/layout", "place")

#pause
#{
  v(.6em)
  set align(center)
  set text(1.4em)
  strong[¡Leed la documentación!]
}

#v(1fr)


== Estilado
#rawc("show") _reemplaza elementos_, mientras que #rawc("set") _sobreescribe
parámetros por defecto_.

#pause

Cosillas que os pueden servir:
#pause
- "No quiero las referencias con colorinchis"
  ```typ
  #show ref: set text(black)
  ```
  #pause
- "Me da pereza estar escribiendo `placement: auto` to'l rato"
  ```typ
  #set figure(placement: auto)
  ```
  #pause
- "No quiero tener subsubsubtítulo 6.7.2.3"
  #[
    #set text(size: 22pt)
    ```typ
    #show heading.where(level: 4): set heading(numbering: none)
    ```
  ]


== Módulos
Puedes separar tus proyectos en archivos `.typ`.

// import / include
- `#include "parts/file.typ"` _inserta_ el contenido del archivo
#pause
- `#import "utils.typ"` _importa_ el módulo `utils`
  #pause
  - `#import "utils.typ" as foo`: renombra el módulo
  - `#import "utils.typ": foo, bar`: importa variables/funciones específicas
  - `#import "utils.typ": *`: lo importa tó

  #pause

// Rutas de archivos
Importante tener en cuenta los _path_:
- Son relativos *al archivo* donde se usan
  #pause
- `/` (_root_) es el *directorio del archivo que compilamos*



== Paquetes

#let pkg(name) = link(
  "https://typst.app/universe/package/fancy-uc3m-thesis/" + name,
  raw(name),
)

Disponibles en #hi-link("https://typst.app/universe/")[Typst Universe] (800+).

#speaker-note([Volver a mencionar CeTZ/fletcher.])

- Bloques de código: #pkg("codly")
- Gráficas: #pkg("lilaq") (ejemplo en plantilla)
- Algoritmos: #pkg("lovelace")
- Teoremas bonicos: #pkg("theorion")
#speaker-note([Estas transparencias están echas en Typst con Touying.])
- Glosario: #pkg("glosarium")
- Gantt: #pkg("timeley") (ejemplo en plantilla)
// - Ingeniería de verdad: #pkg("physica"), #pkg("zero"), #pkg(
//     "quick-maths",
//   )
- UML: #pkg("sourcecraft")
- Requisitos de _software_: #pkg("larman")
- Presentaciones: #pkg("touying"), #pkg("gentle-clues"), #pkg(
    "pinit",
  )
