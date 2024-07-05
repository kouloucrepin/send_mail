library(rmarkdown)
render("doc_setup.qmd", output_format = "html_document")
library(emayili)

print(Sys.getenv("GMAIL_USERNAME"))
smtp <- server(
  host = "smtp.gmail.com",
  port = 587,
  username = Sys.getenv("GMAIL_USERNAME"),
  password = Sys.getenv("GMAIL_PASSWORD")
)

print(Sys.getenv("GMAIL_USERNAME"))

my_rmd_message <- envelope() |>
  from(Sys.getenv("GMAIL_USERNAME")) |>
  to(Sys.getenv("GMAIL_USERNAME"),"crepinkoulo@gmail.com") |>
  subject("Email from an R Markdown file") |>
  render("doc_setup.html")

print(Sys.getenv("GMAIL_USERNAME"))

smtp(my_rmd_message, verbose = TRUE)







