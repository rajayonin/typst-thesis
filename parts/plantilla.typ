#import "@preview/touying:0.8.0": *
#import themes.simple: *

#import "/utils.typ": *


= Plantilla TFG/TFM UC3M

#{
  set align(center)
  link("https://typst.app/universe/package/fancy-uc3m-thesis", image(
    "/img/template-universe.png",
    alt: "fancy-uc3m-thesis",
    width: 80%,
  ))
}

- Hecha por mí#footnote[Con ayuda de otros del GUL.], para vosotros
  #strike[jugadores]
- Siguiendo la #hi-link("https://uc3m.libguides.com/TFG/escribir")[guía de
    estilo de la biblioteca]#footnote[Más o menos. En cualquier caso, el que
    manda es vuestro tutor.]
- Bonita#footnote[Soy daltónico.] y fácil de usar


== Instalación

*CLI:*
```bash
typst init @preview/fancy-uc3m-thesis mi-tfg
```

#v(.7em)

#grid(
  columns: 2,
  column-gutter: 1em,
  {
    strong[VS Code:]
    set align(horizon)
    image("/img/template-vscode.png")
  },
  {
    strong[Webapp:]
    set align(horizon)
    image("/img/template-webapp.png")
  },
)


== Configuración

#v(1fr)

*General:*

```typ
#show: conf.with(
  degree: "Grado en...",
  title: "Análisis de...",
  // short-title: "",
  author: "Pepito Pérez",
  advisors: ("Alex",), // cuidao con la coma
  location: "Leganés, Madrid",
  thesis-type: "TFG", // o "TFM"
  date: datetime(year: 2067, month: 4, day: 20),
```

#v(2fr)

---

#v(1fr)

*Estilo:*

```typ
#show: conf.with(
  // ...
  language: "es", // o "en"
  format: "ieee", // o "apa"
  style: "fancy", // o "clean" o "strict"
  license: true,
  double-sided: true,
  flyleaf: true,
  bibliography-content: bibliography(
    "references.bib",
    style: "ieee" // o "apa", o...
  ),
```

#v(1fr)

---

#v(1fr)

*Cosas extra:*
```typ
#show: conf.with(
  // ...
  epigraph: (quote: [...], author: "Yo", source: "?"),
  abstract: (body: [...], keywords: ("", "")),
  english-abstract: (/* */),
  acknowledgements: [Mi churri.],
  outlines: (
    figures: true, tables: true, listings: false,
    /* custom: ([...], [...],) */
  ),
  // appendixes: [],
  // abbreviations: (TFG: "Trabajo de Fin de Grado"),
)
```

#v(1fr)

---

#focus-slide[
  Para más información, consultad\ #link(
    "https://github.com/guluc3m/uc3m-thesis-typst/blob/main/docs/manual.pdf",
    underline[el manual],
  ).
]
