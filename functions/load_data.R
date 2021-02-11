library(dplyr)
library(tidyr)
library("RPostgreSQL")

# connect to postgresql to get data (in rivanna)
conn <- dbConnect(drv = PostgreSQL(),
                  dbname = "sdad",
                  host = "10.250.124.195",
                  port = 5432,
                  user = Sys.getenv("db_userid"),
                  password = Sys.getenv("db_pwd"))
# query the bipartite edgelist data from github data
data <- dbGetQuery(conn, "SELECT * FROM american_soldier.survey_32_clean");
# disconnect from postgresql
dbDisconnect(conn)

# split into racial groups
S32N <- data %>% filter(racial_group == "black")
S32W <- data %>% filter(racial_group == "white")

# tidyfy the data
white_short <- tibble(index = S32W$index,
                      text = S32W$outfits_comment,
                      outfits = S32W$outfits,
                      racial_group = S32W$racial_group,
                      response_type = rep("short", nrow(S32W))) # Written response to "should soldiers be in separate outfits?"

white_long <- tibble(index = S32W$index,
                     text = S32W$long,
                     outfits = S32W$outfits,
                     racial_group = S32W$racial_group,
                     response_type = rep("long", nrow(S32W))) # Written response on overall thoughts on the survey

black_long <- tibble(index = S32N$index,
                     text = S32N$long,
                     racial_group = S32N$racial_group,
                     response_type = rep("long", nrow(S32N))) # Written response to overall thoughts on survey

# combine into one
s32 <- bind_rows(black_long, white_long, white_short)

# remove NAs
s32 <- s32 %>% filter(!is.na(text))
