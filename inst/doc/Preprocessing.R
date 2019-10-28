## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----Begin textcleaner, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Run 'textcleaner'
#  clean <- textcleaner(data = open.animals[,-c(1:2)], miss = 99,
#                       partBY = "row", dictionary = "animals")

## ----tab2, echo = FALSE, eval = TRUE, comment = NA, warning = FALSE------
output <- matrix(c("`data`", "A matrix or data frame object that contains the participants' IDs and semantic data",
                   "`miss`", "A number or character that corresponds to the symbol used for missing data. The default is set to `99`",
                   "`partBY`", 'Specifies whether participants are across the rows (`"row"`) or down the columns (`"col"`)',
                   "`dictionary`", 'Specifies which dictionaries from SemNetDictionaries should be used (more than one is possible). If no dictionary is chosen, then the `"general"` dictionary is used',
                   "`tolerance`", "Enables automated spell-checking using the Damerau-Levenshtein distance (defaults to `1`)"),
                 ncol = 2, byrow = TRUE)


htmlTable::htmlTable(output,
          header = c("Argument", "Description"),
          caption = "Table 2. textcleaner Arguments")

## ----tab3, echo = FALSE, eval = TRUE, comment = NA, warning = FALSE------
output <- matrix(c("`11:ADD TO DICTIONARY`", "Allows user to add the response to a temporary appendix dictionary",
                   "`12:TYPE MY OWN`", "Allows user to type their own response if it is not provided in the potential response options (if necessary, multiple responses can be typed using spaces)",
                   "`13:GOOGLE IT`", "Opens the user's default internet browser to Google's webpage and searches for a definition of the original response using the terms: dictionary 'RESPONSE'",
                   "`14:BAD RESPONSE`", "Marks the original response as bad and makes it so the response will be missing (i.e., `NA`) and not included in the final results",
                   "`15:SKIP`", "Allows the original response to be included in the final results but does not add it to the temporary appendix dictionary",
                   "`16:CONTEXT`", "(Single responses only) Provides the target response in context of the participant's other responses. Will print each participant's responses that provide the target response",
                   "`16:BAD STRING`", "(Continuous strings only) Marks the entire continuous string of responses as bad and makes all responses missing (i.e., `NA`) and not included in the final results"),
                 ncol = 2, byrow = TRUE)


htmlTable::htmlTable(output,
          header = c("Option", "Description"),
          caption = "Table 3. Additional Response Options")

## ----tab4, echo = FALSE, eval = TRUE, comment = NA, warning = FALSE------
output <- matrix(c("`creatures`", "`14:BAD RESPONSE`", "---",
                   "`catefrog`", "`12:TYPE MY OWN`", "cat frog",
                   "`criters`", "`14:BAD RESPONSE`", "---",
                   "`mario`", "`14:BAD RESPONSE`", "---",
                   "`garafi`", "`14:BAD RESPONSE`", "---",
                   "`snack`", "`14:BAD RESPONSE`", "---",
                   "`girrage`", "`14:BAD RESPONSE`", "---",
                   "`<<gieuna>> pig`", "`12:TYPE MY OWN`", "guinea",
                   "`jesus`", "`14:BAD RESPONSE`", "---",
                   "`squrill`", "`5:squirrel`", "---"),
                 ncol = 3, byrow = TRUE)


htmlTable::htmlTable(output,
          header = c("Prompt", "Selection", "Type My Own"),
          caption = "Table 4. Responses for next ten prompts")

## ----tab5, echo = FALSE, eval = TRUE, comment = NA, warning = FALSE------
output <- matrix(c("`binary`", "---", "Binary response matrix where rows are participants and columns are responses. 1's are responses given by a participant and 0's are responses not given by a participant",
                   "`responses`", "", "",
                   "", "`clean.resp`", "Spell-corrected response matrix where the ordering of the original responses are preserved. Inappropriate and duplicate responses have been removed",
                   "", "`orig.resp`", "Original response matrix where uppercase letters were made to lowercase and white spaces before and after responses were removed",
                   "`spellcheck`", "", "",
                   "", "`full`", "List of all responses whether or not they have been spell-corrected",
                   "", "`auto`", "List of only unique responses that were auto-corrected and corrected by the user",
                   "`removed`", "", "",
                   "", "`rows`", "Vector of rows for the participants with no appropriate responses",
                   "", "`ids`", "Vector of the participants' IDs with no appropriate responses",
                   "`partChanges`", "`ID`", "List of list objects labeled with each participant's ID variable. Each participant's list contains a data frame of the specific words that were changed for the participant"),
                 ncol = 3, byrow = TRUE)


htmlTable::htmlTable(output,
          header = c("Object", "Nested Object", "Description"),
          caption = "Table 5. `textcleaner` and `correct.changes` Output Objects")

## ----View unique changes, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # View unique spelling changes
#  View(clean$spellcheck$auto)

## ----correct changes example, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Corrected 'clean' object from 'textcleaner'
#  corr.clean <- correct.changes(textcleaner.obj = clean,
#                                dictionary = "animals",
#                                incorrect = c("house", "beasts", "god",
#                                              "gunny pig", "liam", "loin",
#                                              "farrot", "oh my", "lizers",
#                                              "teranchilla","manster", "lamp"))

## ----tab6, echo = FALSE, eval = TRUE, comment = NA, warning = FALSE------
output <- matrix(c("`house`", "`mouse`", "`3:BAD RESPONSE`", "---",
                   "`beasts`", "`yeast`", "`3:BAD RESPONSE`", "---",
                   "`god`", "`cod`", "`3:BAD RESPONSE`", "---",
                   "`gunny pig`", "`'bunny' 'pig'`", "`4:guinea pig`", "---",
                   "`liam`", "`lion`", "`3:BAD RESPONSE`", "---",
                   "`loin`", "`loon`", "`4:lion`", "---",
                   "`farrot`", "`parrot`", "`1:TYPE MY OWN`", "ferret",
                   "`oh my`", "`ox`", "`3:BAD RESPONSE`", "---",
                   "`lizers`", "`liger`", "`5:lizard`", "---",
                   "`teranchilla`", "`chinchilla`", "`5:tarantula`", "---",
                   "`manster`", "`hamster`", "`3:BAD RESPONSE`", "---",
                   "`lamp`", "`lamb`", "`3:BAD RESPONSE`", "---"),
                 ncol = 4, byrow = TRUE)


htmlTable::htmlTable(output,
          header = c("From", "To", "Selection", "Type My Own"),
          caption = "Table 6. Responses for `correct.changes`")

## ----Export spell-check changes, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Save .csv of unique changes
#  write.csv(corr.clean$spellcheck$auto,
#            "unique_changes.csv", row.names = FALSE)

## ----Export clean responses, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Save .csv of clean responses
#  write.csv(corr.clean$responses$clean.resp, "cleaned_verbal_fluency.csv")

## ----Response totals, echo = TRUE, eval = FALSE, comment = NA, warning = FALSE----
#  # Verbal fluency response totals
#  totals <- rowSums(corr.clean$binary)

