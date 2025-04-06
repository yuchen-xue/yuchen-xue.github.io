
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Yuchen Xue (M. Sc.)"
#let locale-catalog-page-numbering-style = context { "Yuchen Xue (M. Sc.) - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Apr. 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Fontin"
#let design-section-titles-bold = false
#let design-section-titles-line-thickness = 0.15cm
#let design-section-titles-font-size = 1.4em
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Fontin"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 108pt
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Fontin"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "Fontin"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = left
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.4cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = true
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
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
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let two-col(
  left-column-width: design-entries-date-and-location-width,
  right-column-width: 1fr,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  // Vertical space before the name
  #v(1.5em)
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #two-col(
        alignments: (right, left),
        left-column-width: design-entries-date-and-location-width,
        right-column-width: 1fr,
        left-content: [
          #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
        ],
        right-content: [
          #section-title
        ]
      )

     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx = 0cm
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
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

#let two-col-entry(
  left-column-width: design-entries-date-and-location-width,
  right-column-width: 1fr,
  left-content: "",
  right-content: "",
  alignments: (design-text-date-and-location-column-alignment, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  two-col(
    left-column-width: left-column-width,
    right-column-width: right-column-width,
    alignments: alignments,
    left-content: left-content,
    right-content: [
      #block(
        [
          #right-content
        ],
        inset: (
          left: design-entries-left-and-right-margin,
          right: design-entries-left-and-right-margin,
        ),
        breakable: design-entries-allow-page-break-in-entries,
        width: 100%,
      )
    ],
  )
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

