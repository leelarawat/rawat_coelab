# Package ID: knb-lter-sev.304.4 Cataloging System:https://pasta.edirepository.org.
# Data set title: Monsoon Rainfall Manipulation Experiment (MRME) Soil Temperature, Moisture and Carbon Dioxide Data from the Sevilleta National Wildlife Refuge, New Mexico.
# Data set creator:  Scott Collins - University of New Mexico 
# Contact:    - Information Manager University of New Mexico  - sevim@unm.edu
# Stylesheet v2.15 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu      
# Uncomment the following lines to have R clear previous work, or set a working directory
# rm(list=ls())      


################everything to run before data analysis#########
setwd("~/Desktop/coelab")       

library(ggpubr)
library(rstatix)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyverse)


options(HTTPUserAgent="EDI_CodeGen")
	      

infile1 <-("~/Desktop/coelab/knb-lter-sev.304.4/MRME_2012_2014.csv")
                   
 dt1 <-read.csv(infile1,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "Date",     
                    "treatment",     
                    "plot",     
                    "CO2_2cm",     
                    "CO2_8cm",     
                    "CO2_16cm",     
                    "Temp2cm",     
                    "Temp8cm",     
                    "vwc_2cm",     
                    "flux"    ), check.names=TRUE)
               

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                                                   
# attempting to convert dt1$Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%dT%H:%M:%S"
tmp1Date<-as.POSIXct(dt1$Date,format=tmpDateFormat,tz='UTC')
# Keep the new dates only if they all converted correctly
if(nrow(dt1[dt1$Date != "",]) == length(tmp1Date[!is.na(tmp1Date)])){dt1$Date <- tmp1Date } else {print("Date conversion failed for dt1$Date. Please inspect the data and do the date conversion yourself.")}                                                                    
                                
if (class(dt1$treatment)!="factor") dt1$treatment<- as.factor(dt1$treatment)
if (class(dt1$plot)!="factor") dt1$plot<- as.factor(dt1$plot)
if (class(dt1$CO2_2cm)=="factor") dt1$CO2_2cm <-as.numeric(levels(dt1$CO2_2cm))[as.integer(dt1$CO2_2cm) ]               
if (class(dt1$CO2_2cm)=="character") dt1$CO2_2cm <-as.numeric(dt1$CO2_2cm)
if (class(dt1$CO2_8cm)=="factor") dt1$CO2_8cm <-as.numeric(levels(dt1$CO2_8cm))[as.integer(dt1$CO2_8cm) ]               
if (class(dt1$CO2_8cm)=="character") dt1$CO2_8cm <-as.numeric(dt1$CO2_8cm)
if (class(dt1$CO2_16cm)=="factor") dt1$CO2_16cm <-as.numeric(levels(dt1$CO2_16cm))[as.integer(dt1$CO2_16cm) ]               
if (class(dt1$CO2_16cm)=="character") dt1$CO2_16cm <-as.numeric(dt1$CO2_16cm)
if (class(dt1$Temp2cm)=="factor") dt1$Temp2cm <-as.numeric(levels(dt1$Temp2cm))[as.integer(dt1$Temp2cm) ]               
if (class(dt1$Temp2cm)=="character") dt1$Temp2cm <-as.numeric(dt1$Temp2cm)
if (class(dt1$Temp8cm)=="factor") dt1$Temp8cm <-as.numeric(levels(dt1$Temp8cm))[as.integer(dt1$Temp8cm) ]               
if (class(dt1$Temp8cm)=="character") dt1$Temp8cm <-as.numeric(dt1$Temp8cm)
if (class(dt1$vwc_2cm)=="factor") dt1$vwc_2cm <-as.numeric(levels(dt1$vwc_2cm))[as.integer(dt1$vwc_2cm) ]               
if (class(dt1$vwc_2cm)=="character") dt1$vwc_2cm <-as.numeric(dt1$vwc_2cm)
if (class(dt1$flux)=="factor") dt1$flux <-as.numeric(levels(dt1$flux))[as.integer(dt1$flux) ]               
if (class(dt1$flux)=="character") dt1$flux <-as.numeric(dt1$flux)
                
