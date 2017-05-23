# Exercise-1
# Developed from: http://tidytextmining.com/

# Set up (install packages that you don't have)
library(janeaustenr)
library(tidytext)
library(dplyr)
library(stringr)
library(ggplot2)

# Load booksinto a dataframe using the austen_books() function
books <- austen_books()

# How many books are in the dataset?
number.of.books <- group_by(books, book) %>% summarise(count = n()) %>% nrow()

# Which book has the most lines?
most.lines <- group_by(books, book) %>% summarise(count = n()) %>% filter(max(count) == count)

# Use the unnest_tokens function to generate the full list of words
all.words <- books %>% unnest_tokens(word, text)

# Which words are most common (regardless of which book them come from)?
common.words <- group_by(all.words, word) %>% summarise(count = n()) %>% arrange(desc(count))

# Remove stop words by performing an anti_join with the stop_words dataframe
no.stop.words <- all.words %>% anti_join(stop_words, by="word")

# Which non stop-words are most common?
common.not.stop.words <- group_by(no.stop.words, word) %>% summarise(count = n()) %>% arrange(desc(count))

# Use ggplot to make a horizontal bar chart of the word frequencies of non-stop words

