
#import "@preview/fontawesome:0.5.0": fa-icon

#let person-name = "Yuchen Xue"
#let person-designation = "M. Sc."
#let person-photo = "profile_picture.jpg"
#let date = datetime.today()
#let locale-catalog-page-numbering-style = context { str(person-name) + " - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-update-style = [_Last updated on #date.display("[day] [month repr:short]. [year]")_]
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Fontin"
#let design-section-titles-weight = "bold"
#let design-section-titles-line-thickness = 0.15cm
#let design-section-titles-font-size = 1.4em
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm - 0.5em
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Fontin"
#let design-text-allow-justify = true
#let design-text-allow-hyphenate = auto
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 108pt
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Fontin"
#let design-header-name-font-size = 25pt
#let design-header-name-font-weight = "regular"
#let design-header-connections-font-family = "Fontin"
#let design-header-vertical-space-before-name = 1.5em
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

// Metadata:
#set document(author: person-name, title: person-name + "'s CV", date: date)

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
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: design-text-allow-hyphenate,
  fill: design-colors-text,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: design-text-allow-justify,
)

// Bullet list settings for entries:
#set list(
  marker: design-highlights-bullet,
  spacing: design-highlights-vertical-space-between-highlights,
  indent: design-highlights-left-margin,
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
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: design-header-name-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  // Vertical space before the name
  #v(design-header-vertical-space-before-name)
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: design-section-titles-font-size,
    weight: design-section-titles-weight,
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

     ],
  )
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below)
]

