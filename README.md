## kindleclipr
R script to create a tidy data frame from Kindle's "My Clippings.txt" highlights.

***

### Setup
1. Connect Kindle to your computer and copy the "My Clippings.txt" file. Instructions on how to find the "My Clippings.txt" file [here](http://www.missionarygeek.com/2011/05/view-your-kindle-notes-on-your-computer/).

2. Then use the readr package to extract the file:

```
clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
```

Note: clippings output in this package is from Kindle Paperwhite 2nd edition. File formatting may change across device editions.

***

### Usage

#### Get all Kindle clippings into a data frame.
```
clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
my_clippings <- all_my_clippings()
```



#### Managing Kindle highlights from a Google Sheets doc

I like to manage my reading list through a Google Sheets doc and have added a tab for my Kindle highlights. In order to keep my edits and additional columns, I use this workflow to add any new additions since the last sync:


1. Read in the Kindle file with:
```
clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
```



2. **One-time only:** Populate Google Sheets file with all :
```
all_my_clippings <- all_my_clippings()
googlesheets::gs_edit_cells(ss = "My Workbook Name", ws = "My Worksheet Name", input = all_my_clippings)
```


3. **Ongoing updates:** Add new additions after saving updated My Clippings file (**this will write data** to the Google Sheet identified):
```
clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))
kindle_updates_gs("My Workbook Name", "My Worksheet Name")
```

***

### Credits

Inspiration (and a lot of the regex syntax) comes from the `kindle_notes` [package](https://github.com/RMHogervorst/kindle_notes). I created `kindleclipr` because the format of my Kindle's clippings file had changed from what was used in `kindle_notes`. 



`kindleclipr` also uses Jenny Bryan's `googlesheets` [package](https://github.com/jennybc/googlesheets) to sync Kindle highlights with a Google Sheet reading list.