# Convert Missing Values to NA for non-dates
                
dt1$treatment <- as.factor(ifelse((trimws(as.character(dt1$treatment))==trimws("NA")),NA,as.character(dt1$treatment)))
dt1$plot <- as.factor(ifelse((trimws(as.character(dt1$plot))==trimws("NA")),NA,as.character(dt1$plot)))
dt1$CO2_2cm <- ifelse((trimws(as.character(dt1$CO2_2cm))==trimws("NA")),NA,dt1$CO2_2cm)               
suppressWarnings(dt1$CO2_2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$CO2_2cm))==as.character(as.numeric("NA"))),NA,dt1$CO2_2cm))
dt1$CO2_8cm <- ifelse((trimws(as.character(dt1$CO2_8cm))==trimws("NA")),NA,dt1$CO2_8cm)               
suppressWarnings(dt1$CO2_8cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$CO2_8cm))==as.character(as.numeric("NA"))),NA,dt1$CO2_8cm))
dt1$CO2_16cm <- ifelse((trimws(as.character(dt1$CO2_16cm))==trimws("NA")),NA,dt1$CO2_16cm)               
suppressWarnings(dt1$CO2_16cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$CO2_16cm))==as.character(as.numeric("NA"))),NA,dt1$CO2_16cm))
dt1$Temp2cm <- ifelse((trimws(as.character(dt1$Temp2cm))==trimws("NA")),NA,dt1$Temp2cm)               
suppressWarnings(dt1$Temp2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$Temp2cm))==as.character(as.numeric("NA"))),NA,dt1$Temp2cm))
dt1$Temp8cm <- ifelse((trimws(as.character(dt1$Temp8cm))==trimws("NA")),NA,dt1$Temp8cm)               
suppressWarnings(dt1$Temp8cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$Temp8cm))==as.character(as.numeric("NA"))),NA,dt1$Temp8cm))
dt1$vwc_2cm <- ifelse((trimws(as.character(dt1$vwc_2cm))==trimws("NA")),NA,dt1$vwc_2cm)               
suppressWarnings(dt1$vwc_2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$vwc_2cm))==as.character(as.numeric("NA"))),NA,dt1$vwc_2cm))
dt1$flux <- ifelse((trimws(as.character(dt1$flux))==trimws("NA")),NA,dt1$flux)               
suppressWarnings(dt1$flux <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$flux))==as.character(as.numeric("NA"))),NA,dt1$flux))


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date)
summary(treatment)
summary(plot)
summary(CO2_2cm)
summary(CO2_8cm)
summary(CO2_16cm)
summary(Temp2cm)
summary(Temp8cm)
summary(vwc_2cm)
summary(flux) 
                # Get more details on character variables
                 
summary(as.factor(dt1$treatment)) 
summary(as.factor(dt1$plot))
detach(dt1)               
        
	      
infile2 <- ("~/Desktop/coelab/knb-lter-sev.304.4/MRME_2015_2019.csv")
               
 dt2 <-read.csv(infile2,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "Date",     
                    "treatment",     
                    "plot",     
                    "CO2_2cm",     
                    "CO2_8cm",     
                    "CO2_16cm",     
                    "Temp2cm",     
                    "Temp8cm",     
                    "vwc_2cm",     
                    "flux"    ), check.names=TRUE)
               

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                                                   
# attempting to convert dt2$Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%dT%H:%M:%S"
tmp2Date<-as.POSIXct(dt2$Date,format=tmpDateFormat,tz='UTC')
# Keep the new dates only if they all converted correctly
if(nrow(dt2[dt2$Date != "",]) == length(tmp2Date[!is.na(tmp2Date)])){dt2$Date <- tmp2Date } else {print("Date conversion failed for dt2$Date. Please inspect the data and do the date conversion yourself.")}                                                                    
                                
