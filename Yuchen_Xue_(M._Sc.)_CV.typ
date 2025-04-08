#import "template.typ": conf, entry, inline-entry

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
  entry(
    title: [*#exp.position*, #emph(exp.company) - #exp.location], 
    start_date: exp.start_date, 
    end_date: exp.end_date,
    entry_content: [
      #exp.summary
      #list(..exp.highlights)
    ]
  )
}

== Education

#for edu in cv_data.sections.education {
  entry(
    title: [*#edu.institution* - #emph(edu.degree), #edu.area - #edu.location], 
    start_date: edu.start_date, 
    end_date: 
      // When `end_date` is not defined, it stands for an ongoing activity
      if edu.keys().contains("end_date") {
        edu.end_date
      } else {
        none
      },
    entry_content: 
      if edu.keys().contains("highlights") {
        list(..edu.highlights)
      }
  )
}

== Keynote Technical Skills

#for skill in cv_data.sections.keynote_technical_skills {
  inline-entry(
    entry_content: [/ #skill.label: #skill.details]
  )
}

== Language Skills

#for skill in cv_data.sections.language_skills {
  inline-entry(
    entry_content: [/ #skill.label: #skill.details]
  )
}

== Technical Projects -- Deep Learning & Computer Vision

#for proj in cv_data.sections.technical_projects.at("deep_learning_&_computer_vision") {
  entry(
    title: [*#proj.name* - *#proj.location*], 
    start_date: proj.start_date, 
    end_date: proj.end_date,
    entry_content: [
      #proj.summary
      #if proj.keys().contains("highlights") {
        list(..proj.highlights)
      }
      #if proj.keys().contains("link") {
        [/ Link: #link(proj.link)[#proj.link.split("/").at(-1)]]
      }
      #if proj.keys().contains("keywords") {
        [/ Keywords: #for word in proj.keywords [#emph(word), ]]
      }
    ]
  )
}

== Technical Projects -- Data Engineering

#for proj in cv_data.sections.technical_projects.at("data_engineering") {
  entry(
    title: [*#proj.name* - *#proj.location*], 
    start_date: proj.start_date, 
    end_date: proj.end_date,
    entry_content: [
      #proj.summary
      #if proj.keys().contains("highlights") {
        list(..proj.highlights)
      }
      #if proj.keys().contains("link") {
        [/ Link: #link(proj.link)[#proj.link.split("/").at(-1)]]
      }
      #if proj.keys().contains("keywords") {
        [/ Keywords: #for word in proj.keywords [#emph(word), ]]
      }
    ]
  )
}

== Technical Projects -- Software Development & Embedded Systems

#for proj in cv_data.sections.technical_projects.at("software_development_&_embedded_systems") {
  entry(
    title: [*#proj.name* - *#proj.location*], 
    start_date: proj.start_date, 
    end_date: proj.end_date,
    entry_content: [
      #proj.summary
      #if proj.keys().contains("highlights") {
        list(..proj.highlights)
      }
      #if proj.keys().contains("link") {
        [/ Link: #link(proj.link)[#proj.link.split("/").at(-1)]]
      }
      #if proj.keys().contains("keywords") {
        [/ Keywords: #for word in proj.keywords [#emph(word), ]]
      }
    ]
  )
}

== Publications

#for pub in cv_data.sections.publications {
  entry(
    title: strong(pub.title),
    start_date: pub.date, 
    entry_content: 
      [
        #for author in pub.authors {
          if author == cv_data.name {
            [#emph(author), ]
          } else {
            [#author, ]
          }
        }
        #link("https://doi.org/"+pub.doi)[#pub.doi] (#pub.journal)
    ]
  )
}

== Miscellaneous

#for n in cv_data.sections.miscellaneous {
  inline-entry(
    entry_content: [/ #n.label: #n.details]
  )
}

== Certificate and Award

#for n in cv_data.sections.certificate_and_award {
  entry(
    title: [*#n.name* - #n.location], 
    start_date: n.date,
    entry_content: n.summary
  )
}

== Extracurricular Activities

#for activity in cv_data.sections.extracurricular_activities {
  entry(
    title: [*#activity.name* - #activity.location], 
    start_date: activity.start_date, 
    end_date: activity.end_date,
    entry_content: activity.summary
  )
}
