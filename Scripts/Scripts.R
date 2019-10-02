.libPaths(c("C:/Users/ale097/Data School/Packages"))
library(tidyverse)

read_csv("Data/gapminder.csv")
gapminder <- read_csv("Data/gapminder.csv")

gapminder_1977 <- filter(gapminder, year == 1977)

gapminder_1977

#create a plot using gapminder 1977 data
ggplot(data = gapminder_1977)

#must map an aesthetic name with a variable or column name in the data. 
#variable names are coutry, continent, year, lifeExp, pop, gdpPercap
#aesthetics are x, y, colour and size

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
)

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
       mapping = aes(x = country, y = lifeExp, colour = continent)
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