if (class(dt2$treatment)!="factor") dt2$treatment<- as.factor(dt2$treatment)
if (class(dt2$plot)!="factor") dt2$plot<- as.factor(dt2$plot)
if (class(dt2$CO2_2cm)=="factor") dt2$CO2_2cm <-as.numeric(levels(dt2$CO2_2cm))[as.integer(dt2$CO2_2cm) ]               
if (class(dt2$CO2_2cm)=="character") dt2$CO2_2cm <-as.numeric(dt2$CO2_2cm)
if (class(dt2$CO2_8cm)=="factor") dt2$CO2_8cm <-as.numeric(levels(dt2$CO2_8cm))[as.integer(dt2$CO2_8cm) ]               
if (class(dt2$CO2_8cm)=="character") dt2$CO2_8cm <-as.numeric(dt2$CO2_8cm)
if (class(dt2$CO2_16cm)=="factor") dt2$CO2_16cm <-as.numeric(levels(dt2$CO2_16cm))[as.integer(dt2$CO2_16cm) ]               
if (class(dt2$CO2_16cm)=="character") dt2$CO2_16cm <-as.numeric(dt2$CO2_16cm)
if (class(dt2$Temp2cm)=="factor") dt2$Temp2cm <-as.numeric(levels(dt2$Temp2cm))[as.integer(dt2$Temp2cm) ]               
if (class(dt2$Temp2cm)=="character") dt2$Temp2cm <-as.numeric(dt2$Temp2cm)
if (class(dt2$Temp8cm)=="factor") dt2$Temp8cm <-as.numeric(levels(dt2$Temp8cm))[as.integer(dt2$Temp8cm) ]               
if (class(dt2$Temp8cm)=="character") dt2$Temp8cm <-as.numeric(dt2$Temp8cm)
if (class(dt2$vwc_2cm)=="factor") dt2$vwc_2cm <-as.numeric(levels(dt2$vwc_2cm))[as.integer(dt2$vwc_2cm) ]               
if (class(dt2$vwc_2cm)=="character") dt2$vwc_2cm <-as.numeric(dt2$vwc_2cm)
if (class(dt2$flux)=="factor") dt2$flux <-as.numeric(levels(dt2$flux))[as.integer(dt2$flux) ]               
if (class(dt2$flux)=="character") dt2$flux <-as.numeric(dt2$flux)
                
# Convert Missing Values to NA for non-dates
                
dt2$treatment <- as.factor(ifelse((trimws(as.character(dt2$treatment))==trimws("NA")),NA,as.character(dt2$treatment)))
dt2$plot <- as.factor(ifelse((trimws(as.character(dt2$plot))==trimws("NA")),NA,as.character(dt2$plot)))
dt2$CO2_2cm <- ifelse((trimws(as.character(dt2$CO2_2cm))==trimws("NA")),NA,dt2$CO2_2cm)               
suppressWarnings(dt2$CO2_2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$CO2_2cm))==as.character(as.numeric("NA"))),NA,dt2$CO2_2cm))
dt2$CO2_8cm <- ifelse((trimws(as.character(dt2$CO2_8cm))==trimws("NA")),NA,dt2$CO2_8cm)               
suppressWarnings(dt2$CO2_8cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$CO2_8cm))==as.character(as.numeric("NA"))),NA,dt2$CO2_8cm))
dt2$CO2_16cm <- ifelse((trimws(as.character(dt2$CO2_16cm))==trimws("NA")),NA,dt2$CO2_16cm)               
suppressWarnings(dt2$CO2_16cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$CO2_16cm))==as.character(as.numeric("NA"))),NA,dt2$CO2_16cm))
dt2$Temp2cm <- ifelse((trimws(as.character(dt2$Temp2cm))==trimws("NA")),NA,dt2$Temp2cm)               
suppressWarnings(dt2$Temp2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Temp2cm))==as.character(as.numeric("NA"))),NA,dt2$Temp2cm))
dt2$Temp8cm <- ifelse((trimws(as.character(dt2$Temp8cm))==trimws("NA")),NA,dt2$Temp8cm)               
suppressWarnings(dt2$Temp8cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$Temp8cm))==as.character(as.numeric("NA"))),NA,dt2$Temp8cm))
dt2$vwc_2cm <- ifelse((trimws(as.character(dt2$vwc_2cm))==trimws("NA")),NA,dt2$vwc_2cm)               
suppressWarnings(dt2$vwc_2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$vwc_2cm))==as.character(as.numeric("NA"))),NA,dt2$vwc_2cm))
dt2$flux <- ifelse((trimws(as.character(dt2$flux))==trimws("NA")),NA,dt2$flux)               
suppressWarnings(dt2$flux <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$flux))==as.character(as.numeric("NA"))),NA,dt2$flux))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date)
summary(treatment)
summary(plot)
summary(CO2_2cm)
summary(CO2_8cm)
summary(CO2_16cm)
summary(Temp2cm)
summary(Temp8cm)
summary(vwc_2cm)
summary(flux) 
                # Get more details on character variables
                 
