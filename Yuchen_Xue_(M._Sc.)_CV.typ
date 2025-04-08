#import "template.typ": conf, two-col

#let design-highlights-top-margin = 0.25cm
#let design-entries-vertical-space-between-entries = 0.4cm

// ==== ==== ==== ==== ==== ====
// Load cv data
// ==== ==== ==== ==== ==== ====

#let cv_data = toml("Yuchen_Xue-data.toml").cv

// ==== ==== ==== ==== ==== ====
// Document header
// ==== ==== ==== ==== ==== ====

#show: conf.with(
  person_name: cv_data.name,
  person_designation: cv_data.designation,
  photo: cv_data.photo,
  residence: cv_data.residence,
  email: cv_data.email,
  phone: cv_data.phone, 
  website: cv_data.website,
  social_network_list: cv_data.social_networks
)

// ==== ==== ==== ==== ==== ====
// Document body
// ==== ==== ==== ==== ==== ====

== Experience

#for exp in cv_data.sections.experience {

  two-col(
    alignments: (right, auto),
    left-content: [
      #exp.start_date - #exp.end_date
    ],
    right-content: [
      *#exp.position*, #emph(exp.company) - #exp.location
    ],
  )

  v(design-highlights-top-margin)

  two-col(
    right-content: exp.summary
  )

  v(design-highlights-top-margin)

  two-col(
    right-content: list(
      ..exp.highlights
    )
  )
}

== Education

#for edu in cv_data.sections.education {
  two-col(
    alignments: (right, auto),
    left-content: [
      #edu.start_date - #edu.end_date
    ],
    right-content: [
      *#edu.institution* - #emph(edu.degree), #edu.area - #edu.location
    ]
  )

  v(design-highlights-top-margin);

  if edu.keys().contains("highlights") {
    two-col(
      right-content: list(
        ..edu.highlights
      )
    )
    v(design-highlights-top-margin);
  }
}

== Keynote Technical Skills

#for skill in cv_data.sections.keynote_technical_skills {
  two-col(
    right-content: [
      *#skill.label:* #skill.details
    ]
  )
  v(design-entries-vertical-space-between-entries)
}

== Language Skills

#for skill in cv_data.sections.language_skills {
  two-col(
    right-content: [
      *#skill.label:* #skill.details
    ]
  )
  v(design-entries-vertical-space-between-entries)
}

== Technical Projects -- Deep Learning & Computer Vision

#for proj in cv_data.sections.at("technical_projects -- deep_learning_&_computer_vision") {


  two-col(
    alignments: (right, auto),
    left-content: [
      #proj.start_date - #proj.end_date
    ],
    right-content: [
      *#proj.name* - *#proj.location*
    ],
  )

  v(design-highlights-top-margin)

  two-col(
    right-content: proj.summary
  )

  v(design-highlights-top-margin)

  if proj.keys().contains("highlights") {
    two-col(
      right-content: list(
        ..proj.highlights
      )
    )
  }

  v(design-entries-vertical-space-between-entries)
}

== Technical Projects -- Data Engineering

#for proj in cv_data.sections.at("technical_projects -- data_engineering") {


  two-col(
    alignments: (right, auto),
    left-content: [
      #proj.start_date - #proj.end_date
    ],
    right-content: [
      *#proj.name* - #proj.location
    ],
  )

  v(design-highlights-top-margin)

  two-col(
    right-content: proj.summary
  )

  v(design-highlights-top-margin)

  if proj.keys().contains("highlights") {
    two-col(
      right-content: list(
        ..proj.highlights
      )
    )
  }

  v(design-entries-vertical-space-between-entries)
}

== Technical Projects -- Software Development & Embedded Systems

#for proj in cv_data.sections.at("technical_projects -- software_development_&_embedded_systems") {


  two-col(
    alignments: (right, auto),
    left-content: [
      #proj.start_date - #proj.end_date
    ],
    right-content: [
      *#proj.name* - #proj.location
    ],
  )

  v(design-highlights-top-margin)

  two-col(
    right-content: proj.summary
  )

  v(design-highlights-top-margin)

  if proj.keys().contains("highlights") {
    two-col(
      right-content: list(
        ..proj.highlights
      )
    )
  }

  v(design-entries-vertical-space-between-entries)
}

== Publications

#for pub in cv_data.sections.publications {

  two-col(
    alignments: (right, auto),
    left-content: pub.date,
    right-content: strong(pub.title),
  )

  v(design-highlights-top-margin)

  two-col(
    right-content: 
      for author in pub.authors {
        if author == cv_data.name {
          [#emph(author), ]
        } else {
          [#author, ]
        }
      }
  )

  v(design-highlights-top-margin)

  two-col(
    right-content: [
      #link("https://doi.org/"+pub.doi)[#pub.doi] (#pub.journal)
    ]
  )

  v(design-entries-vertical-space-between-entries)
}

== Miscellaneous

#for n in cv_data.sections.miscellaneous {
  two-col(
    right-content: [
      - #n.bullet
    ]
  )
  v(design-entries-vertical-space-between-entries)
}


== Certificate and Award

#for n in cv_data.sections.certificate_and_award {
  two-col(
    alignments: (right, auto),
    left-content: n.date,
    right-content: [
      *#n.name* - #n.location
    ],
  )
  
  v(design-highlights-top-margin)
  
  two-col(
    right-content: [
      #n.summary
    ]
  )
  v(design-entries-vertical-space-between-entries)
}

== Extracurricular Activities

#for activity in cv_data.sections.extracurricular_activities {
  two-col(
    alignments: (right, auto),
    left-content: [
      #activity.start_date - #activity.end_date
    ],
    right-content: [
      *#activity.name* - #activity.location
    ],
  )
  
  v(design-highlights-top-margin)
  
  two-col(
    right-content: [
      #activity.summary
    ]
  )
  v(design-entries-vertical-space-between-entries)
}