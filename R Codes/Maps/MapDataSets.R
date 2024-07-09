library(dplyr)

load("C:/Users/asus/Desktop/Project-Group 11/Data Sets/Batters23.RData")
countrybat <- c("India","South Africa","New Zealand","India","India","India","India","Australia","India","India","Australia",
             "South Africa","India","India","Australia","India","Australia","England","West Indies","India","India","India","India",
             "India","West Indies","India","India","India","India","India","India","West Indies","England","India","England","England",
             "India","India","India","India","South Africa","South Africa","India","India","South Africa","Afghanistan","West Indies",
             "India","England","South Africa","England","India","India","India","India","India","India","India","India","South Africa","India",
             "Zimbabwe","India","Afghanistan","Australia","England","Australia","India","India","India","India","India","India","India",
             "India","India","India","India","India","Sri Lanka","India","India","India","India","India","New Zealand","Afghanistan",
             "India","India","India","India","New Zealand","South Africa","India","South Africa","England","India","India","Sri Lanka",
             "India","Sri Lanka","Australia","India","India","India","Afghanistan","India","South Africa","India","West Indies","India",
             "India","India","India","India","India","India","India","West Indies","India","Afghanistan","India","New Zealand","England",
             "India","India","India","India","India","West Indies","England","India","England","India","Australia","India","Afghanistan",
            "West Indies","West Indies","India","India","Australia","England","India","India","Bangladesh","England","India","India","India")
