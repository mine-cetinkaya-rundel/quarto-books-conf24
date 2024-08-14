# load packages

# pak::pak("rundel/parsermd") # need dev version
library(parsermd)
library(here)

# find chunks that has ggplot() but not fig-alt

missing_fig_alt <- parse_qmd(here::here("fig-alt-check/data-hello.qmd")) |> 
  rmd_select(
    has_type("rmd_chunk") & 
    has_code("ggplot\\(") & 
    !has_option("fig-alt")
  )

# get labels of cells without fig-alt

rmd_node_label(missing_fig_alt)

# get contents of cells without fig-alt

as_document(missing_fig_alt)