summary(as.factor(dt2$treatment)) 
summary(as.factor(dt2$plot))
detach(dt2)               
        
	      

infile3 <- ("~/Desktop/coelab/knb-lter-sev.304.4/MRME_2020_2022.csv")
               
 dt3 <-read.csv(infile3,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "Date",     
                    "treatment",     
                    "plot",     
                    "CO2_2cm",     
                    "CO2_8cm",     
                    "CO2_16cm",     
                    "Temp2cm",     
                    "Temp8cm",     
                    "vwc_2cm",     
                    "flux"    ), check.names=TRUE)
               

		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                                                   
# attempting to convert dt3$Date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%dT%H:%M:%S"
tmp3Date<-as.POSIXct(dt3$Date,format=tmpDateFormat,tz='UTC')
# Keep the new dates only if they all converted correctly
if(nrow(dt3[dt3$Date != "",]) == length(tmp3Date[!is.na(tmp3Date)])){dt3$Date <- tmp3Date } else {print("Date conversion failed for dt3$Date. Please inspect the data and do the date conversion yourself.")}                                                                    
                                
if (class(dt3$treatment)!="factor") dt3$treatment<- as.factor(dt3$treatment)
if (class(dt3$plot)!="factor") dt3$plot<- as.factor(dt3$plot)
if (class(dt3$CO2_2cm)=="factor") dt3$CO2_2cm <-as.numeric(levels(dt3$CO2_2cm))[as.integer(dt3$CO2_2cm) ]               
if (class(dt3$CO2_2cm)=="character") dt3$CO2_2cm <-as.numeric(dt3$CO2_2cm)
if (class(dt3$CO2_8cm)=="factor") dt3$CO2_8cm <-as.numeric(levels(dt3$CO2_8cm))[as.integer(dt3$CO2_8cm) ]               
if (class(dt3$CO2_8cm)=="character") dt3$CO2_8cm <-as.numeric(dt3$CO2_8cm)
if (class(dt3$CO2_16cm)=="factor") dt3$CO2_16cm <-as.numeric(levels(dt3$CO2_16cm))[as.integer(dt3$CO2_16cm) ]               
if (class(dt3$CO2_16cm)=="character") dt3$CO2_16cm <-as.numeric(dt3$CO2_16cm)
if (class(dt3$Temp2cm)=="factor") dt3$Temp2cm <-as.numeric(levels(dt3$Temp2cm))[as.integer(dt3$Temp2cm) ]               
if (class(dt3$Temp2cm)=="character") dt3$Temp2cm <-as.numeric(dt3$Temp2cm)
if (class(dt3$Temp8cm)=="factor") dt3$Temp8cm <-as.numeric(levels(dt3$Temp8cm))[as.integer(dt3$Temp8cm) ]               
if (class(dt3$Temp8cm)=="character") dt3$Temp8cm <-as.numeric(dt3$Temp8cm)
if (class(dt3$vwc_2cm)=="factor") dt3$vwc_2cm <-as.numeric(levels(dt3$vwc_2cm))[as.integer(dt3$vwc_2cm) ]               
if (class(dt3$vwc_2cm)=="character") dt3$vwc_2cm <-as.numeric(dt3$vwc_2cm)
if (class(dt3$flux)=="factor") dt3$flux <-as.numeric(levels(dt3$flux))[as.integer(dt3$flux) ]               
if (class(dt3$flux)=="character") dt3$flux <-as.numeric(dt3$flux)
                
