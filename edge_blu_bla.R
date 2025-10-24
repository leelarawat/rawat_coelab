setwd("~/Desktop/coelab")
edge_bla <- read.csv("~/Desktop/coelab/edge data/EDGE_Black_2013_thru_20191014_VWC_cleanedByRFB_20250924.csv")
edge_blu <- read.csv("~/Desktop/coelab/edge data/EDGE_Blue_2013_thru_20191014_VWC_cleanedByRFB_20250924.csv")

##Note, for EDGE, ESR = event size reduction (drought)
###REN = reduced event number (delayed monsoon). also DRT, delayed. 
###Confusingly, in the data, the delayed monsoon is correctly identified as DRT (delayed rainfall treatment). 
####Be careful not to assume this is the drought treatment- drought is actually ESR.
##90 is 0-30cm 45 is 0-15cm
#look at only 45 angle

library(ggpubr)
library(rstatix)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyverse)

##############edge black data set###########
edge_bla <- na.omit(edge_bla)

edge_bla$TIMESTAMP <- as.POSIXct(edge_bla$TIMESTAMP, format = "%m/%d/%y %H:%M")
edge_bla$DAY <- as.Date(edge_bla$TIMESTAMP)
edge_bla$MONTH <- factor(format(edge_bla$TIMESTAMP, "%b"), levels = month.abb)
head(edge_bla)

cols <- c('P27CON_VWC45', 'P18CON_VWC45', 'P11CON_VWC45',
          'P1CON_VWC45', 'P1CON_VWC45', 'P17CON_VWC45',
          'P4CON_VWC45', 'P7CON_VWC45', 'P23CON_VWC45', 
          'P21CON_VWC45', 'P15CON_VWC45', 'P28ESR_VWC45', 
          'P19ESR_VWC45', 'P2ESR_VWC45',
          'P10ESR_VWC45', 'P16ESR_VWC45', 'P6ESR_VWC45',
          'P3ESR_VWC45', 'P22ESR_VWC45', 'P26ESR_VWC45',
          'P24ESR_VWC45', 'P29DRT_VWC45', 'P20DRT_VWC45', 
          'P8DRT_VWC45', 'P9DRT_VWC45', 'P13DRT_VWC45', 
          'P5DRT_VWC45','P12DRT_VWC45', 'P25DRT_VWC45', 'P30DRT_VWC45',
          'P14DRT_VWC45')

edge_bla_long <- edge_bla %>%
  pivot_longer(cols = all_of(cols),
    names_to = "OGLabel",
    values_to = "VWC") %>% 
  mutate(Plot = str_extract(OGLabel, "P\\d+"),
    Treatment = str_extract(OGLabel, "CON|DRT|ESR"))

edge_black <- edge_bla_long %>% 
  select(TIMESTAMP, DAY, MONTH, OGLabel, Treatment, Plot, VWC)

edge_black <- edge_black %>%
  mutate(Block = case_when(
    Plot %in% c("P22", "P23", "P25") ~ "1",
    Plot %in% c("P21", "P26", "P30") ~ "2",
    Plot %in% c("P27", "P28", "P29") ~ "3",
    Plot %in% c("P14", "P15", "P24") ~ "4",
    Plot %in% c("P13", "P16", "P17") ~ "5",
    Plot %in% c("P4", "P5", "P6") ~ "6",
    Plot %in% c("P18", "P19", "P20") ~ "7",
    Plot %in% c("P3", "P7", "P12") ~ "8",
    Plot %in% c("P2", "P8", "P11") ~ "9",
    Plot %in% c("P1", "P9", "P10") ~ "10",
    TRUE ~ "Unknown"
  ))

########other precip######
edge_precip <- read.csv("~/Desktop/coelab/edge_black_precip.csv")
edge_precip <- edge_precip %>% 
  select(site, year, date, season, block, plot, season.precip)
edge_precip <- edge_precip %>% 
  rename(Plot = plot, 
         Block = block,
         DAY = date)


##############1st try precip data maybe don't use?##########
edge_precip <- edge_precip %>%
  mutate(DAY = as.Date(DAY))
