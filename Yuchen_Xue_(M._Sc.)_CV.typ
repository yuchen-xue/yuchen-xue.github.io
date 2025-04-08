#import "template.typ": conf, insert-section-title, insert-section-body

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

  insert-section-title(
    title: [*#exp.position*, #emph(exp.company) - #exp.location], 
    start_date: exp.start_date, 
    end_date: exp.end_date,
  )

  v(design-highlights-top-margin)

  insert-section-body(content: exp.summary)

  v(design-highlights-top-margin)

  insert-section-body(
    content: list(
      ..exp.highlights
    )
  )
}

== Education

#for edu in cv_data.sections.education {
  insert-section-title(
    title: [*#edu.institution* - #emph(edu.degree), #edu.area - #edu.location], 
    start_date: edu.start_date, 
    end_date: edu.end_date,
  )

  v(design-highlights-top-margin);

  if edu.keys().contains("highlights") {
    insert-section-body(
      content: list(
        ..edu.highlights
      )
    )
    v(design-highlights-top-margin);
  }
}

== Keynote Technical Skills

#for skill in cv_data.sections.keynote_technical_skills {
  insert-section-body(
    content: [
      / #skill.label: #skill.details
    ]
  )
  v(design-entries-vertical-space-between-entries)
}

== Language Skills

#for skill in cv_data.sections.language_skills {
  insert-section-body(
    content: [
      / #skill.label: #skill.details
    ]
  )
  v(design-entries-vertical-space-between-entries)
}

== Technical Projects -- Deep Learning & Computer Vision

#for proj in cv_data.sections.at("technical_projects -- deep_learning_&_computer_vision") {


  insert-section-title(
    title: [*#proj.name* - *#proj.location*], 
    start_date: proj.start_date, 
    end_date: proj.end_date,
  )

  v(design-highlights-top-margin)

  insert-section-body(content: proj.summary
  )

  v(design-highlights-top-margin)

  if proj.keys().contains("highlights") {
    insert-section-body(content: list(
        ..proj.highlights
      )
    )
  }

  v(design-entries-vertical-space-between-entries)
}

== Technical Projects -- Data Engineering

#for proj in cv_data.sections.at("technical_projects -- data_engineering") {


  insert-section-title(
    title: [*#proj.name* - #proj.location], 
    start_date: proj.start_date, 
    end_date: proj.end_date,
  )

  v(design-highlights-top-margin)

  insert-section-body(content: proj.summary
  )

  v(design-highlights-top-margin)

  if proj.keys().contains("highlights") {
    insert-section-body(
      content: list(
        ..proj.highlights
      )
    )
  }

  v(design-entries-vertical-space-between-entries)
}

== Technical Projects -- Software Development & Embedded Systems

#for proj in cv_data.sections.at("technical_projects -- software_development_&_embedded_systems") {


  insert-section-title(
    title: [*#proj.name* - #proj.location], 
    start_date: proj.start_date, 
    end_date: proj.end_date,
  )

  v(design-highlights-top-margin)

  insert-section-body(content: proj.summary
  )

  v(design-highlights-top-margin)

  if proj.keys().contains("highlights") {
    insert-section-body(
      content: list(
        ..proj.highlights
      )
    )
  }

  v(design-entries-vertical-space-between-entries)
}

== Publications

#for pub in cv_data.sections.publications {

  insert-section-title(
    title: strong(pub.title),
    start_date: pub.date, 
  )

  v(design-highlights-top-margin)

  insert-section-body(content: 
      for author in pub.authors {
        if author == cv_data.name {
          [#emph(author), ]
        } else {
          [#author, ]
        }
      }
  )

  v(design-highlights-top-margin)

  insert-section-body(
    content: [
      #link("https://doi.org/"+pub.doi)[#pub.doi] (#pub.journal)
    ]
  )

  v(design-entries-vertical-space-between-entries)
}

== Miscellaneous

#for n in cv_data.sections.miscellaneous {
  insert-section-body(
    content: [
      / #n.label: #n.details
    ]
  )
  v(design-entries-vertical-space-between-entries)
}


== Certificate and Award

#for n in cv_data.sections.certificate_and_award {

  insert-section-title(
    title: [
      *#n.name* - #n.location
    ], 
    start_date: n.date,
  )
  
  v(design-highlights-top-margin)
  
  insert-section-body(content: n.summary)
  v(design-entries-vertical-space-between-entries)
}

== Extracurricular Activities

#for activity in cv_data.sections.extracurricular_activities {
  insert-section-title(
    title: [
      *#activity.name* - #activity.location
    ], 
    start_date: activity.start_date, 
    end_date: activity.end_date,
  )
  
  v(design-highlights-top-margin)
  
  insert-section-body(content: activity.summary)
  v(design-entries-vertical-space-between-entries)
}