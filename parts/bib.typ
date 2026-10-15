#import "@preview/touying:0.8.0": *
#import themes.simple: *

#import "/utils.typ": *

= Bibliografía


#v(1fr)

Las bibliografías se gestionan con #hi-link(
  "https://github.com/plk/biblatex",
)[Bib#LaTeX] o #hi-link(
  "https://github.com/typst/hayagriva/blob/main/docs/file-format.md",
)[Hayagriva].
#pause
- Entradas en un archivo `.bib`/`.yml`, con un ID y atributos
#pause
- Es recomendable añadir el #hi-link(
    "https://www.doi.org/the-identifier/what-is-a-doi/",
  )[DOI] siempre que se pueda
#pause
- Se referencian con `@entry-id` o, con suplemento, `@entry-id[suplemento]`

#pause
#v(.5em)

Hay diferentes tipos de bibliografía, dependiendo del recurso al que hagas
referencia.

Tenéis más información sobre Bib#TeX/Bib#LaTeX en la #hi-link(
  "https://bibtex.eu/types/",
)[documentación de CiteDrive].

#v(1fr)

---

== Tipos de bibliografía

Aquí dejo algunos ejemplos.

#v(1fr)

*Libro:*
```bibtex
@book{lamport1986latex,
  title     = {{LATEX}: A Document Preparation System},
  author    = {Lamport, Leslie},
  year      = {1986},
  publisher = {Addison-Wesley}
  edition   = {},
  series    = {},
  url       = {},
}
```

#v(1fr)

---

#v(1fr)

*Artículo:*
```bibtex
@article{Gardner1970fantastic,
  title   = {{The fantastic combinations of John
             Conway's new solitaire game ``life''}},
  author  = {Gardner, Martin},
  journal = {Scientific American},
  volume  = {223},
  pages   = {120--123},
  year    = {1970},
  number  = {},
  doi     = {10.1038/scientificamerican1070-120},
}
```

#v(1fr)

---

#v(1fr)

*Página web:*
```bibtex
@online{mal,
  title   = {{Make-A-Lisp}},
  author  = {Martin, Joel},
  year    = {2015},
  url     = {https://github.com/kanaka/mal},
  urldate = {2023-10-05}
}
```

#v(1fr)

---

#v(1fr)

*ISO:*
```bibtex
@techreport{ISOcpp23,
  title       = {{Programming Languages -- C++}},
  number      = {ISO/IEC PRF 14882},
  type        = {International Standard Draft},
  year        = {2023},
  institution = {International Organization for
                 Standardization}
}
```

#v(1fr)

---

#v(1fr)

*IEEE:*
```bibtex
@techreport{IEEE830-1984,
  title       = {{IEEE Guide for Software
                 Requirements Specifications}},
  type        = {IEEE Std.},
  number      = {830-1984},
  year        = {1984},
  institution = {Institute of Electrical and
                 Electronics Engineers},
  doi         = {10.1109/IEEESTD.1984.119205}
}
```

#v(1fr)

---

#v(1fr)

*Conferencia:*
#[
  #set text(size: 22pt)
  ```bibtex
  @conference{creatorZenodo,
    title        = {{CREATOR: Simulador didáctico y genérico
                     para la programación en ensamblador}},
    author       = {Camarmas Alonso, Diego and García
                    Carballeira, Felix and Del Pozo Puñal,
                    Elías and Calderón Mateos, Alejandro},
    year         = 2021,
    publisher    = {Zenodo},
    booktitle    = {XXXI Jornadas de Paralelismo},
    organization = {Sociedad de Arquitectura y Tecnología
                    de Computadores},
    address      = {Málaga, Spain},
    month        = jul,
    doi          = {10.5281/zenodo.5130302}
  }
  ```
]

#v(1fr)

