#' @title Extract and clean full Kindle clippings file
#'
#' @description This function loads the "My Clippings.txt" file generated from your Kindle highlights and creates a tidy data frame.
#' @param data Download the "My_Clippings.txt" file from your Kindle and read into R as clippings_txt.
#' @import lubridate
#' @import purrr
#' @import magrittr
#' @import stringr
#' @import dplyr
#' @import tibble
#'
#' @export
#' @examples
#' clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
#' all_my_clippings(data = clippings_txt)
#'
#'

all_my_clippings <- function(data = clippings_txt) {
    data %>%
        strsplit("==========") %>%
        unlist() %>%
        stringr::str_split("\r\n") %>%
        purrr::map_df(tidy_clippings) %>%
        dplyr::filter(!is.na(author)) %>%
        dplyr::mutate(upload_date = lubridate::today())

}

#' @title Tidy Clippings
#'
#' @description This function puts clippings file into a tidy format
#' @param data Reference "My_Clippings.txt" file downloaded from Kindle and read into R.
#' @import lubridate
#' @import purrr
#' @import magrittr
#' @import stringr
#' @import dplyr
#' @import tibble
#'
#'

tidy_clippings <- function(data) {

    tibble::tibble(
        title = data[2] %>%
            gsub("\\(.*\\)", "",.) %>%
            stringr::str_trim(side = "both"),

        author =
            dplyr::if_else(stringr::str_count(data[2], "\\(") > 1,
                    gsub("^[^-]+\\(|\\).*", "", data[2]),
                    (data[2] %>%
                         stringr::str_extract("\\(.*\\)") %>%
                         gsub("\\(|\\)", "", .))
            ),

        page = data[3] %>%
            gsub('.*page ', '', .) %>%
            stringr::word(1) %>%
            as.numeric(),

        date = data[3] %>%
            gsub('.*day, ', '', .) %>%
            lubridate::mdy_hms(),

        highlight = data[5],

        metadata = paste0(data[2], data[3])

    )
}

