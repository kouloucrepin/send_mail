library(rmarkdown)
render("docsetup.qmd", output_format = "html_document")
library(emayili)

smtp <- server(
  host = "smtp.gmail.com",
  port = 587,
  username = Sys.getenv("GMAIL_USERNAME"),
  password = Sys.getenv("GMAIL_PASSWORD")
)


my_rmd_message <- envelope() |>
  from(Sys.getenv("GMAIL_USERNAME")) |>
  to(Sys.getenv("GMAIL_USERNAME"),"crepinkoulo@gmail.com") |>
  subject("Email from an R Markdown file") |>
  render("docsetup.html")


smtp(my_rmd_message, verbose = TRUE)