edge_blk_pcp <- vwc_black %>%
  left_join(edge_precip, by = "DAY")
edge_blk_pcp <- edge_blk_pcp %>%
  filter(!is.na(site), !is.na(year), !is.na(season), !is.na(Block), 
         !is.na(Plot), !is.na(season.precip))
edge_blk_pcp <- edge_blk_pcp %>% 
  select("DAY", "MONTH", "season.precip", "year", "Treatment", "VWC")
ggplot(edge_blk_pcp, aes(x = DAY, y = season.precip, color = mean_vwc)) + 
  geom_point(size = 1) + 
  theme_minimal()
  
##try for lm 
model_blk_pcp <- lm(VWC ~ season.precip, data = edge_blk_pcp)

############DIF PRECIP DATASET###########
real_pcp <- read.csv("~/Desktop/coelab/precip_10_13_edge_black.csv")
real_pcp <- real_pcp %>% 
  select(TIMESTAMP, PRECIP)
real_pcp$TIMESTAMP <- as.POSIXct(real_pcp$TIMESTAMP, format = "%m/%d/%y %H:%M")
real_pcp <- real_pcp %>%
  mutate(year = year(TIMESTAMP), DAY = as.Date(TIMESTAMP))
real_pcp <- real_pcp %>%
  select(PRECIP, year, DAY)
vwc_black <- edge_black %>%
  group_by(DAY, Treatment) %>%
  summarize(mean_vwc = mean(VWC, na.rm = TRUE)) %>%
  ungroup()
edge_blk_pcp_2 <- vwc_black %>%
  left_join(real_pcp, by = "DAY")
edge_blk_pcp_2 <- edge_blk_pcp_2 %>% 
  filter(PRECIP != 0)
edge_blk_pcp_2$MONTH <- factor(format(edge_blk_pcp_2$DAY, "%b"), levels = month.abb)
######edge_blk_pcp_2 THIS IS NAM#########
edge_blk_pcp_2 <- edge_blk_pcp_2 %>% 
  filter(MONTH %in% c("Jun", "Jul", "Aug", "Sep"))
########vwc with precip#########
#IMPORTANT LOG PRECIP..... NOT NECESSARY
edge_blk_pcp_2$log10PRECIP <- log10(edge_blk_pcp_2$PRECIP)

edge_blk_pcp_2_14 <- edge_blk_pcp_2 %>% 
  filter(year == "2014")
ggplot(edge_blk_pcp_2_14, aes(x = log10PRECIP, y = mean_vwc)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.2, alpha = 0.2) +
  geom_point(size = 0.3) + 
  facet_wrap(~Treatment, ncol = 1) + 
  theme_minimal()
ggplot(edge_blk_pcp_2_14, aes(x = DAY, y = mean_vwc)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.2, alpha = 0.2) +
  facet_wrap(~PRECIP, ncol = 1) + 
  theme_minimal()

ggplot(edge_blk_pcp_2_14, aes(x = log10PRECIP, y = mean_vwc)) + 
  geom_point(size = 0.4, alpha = 0.6) +
  geom_smooth(method = "loess", se = TRUE, span = 0.2, color = "blue", linewidth = 0.6) +
  facet_wrap(~Treatment, ncol = 1) +
  theme_minimal()

ggplot(edge_blk_pcp_2_14, aes(x = log10PRECIP, y = mean_vwc, color = Treatment)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.5, alpha = 0.2, level = 0.7) +
  geom_point(size = 0.5) + 
  theme_minimal()

##FINAL ONE####LOWKEY NO########
edge_blk_pcp_2_13 <- edge_blk_pcp_2 %>% 
  filter(year == "2013")
ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc, color = log10PRECIP)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, level = 0.95) +
  geom_point(size = 0.5) + 
  scale_color_viridis_c(option = "RdYlBu") + 
  facet_wrap(~Treatment, ncol = 1) + 
  labs(title = "2013 mean vwc and precip(log10) by treatment") + 
  theme_minimal()


edge_blk_pcp_2_14 <- edge_blk_pcp_2 %>% 
  filter(year == "2014")
ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc, color = log10PRECIP)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, level = 0.95) +
  geom_point(size = 0.5) + 
  facet_wrap(~Treatment, ncol = 1) + 
  labs(title = "2014 mean vwc and precip(log10) by treatment") + 
  theme_minimal()

