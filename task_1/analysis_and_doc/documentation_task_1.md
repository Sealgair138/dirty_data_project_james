# Q1 Who had the longest long jump seen in the data?
```{r}
longest_jump <- dec_data_lc[order(dec_data_lc$long_jump, decreasing = TRUE),]
head(longest_jump,1)
```
# sorted long jump by decending order, this showed me that clay had the longest jump

# Q2 What was the average 100m time in each competition?
```{r}
dec_data_lc %>% 
  group_by(competition) %>% 
  summarise(avg = mean(x100m))
```
# grouped by competition and calculated the mean of the x100m column

# Q3 Who had the highest total points across both competitions?
```{r}
highest_total_points <- dec_data_lc %>%
  select(surname, points, competition) %>% 
  pivot_wider(names_from = competition,
              values_from = points)
highest_total_points$total_points=rowSums(cbind(highest_total_points$decastar, highest_total_points$olympicg))

head(highest_total_points, 1)
```
# i took the columns i need and made a new table, i then seperated the two competitions into their own columns, and added the points from each into a total for each surname, this gave me the person with the most points.

# Q4 What was the shot-put scores for the top three competitors in each competition?
```{r}
shot_put_scores <- dec_data_lc %>% 
  select(surname, shot_put, competition) %>% 
  pivot_wider(names_from = competition,
              values_from = shot_put)
```

```{r}
shit_put_scores <- shot_put_scores %>% 
  group_by(olympicg, decastar) %>% 
  arrange(desc(olympicg))
  head(shit_put_scores ,3)
```
#i took the columnns surname, shot_put< and competition and made a new table with them, i then pivoted the competition column so that the two competitons would have theor own column. i then arranged the columbs in descending order by olymicg. olymicg had the most competitors, this gave me the top 3 scores.
