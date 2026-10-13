#import "template-USTH_report.typ": conf, entry, inline-entry

//TODO: Create an updated CV indicating current grants, publications, activities during the 1st academic year

// ==== ==== ==== ==== ==== ====
// Load cv data
// ==== ==== ==== ==== ==== ====

#let cv_data = toml("Yuchen_Xue-data-USTH_report.toml")

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
  email_ulr: cv_data.header.contact.email_ulr,
  email_usth: cv_data.header.contact.email_usth,
  phone: cv_data.header.contact.phone, 
  website: cv_data.header.website,
  social_network_list: cv_data.header.social_networks
)

// ==== ==== ==== ==== ==== ====
// Document body
// ==== ==== ==== ==== ==== ====


== Current Position

#for exp in cv_data.sections.lab_experience {
  entry(
    title: [*#exp.institution* - #emph(exp.location)], 
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

== Training Courses

#for course in cv_data.sections.training_courses {
  entry(
    title: [*#course.title* - #emph(course.location)], 
    start_date: course.date,
    entry_content: course.summary
  )
}

== Academic Activities

#for activity in cv_data.sections.academic_activities {
  entry(
    title: [*#activity.title* - #emph(activity.location)], 
    start_date: activity.date,
    entry_content: activity.summary
  )
}

== Previous Publications

#for pub in cv_data.sections.publications {
  let (..authors, last) = pub.authors
  let pub_year = pub.date.split("-").at(0)

  entry(
    title: strong(pub.title),
    start_date: pub.date, 
    entry_content: 
      [
        #for author in authors {
          if author == cv_data.header.name {
            [#emph(author), ]
          } else {
            [#author, ]
          }
        }
        #if last == cv_data.header.name{
          [#emph(last).]
        } else {
          [#last.]
        }
        "#pub.title." In #emph([#pub_year #pub.journal]), pp. #pub.page_number. #pub.publisher, #pub_year. 
        (#link("https://doi.org/"+pub.doi)[#pub.doi])
    ]
  )
}
