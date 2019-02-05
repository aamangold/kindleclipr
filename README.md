# kindleclipr
R script to create a tidy data frame from your Kindle "My Clippings.txt" highlights.


## Setup
Connect your Kindle to the computer and copy the "My Clippings.txt" file. Then use the readr package to extract the file:

> *clippings_txt <- readr::read_file(here::here("data/My Clippings.txt"))*

Note that I used the clippings output from my Kindle Paperwhite 2nd edition. File formatting may change across device editions.


## Usage

> *my_clippings <- all_my_clippings()*


## Credits

This application uses other open source software components. Inspiration (and a lot of the regex syntax) from the **kindle_notes** package (https://github.com/RMHogervorst/kindle_notes). My Kindle's clippings file format had changed since the creation of that package.
