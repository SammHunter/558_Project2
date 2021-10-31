This repo is for Samantha Hunter and Evan Patton to house all information for Project 2 for ST-558. The topic for this project is, to predict the amount of shares on social media that a news article gets. We judged the models using root mean square error. 


The following are the links to the projects completed work and outputs:  

* [Main document that was the base for reports.](report_generator.Rmd)  
* [R Script for rendering reports.](render_automate.Rmd)  
* [Report on World topic.](https://sammhunter.github.io/558_Project2/world_report.html)  
* [Report on Lifestyle topic.](https://sammhunter.github.io/558_Project2/lifestyle_report.html)  
* [Report on Entertainment topic.](https://sammhunter.github.io/558_Project2/entertainment_report.html)  
* [Report on Business topic.](https://sammhunter.github.io/558_Project2/business_report.html)  
* [Report on Social Media topic.](https://sammhunter.github.io/558_Project2/socialMedia_report.html) 
* [Report on Tech topic.](https://sammhunter.github.io/558_Project2/tech_report.html)


The packages used to complete this project are:  

* tidyverse  
* caret  
* rmarkdown  
* randomForest  
* parallel  
* doParallel  
* knitr  
* gbm


Render Code:

`subj_topics<-unique(data$topic)`

`output_file <- paste0(subj_topics, "_report")`
`params <- lapply(subj_topics, FUN = function(x){list(topics = x)})`
`reports <- tibble(output_file, params)`

`apply(reports, MARGIN = 1,` 
`      FUN = function(x) {`
`        render(input = "C:/Users/jolop/OneDrive/Desktop/Fall21/ST558/558_Project2/report_generator.Rmd",`
`               output_file = x[[1]],`

`               params = x[[2]])`
`      })`