
bikedata1 %>% mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + geom_col(position = "dodge")

bikedata1 %>%
  group_by(member_casual, day_of_week) %>% 
  summarise(rides = n(), averageduration = mean(ride_length)) %>% 
  ggplot(aes(x = day_of_week, y = averageduration, fill = member_casual)) + geom_col(position = "dodge") + labs(x = "Day of Week", y = "Average Duration (seconds)", title = "Average Duration vs. Day of Week")

install.packages('rcartocolor')
options(dplyr.summarise.inform = FALSE)

bikedata1 %>% 
  mutate(month = format(as_date(started_at), "%b") %>% factor(levels = month.abb)) %>% 
  group_by(member_casual, month) %>% 
  arrange(month) %>% 
  summarise(rides = n(), average_duration = mean(ride_length)) %>% 
  ggplot(aes(x = month, y = average_duration, fill = member_casual)) + geom_col(position = "dodge") + scale_fill_carto_d(palette = "Vivid") + labs(x = "Month", y = "Average Ride Duration (Seconds)", title = "Average Ride Duration vs. Month for Members and Casual Riders") + theme(plot.title = element_text(hjust = 0.5), legend.title = element_blank())

aggregate(list(number_rides = count(bikedata1), list(member_type = bikedata1$member_casual, day_of_week = bikedata1$day_of_week), sum))

bikedata1 %>% group_by(member_casual, day_of_week) %>% summarise(rides = n(), day = day_of_week, membercas = member_casual)

aggregate(count(bikedata1), by = list(bikedata1$member_casual, bikedata1$day_of_week), sum)

bikedata1 %>% count(member_casual, day_of_week)
