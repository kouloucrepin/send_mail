library(rmarkdown)
rmarkdown::render("docsetup.qmd", output_format = "html_document",output_file="docsetup.html")
Sys.sleep(10)
library(emayili)

smtp <- server(
  host = "smtp.gmail.com",
  port = 587,
  username = Sys.getenv("GMAIL_USERNAME"),
  password = Sys.getenv("GMAIL_PASSWORD")
)


my_rmd_message <- envelope() |>
  from(Sys.getenv("GMAIL_USERNAME")) |>
  to(Sys.getenv("GMAIL_USERNAME")) |>
  subject("Email from an R Markdown file") |>
  attachment("docsetup.html")




smtp(my_rmd_message, verbose = TRUE)