lat <- numeric(length=150)
long <- numeric(length=150)
latI <- c(20.8719, 12.9864, 22.5726, 10.8505, 15.2993, 23.8103, 20.2961, 17.6868, 16.5062, 31.9686, 23.0225, 21.6437, 17.3850, 25.276987, 29.9457, 9.9252, 13.0827, 28.6139, 26.9124, 15.8396, 19.9975, 22.2587, 14.5204, 12.9716, 21.1702, 19.0760, 25.4361, 22.3094, 25.3247, 12.2958, 30.6954, 27.2530, 23.9408, 26.2025, 10.8505, 9.9312, 11.9416, 17.6868, 23.2599, 22.3569, 28.6139, 24.9263, 10.7905, 25.7740, 15.4942, 18.5204, 30.7333, 25.4358, 25.1989, 27.2674, 19.9975,16.7050, 22.3094, 30.8666, 22.5726, 27.1749, 26.1076, 12.9716, 11.0168, 24.5986, 21.9033, 28.7164, 14.4663, 26.7333, 26.5552, 25.3548, 19.0760, 20.5937, 28.6139, 20.3392, 14.0176, 30.1290, 25.0961, 27.6094, 18.0982, 18.4361, 12.9716, 25.8620, 13.0846, 20.1883, 15.4603, 25.5941, 16.0600, 18.1595, 29.1673, 20.5937, 12.6392, 28.7041, 17.6910, 24.6753, 25.4305, 23.5461, 20.9637,18.9)
longI <- c(68.2094, 74.3587, 80.2395, 76.7983, 78.6759, 73.3035, 72.8748, 70.2449, 69.4713, 75.9115, 82.8558, 81.8463, 71.2707, 69.1491, 79.0074, 83.2297, 74.1852, 80.2785, 75.5820, 77.5946, 85.3240, 79.9414, 71.5004, 81.8356, 78.0712, 69.1614, 83.3281, 87.3920, 78.4564, 72.8232, 86.2039, 76.6528, 78.4130, 80.0937, 85.8245, 83.8397, 75.2780, 78.0005, 80.1641, 70.6304, 82.1774, 75.7602, 78.1930, 77.6376, 70.9156, 80.9966, 76.6265, 82.8533, 72.9041, 81.1936, 76.3256, 77.9835, 73.1999, 81.1061, 79.8704, 72.8058, 74.9958, 82.3196, 70.3492, 79.1791, 80.6195, 75.8268, 77.2263, 69.5887, 83.3546, 76.8936, 70.8045, 78.7298, 81.6849, 73.6936, 83.0250, 76.9673, 70.0651, 80.7994, 85.3389, 71.4083, 76.0157, 78.8539, 81.3231, 73.7149, 82.6799, 77.2697, 70.8653, 84.0083, 79.5165, 71.3177, 78.0574, 80.0483, 76.3133, 74.0176, 69.2553, 81.1069, 76.1987,77)
bat <- cbind(bat23,Country=countrybat)
latE <- c(51.5074, 51.4329, 51.4545, 51.3837, 51.5834, 51.6214, 51.0752, 51.2707, 51.1337, 51.2277, 51.0888, 51.2858, 51.7567)
longE <- c(-0.1278, -0.4155, -0.1482, -0.2662, -0.2200, -0.1663, -0.3437, -0.4970, -0.2371, -0.4983, -0.7942, -0.9274, -0.2522)
latAF <- c(34.5553, 33.9391, 32.8788, 31.5837, 30.1798, 29.3859)
longAF <- c(69.7452, 67.7099, 66.0583, 64.3922, 62.2207, 61.3773)
latA <- c(-25.2744, -33.8688, -35.2809, -37.8136, -30.2672, -19.2576, -32.9252, -12.4634, -28.0167)
longA <- c(133.7751, 151.2093, 149.1300, 144.9631, 153.1009, 146.8169, 151.7843, 130.8456, 153.3976)
latS <- c(-33.9249, -25.7461, -28.0473, -29.8587, -26.2041, -33.0197, -29.6168, -30.5595, -27.5659, -32.9440)
longS <- c(18.4241, 28.1870, 26.1892, 31.0218, 28.0473, 18.6731, 30.3928, 22.9375, 18.4846, 27.8665)
latSR <- c(7.8731, 6.9271, 8.2432)
longSR <- c(80.7718, 79.8612, 81.1649)
latW <- c(18.0341, 12.6525, 14.0162, 17.9246, 18.1096, 12.6203, 15.1100, 17.9129, 13.2187)
longW <- c(-77.3923, -61.3338, -61.2426, -76.2859, -77.2975, -61.2958, -60.6411, -76.9557, -61.2982)
latN <- c(-40.9006, -43.5320, -36.8485, -45.0312)
longN <- c(174.8860, 172.6362, 174.7633, 168.6626)
N <- 1
W <- 1
SR <- 1
S <- 1
AF <- 1
I <- 1
E <- 1
A <- 1
for(i in 1:150)
{
  if(bat[i,]$Country=="India")
  {
    lat[i] <- latI[I]
    long[i] <- longI[I]
    I <- I+1
  }
  else if(bat[i,]$Country=="England")
  {
    lat[i] <- latE[E]
    long[i] <- longE[E]
    E <- E+1
  }
  else if(bat[i,]$Country=="Afghanistan")
  {
    lat[i] <- latAF[AF]
    long[i] <- longAF[AF]
    AF <- AF+1
  }
  else if(bat[i,]$Country=="Australia")
  {
    lat[i] <- latA[A]
    long[i] <- longA[A]
    A <- A+1
  }
  else if(bat[i,]$Country=="South Africa")
  {
    lat[i] <- latS[S]
    long[i] <- longS[S]
    S <- S+1
  }
  else if(bat[i,]$Country=="Sri Lanka")
  {
    lat[i] <- latSR[SR]
    long[i] <- longSR[SR]
    SR <- SR+1
  }
  else if(bat[i,]$Country=="West Indies")
  {
    lat[i] <- latW[W]
    long[i] <- longW[W]
    W <- W+1
  }
  else if(bat[i,]$Country=="New Zealand")
  {
    lat[i] <- latN[N]
    long[i] <- longN[N]
    N <- N+1
  }
  else if(bat[i,]$Country == "Zimbabwe")
  {
    lat[i] <- -19.0154 
    long[i] <- 29.1549
  }
  else
  {
    lat[i] <- 23.6850
    long[i] <- 90.3563
  }
}
batmap23 <- cbind(bat,Lat=lat,Long=long)
save(batmap23,file = "CoordCountBat23.RData")
#-----------------------------------------------------------------------------------
load("C:/Users/asus/Desktop/Project-Group 11/Data Sets/Bowlers23.RData")
countrybowl <- c("India", "India", "Afghanistan", "India", "India", "India", "India", "India", "Sri Lanka", "India",
                 "India", "Afghanistan", "India", "India", "India", "India", "Australia", "India", "India", "India",
                 "New Zealand", "New Zealand", "Australia", "India", "England", "Afghanistan", "India", "West Indies", "Sri Lanka",
                 "India", "India", "South Africa", "India", "India", "South Africa", "India", "India", "England", "England",
                 "India", "South Africa", "India", "India","England", "England", "India",
                 "South Africa", "India", "Sri Lanka","India","India", "Australia", "India", "India", "India","West Indies","Australia",
                 "India", "West Indies","South Africa", "New Zealand", "India", "India", "New Zealand", "Australia", "Australia", "India", "India", "India","India","India","India", "Australia",
                 "New Zealand","India", "India", "Australia", "England", "India", "India", "Zimbabwe",
                 "India", "India", "India", "India", "England","Afghanistan", "India", "India",
                 "New Zealand","England", "India", "India", "India", "England", "Australia","England", "West Indies", "India", "New Zealand")