edge_blk_pcp_2_15 <- edge_blk_pcp_2 %>% 
  filter(year == "2015")
ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc, color = log10PRECIP)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, level = 0.95) +
  geom_point(size = 0.5) + 
  facet_wrap(~Treatment, ncol = 1) + 
  labs(title = "2015 mean vwc and precip(log10) by treatment") + 
  theme_minimal()

edge_blk_pcp_2_16 <- edge_blk_pcp_2 %>% 
  filter(year == "2016")
ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc, color = log10PRECIP)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, level = 0.95) +
  geom_point(size = 0.5) + 
  facet_wrap(~Treatment, ncol = 1) + 
  labs(title = "2016 mean vwc and precip(log10) by treatment") + 
  theme_minimal()

edge_blk_pcp_2_17 <- edge_blk_pcp_2 %>% 
  filter(year == "2017")
ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc, color = log10PRECIP)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, level = 0.95) +
  geom_point(size = 0.5) + 
  facet_wrap(~Treatment, ncol = 1) + 
  labs(title = "2017 mean vwc and precip(log10) by treatment") + 
  theme_minimal()

edge_blk_pcp_2_18 <- edge_blk_pcp_2 %>% 
  filter(year == "2018")
ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc, color = log10PRECIP)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, level = 0.95) +
  geom_point(size = 0.5) + 
  facet_wrap(~Treatment, ncol = 1) + 
  labs(title = "2018 mean vwc and precip(log10) by treatment") + 
  theme_minimal()

edge_blk_pcp_2_19 <- edge_blk_pcp_2 %>% 
  filter(year == "2019")
ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc, color = log10PRECIP)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, level = 0.95) +
  geom_point(size = 0.5) + 
  facet_wrap(~Treatment, ncol = 1) + 
  labs(title = "2019 mean vwc and precip(log10) by treatment") + 
  theme_minimal()


###does not look good
ggplot(edge_blk_pcp_2_13, aes(x = mean_vwc, y = log10PRECIP)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.5, alpha = 0.2, level = 0.7) +
  geom_point(size = 0.5) + 
  theme_minimal()

###########facetwrap precip on top of mean vwc and day############
ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc)) + 
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, level = 0.95) +
  geom_point(size = 0.5) + 
  facet_wrap(~PRECIP, ncol = 1, scales = "free_y") + 
  labs(title = "2013 mean vwc and precip by treatment") + 
  theme_minimal()
###FACET WRAP PRECIP GRAPH WITH DAY on x
?facet_wrap

library(ggplot2)
install.packages("patchwork")
library(patchwork)


###ADD STARS
##all years 
p_vwc <- ggplot(edge_blk_pcp_2, aes(x = DAY, y = mean_vwc)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4, levels = 0.95) +
  labs(y = "Mean VWC") +
  theme_minimal()
p_pcp <- ggplot(edge_blk_pcp_2, aes(x = DAY, y = PRECIP)) +
  geom_col(color = "lightblue", alpha = 0.4) +
  labs(y = "Precipitation (mm)", title = "mean vwc & precipitation all years") +
  theme_minimal()
p_pcp / p_vwc

##edge black precip and vwc 2013
p_vwc <- ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = mean_vwc)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4) +
  labs(y = "Mean VWC") +
  theme_minimal()
p_pcp <- ggplot(edge_blk_pcp_2_13, aes(x = DAY, y = PRECIP)) +
  geom_col(alpha = 0.6) +
  labs(y = "Precipitation (mm)", title = "Mean vwc & Precipitation for 2013") +
  theme_minimal()
p_pcp / p_vwc

##edge black precip and vwc 2014
p_vwc <- ggplot(edge_blk_pcp_2_14, aes(x = DAY, y = mean_vwc)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4) +
  labs(y = "Mean VWC") +
  theme_minimal()
p_pcp <- ggplot(edge_blk_pcp_2_14, aes(x = DAY, y = PRECIP)) +
  geom_col(alpha = 0.6) +
  labs(y = "Precipitation (mm)", title = "Mean VWC & Precipitation for 2014") +
  theme_minimal()
