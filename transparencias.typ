// LTEX: enabled=false

#import "@preview/touying:0.8.0": *
#import "@preview/grayness:0.8.0": image-transparency
#import themes.simple: *

#import "@preview/tiaoma:0.3.0": qrcode

#import "utils.typ": *


/* CONFIG */

#set text(lang: "es")

#let title = [Haz tu TFG/TFM con Typst]
#let org = [GUL UC3M]

// pass the "PRESENTATION" variable w/ --input to enable presentation mode
#let presentation-mode = (
  sys.inputs.at("PRESENTATION", default: none) != none
)
#let pympress-mode = (
  sys.inputs.at("PYMPRESS", default: none) != none
)

#show: simple-theme.with(
  aspect-ratio: "4-3",
  footer: [#org --- #title],
  primary: primary-color,
  config-common(
    handout: not (presentation-mode or pympress-mode),
    show-notes-on-second-screen: if pympress-mode { right } else { none },
  ),
)

#set figure(caption: [])


#set list(indent: 1em, spacing: 1em)
#set enum(indent: 1em, spacing: 1em)

// GFM-like monospace text

#show raw.where(block: false): set raw(lang: "typ")
#show raw.where(block: false): it => context {
  set text(size: if dark-mode.get() { .9em } else { 1em })
  let spacing = if dark-mode.get() { .6em } else { .5em }

  h(spacing, weak: true)
  box(
    fill: if dark-mode.get() { aqua.darken(75%) } else { color.rgb("#f5f5f5") },
    outset: 0.3em,
    radius: 0.3em,
    it,
  )
  h(spacing, weak: true)
}

#show raw.where(block: true): it => context {
  set text(size: if dark-mode.get() { .9em } else { 1em })
  let spacing = if dark-mode.get() { .4em } else { .3em }

  v(spacing)

  box(
    fill: if dark-mode.get() { aqua.darken(75%) } else { color.rgb("#f5f5f5") },
    outset: (y: .7em),
    inset: (x: .5em),
    radius: 0.3em,
    width: 100%,
    it,
  )

  v(spacing)
}

// custom title slide

// this doesn't work right with `show-notes-on-second-screen`
// #let my-title-slide = title-slide.with(
//   config: config-page(background: image-transparency(
//     read("img/gul-logo.svg", encoding: none),
//     alpha: 30%,
//     format: "svg",
//   )),
// )

#let my-title-slide(body, config: (:)) = title-slide(
  place(
    top + center,
    image-transparency(
      read("img/gul-logo.svg", encoding: none),
      alpha: 30%,
      format: "svg",
    ),
  )
    + body,
  config: config,
)


/* TITLEPAGE */

#my-title-slide[
  #text(title, size: 1.95em, weight: "bold")
  #v(2em)

  Luis Daniel Casais\
  #hi-link("https://github.com/rajayonin")[\@rajayonin]

  #v(1em)

  #link("https://gul.uc3m.es", org)

  69 Tetambre 2026
]


/* OUTLINE */
// #components.adaptive-columns(outline(indent: 1em, depth: 1))


// #clear-header()

/* QR */

#let transparencias = touying-set-config(config-page(
  header: none,
  footer: none,
))[
  == Transparencias
  #{
    let url = "https://github.com/rajayonin/typst-thesis/blob/main/transparencias.pdf"
    v(0.7fr)
    set align(center)

    qrcode(options: (scale: 5.0), url)
    hi-link(url, text([github.com/rajayonin/typst-thesis], size: 32pt))
    v(1fr)
  }
]

#transparencias


/* CONTENTS */

#include "parts/intro.typ"
#include "parts/plantilla.typ"
#include "parts/text.typ"
#include "parts/bib.typ"
#include "parts/figures.typ"
#include "parts/extra.typ"


/* MOAR INFO */


== Más información
#v(1fr)

- #hi-link("https://typst.app/docs")[Documentación de Typst]
- #hi-link("https://sitandr.github.io/typst-examples-book/book/")[Typst Examples
    Book]
- #hi-link("https://forum.typst.app/")[Typst Forums]
- #hi-link("https://discord.com/invite/typst-1054443721975922748")[Typst Discord
    server]
- #hi-link("https://typst.app/docs/guides/guide-for-latex-users/")[Guía para
    usuarios de #LaTeX]
- #hi-link("https://youtu.be/Apaqtno3ACE")[L. D. Casais -- Memorias de p\*\*\*\*
    madre: Introducción a Typst] (2025)

#v(1fr)


#transparencias

#my-title-slide[
  = ¡Ánimo!
]