# Convert Missing Values to NA for non-dates
                
dt3$treatment <- as.factor(ifelse((trimws(as.character(dt3$treatment))==trimws("NA")),NA,as.character(dt3$treatment)))
dt3$plot <- as.factor(ifelse((trimws(as.character(dt3$plot))==trimws("NA")),NA,as.character(dt3$plot)))
dt3$CO2_2cm <- ifelse((trimws(as.character(dt3$CO2_2cm))==trimws("NA")),NA,dt3$CO2_2cm)               
suppressWarnings(dt3$CO2_2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$CO2_2cm))==as.character(as.numeric("NA"))),NA,dt3$CO2_2cm))
dt3$CO2_8cm <- ifelse((trimws(as.character(dt3$CO2_8cm))==trimws("NA")),NA,dt3$CO2_8cm)               
suppressWarnings(dt3$CO2_8cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$CO2_8cm))==as.character(as.numeric("NA"))),NA,dt3$CO2_8cm))
dt3$CO2_16cm <- ifelse((trimws(as.character(dt3$CO2_16cm))==trimws("NA")),NA,dt3$CO2_16cm)               
suppressWarnings(dt3$CO2_16cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$CO2_16cm))==as.character(as.numeric("NA"))),NA,dt3$CO2_16cm))
dt3$Temp2cm <- ifelse((trimws(as.character(dt3$Temp2cm))==trimws("NA")),NA,dt3$Temp2cm)               
suppressWarnings(dt3$Temp2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Temp2cm))==as.character(as.numeric("NA"))),NA,dt3$Temp2cm))
dt3$Temp8cm <- ifelse((trimws(as.character(dt3$Temp8cm))==trimws("NA")),NA,dt3$Temp8cm)               
suppressWarnings(dt3$Temp8cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$Temp8cm))==as.character(as.numeric("NA"))),NA,dt3$Temp8cm))
dt3$vwc_2cm <- ifelse((trimws(as.character(dt3$vwc_2cm))==trimws("NA")),NA,dt3$vwc_2cm)               
suppressWarnings(dt3$vwc_2cm <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$vwc_2cm))==as.character(as.numeric("NA"))),NA,dt3$vwc_2cm))
dt3$flux <- ifelse((trimws(as.character(dt3$flux))==trimws("NA")),NA,dt3$flux)               
suppressWarnings(dt3$flux <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$flux))==as.character(as.numeric("NA"))),NA,dt3$flux))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(Date)
summary(treatment)
summary(plot)
summary(CO2_2cm)
summary(CO2_8cm)
summary(CO2_16cm)
summary(Temp2cm)
summary(Temp8cm)
summary(vwc_2cm)
summary(flux) 
                # Get more details on character variables
                 
summary(as.factor(dt3$treatment)) 
summary(as.factor(dt3$plot))
detach(dt3)               

colnames(dt1) [9] <- "vwc_int"
colnames(dt2) [9] <- "vwc_int"
colnames(dt3) [9] <- "vwc_int"

colnames(dt1) [6] <- "co2_16"
colnames(dt2) [6] <- "co2_16"
colnames(dt3) [6] <- "co2_16"


##lets combine them 
ds <- rbind(dt1, dt2, dt3)
ds$month <- factor(format(ds$Date, "%b"), levels = month.abb)
#by North american monsoon
NAM <- ds %>% 
  filter(month %in% c("Jun", "Jul", "Aug", "Sep"))
