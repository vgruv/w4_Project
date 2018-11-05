# w4_Project

# This peer assessed assignment has two parts.
# First, you will create a Shiny application and deploy it on Rstudio's servers.
# Second, you will use Slidify or Rstudio Presenter
# to prepare a reproducible pitch presentation about your application.
#

# Shiny Application
# Shiny application with associated supporting documentation.
# The documentation should be thought of as whatever a user will need 
#    to get started using your application.
# Deploy the application on Rstudio's shiny server
# Share the application link by pasting it into the provided text box
# Share your server.R and ui.R code on github

# The application must include the following:
#    Some form of input (widget: textbox, radio button, checkbox, ...)
#    Some operation on the ui input in sever.R
#    Some reactive output displayed as a result of server calculations
#    You must also include enough documentation so that a novice user could use your application.
#    The documentation should be at the Shiny website itself. Do not post to an external link.

# Review criteria Shiny Application
#    Was there enough documentation on the shiny site for a user to get started using the application?
#    Did the application run as described in the documentation?
#    Was there some form of widget input (slider, textbox, radio buttons, checkbox, ...) in either ui.R or a custom web page?
#    Did server.R perform some calculations on the input in server.R?
#    Was the server calculation displayed in the html page?
#    Was the app substantively different than the very simple applications built in the class?
#         Note, it's OK if the app is simple and based on the one presented in class.
#         I just don't want it to be basically a carbon copy of the examples we covered.
#         For example, if someone simply changed the variable names, then this would not count.
#         However, a prediction algorithm that had a similar layout would be fine.
#    Here's your opportunity to give the app +1 for being well done, or neat, or even just a solid effort.

# Your Reproducible Pitch
# Was the presentation completed in slidify or R Presenter?
#    Was it 5 pages?
#    Did it contain an R expression that got evaluated and displayed?
#    Did it contain an R expression that got evaluated and displayed?
#    Was it hosted on github or Rpubs?
#    Was the server calculation displayed in the html page?
#    Here's your opportunity to give this presentation a +1 for being well done.
#         Did they tinker around with the default style?
#         Was the presentation particularly lucid and well organized?
#         In other words, the student made a legitimate try.
#    There were no R errors displayed in the presentation.

library(shiny)

# Define application UI 
shinyUI(fluidPage(
  # Application title
     # qsec	1/4 mile time
     # A performance measure, primarily of acceleration.
     # Fastest time to travel 1/4 mile from standstill (in seconds).
  titlePanel("Car Acceleration Prediction based on selected parameters"),

  # Sidebar with an input for selected car characteristics
  sidebarLayout(
    sidebarPanel(
       h4("Please choose parameters and click the Submit button"),
       sliderInput("sliderHP", "Gross Horsepower (hp)", 52, 335, value = 100),
       sliderInput("sliderWt", "Car Weight (1000 lbs)", 1,6, value = 2),
       selectInput("CylindersNum", "Number of cylinders:",
                   choices = levels(as.factor(mtcars$cyl)), 
                   selected = as.factor(levels(mtcars$cyl)[1])),
       submitButton("Submit")
    ),

    # Display predicted acceleration
    mainPanel(
         h3("Predicted fastest time to travel 1/4 mile from standstill (in seconds)"),
         h4("Multiple linear regression prediction - transmission is not included "),
         p(textOutput("pred_lm")),
         h3(), 
         
         h4("Multiple linear regression prediction - manual transmission"),
         p(textOutput("pred_lm_m")),
         h3(),
         
         h4("Multiple linear regression prediction - automatic transmission"),
         p(textOutput("pred_lm_a"))
    )
  )
))
