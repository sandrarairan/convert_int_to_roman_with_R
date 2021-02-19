library(dplyr)
library(tidyr)
library(tibble)

convert_int_to_roman <- function(x) {
  
  if (x %in% .romans) {
    number_found <- which(.romans == x)
    return(names(.romans)[number_found])
  } else {
    
    romans_df <- tibble(
      char = names(.romans),
      num = .romans
      
    )
    
    numero_max <- romans_df %>%
      mutate(quotient = x %% num,
             remainder = x %/% num) %>%
      filter(quotient < x) %>%
      head(1)
    
    if  (pull(numero_max, quotient) == 0) {
      return(
        paste(collapse = "",rep(roman<- numero_max %>%  select(char, starts_with("char")),
                                remainders<- numero_max %>%  select(remainder, starts_with("remainder"))))
      )
    } else {
      return(paste0(
        paste(collapse = "", rep(roman<- numero_max %>%  select(char, starts_with("char")),
              remainders<- numero_max %>%  select(remainder, starts_with("remainder")))),
        pull(numero_max, quotient) %>% 
          convert_int_to_roman()
      ))
    }
    
  }
  
}


