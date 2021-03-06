
# shiny::runApp('inst/UI/DataEntry/CAPTURES', launch.browser =  TRUE)

  source(system.file('UI', 'global_settings.R', package = 'wadeR'))


  tableName       = 'CAPTURES'
  package         = 'wadeR'
  excludeColumns = c('pk', 'PC', 'nov', 'start_capture','bled_time','plasma','haema')
  n_empty_lines   =  30
  
# table summary function
  describeTable <- function() {
    x = idbq('select ID, species from CAPTURES where ID is not NULL')

    data.table(
        N_entries = nrow(x), 
        N_unique_IDs = length(unique(x$ID))
           )
  }

  comments = column_comment(user, host, db, pwd, tableName,excludeColumns)


  authors = idbq('select initials from AUTHORS')$initials



# Define UI table  
  uitable = emptyFrame(user, host, db, pwd, tableName, n = n_empty_lines, excludeColumns, 
    preFilled = list( date_ = format(Sys.Date(), "%Y-%m-%d")  ) ) %>% 
    rhandsontable %>% 
    hot_cols(columnSorting = FALSE, manualColumnResize = TRUE) %>%
    hot_rows(fixedRowsTop = 1) %>%
    hot_col(col = "author", type = "dropdown", source = authors )



