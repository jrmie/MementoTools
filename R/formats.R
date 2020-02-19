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
  #header = pkg_resource("reports/html/header.html")

  # call the base html_document function
  rmarkdown::html_document(
    template = template,
    css = css,
    toc = TRUE,
    toc_float = TRUE,
    toc_depth = 3,
    collapsed = FALSE,
    theme = "journal")
}