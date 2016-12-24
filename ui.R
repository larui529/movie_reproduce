#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggvis)

# For dropdown menu
actionLink <- function(inputID, ...) {
        tags$a(href = 'javascript: void', #tags$a creates a link to a web page href: the address of the web
               id = inputID,
               class = 'action-button',
               ...)
}

fluidPage(
        titlePanel("Movie explorer"),
        fluidRow(
                column(3,
                       wellPanel(
                               h4("Filler"),
                               sliderInput("reviews", "Minimum number of reviews on Rotten Tomatoes",
                                           10, 300, 80, step = 10),
                               sliderInput("year", "Year released", 1940, 2014, value = c(1970, 2014)),
                               sliderInput("oscars", "Minimum number of Oscar wins (all categories)", 0, 4, 0, step = 1),
                               sliderInput("boxoffice", "Dollars at Box Office (millions)", 0, 800, c(0,800), step = 1),
                               selectInput("genre", "Genre (a movie can have multiple genres)", 
                                           c("All","Action", "Adventure", "Animation", "Biography", "Comedy", "Crime", "Documentary",
                                             "Drama", "Fantasy", "History", "Horror", "Music", "Musical", "Mystery", "Romance", "Sci-Fi",
                                             "Short", "Sport", "Thriller", "War", "Western")
                                           ),
                               textInput("director", "Director name contains (e.g., Mayazaki)"),
                               textInput("cast", "Cast names contains (e.g. Tom Hanks)")
                       ),
                       wellPanel(
                               selectInput("xvar", "X-axis variable", axis_vars, selected = "Meter"),
                               selectInput("yvar", "Y-axis variable", axis_vars, selected = "Reviews"),
                               tags$small(paste0(
                                       "Note: the tomato meter is the proportion of positive reviews", 
                                       " (as judged by the Roten Tomatoes staff), and the numeric rating is",
                                       " a normalized 1-10 score of those reviews which have star ratings",
                                       " (for example, 3 out of 4 stars)."
                                       
                               ))
                               
                           )
                       ),
                column(9, #width must between 1 and 12
                       ggvisOutput("plot1"),
                       wellPanel(
                               span("Number of movies selected:",
                                    textOutput("n_movies")
                                )
                       )
                )
        )
 )


