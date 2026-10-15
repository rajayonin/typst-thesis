#import "@preview/touying:0.8.0": *
#import themes.simple: *

#import "/utils.typ": *

= Texto


== Modos sintácticos

*_Markup_* (`[..]`): Modo por defecto, _WYSIWYG_.
#speaker-note([_What You See Is What You Get_, básicamente markdown])

```typ
Typst es _blazingly fast_! 🚀
```

#v(1em)
#pause

*Código* (`#`): Permite usar directamente el lenguaje de _scripting_.
```typ
#let foo(n) = { n + 1 }
```
```typ
Tengo #foo(66) Labubus.
```

#v(1em)
#pause

Los modos *son intercalables*:
```typ
#let cool-os = [*Linux!* 🐧]
```


== Formato de texto

#v(-.4em)

- Comentarios con `//` o `/* */`
#pause
- Caracteres especiales (`\`, `#`, `$`, `_`, `*`) se escapan con `\`
#pause
- #strong(text(black)[Negrita]): `*...*`
- _Cursiva_: `_..._`
- `Monoespaciado`: #raw("`...`") o #raw("```") (bloques de código)
- #underline[Subrayado]: `#underline[...]`
#pause
- `= Capítulo`, `== Sección`, `=== Subsección`
#pause
- Notas a pie de página: `#footnote[...]`
#pause
- #hi-link("https://motherfuckingwebsite.com/", [Links]): `#link("<url>")[...]`,
  ) o `https://link.com`
#pause
- Comillas "inteligentes" (dependientes del idioma): `"`, `'`
#pause
- Símbolos: `~` (_nsbp_), `---`/`--` (raya/semiraya), #link(
    "https://typst.app/docs/reference/symbols/sym",
  )[`#sym.`]


== Saltos
Los saltos de línea son automáticos. Un salto de línea en el archivo fuente no
rompe una línea.

#pause

- Para saltar una línea, se usa `\` (o #fn(
    "reference/layout",
    "linebreak",
    markup: true,
  ))
#pause
- Para saltar un párrafo se deja una línea en blanco\ (o #fn(
    "reference/layout",
    "parbreak",
    markup: true,
  ))
#pause
- Para saltar una página se usa #fn(
    "reference/layout",
    "pagebreak",
    markup: true,
  )

#pause

#two-col[
  ```typ
  Esta línea no
  la rompe ni Dios.
  ```
][
  #v(.7em)
  Esta línea no la rompe ni Dios.
]

#two-col[
  ```typ
  Esta la rompo yo\
  porque me da la gana.
  ```
][
  Esta la rompo yo\
  porque me da la gana.
]


== Listas
Enumeradas o no enumeradas.

#two-col[
  ```typ
  + Primero
  + Segundo
  ```
  ```typ
  - Uno
  - Otro
  ```
][
  #set list(indent: 0pt, spacing: auto)
  #set enum(indent: 0pt, spacing: auto)
  + Primero
  + Segundo
  - Uno
  - Otro
]

#pause

Y se pueden anidar:

#two-col[
  ```typ
  + Primero
    - Primero uno
    - Luego otro
  + Segundo
  ```
][
  #set list(indent: 0pt, spacing: auto)
  #set enum(indent: 0pt, spacing: auto)
  + Primero
    - Primero uno
    - Luego otro
  + Segundo
]


== Ecuaciones


Sintaxis _similar_ a #LaTeX#footnote[#hi-link(
  "https://qwinsi.github.io/tex2typst-webapp",
)[Conversor de fórmulas de LaTeX a Typst.]], pero con menos `\`.

#pause

- Echadle un vistazo al #hi-link(
    "https://sitandr.github.io/typst-examples-book/book/basics/math/",
  )[capítulo en Typst Examples Book] y a la #hi-link(
    "https://typst.app/docs/reference/math/",
  )[documentación].
#pause
- Hay herramientas interactivas como #hi-link("https://typerino.com/")[Typerino]
  para crearlas

#v(.5em)
#pause

Se usa un modo sintáctico de *mates* (`$..$`)

#pause

```typ
$ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $
```

$ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $

#pause

_Inline_ sin espacio (`$x=y$`), de bloque con espacio (`$ x=y $`)

---

#v(1fr)

TL;DR:
#pause
- $x^(2y)$ con #rawm("x^(2y)"), $x_(2y)$ con #rawm("x_(2y)")
#pause
- $"texto"$ con #rawm("\"texto\""), $x y$ con #rawm("x y"), $italic("caca")$ con
  #rawm("italic(\"caca\")")
#pause
- $(2a)/b$ con #rawm("(2a)/b"), $(a + b)$ con #rawm("(a + b)")
#pause
- $->$ con #rawm("->"), $<=$ con #rawm("<="), $!=$ con #rawm("!=")
#pause
- $forall$ con #rawm("forall") ó `∀`, $alpha$ con #rawm("alpha"), $Omega$ con
  #rawm("Omega"), $NN$ con #rawm("NN") (ver #mod("reference/symbols", "sym"))
#pause
- No hace falta llamar a #rawm("#sym.cosa"), directamente vale con #rawm("cosa")

#v(1fr)


== Referencias
Primero se crea una marca con `<id>`#footnote[Para las referencias
  bibliográficas, esto no es necesario, lo veremos ahora.].

#pause

Para referenciarla, basta con usar `@id`.
- Dependiendo de lo que hayas marcado (sección, figura, ecuación, etc.), se
  pondrá un texto automáticamente
- Puedes especificar el texto (suplemento) con `@id[...]`

#pause

#v(1fr)

#two-col[
  ```typ
  === Introducción <intro>
  En la @intro...
  ```
][
  #set heading(numbering: "1.")
  #counter(heading).update((6, 9))
  #show heading: set text(size: 25pt)

  === Introducción <intro>
  En la @intro...
]

#two-col[
  ```typ
  $ pi = e = 3 $ <real>
  La @real...
  ```
][
  // this gives a warning...
  // #set math.equation(numbering: "(1)")
  // $ pi = e = 3 $ <real>
  // #v(-.4em)
  // El @real[Teorema]...

  $ pi = e = 3 $
  #place(horizon + end)[#v(-1.5em) $(1.1)$]
  #v(-.4em)
  La Ecuación 1.1...
]

#v(1fr)