NAM <- NAM %>% 
  select(Date, treatment, plot, vwc_int, month)
ds$Year <- factor(format(ds$Date, "%Y"))
NAM$Year <- factor(format(NAM$Date, "%Y"))




################ 1st plot plot of north american monsoon##################
ggplot(NAM, aes(x=month, y=vwc_int)) + 
  geom_boxplot(alpha = 0.5, color = "blue", size = 0.3) + 
  facet_wrap(~ treatment, ncol = 1) + 
  labs(title = "plot of vwc + treatment by month", 
       x = "month", y = "vwc + treatment")

############stats by month May to Sept###############
NAM <- NAM %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment, month) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()

###add in plots. 

###wilcox
jun <- NAM %>% 
  filter(month == "Jun") %>% 
  wilcox_test(mean_vwc ~ treatment)
jun
jun.t <- NAM %>% 
  filter(month == "Jun") %>% 
  dunn_test(mean_vwc ~ treatment)
jun.t

jul <- NAM %>% 
  filter(month == "Jul") %>% 
  wilcox_test(mean_vwc ~ treatment)
jul
jul.t <- NAM %>% 
  filter(month == "Jul") %>% 
  dunn_test(mean_vwc ~ treatment)
jul.t

aug <- NAM %>% 
  filter(month == "Aug") %>% 
  wilcox_test(mean_vwc ~ treatment)
aug
aug.t <- NAM %>% 
  filter(month == "Aug") %>% 
  dunn_test(mean_vwc ~ treatment)
aug.t

sep <- NAM %>% 
  filter(month == "Sep") %>% 
  wilcox_test(mean_vwc ~ treatment)
sep
sep.t <- NAM %>%
  filter(month == "Sep") %>% 
  dunn_test(mean_vwc ~ treatment)
sep.t

#######kruskal
jun <- NAM %>% 
  filter(month == "Jun") %>% 
  kruskal_test(mean_vwc ~ treatment)
jun
jun.t <- NAM %>% 
  filter(month == "Jun") %>% 
  dunn_test(mean_vwc ~ treatment)
jun.t

jul <- NAM %>% 
  filter(month == "Jul") %>% 
  kruskal_test(mean_vwc ~ treatment)
jul
jul.t <- NAM %>% 
  filter(month == "Jul") %>% 
  dunn_test(mean_vwc ~ treatment)
jul.t

aug <- NAM %>% 
  filter(month == "Aug") %>% 
  kruskal_test(mean_vwc ~ treatment)
aug
aug.t <- NAM %>% 
  filter(month == "Aug") %>% 
  dunn_test(mean_vwc ~ treatment)
aug.t

sep <- NAM %>% 
  filter(month == "Sep") %>% 
  kruskal_test(mean_vwc ~ treatment)
sep
sep.t <- NAM %>%
  filter(month == "Sep") %>% 
  dunn_test(mean_vwc ~ treatment)
sep.t




###########vwc for control, L, S, filter and shapiro test###############
#create another column, log to make it normal, then parametric stats. 
NAM_C <- NAM %>% filter(!is.na(vwc_int))
NAM_C <- NAM %>% 
  filter(treatment == "C")

NAM_L <- NAM %>% filter(!is.na(vwc_int))
NAM_L <- NAM %>% 
  filter(treatment == "L")

NAM_S <- NAM %>% filter(!is.na(vwc_int))
NAM_S <- NAM %>% 
  filter(treatment == "S")

NAM_C$log10_vwc_int <- log10(NAM_C$vwc_int)
NAM_L$log10_vwc_int <- log10(NAM_L$vwc_int)
NAM_S$log10_vwc_int <- log10(NAM_S$vwc_int)

shapiro.test(sample(NAM_C$log10_vwc_int, 3000))
shapiro.test(sample(NAM_L$log10_vwc_int, 4000))
shapiro.test(sample(NAM_S$log10_vwc_int, 1000))

##P value less than 0.05 --> data is non normal data confirmed is not.