// Customable links used for content of entries:
#let link-entry-content(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  place(
    top + right,
    dx: 0cm,
    dy: -design-page-top-margin / 2,
    text(
      locale-catalog-last-update-style,
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

#two-col(
  alignments: (center, left),
  left-content: image(
    person-photo, 
    width: design-header-photo-width
  ),
  right-content: [
= #person-name (#person-designation)

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Rostock, Germany],
  [#box(link("mailto:yuchen.xue@example.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)yuchen.xue\@example.com])],
  [#box(link("tel:+49-1234-5678")[#fa-icon("phone", size: 0.9em) #h(0.05cm)+49 1234 5678])],
  [#box(link("https://yuchen-xue.notion.site/Yuchen-Xue-M-Sc-d20b6d8537bf45b5aee1dd2a72ff6bd6")[#fa-icon("link", size: 0.9em) #h(0.05cm)yuchen-xue.notion.site\/Yuchen-Xue-M-Sc-d20b6d8537bf45b5aee1dd2a72ff6bd6])],
  [#box(link("https://linkedin.com/in/sean-yuchen-xue")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)sean-yuchen-xue])],
  [#box(link("https://github.com/yuchen-xue")[#fa-icon("github", size: 0.9em) #h(0.05cm)yuchen-xue])],
  [#box(link("https://researchgate.net/profile/Yuchen-Xue-6")[#fa-icon("researchgate", size: 0.9em) #h(0.05cm)Yuchen-Xue-6])],
  [#box(link("https://www.xing.com/profile/Yuchen_Xue2")[#fa-icon("xing", size: 0.9em) #h(0.05cm)Yuchen_Xue2])],
)
#connections(connections-list)

  ],
)


== Experience


#two-col(
  alignments: (right, auto),
  left-content: [
    May. 2023 – Apr. 2024
  ],
  right-content: [
    #strong[Technical assistant for a deep-learning-based defect detection solution], Fraunhofer IFF -- Magdeburg \(Germany\)
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    I developed a deep-learning-based zero-shot solution for industry-level defect detection on different types of machinery parts. This solution features the comparison of image samples based on image segmentation technologies. Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
      [Solution for precise image segmentation of irregular machinery parts using computer vision algorithms;],
      [97.6\% precision on recognition tasks that was tested by a pre-defined dataset;],
      [Deployment using Docker Compose;],
      [Collaborated with my colleagues using a version control repository;],
  )
)


== Education


#two-col(
  alignments: (right, auto),
  left-content: [
    Oct. 2021 – present
  ],
  right-content: [
    #strong[University of Rostock], M.Sc. in Computational Electrical Engineering -- Rostock \(Germany\)
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [#strong[Keynotes]: Computational methods, Image processing],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Mar. 2021 – Aug. 2021
  ],
  right-content: [
    #strong[Rhein-Waal University of Applied Science], M.Sc. in Information Engineering and Computer Science -- Kleve \(Germany\)
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [#strong[Keynotes]: Data engineering, Simulation technologies],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Feb. 2020 – Aug. 2020
  ],
  right-content: [
    #strong[University of Groningen], Exchange program in the Faculty of Science and Engineering -- Groningen \(the Netherlands\)
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [#strong[Keynotes]: Parallel Computing, Scalable Computing],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Sep. 2017 – Jan. 2021
  ],
  right-content: [
    #strong[National Taiwan University of Science and Technology], M.Sc. in Electrical Engineering -- Taipei \(Taiwan\)
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [Top technical university in Taiwan],
    [#strong[Keynotes]: Deep Learning, Image processing, Data engineering],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Sep. 2013 – Jun. 2017
  ],
  right-content: [
    #strong[Thunhai University], B.Sc. in Electrical Engineering -- Taipei \(Taiwan\)
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [#strong[Keynotes]: Verilog HDL, Semiconductor, Microelectronics],
  )
)

== Keynote Technical Skills


#two-col(
  right-content: [#strong[Programming Languages:] Proficient with Python; good understanding with Java, C++ and R]
)
#v(design-entries-vertical-space-between-entries)

#two-col(
  right-content: [#strong[Machine Learning and Data Science Packages:] Good understanding with Pytorch, Tensorflow, OpenCV, Matplotlib, MySQL Server, Numpy, Pandas, Skikit Learn, Quarto]
)
#v(design-entries-vertical-space-between-entries)

#two-col(
  right-content: [#strong[Programming Frameworks and Tools:] Good understanding with Docker Compose, Spring Boot, Git & Github, Linux, Bash, Raspberry Pi; Basic understanding with Arduino, Android Dev, VPN technologies WSL2 & VM and Verilog]
)


== Language Skills


#two-col(
  right-content: [#strong[English: Fluent \(C1\):] IETLS band 7 \(CERF C1-Level\). Date of the certification was issued: 26.03.2019]
)
#v(design-entries-vertical-space-between-entries)

#two-col(
  right-content: [#strong[German: Fluent \(C1\):] CERF C1 Level. Issued by Sprachzentrum der Universtität Rostock on 19.02.2025]
)
#v(design-entries-vertical-space-between-entries)

#two-col(
  right-content: [#strong[Chinese: Native speaker \(C2\):] Native Mandarin speaker]
)


== Technical Projects -- Deep Learning & Computer Vision


#two-col(
  alignments: (right, auto),
  left-content: [
    Oct. 2019 – Jan. 2021
  ],
  right-content: [
    #strong[Master thesis: Survey on facial recognition models using deep learning technologies] -- #strong[Taipei \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    This is an academic survey of different deep-learning based face recognition models, aiming at bringing insights to future researches in the field of deep learning. Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [Literal survey of numerous face recognition solutions],
    [Summary of the fundamental differences of deep learning models],
    [Use of experimental method for comparing the performance of different models],
    [#strong[Keynotes]: Face recognition, deep learning, PyTorch, Tensorflow],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Jul. 2018 – Sep. 2019
  ],
  right-content: [
    #strong[Publication and Academic Speech with the topic \"Improved Part-aligned Deep Features Learning for Person Re-Identification\"] -- #strong[Taipei \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    This is a solution to the challenge of person re-identification \(Re-ID\) problem. The Re-ID problem is about recognizing and matching pedestrian with different appearances across different cameras. Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [Development of a solution to Re-ID problem using computer vision and deep learning methods],
    [Contributed to the relative academic paper as the 2nd co-author. The paper accepted by the 16th IEEE International Conference on Advanced Video and Signal-based Surveillance \(AVSS\)],
    [Delivered an academic speech on this conference],
    [Use of experimental method for comparing the performance of different models],
    [#strong[Keynotes]: Cross-camera recognition, Python, deep learning, TensorFlow],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Feb. 2018 – Apr. 2018
  ],
  right-content: [
    #strong[Real-time pedestrian and vehicle detection on surveillance cameras video stream] -- #strong[Taipei \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    A real-time object detection solution for real-time video streams written in C++. Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [Improvement of 20\% in precision compared to the base model],
    [Improvement on small, obscured, and overlapping objects],
    [I was in charge of data collection, sample labeling, and training a model],
    [Training of a reliable model with limited data using transfer learning technique],
  )
)


== Technical Projects -- Data Engineering


#two-col(
  alignments: (right, auto),
  left-content: [
    Apr. 2018 – Jun. 2018
  ],
  right-content: [
    #strong[Energy consumption analysis on a real-life dataset using R language] -- #strong[Taipei \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    This is a project about analyzing and predicting real-world energy consumption data using Generalized Additive Model \(GAM\). Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [Development of a GAM model with high capability of generalization;],
    [The model has a MAPE \(mean absolute percentage error\) value of 14.89;],
    [A report is available online \(#link-entry-content("https://yuchen-xue.github.io/Learn-R-Quarto/content/linear-model/EnerNOC-GAM.html")[link to this report]\)],
    [#strong[Keynotes]: R language, Regression model, Generalized Additive Model \(GAM\)],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Sep. 2024 – Oct. 2024
  ],
  right-content: [
    #strong[Online R Tutorial Website based on Quarto] -- #strong[Rostock \(Germany\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    This is a website that contains my study note and projects of R language. Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [Developed of a website using Quarto \(#link-entry-content("https://yuchen-xue.github.io/Learn-R-Quarto/")[Link to this website]\)],
    [Automated deployment using Github Action],
    [#strong[Keynotes]: Quarto, R language, Github Actions],
  )
)


== Technical Projects -- Software Development & Embedded Systems


#two-col(
  alignments: (right, auto),
  left-content: [
    Jan. 2018 – Mar. 2018
  ],
  right-content: [
    #strong[Java Spring Boot application for image object detection] -- #strong[Taipei \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    A Restful API for object detection based on Spring Framework and MySql server. Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [Implementation of the Spring Boot backend;],
    [Deployment of an object detection model using TensorFlow for Java;],
    [Implementation of MySQL database and Spring Database Connector for storing detection result.],
    [Available on Github \(#link-entry-content("https://github.com/yuchen-xue/Spring-MySQL-TF-Detection")[link to this repository]\)],
    [#strong[Keynotes]: Spring framework, SQL database, Model deployment, Gradle, RESTful API],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Mar. 2018 – Jun. 2018
  ],
  right-content: [
    #strong[\"You Smile I Serve\" – A concept of smart restaurant using Raspberry-Pi] -- #strong[Taipei \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    A hardware and software integration using Raspberry Pi. Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [The design of the whole software and hardware structure;],
    [The implementation of a voice recognition technique through cloud platform;],
    [The implementation of a QR code reading technique;],
    [The implementation of smile detection based on OpenCV.],
    [#strong[Keynotes]: Raspberry Pi, OpenCV, Cloud platform],
  )
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Feb. 2016 – Jun. 2016
  ],
  right-content: [
    #strong[Simple Quadcopter based on Arduino] -- #strong[Taichung \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    A simple quadcopter based on Arduino. Highlights:
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: list(
    [A collaboration work of assemble of a quadcopter from scratch],
    [Programming, design of control system and testing of the quadcopter],
    [This project won the best Final Year Project of the Department of Electrical Engineering of Thunhai University],
    [#strong[Keynotes]: Control system, Unmanned aerial vehicle, Arduino, C],
  )
)


== Publications


#two-col(
  alignments: (right, auto),
  left-content: [
    Nov. 2019
  ],
  right-content: [
    #strong[Improved Part-aligned Deep Features Learning for Person Re-Identification]],
)


#v(design-highlights-top-margin)

#two-col(
  right-content: [
    Sheng-Luen Chung, #strong[#emph[#person-name]], Shih-Chao Chien, Ruei-Shan Chan
  ]
)

#v(design-highlights-top-margin - design-text-leading)#link-entry-content("https://doi.org/10.1109/AVSS.2019.8909867")[10.1109/AVSS.2019.8909867] (16th IEEE International Conference on Advanced Video and Signal Based Surveillance \(AVSS\))  ],
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Dec. 2016
  ],
  right-content: [
    #strong[Cloud Encryption Using Distributed Environmental Keys]],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    Kun-Lin Tsai, Fang-Yie Leu, Yi-Fung Huang, Chi Yang, Cheng-Hsin Chang, King-Shing Yip, #strong[#emph[#person-name]], Guan-Chi Lai
  ]
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    #link-entry-content("https://doi.org/10.1109/IMIS.2016.73")[10.1109/IMIS.2016.73] (10th International Conference on Innovative Mobile and Internet Services in Ubiquitous Computing \(IMIS\))
  ]
)


== Miscellaneous


#two-col(
  right-content: [- Hobbies: Snowboarding, Hiking & trekking, Cycling, Badminton],
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  right-content: [- German driving license #strong[#emph[\(Class B\)]]],
)


== Certificate and Award


#two-col(
  alignments: (right, auto),
  left-content: [
    Sep. 2024
  ],
  right-content: [
    #strong[Certificate: Qualification Program -- Statistics Software R \(advanced\)] -- #strong[Rostock \(Germany\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    A 4-day workshop that features multiple theoretical topics and practical sessions related to multiple statistics topics: #strong[#emph[linear model, anova, mean comparison with post-hoc tests, experimental designs and professional illustration]]
  ]
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Aug. 2016
  ],
  right-content: [
    #strong[The best annual final year project of the Department of Electrical Engineering] -- #strong[Taichung \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    “A Simple Quadcopter using Arduino” was granted as the best annual final year project of the Department of Electrical Engineering at Thunhai University
  ]
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Sep. 2014
  ],
  right-content: [
    #strong[Calculus Competition at Thunghai University] -- #strong[Taichung \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    Won a prize in the Calculus Competition held by the Department of Applied Mathematics at Thunhai University
  ]
)


== Extracurricular Activities


#two-col(
  alignments: (right, auto),
  left-content: [
    Sep. 2015 – Jun. 2017
  ],
  right-content: [
    #strong[Teaching assistant of the course “Logic Design Laboratory”] -- #strong[Taichung \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    I volunteered as a teaching assistant for the practical session of the course “Logic Design”. During this practical session, each student is required to learn the coding skills of the Verilog language \(a hardware description language\) and to complete tasks relating to the implementation of various logic units using FPGA development. My role was to introduce each assignment to the students and assist them when needed.
  ]
)

#v(design-entries-vertical-space-between-entries)

#two-col(
  alignments: (right, auto),
  left-content: [
    Sep. 2015 – Jun. 2017
  ],
  right-content: [
    #strong[Teaching assistant of the course \"Introduction to Cyber-Physical System\"] -- #strong[Taichung \(Taiwan\)]
  ],
)

#v(design-highlights-top-margin)

#two-col(
  right-content: [
    I volunteered as a teaching assistant for this course “Regression Analysis”. During this practical session, where each student is required to learn the coding skill of the Python language and complete tasks using Raspberry Pi single board computer. My role was to introduce each assignment to the students and assist them when needed.
  ]
)
