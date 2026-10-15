#import "@preview/touying:0.8.0": *
#import themes.simple: *

#import "/utils.typ": *

= Tablas y figuras

== Figuras

Soporta #link("https://www.w3.org/TR/REC-png-961001")[PNG], #link(
  "https://jpeg.org/jpeg/",
)[JPG], #link("https://www.w3.org/Graphics/GIF/spec-gif87.txt")[GIF], #link(
  "https://www.w3.org/TR/SVG2/",
)[SVG]#footnote[Excepto #plain-raw("foreignObject"), ver #hi-link(
    "https://github.com/typst/typst/issues/1421",
  )[typst/typst\#1421].], #link(
  "https://pdfa.org/sponsored-standards/",
)[PDF]#footnote[A partir de la versión 0.14.], y _raw bytes_.

#pause

```typ
#figure(
  image("img0.png", width: 80%),
  caption: [...]
) <fig:img0> // label
```

// TODO: show

#pause

- Colocación: parámetro `placement`
  - #rawc("none"): exactamente aquí (_default_)
  - #rawc("auto"): arriba o abajo de la página
// #pause
- Para hacerlas _inline_, usa `#box` en lugar de `#figure`
// #pause
- Puedes escalarlas con #fn("reference/layout", "scale"), e.g. #rawc(
    "scale(50%, image(...))",
  )


#pagebreak()


=== Generación de diagramas
Se recomienda trabajar con SVGs.

- #hi-link("https://www.drawio.com")[draw.io]: La vieja confiable\
#pause
- #hi-link("https://excalidraw.com/")[Excalidraw]: Un rollito más _cool_
#pause
- #hi-link("https://plantuml.com/")[PlantUML]: Lenguaje declarativo para #link(
    "https://www.omg.org/uml/",
  )[UML]
#pause
- #hi-link("https://cetz-package.github.io/")[CeTZ]/#hi-link(
    "https://typst.app/universe/package/fletcher",
  )[fletcher] o derivados: Puro Typst (para _tryhards_)

#pause

#warning[Si los SVG dan problemas#footnote[Ver #hi-link(
      "https://www.drawio.com/doc/faq/svg-export-text-problems",
    )[draw.io FAQ].], exportar como PDF, importar en #hi-link(
    "https://inkscape.org/",
  )[Inkscape], y re-exportar a SVG.]


== Tablas

Echadle un vistazo a la #hi-link(
  "https://typst.app/docs/guides/table-guide/",
)[guía de tablas]#footnote[
  También podéis usar un #hi-link(
    "https://www.latex-tables.com/?format=typst",
  )[generador de tablas].
].

#pause

#[
  #set text(22pt)

  ```typ
  #figure(
    table(
      columns: 2, // o `(1fr, 1fr)`
      align: center, // o `auto` o `(left, right)`
      [Fila 0, Columna 0], [Fila 0, Columna 1],
      [Fila 1, Columna 0], [Fila 1, Columna 1],
    ),
    caption: [Mi tabla]
  ) <tab:example>
  ```
]

#{
  show table: block.with(stroke: (y: 0.7pt))
  set table(column-gutter: .2em, stroke: none)
  set table.hline(stroke: 0.4pt)

  figure(
    table(
      columns: 2,
      // o `(1fr, 1fr)`
      align: center,
      // o `auto` o `(left, right)`
      [Fila 0, Columna 0], [Fila 0, Columna 1],
      [Fila 1, Columna 0], [Fila 1, Columna 1],
    ),
    caption: [Mi tabla],
  )
}


== Subfiguras

#v(1fr)

```typ
#import "@preview/subpar:0.2.2"
```
```typ
#subpar.grid(
  label: <fig0>,
  caption: [Mis cuadrados],
  columns: 2,
  [ #figure(caption: [Rojo], ..)  <subfig0>],
  [ #figure(caption: [Azul], ..)  <subfig1>],
)
```

#import "@preview/subpar:0.2.2"
#subpar.grid(
  label: <fig0>,
  caption: [Mis cuadrados],
  columns: 2,
  [
    #figure(caption: [Rojo], square(
      width: 1cm,
      height: 1cm,
      fill: rgb("#808000"),
    )) <subfig0>],
  [
    #figure(caption: [Azul], square(
      width: 1cm,
      height: 1cm,
      fill: rgb("#8000FF"),
    )) <subfig1>],
)

#v(1fr)