###########plot a density plot on treatment + vwc#######
NAM %>% 
  ggplot(aes(x = vwc_int, color = treatment, fill = treatment)) + 
  geom_density(alpha = 0.1) +
  labs(title = "density distribution of vwc based on treatment")

#############plots of annual vwc based on treatment#####
ggplot(ds, aes(x=month, y = vwc_int)) + 
  geom_point(alpha = 0.5, color = "blue", size = 0.5)
ggplot(NAM, aes(x=month, y = vwc_int)) + 
  geom_point(alpha = 0.5, color = "blue", size = 0.5)

?select

ggplot(ds, aes(x=Date, y =vwc_int)) + 
  geom_point(alpha = 0.5, color = "blue", size = 0.5)

ggplot(NAM, aes(x=Date, y =vwc_int)) + 
  geom_point(alpha = 0.5, color = "blue", size = 0.5) +
  facet_wrap(~treatment) + 
  labs(title = "annual vwc during monsoon by treatment")

ds$log10_vwc_int <- log10(ds$vwc_int)

ggplot(NAM, aes(x=Date, y =log10_vwc_int)) + 
  geom_point(alpha = 0.5, color = "blue", size = 0.5) +
  facet_wrap(~treatment) + 
  labs(title = "annual vwc during monsoon by treatment")






###########RIDGELINE PLOTS by year###############
install.packages("ggridges")
library(ggridges)
library(ggplot2)
install.packages("viridis")
library(dplyr)
library(tidyr)
library(viridis)

