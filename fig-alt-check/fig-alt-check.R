# load packages

# pak::pak("rundel/parsermd") # need dev version
library(parsermd)
library(here)

# find cells that have ggplot() but not fig-alt

missing_fig_alt <- here::here("fig-alt-check/data-hello.qmd") |>
  parse_qmd() |> 
  rmd_select(
    has_type("rmd_chunk") & 
    has_code("ggplot\\(") & 
    !has_option("fig-alt")
  )

# get labels of cells without fig-alt

rmd_node_label(missing_fig_alt)

# get contents of cells without fig-alt

as_document(missing_fig_alt)
