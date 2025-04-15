// This template is based on `moderncv` (from the `rendercv` project).
// Ref: https://docs.rendercv.com/reference/themes/moderncv/

#import "@preview/fontawesome:0.5.0": fa-icon

// ==== ==== ==== ==== ==== ====
// Methods and properties
// ==== ==== ==== ==== ==== ====

// ---- ---- ---- ---- ---- ----
// Private methods and properties
// ---- ---- ---- ---- ---- ----

#let design-page-size = "a4"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Fontin"
#let design-section-titles-weight = "regular"
#let design-section-titles-line-thickness = 0.15cm
#let design-section-titles-font-size = 1.4em
#let design-section-titles-vertical-space-above = 0.1cm
#let design-section-titles-vertical-space-below = 0.1cm
#let design-section-titles-small-caps = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Fontin"
#let design-text-allow-justify = true
#let design-text-allow-hyphenate = auto
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 108pt
#let design-header-name-font-family = "Fontin"
#let design-header-name-font-size = 25pt
#let design-header-name-weight = "regular"
#let design-header-label-font-size = 12pt
#let design-header-label-style = "italic"
#let design-header-connections-font-family = "Fontin"
#let design-header-vertical-space-before-title = 0.9cm
#let design-header-vertical-space-between-title-and-connections = 0.3cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = left
#let design-highlights-bullet = "•"
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-terms-left-margin = 0cm
#let design-terms-separator = [: ]
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.4cm
#let design-entries-left-and-right-margin = 0cm
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-use-external-link-icon = true
#let design-links-underline = true
#let design-last-update-location = top + right

// Basic building block for document content
#let two-col(
  left-column-width: design-entries-date-and-location-width,
  right-column-width: 1fr,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = {
  block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
  )
}

// Only display month and year
// `day: 1` is just a workaround of ignoring input of "day"
#let display-date(
  date_string: "",
) = {
  let date_split = date_string.split("-")
  datetime(
    year: int(date_split.at(0)),
    month: int(date_split.at(1)),
    day: 1, 
  ).display("[month repr:short]. [year]")
}

// ---- ---- ---- ---- ---- ----
// Public methods and properties
// ---- ---- ---- ---- ---- ----