#two-col(
  left-column-width: design-header-photo-width * 1.3,
  right-column-width: 1fr,
  left-content: [
    #align(
      left + horizon,
      pad(x: 4pt, image("profile_picture.jpg", width: design-header-photo-width)),
    )
  ],
  column-gutter: 0cm,
  right-content: [
= Yuchen Xue \(M. Sc.\)

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Rostock, Germany],
  [#box(original-link("mailto:yuchen.xue@example.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)yuchen.xue\@example.com])],
  [#box(original-link("tel:+49-1234-5678")[#fa-icon("phone", size: 0.9em) #h(0.05cm)+49 1234 5678])],
  [#box(original-link("https://yuchen-xue.notion.site/Yuchen-Xue-M-Sc-d20b6d8537bf45b5aee1dd2a72ff6bd6")[#fa-icon("link", size: 0.9em) #h(0.05cm)yuchen-xue.notion.site\/Yuchen-Xue-M-Sc-d20b6d8537bf45b5aee1dd2a72ff6bd6])],
  [#box(original-link("https://linkedin.com/in/sean-yuchen-xue")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)sean-yuchen-xue])],
  [#box(original-link("https://github.com/yuchen-xue")[#fa-icon("github", size: 0.9em) #h(0.05cm)yuchen-xue])],
  [#box(original-link("https://researchgate.net/profile/Yuchen-Xue-6")[#fa-icon("researchgate", size: 0.9em) #h(0.05cm)Yuchen-Xue-6])],
)
#connections(connections-list)

  ],
)


== Experience


#two-col-entry(
  left-content: [
    May. 2023 – Apr. 2024
  ],
  right-content: [
    #strong[Technical assistant for a deep-learning-based defect detection solution], Fraunhofer IFF -- Magdeburg \(Germany\)
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [I developed a deep-learning-based zero-shot solution for industry-level defect detection on different types of machinery parts. This solution features the comparison of image samples based on image segmentation technologies. Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Solution for precise image segmentation of irregular machinery parts using computer vision algorithms;],[97.6\% precision on recognition tasks that was tested by a pre-defined dataset;],[Deployment using Docker Compose;],[Collaborated with my colleagues using a version control repository;],)
  ],
)



== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    Oct. 2021 – present
  ],
  right-content: [
    #strong[University of Rostock], M.Sc. in Computational Electrical Engineering -- Rostock \(Germany\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([#strong[Keynotes]: Computational methods, Image processing],)
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    Mar. 2021 – Aug. 2021
  ],
  right-content: [
    #strong[Rhein-Waal University of Applied Science], M.Sc. in Information Engineering and Computer Science -- Kleve \(Germany\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([#strong[Keynotes]: Data engineering, Simulation technologies],)
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    Feb. 2020 – Aug. 2020
  ],
  right-content: [
    #strong[University of Groningen], Exchange program in the Faculty of Science and Engineering -- Groningen \(the Netherlands\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([#strong[Keynotes]: Parallel Computing, Scalable Computing],)
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    Sep. 2017 – Jan. 2021
  ],
  right-content: [
    #strong[National Taiwan University of Science and Technology], M.Sc. in Electrical Engineering -- Taipei \(Taiwan\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Top technical university in Taiwan],[#strong[Keynotes]: Deep Learning, Image processing, Data engineering],)
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    Sep. 2013 – Jun. 2017
  ],
  right-content: [
    #strong[Thunhai University], B.Sc. in Electrical Engineering -- Taipei \(Taiwan\)
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([#strong[Keynotes]: Verilog HDL, Semiconductor, Microelectronics],)
  ],
)



== Keynote Technical Skills


#one-col-entry(
  content: [#strong[Programming Languages:] Proficient with Python; good understanding with Java, C++ and R]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Machine Learning and Data Science Packages:] Good understanding with Pytorch, Tensorflow, OpenCV, Matplotlib, MySQL Server, Numpy, Pandas, Skikit Learn, Quarto]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Programming Frameworks and Tools:] Good understanding with Docker Compose, Spring Boot, Git & Github, Linux, Bash, Raspberry Pi; Basic understanding with Arduino, Android Dev, VPN technologies WSL2 & VM and Verilog]
)


== Language Skills


#one-col-entry(
  content: [#strong[English: Fluent \(C1\):] IETLS band 7 \(CERF C1-Level\). Date of the certification was issued: 26.03.2019]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[German: Fluent \(C1\):] CERF C1 Level. Issued by Sprachzentrum der Universtität Rostock on 19.02.2025]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Chinese: Native speaker \(C2\):] Native Mandarin speaker]
)


== Technical Projects -- Deep Learning & Computer Vision


#two-col-entry(
  left-content: [
    Oct. 2019 – Jan. 2021
  ],
  right-content: [
    #strong[Master thesis: Survey on facial recognition models using deep learning technologies] -- #strong[Taipei \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [This is an academic survey of different deep-learning based face recognition models, aiming at bringing insights to future researches in the field of deep learning. Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Literal survey of numerous face recognition solutions],[Summary of the fundamental differences of deep learning models],[Use of experimental method for comparing the performance of different models],[#strong[Keynotes]: Face recognition, deep learning, PyTorch, Tensorflow],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Jul. 2018 – Sep. 2019
  ],
  right-content: [
    #strong[Publication and Academic Speech with the topic \"Improved Part-aligned Deep Features Learning for Person Re-Identification\"] -- #strong[Taipei \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [This is a solution to the challenge of person re-identification \(Re-ID\) problem. The Re-ID problem is about recognizing and matching pedestrian with different appearances across different cameras. Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Development of a solution to Re-ID problem using computer vision and deep learning methods],[Contributed to the relative academic paper as the 2nd co-author. The paper accepted by the 16th IEEE International Conference on Advanced Video and Signal-based Surveillance \(AVSS\)],[Delivered an academic speech on this conference],[Use of experimental method for comparing the performance of different models],[#strong[Keynotes]: Cross-camera recognition, Python, deep learning, TensorFlow],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Feb. 2018 – Apr. 2018
  ],
  right-content: [
    #strong[Real-time pedestrian and vehicle detection on surveillance cameras video stream] -- #strong[Taipei \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A real-time object detection solution for real-time video streams written in C++. Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Improvement of 20\% in precision compared to the base model],[Improvement on small, obscured, and overlapping objects],[I was in charge of data collection, sample labeling, and training a model],[Training of a reliable model with limited data using transfer learning technique],)
  ],
)



== Technical Projects -- Data Engineering


#two-col-entry(
  left-content: [
    Apr. 2018 – Jun. 2018
  ],
  right-content: [
    #strong[Energy consumption analysis on a real-life dataset using R language] -- #strong[Taipei \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [This is a project about analyzing and predicting real-world energy consumption data using Generalized Additive Model \(GAM\). Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Development of a GAM model with high capability of generalization;],[The model has a MAPE \(mean absolute percentage error\) value of 14.89;],[A report is available online \(#link("https://yuchen-xue.github.io/Learn-R-Quarto/content/linear-model/EnerNOC-GAM.html")[link to this report]\)],[#strong[Keynotes]: R language, Regression model, Generalized Additive Model \(GAM\)],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Sep. 2024 – Oct. 2024
  ],
  right-content: [
    #strong[Online R Tutorial Website based on Quarto] -- #strong[Rostock \(Germany\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [This is a website that contains my study note and projects of R language. Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed of a website using Quarto \(#link("https://yuchen-xue.github.io/Learn-R-Quarto/")[Link to this website]\)],[Automated deployment using Github Action],[#strong[Keynotes]: Quarto, R language, Github Actions],)
  ],
)



== Technical Projects -- Software Development & Embedded Systems


