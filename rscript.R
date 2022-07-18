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

as.numeric(mean(bikedata1$ride_length), units = "mins")