lat <- numeric(length=100)
long <- numeric(length=100)
latI <- c(28.6139, 12.9716, 18.5204, 22.5726, 23.2599, 25.276987, 30.7333, 26.9124, 11.0168, 17.6868, 15.2993, 20.2961, 27.1767, 19.0760, 31.5497, 23.2156, 28.6139, 25.5941, 21.1702, 9.9252, 14.6328, 22.3072, 24.8799, 30.6954, 25.3385, 12.2958, 13.0827, 21.1458, 23.6850, 29.0588, 17.3850, 11.1271, 28.6139, 25.0961, 21.2787, 12.9716, 13.4126, 26.2037, 10.8505, 24.8607, 19.9975, 29.0588, 25.4358, 15.9129, 17.6710, 12.6392, 26.9124, 28.6139, 19.7515, 14.0670, 9.9252, 18.1124, 22.2587, 13.0827, 27.7172, 28.6139, 16.5079)
longI <- c(77.2090, 77.5946, 73.8567, 88.3639, 77.4126, 82.988390, 76.7794, 75.7873, 76.9558, 83.2185, 74.1240, 85.8245, 78.0081, 72.8777, 74.3436, 77.3926, 77.2090, 85.1376, 79.0682, 78.1198, 78.1190, 73.1812, 81.3850, 76.2328, 92.7978, 76.6394, 77.5875, 79.0762, 82.1991, 92.7406, 78.4867, 76.6742, 77.2090, 85.3131, 81.8661, 77.5946, 77.5770, 91.7445, 78.6966, 80.9462, 73.3000, 82.1991, 85.2488, 78.5160, 80.6188, 75.7139, 86.1581, 72.8337, 77.7874, 85.3240, 77.5946, 79.9656, 75.9214, 78.1198, 78.6392, 88.3630, 79.1590)
bowl <- cbind(bowl23,Country=countrybowl)
latE <- c(51.5074, 52.4862, 53.8008, 53.4808, 52.0406, 51.4545, 51.4632, 51.6214, 50.7184, 52.6297)
longE <- c(-0.1278, -1.8904, -1.5491, -2.2426, -0.7594, -2.5879, -0.1157, -3.9436, -1.8808, -1.1316)
latAF <- c(34.5553, 34.3472, 31.6133, 36.7069)
longAF <- c(69.2075, 62.1900, 65.7100, 67.1128)
latA <- c(-25.2744, -33.8688, -35.2809, -37.8136, -30.2672, -19.2576, -32.9252, -12.4634, -28.0167)
longA <- c(153.0251, 151.2093, 144.9631, 138.6007, 146.3175, 115.8605, 152.9324, 130.8456, 146.8183)
latS <- c(-29.8579, -33.9249, -26.2041, -29.1150, -33.5903)
longS <- c(31.0278, 18.4241, 28.0473, 26.2237, 22.2063)
latSR <- c(6.9271, 7.2906, 6.0320)
longSR <- c(79.8480, 80.6337, 80.2170)
latW <- c(10.6918, 18.1096, 18.7357, 13.1939)
longW <- c(-61.2225, -77.2975, -70.1627, -59.5432)
latN <- c(-36.8485, -41.2865, -43.5321, -45.0302, -45.8788, -38.1368, -41.2985)
longN <- c(174.7633, 174.7762, 172.6362, 168.6622, 170.5028, 176.2497, 173.2444)
N <- 1
W <- 1
SR <- 1
S <- 1
AF <- 1
I <- 1
E <- 1
A <- 1
for(i in 1:100)
{
  if(bowl[i,]$Country=="India")
  {
    lat[i] <- latI[I]
    long[i] <- longI[I]
    I <- I+1
  }
  else if(bowl[i,]$Country=="England")
  {
    lat[i] <- latE[E]
    long[i] <- longE[E]
    E <- E+1
  }
  else if(bowl[i,]$Country=="Afghanistan")
  {
    lat[i] <- latAF[AF]
    long[i] <- longAF[AF]
    AF <- AF+1
  }
  else if(bowl[i,]$Country=="Australia")
  {
    lat[i] <- latA[A]
    long[i] <- longA[A]
    A <- A+1
  }
  else if(bowl[i,]$Country=="South Africa")
  {
    lat[i] <- latS[S]
    long[i] <- longS[S]
    S <- S+1
  }
  else if(bowl[i,]$Country=="Sri Lanka")
  {
    lat[i] <- latSR[SR]
    long[i] <- longSR[SR]
    SR <- SR+1
  }
  else if(bowl[i,]$Country=="West Indies")
  {
    lat[i] <- latW[W]
    long[i] <- longW[W]
    W <- W+1
  }
  else if(bowl[i,]$Country=="New Zealand")
  {
    lat[i] <- latN[N]
    long[i] <- longN[N]
    N <- N+1
  }
  else if(bowl[i,]$Country == "Zimbabwe")
  {
    lat[i] <- -19.0154 
    long[i] <- 29.1549
  }
  else
  {
    lat[i] <- 23.6850
    long[i] <- 90.3563
  }
}
bowlmap23 <- cbind(bowl,Lat=lat,Long=long)
save(bowlmap23,file = "CoordCountBowl23.RData")