#two-col-entry(
  left-content: [
    Jan. 2018 – Mar. 2018
  ],
  right-content: [
    #strong[Java Spring Boot application for image object detection] -- #strong[Taipei \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A Restful API for object detection based on Spring Framework and MySql server. Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Implementation of the Spring Boot backend;],[Deployment of an object detection model using TensorFlow for Java;],[Implementation of MySQL database and Spring Database Connector for storing detection result.],[Available on Github #link("https://github.com/yuchen-xue/Spring-MySQL-TF-Detection")[link to this repository]],[#strong[Keynotes]: Spring framework, SQL database, Model deployment, Gradle, RESTful API],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Mar. 2018 – Jun. 2018
  ],
  right-content: [
    #strong[\"You Smile I Serve\" – A concept of smart restaurant using Raspberry-Pi] -- #strong[Taipei \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A hardware and software integration using Raspberry Pi. Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([The design of the whole software and hardware structure;],[The implementation of a voice recognition technique through cloud platform;],[The implementation of a QR code reading technique;],[The implementation of smile detection based on OpenCV.],[#strong[Keynotes]: Raspberry Pi, OpenCV, Cloud platform],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Feb. 2016 – Jun. 2016
  ],
  right-content: [
    #strong[Simple Quadcopter based on Arduino] -- #strong[Taichung \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A simple quadcopter based on Arduino. Highlights:])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([A collaboration work of assemble of a quadcopter from scratch],[Programming, design of control system and testing of the quadcopter],[This project won the best Final Year Project of the Department of Electrical Engineering of Thunhai University],[#strong[Keynotes]: Control system, Unmanned aerial vehicle, Arduino, C],)
  ],
)



== Publications


#two-col-entry(
  left-content: [
    Nov. 2019
  ],
  right-content: [
    #strong[Improved Part-aligned Deep Features Learning for Person Re-Identification]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Sheng-Luen Chung, #strong[#emph[Yuchen Xue]], Shih-Chao Chien, Ruei-Shan Chan

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/AVSS.2019.8909867")[10.1109/AVSS.2019.8909867] (16th IEEE International Conference on Advanced Video and Signal Based Surveillance \(AVSS\))  ],
  right-content: [
    Nov. 2019
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Dec. 2016
  ],
  right-content: [
    #strong[Cloud Encryption Using Distributed Environmental Keys]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Kun-Lin Tsai, Fang-Yie Leu, Yi-Fung Huang, Chi Yang, Cheng-Hsin Chang, King-Shing Yip, #strong[#emph[Yuchen Xue]], Guan-Chi Lai

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/IMIS.2016.73")[10.1109/IMIS.2016.73] (10th International Conference on Innovative Mobile and Internet Services in Ubiquitous Computing \(IMIS\))  ],
)



== Miscellaneous


#one-col-entry(
  content: [- Hobbies: Snowboarding, Hiking & trekking, Cycling, Badminton],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- German driving license #strong[#emph[\(Class B\)]]],
)


== Certificate and Award


#two-col-entry(
  left-content: [
    Sep. 2024
  ],
  right-content: [
    #strong[Certificate: Qualification Program -- Statistics Software R \(advanced\)] -- #strong[Rostock \(Germany\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A 4-day workshop that features multiple theoretical topics and practical sessions related to multiple statistics topics: #strong[#emph[linear model, anova, mean comparison with post-hoc tests, experimental designs and professional illustration]]])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Aug. 2016
  ],
  right-content: [
    #strong[The best annual final year project of the Department of Electrical Engineering] -- #strong[Taichung \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [“A Simple Quadcopter using Arduino” was granted as the best annual final year project of the Department of Electrical Engineering at Thunhai University])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Sep. 2014
  ],
  right-content: [
    #strong[Calculus Competition at Thunghai University] -- #strong[Taichung \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Won a prize in the Calculus Competition held by the Department of Applied Mathematics at Thunhai University])], column-gutter: 0cm)
  ],
)



== Extracurricular Activities


#two-col-entry(
  left-content: [
    Sep. 2015 – Jun. 2017
  ],
  right-content: [
    #strong[Teaching assistant of the course “Logic Design Laboratory”] -- #strong[Taichung \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [I volunteered as a teaching assistant for the practical session of the course “Logic Design”. During this practical session, each student is required to learn the coding skills of the Verilog language \(a hardware description language\) and to complete tasks relating to the implementation of various logic units using FPGA development. My role was to introduce each assignment to the students and assist them when needed.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    Sep. 2015 – Jun. 2017
  ],
  right-content: [
    #strong[Teaching assistant of the course \"Introduction to Cyber-Physical System\"] -- #strong[Taichung \(Taiwan\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [I volunteered as a teaching assistant for this course “Regression Analysis”. During this practical session, where each student is required to learn the coding skill of the Python language and complete tasks using Raspberry Pi single board computer. My role was to introduce each assignment to the students and assist them when needed.])], column-gutter: 0cm)
  ],
)