p_pcp / p_vwc

##edge black precip and vwc 2015
p_vwc <- ggplot(edge_blk_pcp_2_15, aes(x = DAY, y = mean_vwc)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4) +
  labs(y = "Mean VWC") +
  theme_minimal()
p_pcp <- ggplot(edge_blk_pcp_2_15, aes(x = DAY, y = PRECIP)) +
  geom_col(alpha = 0.6) +
  labs(y = "Precipitation (mm)", title = "Mean VWC & Precipitation for 2015") +
  theme_minimal()
p_pcp / p_vwc

##edge black precip and vwc 2016
p_vwc <- ggplot(edge_blk_pcp_2_16, aes(x = DAY, y = mean_vwc)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4) +
  labs(y = "Mean VWC") +
  theme_minimal()
p_pcp <- ggplot(edge_blk_pcp_2_16, aes(x = DAY, y = PRECIP)) +
  geom_col(alpha = 0.6) +
  labs(y = "Precipitation (mm)", title = "Mean VWC & Precipitation for 2016") +
  theme_minimal()
p_pcp / p_vwc

##edge black precip and vwc 2017
p_vwc <- ggplot(edge_blk_pcp_2_17, aes(x = DAY, y = mean_vwc)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4) +
  labs(y = "Mean VWC") +
  theme_minimal()
p_pcp <- ggplot(edge_blk_pcp_2_17, aes(x = DAY, y = PRECIP)) +
  geom_col(alpha = 0.6) +
  labs(y = "Precipitation (mm)", title = "Mean VWC & Precipitation for 2017") +
  theme_minimal()
p_pcp / p_vwc

##edge black precip and vwc 2018
p_vwc <- ggplot(edge_blk_pcp_2_18, aes(x = DAY, y = mean_vwc)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4) +
  labs(y = "Mean VWC") +
  theme_minimal()
p_pcp <- ggplot(edge_blk_pcp_2_18, aes(x = DAY, y = PRECIP)) +
  geom_col(alpha = 0.6) +
  labs(y = "Precipitation (mm)", title = "Mean VWC & Precipitation for 2018") +
  theme_minimal()
p_pcp / p_vwc

##edge black precip and vwc 2019
p_vwc <- ggplot(edge_blk_pcp_2_19, aes(x = DAY, y = mean_vwc)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.4) +
  labs(y = "Mean VWC") +
  theme_minimal()
p_pcp <- ggplot(edge_blk_pcp_2_19, aes(x = DAY, y = PRECIP)) +
  geom_col(alpha = 0.6) +
  labs(y = "Precipitation (mm)", title = "Mean VWC & Precipitation for 2019") +
  theme_minimal()
p_pcp / p_vwc


##########lm + GLMM#######
edge_black$TIMESTAMP <- as.POSIXct(edge_black$TIMESTAMP, format = "%m/%d/%y %H:%M")
edge_black <- edge_black %>%
  mutate(year = year(TIMESTAMP))
install.packages("lme4")
library(lme4)
lmer(VWC ~ Treatment * MONTH + (1|year), data = edge_black)
lmer(VWC ~ Treatment * MONTH + (1|Plot), data = edge_black)
lmer(VWC ~ Treatment * MONTH + (1|year/Plot), data = edge_black)
summary(blk_lm)
###plot nested with year

############plot and VWC#########################
edge_black$Plot <- factor(edge_black$Plot, levels = paste0("P", 1:30))
ggplot(edge_black, aes(x = VWC, y = Plot)) + 
       geom_point(color = "lightblue") + 
  #boxplot or violin plot, to show variability 
  theme_minimal()
?geom_col

################EDGE BLUE DATASET still needs to be edited###############
edge_blu <- na.omit(edge_bla)

edge_blk_pcp_2$TIMESTAMP <- as.POSIXct(edge_bla$TIMESTAMP, format = "%m/%d/%y %H:%M")
edge_bla$DAY <- as.Date(edge_bla$TIMESTAMP)
edge_bla$MONTH <- factor(format(edge_bla$TIMESTAMP, "%b"), levels = month.abb)
head(edge_bla)

