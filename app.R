# ============================================================
# STUDENT PERFORMANCE SHINY DASHBOARD
# ============================================================

library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)
library(DT)
library(readxl)
library(corrplot)
library(broom)

# ============================================================
# UI
# ============================================================

ui <- dashboardPage(
  
  # ----------------------------------------------------------
  # HEADER
  # ----------------------------------------------------------
  
  dashboardHeader(
    title = "Student Performance Dashboard"
  ),
  
  # ----------------------------------------------------------
  # SIDEBAR
  # ----------------------------------------------------------
  
  dashboardSidebar(
    
    sidebarMenu(
      
      menuItem(
        "Overview",
        tabName = "overview",
        icon = icon("dashboard")
      ),
      
      menuItem(
        "Demographics",
        tabName = "demographics",
        icon = icon("users")
      ),
      
      menuItem(
        "Academic Performance",
        tabName = "academic",
        icon = icon("graduation-cap")
      ),
      
      menuItem(
        "Study Habits",
        tabName = "study",
        icon = icon("book")
      ),
      
      menuItem(
        "Lifestyle & Wellbeing",
        tabName = "wellbeing",
        icon = icon("heart")
      ),
      
      menuItem(
        "Technology",
        tabName = "technology",
        icon = icon("laptop")
      ),
      
      menuItem(
        "Exam Analysis",
        tabName = "exam",
        icon = icon("file-text")
      ),
      
      menuItem(
        "Statistical Analysis",
        tabName = "statistics",
        icon = icon("bar-chart")
      ),
      
      menuItem(
        "Predictive Analysis",
        tabName = "prediction",
        icon = icon("line-chart")
      ),
      
      menuItem(
        "Missing Data",
        tabName = "missing",
        icon = icon("exclamation-triangle")
      ),
      
      menuItem(
        "Data Explorer",
        tabName = "data",
        icon = icon("table")
      )
      
    )
  ),
  
  # ----------------------------------------------------------
  # BODY
  # ----------------------------------------------------------
  
  dashboardBody(
    
    tags$head(
      
      tags$style(HTML("
        .content-wrapper {
          background-color: #f4f6f9;
        }

        .small-box {
          border-radius: 10px;
        }

        .box {
          border-radius: 10px;
        }

        h2 {
          font-weight: bold;
        }
      "))
      
    ),
    
    tabItems(
      
      # ======================================================
      # OVERVIEW
      # ======================================================
      
      tabItem(
        tabName = "overview",
        
        h2("Student Performance Overview"),
        
        fluidRow(
          
          valueBoxOutput("total_students"),
          valueBoxOutput("average_score"),
          valueBoxOutput("average_gpa"),
          valueBoxOutput("pass_rate")
          
        ),
        
        fluidRow(
          
          box(
            title = "Performance Grade Distribution",
            width = 6,
            status = "primary",
            solidHeader = TRUE,
            plotlyOutput("grade_plot")
          ),
          
          box(
            title = "Performance Level",
            width = 6,
            status = "success",
            solidHeader = TRUE,
            plotlyOutput("performance_level_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Exam Score Distribution",
            width = 6,
            plotlyOutput("score_distribution")
          ),
          
          box(
            title = "Attendance vs Exam Score",
            width = 6,
            plotlyOutput("attendance_score_plot")
          )
          
        )
        
      ),
      
      # ======================================================
      # DEMOGRAPHICS
      # ======================================================
      
      tabItem(
        tabName = "demographics",
        
        h2("Student Demographics"),
        
        fluidRow(
          
          box(
            title = "Gender",
            width = 6,
            plotlyOutput("gender_plot")
          ),
          
          box(
            title = "Education Level",
            width = 6,
            plotlyOutput("education_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "School Type",
            width = 6,
            plotlyOutput("school_type_plot")
          ),
          
          box(
            title = "Family Income",
            width = 6,
            plotlyOutput("income_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Parent Education",
            width = 6,
            plotlyOutput("parent_education_plot")
          ),
          
          box(
            title = "Urban / Rural",
            width = 6,
            plotlyOutput("urban_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Age Distribution",
            width = 12,
            plotlyOutput("age_plot")
          )
          
        )
        
      ),
      
      # ======================================================
      # ACADEMIC
      # ======================================================
      
      tabItem(
        tabName = "academic",
        
        h2("Academic Performance"),
        
        fluidRow(
          
          box(
            title = "Previous Exam Score vs Current Exam Score",
            width = 6,
            plotlyOutput("previous_exam_plot")
          ),
          
          box(
            title = "Previous GPA vs Exam Score",
            width = 6,
            plotlyOutput("gpa_exam_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Attendance vs Exam Score",
            width = 6,
            plotlyOutput("academic_attendance_plot")
          ),
          
          box(
            title = "Assignment Completion vs Exam Score",
            width = 6,
            plotlyOutput("assignment_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Class Participation",
            width = 6,
            plotlyOutput("participation_plot")
          ),
          
          box(
            title = "Pass Status",
            width = 6,
            plotlyOutput("pass_plot")
          )
          
        )
        
      ),
      
      # ======================================================
      # STUDY HABITS
      # ======================================================
      
      tabItem(
        tabName = "study",
        
        h2("Study Habits"),
        
        fluidRow(
          
          box(
            title = "Study Hours vs Exam Score",
            width = 6,
            plotlyOutput("study_hours_plot")
          ),
          
          box(
            title = "Self Study Hours vs Exam Score",
            width = 6,
            plotlyOutput("self_study_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Study Consistency",
            width = 6,
            plotlyOutput("consistency_plot")
          ),
          
          box(
            title = "Study Environment",
            width = 6,
            plotlyOutput("environment_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Study Method",
            width = 6,
            plotlyOutput("method_plot")
          ),
          
          box(
            title = "Revision Frequency",
            width = 6,
            plotlyOutput("revision_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Practice Tests vs Exam Score",
            width = 6,
            plotlyOutput("practice_tests_plot")
          ),
          
          box(
            title = "Notes Quality",
            width = 6,
            plotlyOutput("notes_plot")
          )
          
        )
        
      ),
      
      # ======================================================
      # WELLBEING
      # ======================================================
      
      tabItem(
        tabName = "wellbeing",
        
        h2("Lifestyle & Wellbeing"),
        
        fluidRow(
          
          box(
            title = "Sleep Hours vs Exam Score",
            width = 6,
            plotlyOutput("sleep_plot")
          ),
          
          box(
            title = "Sleep Quality",
            width = 6,
            plotlyOutput("sleep_quality_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Screen Time vs Exam Score",
            width = 6,
            plotlyOutput("screen_plot")
          ),
          
          box(
            title = "Physical Activity",
            width = 6,
            plotlyOutput("activity_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Stress Level",
            width = 6,
            plotlyOutput("stress_plot")
          ),
          
          box(
            title = "Motivation Level",
            width = 6,
            plotlyOutput("motivation_plot")
          )
          
        )
        
      ),
      
      # ======================================================
      # TECHNOLOGY
      # ======================================================
      
      tabItem(
        tabName = "technology",
        
        h2("Technology & Learning Resources"),
        
        fluidRow(
          
          box(
            title = "Internet Access",
            width = 6,
            plotlyOutput("internet_plot")
          ),
          
          box(
            title = "Device Availability",
            width = 6,
            plotlyOutput("device_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Educational App Usage",
            width = 6,
            plotlyOutput("app_usage_plot")
          ),
          
          box(
            title = "Online Learning Hours",
            width = 6,
            plotlyOutput("online_learning_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Online Course Hours vs Exam Score",
            width = 6,
            plotlyOutput("course_exam_plot")
          ),
          
          box(
            title = "Private Tuition",
            width = 6,
            plotlyOutput("tuition_plot")
          )
          
        )
        
      ),
      
      # ======================================================
      # EXAM
      # ======================================================
      
      tabItem(
        tabName = "exam",
        
        h2("Exam Analysis"),
        
        fluidRow(
          
          box(
            title = "Exam Preparation Days",
            width = 6,
            plotlyOutput("preparation_plot")
          ),
          
          box(
            title = "Questions Attempted vs Correct",
            width = 6,
            plotlyOutput("questions_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Time Management vs Exam Score",
            width = 6,
            plotlyOutput("time_management_plot")
          ),
          
          box(
            title = "Exam Anxiety vs Exam Score",
            width = 6,
            plotlyOutput("anxiety_plot")
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Exam Difficulty",
            width = 6,
            plotlyOutput("difficulty_plot")
          ),
          
          box(
            title = "Exam Score by Difficulty",
            width = 6,
            plotlyOutput("difficulty_score_plot")
          )
          
        )
        
      ),
      
      # ======================================================
      # STATISTICS
      # ======================================================
      
      tabItem(
        tabName = "statistics",
        
        h2("Statistical Analysis"),
        
        fluidRow(
          
          box(
            title = "Select Variables",
            width = 4,
            
            selectInput(
              "numeric_x",
              "Numerical Variable:",
              choices = NULL
            ),
            
            selectInput(
              "numeric_y",
              "Outcome Variable:",
              choices = NULL
            )
            
          ),
          
          box(
            title = "Correlation",
            width = 8,
            
            verbatimTextOutput("correlation_result")
            
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Scatterplot",
            width = 12,
            
            plotlyOutput("scatter_analysis")
            
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Linear Regression",
            width = 12,
            
            verbatimTextOutput("linear_regression")
            
          )
          
        )
        
      ),
      
      # ======================================================
      # PREDICTION
      # ======================================================
      
      tabItem(
        tabName = "prediction",
        
        h2("Predictive Analysis"),
        
        fluidRow(
          
          box(
            title = "Exam Score Prediction Model",
            width = 12,
            
            verbatimTextOutput("prediction_model")
            
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Predicted vs Actual Exam Score",
            width = 12,
            
            plotlyOutput("prediction_plot")
            
          )
          
        )
        
      ),
      
      # ======================================================
      # MISSING DATA
      # ======================================================
      
      tabItem(
        tabName = "missing",
        
        h2("Missing Data Analysis"),
        
        fluidRow(
          
          box(
            title = "Missing Values by Variable",
            width = 12,
            
            plotlyOutput("missing_plot")
            
          )
          
        ),
        
        fluidRow(
          
          box(
            title = "Missing Data Table",
            width = 12,
            
            DTOutput("missing_table")
            
          )
          
        )
        
      ),
      
      # ======================================================
      # DATA
      # ======================================================
      
      tabItem(
        tabName = "data",
        
        h2("Data Explorer"),
        
        fluidRow(
          
          box(
            title = "Filters",
            width = 4,
            
            selectInput(
              "filter_gender",
              "Gender:",
              choices = "All"
            ),
            
            selectInput(
              "filter_school",
              "School Type:",
              choices = "All"
            ),
            
            selectInput(
              "filter_performance",
              "Performance Level:",
              choices = "All"
            ),
            
            selectInput(
              "filter_pass",
              "Pass Status:",
              choices = "All"
            )
            
          ),
          
          box(
            title = "Filtered Data",
            width = 8,
            
            downloadButton(
              "download_data",
              "Download Filtered Data"
            ),
            
            DTOutput("student_table")
            
          )
          
        )
        
      )
      
    )
    
  )
)


# ============================================================
# SERVER
# ============================================================

server <- function(input, output, session) {
  
  # ----------------------------------------------------------
  # LOAD DATA
  # ----------------------------------------------------------
  
  data <- reactive({
    
    read.csv(
      "cleaned_student_analysis.csv",
      stringsAsFactors = FALSE
    )
    
  })
  
  
  # ----------------------------------------------------------
  # UPDATE SELECTORS
  # ----------------------------------------------------------
  
  observe({
    
    df <- data()
    
    updateSelectInput(
      session,
      "numeric_x",
      choices = names(
        df[sapply(df, is.numeric)]
      )
    )
    
    updateSelectInput(
      session,
      "numeric_y",
      choices = names(
        df[sapply(df, is.numeric)]
      )
    )
    
    updateSelectInput(
      session,
      "filter_gender",
      choices = c(
        "All",
        sort(unique(df$gender))
      )
    )
    
    updateSelectInput(
      session,
      "filter_school",
      choices = c(
        "All",
        sort(unique(df$school_type))
      )
    )
    
    updateSelectInput(
      session,
      "filter_performance",
      choices = c(
        "All",
        sort(unique(df$performance_level))
      )
    )
    
    updateSelectInput(
      session,
      "filter_pass",
      choices = c(
        "All",
        sort(unique(df$pass_status))
      )
    )
    
  })
  
  
  # ==========================================================
  # OVERVIEW
  # ==========================================================
  
  output$total_students <- renderValueBox({
    
    valueBox(
      nrow(data()),
      "Total Students",
      icon = icon("users"),
      color = "blue"
    )
    
  })
  
  
  output$average_score <- renderValueBox({
    
    valueBox(
      round(mean(data()$exam_score, na.rm = TRUE), 2),
      "Average Exam Score",
      icon = icon("graduation-cap"),
      color = "green"
    )
    
  })
  
  
  output$average_gpa <- renderValueBox({
    
    valueBox(
      round(mean(data()$previous_gpa, na.rm = TRUE), 2),
      "Average Previous GPA",
      icon = icon("star"),
      color = "yellow"
    )
    
  })
  
  
  output$pass_rate <- renderValueBox({
    
    pass_rate <- mean(
      data()$pass_status == "Pass",
      na.rm = TRUE
    ) * 100
    
    valueBox(
      paste0(round(pass_rate, 2), "%"),
      "Pass Rate",
      icon = icon("check"),
      color = "purple"
    )
    
  })
  
  
  # ----------------------------------------------------------
  # GRADE
  # ----------------------------------------------------------
  
  output$grade_plot <- renderPlotly({
    
    p <- data() %>%
      count(performance_grade) %>%
      ggplot(
        aes(
          x = performance_grade,
          y = n,
          fill = performance_grade
        )
      ) +
      geom_col() +
      labs(
        x = "Grade",
        y = "Number of Students"
      ) +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ----------------------------------------------------------
  # PERFORMANCE LEVEL
  # ----------------------------------------------------------
  
  output$performance_level_plot <- renderPlotly({
    
    p <- data() %>%
      count(performance_level) %>%
      ggplot(
        aes(
          x = performance_level,
          y = n,
          fill = performance_level
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ----------------------------------------------------------
  # SCORE DISTRIBUTION
  # ----------------------------------------------------------
  
  output$score_distribution <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(x = exam_score)
    ) +
      geom_histogram(
        bins = 30
      ) +
      theme_minimal() +
      labs(
        x = "Exam Score",
        y = "Number of Students"
      )
    
    ggplotly(p)
    
  })
  
  
  # ----------------------------------------------------------
  # ATTENDANCE
  # ----------------------------------------------------------
  
  output$attendance_score_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = attendance_percentage,
        y = exam_score
      )
    ) +
      geom_point(
        alpha = 0.15
      ) +
      geom_smooth(
        method = "lm",
        se = TRUE
      ) +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ==========================================================
  # DEMOGRAPHICS
  # ==========================================================
  
  output$gender_plot <- renderPlotly({
    
    p <- data() %>%
      count(gender) %>%
      ggplot(
        aes(
          x = gender,
          y = n,
          fill = gender
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$education_plot <- renderPlotly({
    
    p <- data() %>%
      count(education_level) %>%
      ggplot(
        aes(
          x = education_level,
          y = n,
          fill = education_level
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$school_type_plot <- renderPlotly({
    
    p <- data() %>%
      count(school_type) %>%
      ggplot(
        aes(
          x = school_type,
          y = n,
          fill = school_type
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$income_plot <- renderPlotly({
    
    p <- data() %>%
      count(family_income) %>%
      ggplot(
        aes(
          x = family_income,
          y = n,
          fill = family_income
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$parent_education_plot <- renderPlotly({
    
    p <- data() %>%
      count(parent_education) %>%
      ggplot(
        aes(
          x = parent_education,
          y = n,
          fill = parent_education
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$urban_plot <- renderPlotly({
    
    p <- data() %>%
      count(urban_rural) %>%
      ggplot(
        aes(
          x = urban_rural,
          y = n,
          fill = urban_rural
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$age_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(x = age)
    ) +
      geom_histogram(
        bins = 20
      ) +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ==========================================================
  # ACADEMIC
  # ==========================================================
  
  output$previous_exam_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = previous_exam_score,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$gpa_exam_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = previous_gpa,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$academic_attendance_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = attendance_percentage,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$assignment_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = assignment_completion_rate,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$participation_plot <- renderPlotly({
    
    p <- data() %>%
      group_by(class_participation) %>%
      summarise(
        average_score = mean(
          exam_score,
          na.rm = TRUE
        )
      ) %>%
      ggplot(
        aes(
          x = class_participation,
          y = average_score,
          fill = class_participation
        )
      ) +
      geom_col() +
      labs(
        y = "Average Exam Score"
      ) +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$pass_plot <- renderPlotly({
    
    p <- data() %>%
      count(pass_status) %>%
      ggplot(
        aes(
          x = pass_status,
          y = n,
          fill = pass_status
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ==========================================================
  # STUDY HABITS
  # ==========================================================
  
  output$study_hours_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = study_hours_per_day,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$self_study_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = self_study_hours,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$consistency_plot <- renderPlotly({
    
    p <- data() %>%
      group_by(study_consistency) %>%
      summarise(
        average_score = mean(
          exam_score,
          na.rm = TRUE
        )
      ) %>%
      ggplot(
        aes(
          x = study_consistency,
          y = average_score,
          fill = study_consistency
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$environment_plot <- renderPlotly({
    
    p <- data() %>%
      group_by(study_environment) %>%
      summarise(
        average_score = mean(
          exam_score,
          na.rm = TRUE
        )
      ) %>%
      ggplot(
        aes(
          x = study_environment,
          y = average_score,
          fill = study_environment
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$method_plot <- renderPlotly({
    
    p <- data() %>%
      count(study_method) %>%
      ggplot(
        aes(
          x = reorder(study_method, n),
          y = n,
          fill = study_method
        )
      ) +
      geom_col() +
      coord_flip() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$revision_plot <- renderPlotly({
    
    p <- data() %>%
      count(revision_frequency) %>%
      ggplot(
        aes(
          x = revision_frequency,
          y = n,
          fill = revision_frequency
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$practice_tests_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = practice_tests_completed,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$notes_plot <- renderPlotly({
    
    p <- data() %>%
      group_by(notes_quality) %>%
      summarise(
        average_score = mean(
          exam_score,
          na.rm = TRUE
        )
      ) %>%
      ggplot(
        aes(
          x = notes_quality,
          y = average_score,
          fill = notes_quality
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ==========================================================
  # WELLBEING
  # ==========================================================
  
  output$sleep_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = sleep_hours,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$sleep_quality_plot <- renderPlotly({
    
    p <- data() %>%
      group_by(sleep_quality) %>%
      summarise(
        average_score = mean(
          exam_score,
          na.rm = TRUE
        )
      ) %>%
      ggplot(
        aes(
          x = sleep_quality,
          y = average_score,
          fill = sleep_quality
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$screen_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = daily_screen_time,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$activity_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = physical_activity_hours,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$stress_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = stress_level,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$motivation_plot <- renderPlotly({
    
    p <- data() %>%
      group_by(motivation_level) %>%
      summarise(
        average_score = mean(
          exam_score,
          na.rm = TRUE
        )
      ) %>%
      ggplot(
        aes(
          x = motivation_level,
          y = average_score,
          fill = motivation_level
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ==========================================================
  # TECHNOLOGY
  # ==========================================================
  
  output$internet_plot <- renderPlotly({
    
    p <- data() %>%
      mutate(
        internet = ifelse(
          internet_access == 1,
          "Yes",
          "No"
        )
      ) %>%
      count(internet) %>%
      ggplot(
        aes(
          x = internet,
          y = n,
          fill = internet
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$device_plot <- renderPlotly({
    
    p <- data() %>%
      count(device_availability) %>%
      ggplot(
        aes(
          x = device_availability,
          y = n,
          fill = device_availability
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$app_usage_plot <- renderPlotly({
    
    p <- data() %>%
      count(educational_app_usage) %>%
      ggplot(
        aes(
          x = educational_app_usage,
          y = n,
          fill = educational_app_usage
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$online_learning_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(x = online_learning_hours)
    ) +
      geom_histogram(bins = 30) +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$course_exam_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = online_course_hours,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$tuition_plot <- renderPlotly({
    
    p <- data() %>%
      mutate(
        tuition = ifelse(
          private_tuition == 1,
          "Yes",
          "No"
        )
      ) %>%
      group_by(tuition) %>%
      summarise(
        average_score = mean(
          exam_score,
          na.rm = TRUE
        )
      ) %>%
      ggplot(
        aes(
          x = tuition,
          y = average_score,
          fill = tuition
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ==========================================================
  # EXAM
  # ==========================================================
  
  output$preparation_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = exam_preparation_days,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$questions_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = questions_attempted,
        y = questions_correct
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$time_management_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = time_management_score,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$anxiety_plot <- renderPlotly({
    
    p <- ggplot(
      data(),
      aes(
        x = exam_anxiety_level,
        y = exam_score
      )
    ) +
      geom_point(alpha = 0.15) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$difficulty_plot <- renderPlotly({
    
    p <- data() %>%
      count(exam_difficulty) %>%
      ggplot(
        aes(
          x = exam_difficulty,
          y = n,
          fill = exam_difficulty
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$difficulty_score_plot <- renderPlotly({
    
    p <- data() %>%
      group_by(exam_difficulty) %>%
      summarise(
        average_score = mean(
          exam_score,
          na.rm = TRUE
        )
      ) %>%
      ggplot(
        aes(
          x = exam_difficulty,
          y = average_score,
          fill = exam_difficulty
        )
      ) +
      geom_col() +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ==========================================================
  # STATISTICAL ANALYSIS
  # ==========================================================
  
  output$correlation_result <- renderPrint({
    
    req(input$numeric_x, input$numeric_y)
    
    x <- data()[[input$numeric_x]]
    y <- data()[[input$numeric_y]]
    
    cor.test(
      x,
      y,
      use = "complete.obs"
    )
    
  })
  
  
  output$scatter_analysis <- renderPlotly({
    
    req(input$numeric_x, input$numeric_y)
    
    df <- data() %>%
      select(
        all_of(c(
          input$numeric_x,
          input$numeric_y
        ))
      ) %>%
      drop_na()
    
    # Sample for faster visualization
    if(nrow(df) > 10000){
      df <- df %>%
        slice_sample(n = 10000)
    }
    
    p <- ggplot(
      df,
      aes(
        x = .data[[input$numeric_x]],
        y = .data[[input$numeric_y]]
      )
    ) +
      geom_point(alpha = 0.3) +
      geom_smooth(method = "lm") +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$linear_regression <- renderPrint({
    
    req(input$numeric_x, input$numeric_y)
    
    df <- data() %>%
      select(
        all_of(c(
          input$numeric_x,
          input$numeric_y
        ))
      ) %>%
      drop_na()
    
    model <- lm(
      as.formula(
        paste(
          input$numeric_y,
          "~",
          input$numeric_x
        )
      ),
      data = df
    )
    
    summary(model)
    
  })
  
  
  # ==========================================================
  # PREDICTIVE MODEL
  # ==========================================================
  
  prediction_model_object <- reactive({
    
    df <- data() %>%
      select(
        exam_score,
        previous_exam_score,
        previous_gpa,
        attendance_percentage,
        assignment_completion_rate,
        study_hours_per_day,
        self_study_hours,
        sleep_hours,
        stress_level,
        exam_anxiety_level,
        time_management_score,
        physical_activity_hours
      ) %>%
      drop_na()
    
    lm(
      exam_score ~
        previous_exam_score +
        previous_gpa +
        attendance_percentage +
        assignment_completion_rate +
        study_hours_per_day +
        self_study_hours +
        sleep_hours +
        stress_level +
        exam_anxiety_level +
        time_management_score +
        physical_activity_hours,
      data = df
    )
    
  })
  
  
  output$prediction_model <- renderPrint({
    
    summary(
      prediction_model_object()
    )
    
  })
  
  
  output$prediction_plot <- renderPlotly({
    
    model <- prediction_model_object()
    
    df <- model$model
    
    df$predicted <- predict(model)
    
    p <- ggplot(
      df,
      aes(
        x = exam_score,
        y = predicted
      )
    ) +
      geom_point(alpha = 0.2) +
      geom_abline(
        slope = 1,
        intercept = 0
      ) +
      labs(
        x = "Actual Exam Score",
        y = "Predicted Exam Score"
      ) +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  # ==========================================================
  # MISSING DATA
  # ==========================================================
  
  missing_data <- reactive({
    
    df <- data()
    
    tibble(
      variable = names(df),
      missing = sapply(
        df,
        function(x) sum(is.na(x))
      )
    ) %>%
      mutate(
        percentage = round(
          missing / nrow(df) * 100,
          2
        )
      ) %>%
      arrange(
        desc(missing)
      )
    
  })
  
  
  output$missing_plot <- renderPlotly({
    
    df <- missing_data() %>%
      filter(missing > 0)
    
    p <- ggplot(
      df,
      aes(
        x = reorder(variable, missing),
        y = missing
      )
    ) +
      geom_col() +
      coord_flip() +
      labs(
        x = "Variable",
        y = "Number of Missing Values"
      ) +
      theme_minimal()
    
    ggplotly(p)
    
  })
  
  
  output$missing_table <- renderDT({
    
    datatable(
      missing_data(),
      options = list(
        pageLength = 15,
        scrollX = TRUE
      )
    )
    
  })
  
  
  # ==========================================================
  # DATA EXPLORER
  # ==========================================================
  
  filtered_data <- reactive({
    
    df <- data()
    
    if(input$filter_gender != "All"){
      
      df <- df %>%
        filter(
          gender == input$filter_gender
        )
      
    }
    
    if(input$filter_school != "All"){
      
      df <- df %>%
        filter(
          school_type == input$filter_school
        )
      
    }
    
    if(input$filter_performance != "All"){
      
      df <- df %>%
        filter(
          performance_level ==
            input$filter_performance
        )
      
    }
    
    if(input$filter_pass != "All"){
      
      df <- df %>%
        filter(
          pass_status ==
            input$filter_pass
        )
      
    }
    
    df
    
  })
  
  
  output$student_table <- renderDT({
    
    datatable(
      filtered_data(),
      filter = "top",
      options = list(
        pageLength = 20,
        scrollX = TRUE
      )
    )
    
  })
  
  
  output$download_data <- downloadHandler(
    
    filename = function(){
      
      paste0(
        "filtered_student_data_",
        Sys.Date(),
        ".csv"
      )
      
    },
    
    content = function(file){
      
      write.csv(
        filtered_data(),
        file,
        row.names = FALSE
      )
      
    }
    
  )
  
}


# ============================================================
# RUN APPLICATION
# ============================================================

shinyApp(
  ui = ui,
  server = server
) 