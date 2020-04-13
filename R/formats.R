################################################################################
#            Functions to define formats of the templates                      #
################################################################################


memento_html <- function() {

  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "MementoTools")
  }

  css    = pkg_resource("rmarkdown/templates/formats/html/styles.css")
  template = pkg_resource("rmarkdown/templates/formats/html/default.html")
  logo = pkg_resource("rmarkdown/templates/formats/logo/memento.png")
  arg_logo <- rmarkdown::pandoc_variable_arg("logo", logo)

  # call the base html_document function
  rmarkdown::html_document(
    template = template,
    pandoc_args = c(arg_logo),
    css = css,
    toc = TRUE,
    toc_float = TRUE,
    toc_depth = 3,
    collapsed = FALSE)
}

memento_pdf <- function() {

  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "MementoTools")
  }

  theme_perso    = pkg_resource("rmarkdown/templates/formats/pdf/perso.theme")
  template = pkg_resource("rmarkdown/templates/formats/pdf/default.latex")
  logo = pkg_resource("rmarkdown/templates/formats/logo/memento.png")
  arg_logo <- rmarkdown::pandoc_variable_arg("logo", logo)
  arg_theme <- paste0("--highlight-style=", theme_perso)

  # call the base html_document function
  rmarkdown::pdf_document(
    template = template,
    pandoc_args = c(arg_logo, arg_theme),
    toc = TRUE,
    toc_depth = 3,
    fig_width = 6.5,
    fig_height = 4)
}

memento_beamer <- function() {

  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "MementoTools")
  }

  template = pkg_resource("rmarkdown/templates/formats/beamer/default.latex")
  theme_perso    = pkg_resource("rmarkdown/templates/formats/beamer/perso.theme")
  arg_theme <- paste0("--highlight-style=", theme_perso)
  logo = pkg_resource("rmarkdown/templates/formats/logo/memento.png")
  arg_logo <- rmarkdown::pandoc_variable_arg("logo_memento", logo)

  # call the base beamer_presentation function
  rmarkdown::beamer_presentation(
    template = template,
    slide_level = 1,
    theme = "Madrid",
    fig_height = 5,
    pandoc_args = c(arg_logo, arg_theme)
  )
}


