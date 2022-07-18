bikedata1 %>% count(rideable_type)
bikedata1 %>% filter(rideable_type == "docked_bike")
bikedata1 %>% select(rideable_type, start_station_name, end_station_name) %>% count(start_station_name) %>% arrange(desc(n))
bikedata1 %>% count(rideable_type)
bikedata1[is.na(bikedata1$end_lng), ] 



%>% select(start_station_name, end_station_name, start_lat, start_lng, end_lat, end_lng) %>% count(end_lng)
bikedata1 <- bikedata1 %>% filter(!is.na(start_station_name))
bikedata1 <- na.omit(bikedata1)
bikedata1 %>% filter(started_at <= as_date("2021-05-31") | started_at >= as_date("2022-06-01"))
bikedata1 %>% filter(started_at >= as_date("2022-06-01"))
bikedata1 <- bikedata1 %>% filter(!rideable_type == "docked_bike")
bikedata1 %>% filter(rideable_type == "docked_bike")
aggregate(list(ride_length = bikedata1$ride_length), list(member_type = bikedata1$member_casual), mean)
class(bikedata1$ride_length)

aggregate(list(ride_length = bikedata1$ride_length), list(member_type = bikedata1$member_casual), mean)

as.numeric(mean(bikedata1$ride_length), units = "mins")

aggregate(bikedata1$ride_length, by = list(bikedata1$member_casual), mean)

bikedata1 <- list.files("data", full.names = TRUE, pattern = "*.csv") %>% 
  lapply(read_csv) %>% 
  bind_rows()
list.files("C:/Users/aguo1/Documents/coding_projects/bike_share_project/data") %>% lapply(read_csv) %>% bind_rows()
lengthbymember <- aggregate(as.numeric(bikedata1$ride_length) / 60, by = list(bikedata1$member_casual), mean) 

colnames(lengthbymember) <- c("member_type", "ride_length")
print(lengthbymember)
`colnames<-`()
is.factor()
class(bikedata1$ride_length)
typeof(bikedata1$ride_length)
mean(bikedata1$ride_length)
is.factor(bikedata1$ride_length)
?is.factor
is_numeric(bikedata1$ride_length)
as.numeric(bikedata1$ride_length)
bikedata1$ride_length <- difftime(bikedata1$ended_at, bikedata1$started_at, units = "auto")
?difftime
head(bikedata1$ride_length)
typeof(bikedata1$ride_length)
class(bikedata1$ride_length)
is.factor(bikedata1$ride_length)
bikedata1$ride_length <- as.numeric(bikedata1$ride_length)
is.numeric(bikedata1$ride_length)
is.character(bikedata1$ride_length)
minute(bikedata1$ride_length)
filter(bikedata1$ride_length < 0)
bikedata1 %>% select(ride_length) %>% filter(ride_length <= 0)
bikedata1 <- bikedata1 %>% filter(!ride_length <= 0)
aggregate(list(ride_length_mean = bikedata1$ride_length), list(member_type = bikedata1$member_casual, day_of_week = bikedata1$day_of_week), mean)
bikedata1$day_of_week <- ordered(bikedata1$day_of_week, levels = c('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'))
bikedata1 %>% mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + geom_col(position = "dodge")
counts <- aggregate(bikedata1$ride_length, list(bikedata1$member_casual, bikedata1$day_of_week), mean)
