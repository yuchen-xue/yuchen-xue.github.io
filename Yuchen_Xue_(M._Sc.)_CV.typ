#import "template.typ": conf, entry, inline-entry

// ==== ==== ==== ==== ==== ====
// Load cv data
// ==== ==== ==== ==== ==== ====

#let cv_data = toml("Yuchen_Xue-data.toml")

// ==== ==== ==== ==== ==== ====
// User-defined functions
// ==== ==== ==== ==== ==== ====

#let display-project(proj_entity) = {
  entry(
    title: [*#proj_entity.title* - #emph(proj_entity.location)], 
    start_date: proj_entity.start_date, 
    end_date: proj_entity.end_date,
    entry_content: [
      #proj_entity.summary

      #if proj_entity.keys().contains("highlights") {
        [#underline([_Highlights:_])]
        list(..proj_entity.highlights)
      }

      #if proj_entity.keys().contains("external_links") {
        [/ Link: #link(proj_entity.external_links.at(0).url)[#proj_entity.external_links.at(0).display_text]]
      }

      #if proj_entity.keys().contains("keywords") {
        let (..keywords, last) = proj_entity.keywords
        [/ Keywords: #for kw in keywords [#emph(kw), ] #emph(last)]
      }
    ]
  )
}

// ==== ==== ==== ==== ==== ====
// Document header
// ==== ==== ==== ==== ==== ====

#show: conf.with(
  person_name: cv_data.header.name,
  person_label: cv_data.header.label,
  profile_picture: cv_data.header.picture.profile_picture_cv,
  residence: cv_data.header.contact.residence,
  email: cv_data.header.contact.email,
  phone: cv_data.header.contact.phone, 
  website: cv_data.header.website,
  social_network_list: cv_data.header.social_networks
)

// ==== ==== ==== ==== ==== ====
// Document body
// ==== ==== ==== ==== ==== ====

== Work Experience

#for exp in cv_data.sections.work_experience {
  entry(
    title: [*#exp.position \@ #exp.company* - #emph(exp.location)], 
    start_date: exp.start_date, 
    end_date: exp.end_date,
    entry_content: [
      #exp.summary
      
      #underline([_Highlights:_])
      #list(..exp.highlights)
    ]
  )
}

== Education

#for edu in cv_data.sections.education {
  entry(
    title: [*#edu.institution* - #edu.study_program - #emph(edu.location)], 
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

#for proj in cv_data.sections.technical_projects.at("deep_learning_computer_vision") {
  display-project(proj)
}

== Technical Projects -- Data Engineering

#for proj in cv_data.sections.technical_projects.at("data_engineering") {
  display-project(proj)
}

== Technical Projects -- Software Development & Embedded Systems

#for proj in cv_data.sections.technical_projects.at("software_development_embedded_systems") {
  display-project(proj)
}

== Publications

#for pub in cv_data.sections.publications {
  entry(
    title: strong(pub.title),
    start_date: pub.date, 
    entry_content: 
      [
        #for author in pub.authors {
          if author == cv_data.header.name {
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

#for m in cv_data.sections.miscellaneous {
  inline-entry(
    entry_content: [/ #m.label: #m.details]
  )
}

== Certificate and Award

#for ca in cv_data.sections.certificate_and_award {
  entry(
    title: [*#ca.title* - #emph(ca.location)], 
    start_date: ca.date,
    entry_content: ca.summary
  )
}

== Volunteer Experiences

#for activity in cv_data.sections.volunteer_experiences {
  entry(
    title: [*#activity.title* - #emph(activity.location)], 
    start_date: activity.start_date, 
    end_date: activity.end_date,
    entry_content: [
      #activity.summary
      #if activity.keys().contains("highlights") {
        list(..activity.highlights)
      }
    ]
  )
}
