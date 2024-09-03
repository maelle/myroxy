#' @importFrom roxygen2 roxy_tag_parse
#' @importFrom roxygen2 roxy_tag_rd
NULL

#' @export
# same as https://roxygen2.r-lib.org/articles/extending.html#creating-a-new-roclet
roxy_tag_parse.roxy_tag_custom <- function(x) {
  roxygen2::tag_markdown(x)
}

#' @export
# same as https://roxygen2.r-lib.org/articles/extending.html#creating-a-new-roclet
roxy_tag_rd.roxy_tag_custom <- function(x, base_path, env) {
  roxygen2::rd_section("custom", x$val)
}

#' @export
# same as https://roxygen2.r-lib.org/articles/extending.html#creating-a-new-roclet
format.rd_section_custom <- function(x, ...) {
  paste0(
    "\\section{Custom section}{\n",
    "\\itemize{\n",
    paste0("  \\item ", x$value, "\n", collapse = ""),
    "}\n",
    "}\n"
  )
}

#' @export
# https://github.com/shahronak47/informationtag
custom_roclet <- function() {
  roxygen2::roclet("custom")
}

#' @importFrom roxygen2 block_get_tags roclet_process
#' @method roclet_process roclet_custom
#' @export
# https://github.com/shahronak47/informationtag
roclet_process.roclet_custom <- function(x, blocks, env, base_path) {
  x
}


#' @export
#' @importFrom roxygen2 block_get_tags roclet_output
roclet_output.roclet_custom <- function(x, results, base_path, ...) {
  x
}