// Insert date information on the left column and `title` on the right column,
// followed by `entry_content` at the bottom.
// Required arguments: `title`, `start_date` and `entry_content`;
// Optional argument: `end_date`
// By default `end_date` is an empty string, thus only a single date is displayed;
// if only `start_date` is given but `end_date` is of none type,
// this function will treat the input date as an ongoing activity;
// if both `start_date` and `end_date` are defined, both of them are displayed
#let entry(
  title: [],
  start_date: "",
  end_date: "",
  entry_content: []
) = two-col(
    alignments: (design-text-date-and-location-column-alignment, auto),
    left-content: 
      if end_date == "" {
        display-date(date_string: start_date)
      } else if end_date == none {
        [#display-date(date_string: start_date) - ]
      } else {
        [#display-date(date_string: start_date) - #display-date(date_string: end_date)]
      },
    right-content: [
      #title \
      #entry_content
      #v(design-entries-vertical-space-between-entries)
    ]
)

// Similar to `entry`, but without date information and title
#let inline-entry(
  entry_content: [],
) = two-col(
  right-content: [
    #entry_content
    #v(design-entries-vertical-space-between-entries)
  ]
)

// ==== ==== ==== ==== ==== ====
// Main template configuration
// ==== ==== ==== ==== ==== ====
#let conf(
  person_name :"",
  person_label :"",
  profile_picture: "",
  residence: "",
  email: "",
  phone: "",
  website: "",
  social_network_list: (),
  text_lang: "en",
  doc,
) = {

  // Document metadata:
  set document(
    title: person_name + "'s CV", 
    author: person_name, 
  )

  // Page settings:
  set page(
    margin: (
      top: design-page-top-margin,
      bottom: design-page-bottom-margin,
      left: design-page-left-margin,
      right: design-page-right-margin,
    ),
    paper: design-page-size,
    footer: 
      if design-page-show-page-numbering {
        // Use a page counter as the document's footer
        let locale-catalog-page-numbering-style = context{
          str(person_name) + " - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + ""
        }

        text(
          fill: design-colors-last-updated-date-and-page-numbering,
          align(center, [_#locale-catalog-page-numbering-style _]),
          size: 0.9em,
        )
      } else {
        none
      },
    footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
  )

  // Text settings:
  set text(
    font: design-text-font-family,
    size: design-text-font-size,
    lang: text_lang,
    hyphenate: design-text-allow-hyphenate,
    fill: design-colors-text,
  )
  set par(
    spacing: 0pt,
    leading: design-text-leading,
    justify: design-text-allow-justify,
  )

  // Text list settings:
  set list(
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
  set terms(
    hanging-indent: design-terms-left-margin, 
    separator: design-terms-separator, 
  )

  // CV title settings:
  show heading.where(level: 1): it => [
    #set align(design-header-alignment)
    #set text(
      font: design-header-name-font-family,
      weight: design-header-name-weight,
      size: design-header-name-font-size,
      fill: design-colors-name,
    )
    #it.body
  ]

  // Display person's name and label as the document's title
  let display-title(
    name: "",
    label: "",
  ) = {

    // Vertical space before the CV title
    v(design-header-vertical-space-before-title)

    [= #name]
    text(
      font: design-header-name-font-family,
      style: design-header-label-style,
      size: design-header-label-font-size,
      fill: design-colors-name,
    )[#label]

    // Vertical space after the CV title
    v(design-header-vertical-space-between-title-and-connections)
  }

  // Section title settings:
  show heading.where(level: 2): it => [
    #set align(left)
    #set text(
      font: design-section-titles-font-family,
      size: design-section-titles-font-size,
      weight: design-section-titles-weight,
      fill: design-colors-section-titles,
    )

    // Vertical space above the section title
    #v(design-section-titles-vertical-space-above, weak: true)

    // Configuration of each section -- 
    // Left: a thin box for visual separation
    // Right: the text of this section 
    #block(
      breakable: false,
      width: 100%,
      [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(
              horizon, 
              box(
                width: 1fr, 
                height: design-section-titles-line-thickness, 
                fill: design-colors-section-titles
              )
            )
          ],
          right-content: 
            if design-section-titles-small-caps {
              smallcaps(it.body)
            } else {
              it.body
            }
        )
      ],
    )
    // Vertical space after the section title
    #v(design-section-titles-vertical-space-below)
  ]

  // Last updated date text:
  if design-page-show-last-updated-date {
    place(
      design-last-update-location,
      dx: 0cm,
      dy: -design-page-top-margin / 2,
      text(
        [
          _Rendered by #underline(link("https://typst.app/")[Typst]) on #datetime.today().display("[day] [month repr:short]. [year]")_
        ],
        fill: design-colors-last-updated-date-and-page-numbering,
        size: 0.9em,
      ),
    )
  }

  // Function for printing email, personal website and social network links
  let print-connections(connections-list) = context {
    set text(fill: design-colors-connections, font: design-header-connections-font-family)
    set par(leading: design-text-leading*1.7, justify: false)
    let list-of-connections = ()
    let separator = (
      h(design-header-horizontal-space-between-connections / 2, weak: true)
        + design-header-separator-between-connections
        + h(design-header-horizontal-space-between-connections / 2, weak: true)
    )
    let starting-index = 0
    while (starting-index < connections-list.len()) {
      let left-sum-right-margin
      if type(page.margin) == dictionary {
        left-sum-right-margin = page.margin.left + page.margin.right
      } else {
        left-sum-right-margin = page.margin * 4
      }

      let ending-index = starting-index + 1
      while (
        measure(connections-list.slice(starting-index, ending-index).join(separator)).width
          < page.width - left-sum-right-margin - design-header-photo-width * 1.1
      ) {
        ending-index = ending-index + 1
        if ending-index > connections-list.len() {
          break
        }
      }
      if ending-index > connections-list.len() {
        ending-index = connections-list.len()
      }
      list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
      starting-index = ending-index
    }
    align(list-of-connections.join(linebreak()), design-header-alignment)
    v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
  }

  // ---- ---- ---- ---- ---- ---- ----
  // Header
  // ---- ---- ---- ---- ---- ---- ----
  two-col(
    alignments: (center, left),

    // Display profile picture
    left-content: image(
      profile_picture, 
      width: design-header-photo-width
    ),

    // Display CV title and connections list
    right-content: [
    
      #display-title(
        name: person_name,
        label: person_label,
      )

      #print-connections(
        (
          [
            #fa-icon("location-dot", size: 0.9em)
            #h(0.05cm)
            #residence
          ],
          box(
            link("mailto:" + email)[
              #fa-icon("envelope", size: 0.9em)
              #h(0.05cm)
              #email
            ]
          ),
          box(
            link("tel:" + phone)[
              #fa-icon("phone", size: 0.9em)
              #h(0.05cm)
              #phone.replace("-", " ")
            ]
          ),
          box(
            link(website)[
              #fa-icon("link", size: 0.9em)
              #h(0.05cm)
              #website.replace("https://", "")
            ]
          ),
          ..for social_network in social_network_list {
            (
              box(
                link(social_network.url)[
                  #fa-icon(social_network.fa_icon, size: 0.9em)  
                  #h(0.05cm)
                  #social_network.display_text
                ]
              ),
            )
          }
        )
      )
    ],
  )

  // ---- ---- ---- ---- ---- ---- ----
  // Document body settings
  // ---- ---- ---- ---- ---- ---- ----

  // Show rules for links that affect the rest of the document
  show link: it => {

    set text(fill: design-colors-links)

    if design-links-underline {
      underline[#it]
    } else {
      it
    }

    if design-links-use-external-link-icon {
      // Append an icon to the end of the text
      h(design-text-font-size/4)
      box(
        fa-icon(
          "external-link", 
          size: 0.7em
        ),
        baseline: -10%,
      )
    }
  }

  // ---- ---- ---- ---- ---- ---- ----
  // Begin of the document body
  // ---- ---- ---- ---- ---- ---- ----
  doc
}