cols <- c('P27CON_VWC45', 'P18CON_VWC45', 'P11CON_VWC45',
          'P1CON_VWC45', 'P1CON_VWC45', 'P17CON_VWC45',
          'P4CON_VWC45', 'P7CON_VWC45', 'P23CON_VWC45', 
          'P21CON_VWC45', 'P15CON_VWC45', 'P28ESR_VWC45', 
          'P19ESR_VWC45', 'P2ESR_VWC45',
          'P10ESR_VWC45', 'P16ESR_VWC45', 'P6ESR_VWC45',
          'P3ESR_VWC45', 'P22ESR_VWC45', 'P26ESR_VWC45',
          'P24ESR_VWC45', 'P29DRT_VWC45', 'P20DRT_VWC45', 
          'P8DRT_VWC45', 'P9DRT_VWC45', 'P13DRT_VWC45', 
          'P5DRT_VWC45','P12DRT_VWC45', 'P25DRT_VWC45', 'P30DRT_VWC45',
          'P14DRT_VWC45')

edge_bla_long <- edge_bla %>%
  pivot_longer(cols = all_of(cols),
               names_to = "OGLabel",
               values_to = "VWC") %>% 
  mutate(Plot = str_extract(OGLabel, "P\\d+"),
         Treatment = str_extract(OGLabel, "CON|DRT|ESR"))

head(edge_bla_long)

edge_black <- edge_bla_long %>% 
  select(TIMESTAMP, DAY, MONTH, OGLabel, Treatment, Plot, VWC)

edge_precip <- read.csv("~/Desktop/coelab/edge_black_precip.csv")

edge_precip <- edge_precip %>% 
  select(site, year, date, season, block, plot, season.precip)
edge_precip <- edge_precip %>% 
  rename(Plot = plot, 
         Block = block,
         DAY = date)


edge_black <- edge_black %>%
  mutate(Block = case_when(
    Plot %in% c("P22", "P23", "P25") ~ "1",
    Plot %in% c("P21", "P26", "P30") ~ "2",
    Plot %in% c("P27", "P28", "P29") ~ "3",
    Plot %in% c("P14", "P15", "P24") ~ "4",
    Plot %in% c("P13", "P16", "P17") ~ "5",
    Plot %in% c("P4", "P5", "P6") ~ "6",
    Plot %in% c("P18", "P19", "P20") ~ "7",
    Plot %in% c("P3", "P7", "P12") ~ "8",
    Plot %in% c("P2", "P8", "P11") ~ "9",
    Plot %in% c("P1", "P9", "P10") ~ "10",
    TRUE ~ "Unknown"
  ))

head(edge_black)

edge_precip <- edge_precip %>%
  mutate(DAY = as.Date(DAY))

edge_blk_pcp <- edge_precip %>%
  left_join(edge_black, by = "DAY")

edge_blk_pcp <- edge_blk_pcp %>%
  filter(!is.na(site), !is.na(year), !is.na(season), !is.na(Block.y), 
         !is.na(Plot.y), !is.na(season.precip))

edge_blk_pcp <- edge_blk_pcp %>% 
  select("DAY", "MONTH", "season.precip", "year", "Treatment", "VWC")

edge_blk_pcp <- edge_blk_pcp %>%
  distinct(VWC, season.precip , .keep_all = TRUE)

ggscatter(edge_blk_pcp, x = "VWC", y = "season.precip", 
          size = 0.3)



ggplot(edge_blk_pcp, aes(x = VWC, y = season.precip)) +
  geom_point(size = 0.3)

summary(edge_blk_pcp$VWC)
summary(edge_blk_pcp$season.precip)

ggscatter(edge_blk_pcp, x = "season.precip", y = "VWC", size = 0.3)

model_blk_pcp <- lm(VWC ~ season.precip, data = edge_blk_pcp)

ggscatter(edge_blk_pcp, x = "season.precip", y = "VWC", size = 0.5, 
          add = "reg.line", conf.int = TRUE, cor.coef = TRUE, 
          xlab = "precip",
          ylab = "VWC")  


git init
git remote add origin https://github.com/username/reponame

