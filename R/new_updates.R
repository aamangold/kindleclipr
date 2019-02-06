#' @title Pull new highlights and writes them to Google Sheet
#'
#' @description Pull list of highlights not already in googlesheets file. To use if you have Google Sheets doc to store your Kindle highlights.
#' @param gsworkbook Name of the Google Sheets workbook (file name) where your Kindle clippings are managed.
#' @param gsworksheet Name of the Google Sheets workbook (tab name) where your Kindle clippings are managed.
#' @import lubridate
#' @import googlesheets
#' @import magrittr
#' @import dplyr
#'
#' @export
#' @examples
#' clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
#' kindle_updates_gs(gsworkbook = "My Workbook Name", gsworksheet = "My Worksheet Name")
#' 

kindle_updates_gs <- function(gsworkbook, gsworksheet) {
    
    bookR <- googlesheets::gs_title(gsworkbook)
    
    last_clip <- bookR %>% 
        googlesheets::gs_read(ws = gsworksheet) %>% 
        dplyr::summarize(date = max(date))
    
    my_new_clippings <- kindleclipr::all_my_clippings() %>% 
        dplyr::filter(date > lubridate::ymd_hms(last_clip))
    
    bookR %>% 
        googlesheets::gs_add_row(ws = gsworksheet, input = my_new_clippings)

}
