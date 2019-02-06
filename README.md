# kindleclipr
R script to create a tidy data frame from your Kindle "My Clippings.txt" highlights.



## Setup
Connect your Kindle to the computer and copy the "My Clippings.txt" file. Then use the readr package to extract the file:

```
clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
```

Note that I used the clippings output from my Kindle Paperwhite 2nd edition. File formatting may change across device editions.


## Usage

<<<<<<< HEAD
### Get all Kindle clippings into a data frame.
```
clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
my_clippings <- all_my_clippings()
```





### Managing Kindle highlights from a Google Sheets doc

I like to manage my reading list through a Google Sheets doc and have added a tab for my Kindle highlights. In order to keep my edits and additional columns, I use this workflow to add any new additions since the last sync:

1. Read in the Kindle file with:
```
clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
```

2. **One-time only:** Populate your spreadsheet:
```
all_my_clippings <- all_my_clippings()
googlesheets::gs_edit_cells(ss = "My Workbook Name", ws = "My Worksheet Name", input = all_my_clippings)

```

3. **Ongoing updates:** Add new additions (**this will write data** to the Google Sheet you identify):
```
kindle_updates_gs("My Workbook Name", "My Worksheet Name")
```

=======
> *my_clippings <- all_my_clippings()*
>>>>>>> 21bacc2f3fe9d8012bccbebe80d2f045940ca7b2


## Credits

This application uses other open source software components. Inspiration (and a lot of the regex syntax) from the **kindle_notes** package (https://github.com/RMHogervorst/kindle_notes). I created this package becaust the format of my Kindle's clippings file had changed from what was used in kindle_notes. This package also uses Jenny Bryan's googlesheets package (https://github.com/jennybc/googlesheets) to sync Kindle highlights with a Google Sheet reading list.
