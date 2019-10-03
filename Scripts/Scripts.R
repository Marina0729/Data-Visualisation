.libPaths(c("C:/Users/ale097/Data School/Packages"))
library(tidyverse)

read_csv("Data/gapminder.csv")
gapminder <- read_csv("Data/gapminder.csv")

gapminder

gapminder_1977 <- filter(gapminder, year == 1977)

gapminder_1977

gapminder_1987 <- filter(gapminder, year == 1987)

gapminder_1987

#create a plot using gapminder 1977 data
ggplot(data = gapminder_1977)

#must map an aesthetic name with a variable or column name in the data. 
#variable names are coutry, continent, year, lifeExp, pop, gdpPercap
#aesthetics are x, y, colour and size

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
  ) + geom_point() + scale_x_log10()


#must apply the geometry, in this case "point" for the aesthetics to be 
#applied to. Note that you layer the geometry on top of the mapping

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
) + geom_point() 


#you can then layer on any scales you want to apply to the mapping

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
  ) + geom_point() + scale_x_log10()

#TO SUMMARISE
#ggplot(<DATA>, <AESTHETIC MAPPING>) + <GEOMETRY FUNCTION> + <SCALE FUNTION>

#Challenge 4, experiment with substiuting variables
#variables include gdpPercap, lifeExp, continent, country, pop

ggplot(data = gapminder_1977,
       mapping = aes(x = lifeExp, y = gdpPercap, colour = continent)
       ) + geom_point() 

ggplot(data = gapminder_1977,
       mapping = aes(x = lifeExp, y = gdpPercap, colour = country)
      ) + geom_point() 

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap, y = lifeExp, colour = country)
      ) + geom_point() 

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap, y = lifeExp, colour = continent)
      ) + geom_point() 

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap, y = lifeExp, colour = country)
      ) + geom_point() 

ggplot(data = gapminder_1977,
       mapping = aes(x = pop, y = gdpPercap, colour = continent)
      ) + geom_point() + scale_x_log10()

ggplot(data = gapminder,
       mapping = aes(x = pop, y = gdpPercap, colour = continent)
) + geom_point() + scale_x_log10()

gapminder_1952 <- filter(gapminder, year == 1952)

gapminder_1952


ggplot(data = gapminder_1952,
       mapping = aes(x = lifeExp, y = gdpPercap, colour = continent)
       ) + geom_point() + scale_x_log10()

ggplot(
  data = gapminder_1952, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = pop, size = continent)
) + geom_point() + scale_x_log10() + scale_colour_continuous(type = "viridis")

#taking mapping outside the ggplot funtion

ggplot(data = gapminder_1977) + 
  geom_point(mapping = aes(x = gdpPercap,
                           y = lifeExp,
                           colour = continent,
                           size = pop)) +  
  scale_x_log10()

#but if you want to set a single aesthetic across the plot you have to 
#do it outside 

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, alpha = pop)
) + geom_point(shape = "star") + scale_x_log10() 

#Challenge 7
#shows how life expectancy has changed over time

ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp, colour = continent)
       ) + geom_line()


ggplot(data = gapminder, 
  mapping = aes(x = year,
                y = lifeExp,
                group = country,
                colour = continent)
) + geom_point() + geom_line()
#messy so how about we take out country data 

gapminder_minus_country <- select(gapminder, -country)

ggplot(data = gapminder_minus_country, 
       mapping = aes(x = year,
                     y = lifeExp,
                     colour = continent)
) + geom_line() + geom_point(color = "black")

ggplot(data = gapminder, 
       mapping = aes(x = year,
                     y = lifeExp,
                     group = country,
                     colour = continent)
) + geom_line() + geom_point(color = "black") 


ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent)) + 
  scale_x_log10() + 
  scale_color_manual(values = c("red", "green", "purple", "blue", "black"))


#Challenge 9
#Modify the color and size of the points on the point layer in the previous example.
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "orange", size = 1) + 
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5)


#Challenge 10
#Modify your solution to Challenge 9 so that the points 
#are now a different shape and are colored by continent 
#with new trendlines. Hint: The color argument can be used inside the aesthetic.

ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent, shape = continent)) +
  geom_point(size = 1.5) + 
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5) +
  scale_color_manual(values = c("#e41a1c","#377eb8","#4daf4a", "#984ea3", "#ff7f00"))

ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(size = 1.5, shape = "triangle") + 
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5) +
  scale_color_brewer(palette = "Dark2")

a_countries <- filter(gapminder, str_starts(country, "A"))

ggplot(data = a_countries, 
       mapping = aes(x = year, y = lifeExp, color = continent, group = country)) +
  geom_line() + 
  facet_wrap( ~ country)

gapminder_1977

gapminder_rich <- filter(gapminder_1977, gdpPercap > 30000)

gapminder_rich

#labelling an outlier 
ggplot(data = gapminder_1977, 
       mapping = aes(x = gdpPercap, 
                     y = lifeExp, 
                     color = continent, 
                     size = pop, 
                     label = country)) + 
  geom_point() + 
  scale_x_log10() + 
  geom_text(data = gapminder_rich, color = "black", size = 5)                                


#saving a plot into a variable and add a new layer
#labs

rough_plot <- ggplot(data = a_countries, 
       mapping = aes(x = year, y = lifeExp, color = continent, group = country)) +
  geom_line() + 
  facet_wrap( ~ country)

rough_plot + scale_color_brewer(palette = "Dark2")

modified_plot <- rough_plot + 
  labs(title = "Life Expentancy over time for 'A' countries", 
       caption = "Data from Gapminder",
       x = "Year", 
       y = "Life expextancy", 
       colour = "Continent") +
  theme(panel.grid.major = element_blank(), 
        plot.title = element_text(size = 4), 
        axis.text.x = element_text(size = 6),
        axis.text.y = element_text(size = 6))

ggsave("Figures/my_first_plot.png", plot = rough_plot, width = 12, 
       height = 10, units = "cm") 

ggsave("Figures/my_second_plot.png", plot = modified_plot)