##dif try
ggscatter(NAM_2012, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2012 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment") 


NAM_2012 <- NAM %>% 
  filter(Year == "2012")
NAM_2012 %>% 
  ggplot(aes(x = log10_vwc_int, y = month, fill = treatment)) +
  geom_density_ridges(alpha = 0.6) +
  theme_ridges() + 
  labs(x = "Water Volume Content (log10)", y = "Month",
    title = "VWC(log10) distribution by month and Treatment",
    fill = "Treatment")

ggplot(NAM_2012, aes(x = log10_vwc_int, fill = treatment)) +
  geom_density(adjust = 1.2, alpha = 0.4) +
  theme_minimal() +
  labs(
    x = "Water Volume Content (log10)",
    title = "Density of VWC (log10) by Treatment"
  )


NAM_2013 <- NAM %>% 
  filter(Year == "2013")
ggscatter(NAM_2013, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2013 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2014 <- NAM %>% 
  filter(Year == "2014")
ggscatter(NAM_2014, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2014 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2015 <- NAM %>% 
  filter(Year == "2015")
ggscatter(NAM_2015, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2015 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2016 <- NAM %>% 
  filter(Year == "2016")
ggscatter(NAM_2016, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2016 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2017 <- NAM %>% 
  filter(Year == "2017")
ggscatter(NAM_2017, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2017 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2018 <- NAM %>% 
  filter(Year == "2018")
ggscatter(NAM_2018, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          add = "loess", conf.int.level = 0.95,
          xlab = "2018 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2019 <- NAM %>% 
  filter(Year == "2019")
ggscatter(NAM_2019, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2019 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2020 <- NAM %>% 
  filter(Year == "2020")
ggscatter(NAM_2020, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2020 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2021 <- NAM %>% 
  filter(Year == "2021")
ggscatter(NAM_2021, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2021 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")

NAM_2022 <- NAM %>% 
  filter(Year == "2022")
ggscatter(NAM_2022, x="Date", y ="log10_vwc_int", color = "treatment", 
          fill = "treatment", size = 0.5, alpha = 0.4, 
          xlab = "2022 North American Monsoon Months", 
          ylab = "water volume content (log10)", 
          title = "annual water volume content during monsoon by treatment")


#vwc at monsoon vs not
ggplot(ds, aes(x = Date, y = log10_vwc_int)) + 
  geom_line(size = 0.3, alpha = 0.4) 

#############  mean of VWC by year and treatment #####################
daily_mean12 <- NAM_2012 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean12, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
    title = "2012 VWC by treatment")

daily_mean13 <- NAM_2013 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean13, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2013 VWC by treatment")

daily_mean14 <- NAM_2014 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean14, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2014 VWC by treatment")

daily_mean15 <- NAM_2015 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean15, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2015 VWC by treatment")

daily_mean16 <- NAM_2016 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean16, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2016 VWC by treatment")

daily_mean17 <- NAM_2017 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean17, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2017 VWC by treatment")

daily_mean18 <- NAM_2018 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean18, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2018 VWC by treatment")

daily_mean19 <- NAM_2019 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean19, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2019 VWC by treatment")

daily_mean20 <- NAM_2020 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean20, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2020 VWC by treatment")

daily_mean21 <- NAM_2021 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean21, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2021 VWC by treatment")

daily_mean22 <- NAM_2022 %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
ggplot(daily_mean22, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs( x = "Months", y = "Volumetric Water Content (VWC)",
        title = "2022 VWC by treatment")

ggplot(NAM, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs(x = "Months", y = "Volumetric Water Content (VWC)",
      title = "Mean VWC by treatment North American Monsoon")

ggplot(NAM, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs(x = "Months", y = "Volumetric Water Content (VWC)",
       title = "Mean VWC by treatment North American Monsoon") + 
  annotate("text", x = as.Date("2013-06-01"), y = 0.155, label = "****", size = 6) +
  annotate("segment", x = as.Date("2012-05-01"), xend = as.Date("2014-09-01"), y = 0.16, yend = 0.16, 
           linewidth = 0.8)

NAM %>% 
  kruskal_test(mean_vwc ~ treatment)
NAM %>% 
  dunn_test(mean_vwc ~ treatment)


###ADD STARS

ds <- ds %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment, month) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()

ggplot(ds, aes(x = Date, y = mean_vwc, color = treatment)) +
  geom_smooth(method = "loess", se = TRUE, span = 0.4, alpha = 0.2) +
  theme_minimal() +
  labs(x = "Months", y = "Volumetric Water Content (VWC)",
       title = "Mean VWC by treatment (all months)")

#####precipitation with mean_vwc######
mrme_pcp <- read.csv("~/Desktop/coelab/mrmeprecip.csv")
##FOR PRECIP
mrme_pcp <- mrme_pcp %>% 
  select(year, date, plot, season.precip)
mrme_pcp$date <- as.POSIXct(mrme_pcp$date, format = "%Y-%m-%d")
mrme_pcp <- mrme_pcp %>%
  mutate(DAY = as.Date(date))
mrme_pcp <- mrme_pcp %>%
  select(PRECIP, year, DAY)
vwc_black <- edge_black %>%
  group_by(DAY, Treatment) %>%
  summarize(mean_vwc = mean(VWC, na.rm = TRUE)) %>%
  ungroup()
edge_blk_pcp_2 <- vwc_black %>%
  left_join(mrme_pcp, by = "DAY")
##FOR NAM
NAM <- NAM %>%
  mutate(Date = as.Date(Date)) %>% 
  group_by(Date, treatment, month, DAY) %>%
  summarize(mean_vwc = mean(vwc_int, na.rm = TRUE)) %>%
  ungroup()
NAM$Date <- as.POSIXct(NAM$Date, format = "%Y-%m-%d %H:%M")
NAM <- NAM %>%
  mutate(DAY = as.Date(Date))
NAM_PCP <- NAM %>%
  left_join(mrme_pcp, by = "DAY")
NAM_PCP <- NAM_PCP %>% 
  filter(!is.na(season.precip))
NAM_PCP <- NAM_PCP %>% 
  select("DAY", "month", "season.precip", "year", "treatment", "mean_vwc")
NAM_PCP <- NAM_PCP %>% 
  ##point
ggplot(NAM_PCP, aes(x=season.precip, y = mean_vwc)) + 
       geom_point(size = 1)

NAM_PCP$season.precip


