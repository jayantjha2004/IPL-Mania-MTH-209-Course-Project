# 1. Doughnut Chart for average Strike rate of each team

library(ggplot2)
library(dplyr)

grp_by_team <- bat13 %>% group_by(Teams) %>% summarise(Avg_S_rate = mean(as.numeric(Strike.Rate)))
grp_team <- unique(bat13$Teams)

df <- data.frame( value= round(grp_by_team$Avg_S_rate,2),
                  group = grp_team)

# Hole size
hsize <- 1.5

df <- df %>% 
  mutate(x = hsize)

ggplot(df, aes(x = hsize, y = value, fill = group)) +
  geom_col(color = "black") +
  geom_text(aes(label = value ),
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "GnBu") +
  xlim(c(0.2, hsize + 0.5)) +
  theme(panel.background = element_rect(fill = "white"),
        panel.grid = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())


#2. circular packing for Most runs

# Libraries
library(packcircles)
library(ggplot2)

# Create data
data1 <- data.frame(Name=head(bat13$Player,50), Runs=head(bat13$Runs,50))

# Generate the layout. This function return a dataframe with one line per bubble. 
# It gives its center (x and y) and its radius, proportional of the value
packing <- circleProgressiveLayout(data1$Runs, sizetype='area')

# We can add these packing information to the initial data frame
data1 <- cbind(data1, packing)

# Check that radius is proportional to value. We don't want a linear relationship, since it is the AREA that must be proportionnal to the value
# plot(data$radius, data$value)

# The next step is to go from one center + a radius to the coordinates of a circle that
# is drawn by a multitude of straight lines.
dat.gg <- circleLayoutVertices(packing, npoints=50)

# Make the plot
ggplot() + 
  
  # Make the bubbles
  geom_polygon(data = dat.gg, aes(x, y, group = id, fill=as.factor(id)), colour = "black", alpha = 0.6) +
  
  # Add text in the center of each bubble + control its size
  geom_text(data = data1, aes(x, y, size=Runs, label = Name)) +
  scale_size_discrete(range = c(1.5,3)) +
  
  # General theme:
  theme_void() + 
  theme(legend.position="none") +
  coord_equal()

#3. Point

library(ggplot2)

ggplot(data = bat13, aes(x=as.numeric(X4s)+as.numeric(X6s), y=as.numeric(Strike.Rate), color = Teams))+
  geom_point(alpha=0.7)+guides(size=F) + labs(title="Plot for no. of boundaries vs strike rates ", x= "no. of boundaries", y= "Strike rate")


ggplot(data = bat13, aes(x=as.numeric(Runs), y=as.numeric(Balls.Faced), size=as.numeric(Average), color = Teams))+
  geom_point() + labs(title="Plot for No. of ball faced vs Runs", x="Runs",y="Balls Faced") + guides(size=F)

ggplot(data = bat13, aes(x=as.numeric(Runs),size=as.numeric(Strike.Rate), y=as.numeric(Average), color = Teams))+
  geom_point() + labs(title="Plot for Strike Rate vs Runs", x="Runs",y="Strike Rate") + guides(size=F)


#4 vertical line plot

library(ggplot2)
# Plot
ggplot(data= head(bat13,50), aes(x=Player, y=as.numeric(Highest.Score))) +
  geom_point() + 
  geom_segment( aes(x=Player, xend=Player, y=0, yend=as.numeric(Highest.Score)))+
  labs(title="Highest Score", x="Players", y= "Score")+
  theme(axis.text.x = element_text(angle = 90))


###########
##Bowlers##
###########


#1 no. of runs vs wickets
ggplot(data = bowl15, aes(x=as.numeric(Runs), y=as.numeric(Wickets), color = Teams))+
  geom_point() + labs(title="Plot for No. of Runs vs Wickets", x="Runs",y="Wickets")

# 2. 3 line graph 
ggplot(data = bowl15, aes(x=as.numeric(Rank))) + 
  geom_line(aes(y = as.numeric(Average)), colour ="darkred") + 
  geom_line(aes(y = as.numeric(Strike.Rate)), colour="steelblue") +
  geom_line(aes(y= as.numeric(Economy.Rate)), colour="purple" ) +
  labs(title="Plot", x=" ", y= " ") 
 

# Density plot of average score

a1 <- tibble(bat13)
ggplot(a1,aes(x=as.numeric(Average),fill= Teams))+
  geom_density(alpha=0.2)

# Scatter plot of 
ggplot(bowl13,aes(x=as.numeric(Balls),y=as.numeric(Wickets),color = Teams))+
  geom_point()+
  labs(title="No.of Balls vs Wickets",x="No. of Balls",y="No. of Wicket")

# vertical Bar of top 10 bowlers
library(plotly)

fig <- plot_ly(x = as.numeric(head(bowl23$Economy.Rate,20)), y = head(bowl23$Player,20), type = 'bar', orientation = 'h',color =head(bowl23$Teams,20))
fig
