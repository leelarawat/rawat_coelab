# Package ID: edi.1594.1 Cataloging System:https://pasta.edirepository.org.
# Data set title: Extreme Drought in Grasslands Experiment (EDGE): High frequency measurements from the northern Chihuahuan Desert site, Sevilleta National Wildlife Refuge, NM, USA (2013-2023).
# Data set creator:  Scott Collins -  
# Data set creator:  Renée Brown -  
# Metadata Provider:  Renée Brown -  
# Contact:  Renée Brown -    - rfbrown@unm.edu
# Stylesheet v2.15 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu      
# Uncomment the following lines to have R clear previous work, or set a working directory
# rm(list=ls())      

setwd("~/Desktop/coelab")       

library(ggplot2)

options(HTTPUserAgent="EDI_CodeGen")
	      

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/1594/1/918becfd688ffd5c5a4d0fcc707e551d" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")

                   
 CD_edge_dt1 <-read.csv(infile1,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "TIMESTAMP",     
                    "CON_B6_P18_AT",     
                    "ESR_B6_P19_AT",     
                    "DRT_B6_P20_AT",     
                    "CON_B6_P18_RH",     
                    "ESR_B6_P19_RH",     
                    "DRT_B6_P20_RH",     
                    "BATT",     
                    "BPRESSURE",     
                    "PRECIP"    ), check.names=TRUE)
               
unlink(infile1)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                                                   
# attempting to convert CD_edge_dt1$TIMESTAMP dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"M/D/%y h:%M" 
tmp1TIMESTAMP<-as.POSIXct(CD_edge_dt1$TIMESTAMP,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(CD_edge_dt1[CD_edge_dt1$TIMESTAMP != "",]) == length(tmp1TIMESTAMP[!is.na(tmp1TIMESTAMP)])){CD_edge_dt1$TIMESTAMP <- tmp1TIMESTAMP } else {print("Date conversion failed for CD_edge_dt1$TIMESTAMP. Please inspect the data and do the date conversion yourself.")}                                                                    
                                
if (class(CD_edge_dt1$CON_B6_P18_AT)=="factor") CD_edge_dt1$CON_B6_P18_AT <-as.numeric(levels(CD_edge_dt1$CON_B6_P18_AT))[as.integer(CD_edge_dt1$CON_B6_P18_AT) ]               
if (class(CD_edge_dt1$CON_B6_P18_AT)=="character") CD_edge_dt1$CON_B6_P18_AT <-as.numeric(CD_edge_dt1$CON_B6_P18_AT)
if (class(CD_edge_dt1$ESR_B6_P19_AT)=="factor") CD_edge_dt1$ESR_B6_P19_AT <-as.numeric(levels(CD_edge_dt1$ESR_B6_P19_AT))[as.integer(CD_edge_dt1$ESR_B6_P19_AT) ]               
if (class(CD_edge_dt1$ESR_B6_P19_AT)=="character") CD_edge_dt1$ESR_B6_P19_AT <-as.numeric(CD_edge_dt1$ESR_B6_P19_AT)
if (class(CD_edge_dt1$DRT_B6_P20_AT)=="factor") CD_edge_dt1$DRT_B6_P20_AT <-as.numeric(levels(CD_edge_dt1$DRT_B6_P20_AT))[as.integer(CD_edge_dt1$DRT_B6_P20_AT) ]               
if (class(CD_edge_dt1$DRT_B6_P20_AT)=="character") CD_edge_dt1$DRT_B6_P20_AT <-as.numeric(CD_edge_dt1$DRT_B6_P20_AT)
if (class(CD_edge_dt1$CON_B6_P18_RH)=="factor") CD_edge_dt1$CON_B6_P18_RH <-as.numeric(levels(CD_edge_dt1$CON_B6_P18_RH))[as.integer(CD_edge_dt1$CON_B6_P18_RH) ]               
if (class(CD_edge_dt1$CON_B6_P18_RH)=="character") CD_edge_dt1$CON_B6_P18_RH <-as.numeric(CD_edge_dt1$CON_B6_P18_RH)
if (class(CD_edge_dt1$ESR_B6_P19_RH)=="factor") CD_edge_dt1$ESR_B6_P19_RH <-as.numeric(levels(CD_edge_dt1$ESR_B6_P19_RH))[as.integer(CD_edge_dt1$ESR_B6_P19_RH) ]               
if (class(CD_edge_dt1$ESR_B6_P19_RH)=="character") CD_edge_dt1$ESR_B6_P19_RH <-as.numeric(CD_edge_dt1$ESR_B6_P19_RH)
if (class(CD_edge_dt1$DRT_B6_P20_RH)=="factor") CD_edge_dt1$DRT_B6_P20_RH <-as.numeric(levels(CD_edge_dt1$DRT_B6_P20_RH))[as.integer(CD_edge_dt1$DRT_B6_P20_RH) ]               
if (class(CD_edge_dt1$DRT_B6_P20_RH)=="character") CD_edge_dt1$DRT_B6_P20_RH <-as.numeric(CD_edge_dt1$DRT_B6_P20_RH)
if (class(CD_edge_dt1$BATT)=="factor") CD_edge_dt1$BATT <-as.numeric(levels(CD_edge_dt1$BATT))[as.integer(CD_edge_dt1$BATT) ]               
if (class(CD_edge_dt1$BATT)=="character") CD_edge_dt1$BATT <-as.numeric(CD_edge_dt1$BATT)
if (class(CD_edge_dt1$BPRESSURE)=="factor") CD_edge_dt1$BPRESSURE <-as.numeric(levels(CD_edge_dt1$BPRESSURE))[as.integer(CD_edge_dt1$BPRESSURE) ]               
if (class(CD_edge_dt1$BPRESSURE)=="character") CD_edge_dt1$BPRESSURE <-as.numeric(CD_edge_dt1$BPRESSURE)
if (class(CD_edge_dt1$PRECIP)=="factor") CD_edge_dt1$PRECIP <-as.numeric(levels(CD_edge_dt1$PRECIP))[as.integer(CD_edge_dt1$PRECIP) ]               
if (class(CD_edge_dt1$PRECIP)=="character") CD_edge_dt1$PRECIP <-as.numeric(CD_edge_dt1$PRECIP)
                
# Convert Missing Values to NA for non-dates
                
CD_edge_dt1$CON_B6_P18_AT <- ifelse((trimws(as.character(CD_edge_dt1$CON_B6_P18_AT))==trimws("blank")),NA,CD_edge_dt1$CON_B6_P18_AT)               
suppressWarnings(CD_edge_dt1$CON_B6_P18_AT <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$CON_B6_P18_AT))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$CON_B6_P18_AT))
CD_edge_dt1$ESR_B6_P19_AT <- ifelse((trimws(as.character(CD_edge_dt1$ESR_B6_P19_AT))==trimws("blank")),NA,CD_edge_dt1$ESR_B6_P19_AT)               
suppressWarnings(CD_edge_dt1$ESR_B6_P19_AT <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$ESR_B6_P19_AT))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$ESR_B6_P19_AT))
CD_edge_dt1$DRT_B6_P20_AT <- ifelse((trimws(as.character(CD_edge_dt1$DRT_B6_P20_AT))==trimws("blank")),NA,CD_edge_dt1$DRT_B6_P20_AT)               
suppressWarnings(CD_edge_dt1$DRT_B6_P20_AT <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$DRT_B6_P20_AT))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$DRT_B6_P20_AT))
CD_edge_dt1$CON_B6_P18_RH <- ifelse((trimws(as.character(CD_edge_dt1$CON_B6_P18_RH))==trimws("blank")),NA,CD_edge_dt1$CON_B6_P18_RH)               
suppressWarnings(CD_edge_dt1$CON_B6_P18_RH <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$CON_B6_P18_RH))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$CON_B6_P18_RH))
CD_edge_dt1$ESR_B6_P19_RH <- ifelse((trimws(as.character(CD_edge_dt1$ESR_B6_P19_RH))==trimws("blank")),NA,CD_edge_dt1$ESR_B6_P19_RH)               
suppressWarnings(CD_edge_dt1$ESR_B6_P19_RH <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$ESR_B6_P19_RH))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$ESR_B6_P19_RH))
CD_edge_dt1$DRT_B6_P20_RH <- ifelse((trimws(as.character(CD_edge_dt1$DRT_B6_P20_RH))==trimws("blank")),NA,CD_edge_dt1$DRT_B6_P20_RH)               
suppressWarnings(CD_edge_dt1$DRT_B6_P20_RH <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$DRT_B6_P20_RH))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$DRT_B6_P20_RH))
CD_edge_dt1$BATT <- ifelse((trimws(as.character(CD_edge_dt1$BATT))==trimws("blank")),NA,CD_edge_dt1$BATT)               
suppressWarnings(CD_edge_dt1$BATT <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$BATT))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$BATT))
CD_edge_dt1$BPRESSURE <- ifelse((trimws(as.character(CD_edge_dt1$BPRESSURE))==trimws("blank")),NA,CD_edge_dt1$BPRESSURE)               
suppressWarnings(CD_edge_dt1$BPRESSURE <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$BPRESSURE))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$BPRESSURE))
CD_edge_dt1$PRECIP <- ifelse((trimws(as.character(CD_edge_dt1$PRECIP))==trimws("blank")),NA,CD_edge_dt1$PRECIP)               
suppressWarnings(CD_edge_dt1$PRECIP <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt1$PRECIP))==as.character(as.numeric("blank"))),NA,CD_edge_dt1$PRECIP))


# Here is the structure of the input data frame:
str(CD_edge_dt1)                            
attach(CD_edge_dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(TIMESTAMP)
summary(CON_B6_P18_AT)
summary(ESR_B6_P19_AT)
summary(DRT_B6_P20_AT)
summary(CON_B6_P18_RH)
summary(ESR_B6_P19_RH)
summary(DRT_B6_P20_RH)
summary(BATT)
summary(BPRESSURE)
summary(PRECIP) 
                # Get more details on character variables
                
detach(CD_edge_dt1)               
        
	      

inUrl2  <- "https://pasta.lternet.edu/package/data/eml/edi/1594/1/8c41cb2a0910ec83ac0436819eb8ba0e" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")

                   
 CD_edge_dt2 <-read.csv(infile2,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "TIMESTAMP",     
                    "CON_B6_P18_CO2_5",     
                    "CON_B6_P18_CO2_10",     
                    "CON_B6_P18_CO2_20",     
                    "CON_B6_P18_CO2_AG",     
                    "ESR_B6_P19_CO2_5",     
                    "ESR_B6_P19_CO2_10",     
                    "ESR_B6_P19_CO2_20",     
                    "DRT_B6_P20_CO2_5",     
                    "DRT_B6_P20_CO2_10",     
                    "DRT_B6_P20_CO2_20",     
                    "CON_B5_P17_CO2_5",     
                    "CON_B5_P17_CO2_10",     
                    "CON_B5_P17_CO2_20",     
                    "CON_B5_P17_CO2_AG",     
                    "CON_B1_P23_CO2_5",     
                    "CON_B1_P23_CO2_10",     
                    "CON_B1_P23_CO2_20",     
                    "ESR_B5_P16_CO2_5",     
                    "ESR_B5_P16_CO2_10",     
                    "ESR_B5_P16_CO2_20",     
                    "ESR_B1_P22_CO2_5",     
                    "ESR_B1_P22_CO2_10",     
                    "ESR_B1_P22_CO2_20",     
                    "DRT_B5_P13_CO2_5",     
                    "DRT_B5_P13_CO2_10",     
                    "DRT_B5_P13_CO2_20",     
                    "DRT_B1_P25_CO2_5",     
                    "DRT_B1_P25_CO2_10",     
                    "DRT_B1_P25_CO2_20"    ), check.names=TRUE)
               
unlink(infile2)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                                                   
# attempting to convert CD_edge_dt2$TIMESTAMP dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"M/D/%y h:%M" 
tmp2TIMESTAMP<-as.POSIXct(CD_edge_dt2$TIMESTAMP,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(CD_edge_dt2[CD_edge_dt2$TIMESTAMP != "",]) == length(tmp2TIMESTAMP[!is.na(tmp2TIMESTAMP)])){CD_edge_dt2$TIMESTAMP <- tmp2TIMESTAMP } else {print("Date conversion failed for CD_edge_dt2$TIMESTAMP. Please inspect the data and do the date conversion yourself.")}                                                                    
                                
if (class(CD_edge_dt2$CON_B6_P18_CO2_5)=="factor") CD_edge_dt2$CON_B6_P18_CO2_5 <-as.numeric(levels(CD_edge_dt2$CON_B6_P18_CO2_5))[as.integer(CD_edge_dt2$CON_B6_P18_CO2_5) ]               
if (class(CD_edge_dt2$CON_B6_P18_CO2_5)=="character") CD_edge_dt2$CON_B6_P18_CO2_5 <-as.numeric(CD_edge_dt2$CON_B6_P18_CO2_5)
if (class(CD_edge_dt2$CON_B6_P18_CO2_10)=="factor") CD_edge_dt2$CON_B6_P18_CO2_10 <-as.numeric(levels(CD_edge_dt2$CON_B6_P18_CO2_10))[as.integer(CD_edge_dt2$CON_B6_P18_CO2_10) ]               
if (class(CD_edge_dt2$CON_B6_P18_CO2_10)=="character") CD_edge_dt2$CON_B6_P18_CO2_10 <-as.numeric(CD_edge_dt2$CON_B6_P18_CO2_10)
if (class(CD_edge_dt2$CON_B6_P18_CO2_20)=="factor") CD_edge_dt2$CON_B6_P18_CO2_20 <-as.numeric(levels(CD_edge_dt2$CON_B6_P18_CO2_20))[as.integer(CD_edge_dt2$CON_B6_P18_CO2_20) ]               
if (class(CD_edge_dt2$CON_B6_P18_CO2_20)=="character") CD_edge_dt2$CON_B6_P18_CO2_20 <-as.numeric(CD_edge_dt2$CON_B6_P18_CO2_20)
if (class(CD_edge_dt2$CON_B6_P18_CO2_AG)=="factor") CD_edge_dt2$CON_B6_P18_CO2_AG <-as.numeric(levels(CD_edge_dt2$CON_B6_P18_CO2_AG))[as.integer(CD_edge_dt2$CON_B6_P18_CO2_AG) ]               
if (class(CD_edge_dt2$CON_B6_P18_CO2_AG)=="character") CD_edge_dt2$CON_B6_P18_CO2_AG <-as.numeric(CD_edge_dt2$CON_B6_P18_CO2_AG)
if (class(CD_edge_dt2$ESR_B6_P19_CO2_5)=="factor") CD_edge_dt2$ESR_B6_P19_CO2_5 <-as.numeric(levels(CD_edge_dt2$ESR_B6_P19_CO2_5))[as.integer(CD_edge_dt2$ESR_B6_P19_CO2_5) ]               
if (class(CD_edge_dt2$ESR_B6_P19_CO2_5)=="character") CD_edge_dt2$ESR_B6_P19_CO2_5 <-as.numeric(CD_edge_dt2$ESR_B6_P19_CO2_5)
if (class(CD_edge_dt2$ESR_B6_P19_CO2_10)=="factor") CD_edge_dt2$ESR_B6_P19_CO2_10 <-as.numeric(levels(CD_edge_dt2$ESR_B6_P19_CO2_10))[as.integer(CD_edge_dt2$ESR_B6_P19_CO2_10) ]               
if (class(CD_edge_dt2$ESR_B6_P19_CO2_10)=="character") CD_edge_dt2$ESR_B6_P19_CO2_10 <-as.numeric(CD_edge_dt2$ESR_B6_P19_CO2_10)
if (class(CD_edge_dt2$ESR_B6_P19_CO2_20)=="factor") CD_edge_dt2$ESR_B6_P19_CO2_20 <-as.numeric(levels(CD_edge_dt2$ESR_B6_P19_CO2_20))[as.integer(CD_edge_dt2$ESR_B6_P19_CO2_20) ]               
if (class(CD_edge_dt2$ESR_B6_P19_CO2_20)=="character") CD_edge_dt2$ESR_B6_P19_CO2_20 <-as.numeric(CD_edge_dt2$ESR_B6_P19_CO2_20)
if (class(CD_edge_dt2$DRT_B6_P20_CO2_5)=="factor") CD_edge_dt2$DRT_B6_P20_CO2_5 <-as.numeric(levels(CD_edge_dt2$DRT_B6_P20_CO2_5))[as.integer(CD_edge_dt2$DRT_B6_P20_CO2_5) ]               
if (class(CD_edge_dt2$DRT_B6_P20_CO2_5)=="character") CD_edge_dt2$DRT_B6_P20_CO2_5 <-as.numeric(CD_edge_dt2$DRT_B6_P20_CO2_5)
if (class(CD_edge_dt2$DRT_B6_P20_CO2_10)=="factor") CD_edge_dt2$DRT_B6_P20_CO2_10 <-as.numeric(levels(CD_edge_dt2$DRT_B6_P20_CO2_10))[as.integer(CD_edge_dt2$DRT_B6_P20_CO2_10) ]               
if (class(CD_edge_dt2$DRT_B6_P20_CO2_10)=="character") CD_edge_dt2$DRT_B6_P20_CO2_10 <-as.numeric(CD_edge_dt2$DRT_B6_P20_CO2_10)
if (class(CD_edge_dt2$DRT_B6_P20_CO2_20)=="factor") CD_edge_dt2$DRT_B6_P20_CO2_20 <-as.numeric(levels(CD_edge_dt2$DRT_B6_P20_CO2_20))[as.integer(CD_edge_dt2$DRT_B6_P20_CO2_20) ]               
if (class(CD_edge_dt2$DRT_B6_P20_CO2_20)=="character") CD_edge_dt2$DRT_B6_P20_CO2_20 <-as.numeric(CD_edge_dt2$DRT_B6_P20_CO2_20)
if (class(CD_edge_dt2$CON_B5_P17_CO2_5)=="factor") CD_edge_dt2$CON_B5_P17_CO2_5 <-as.numeric(levels(CD_edge_dt2$CON_B5_P17_CO2_5))[as.integer(CD_edge_dt2$CON_B5_P17_CO2_5) ]               
if (class(CD_edge_dt2$CON_B5_P17_CO2_5)=="character") CD_edge_dt2$CON_B5_P17_CO2_5 <-as.numeric(CD_edge_dt2$CON_B5_P17_CO2_5)
if (class(CD_edge_dt2$CON_B5_P17_CO2_10)=="factor") CD_edge_dt2$CON_B5_P17_CO2_10 <-as.numeric(levels(CD_edge_dt2$CON_B5_P17_CO2_10))[as.integer(CD_edge_dt2$CON_B5_P17_CO2_10) ]               
if (class(CD_edge_dt2$CON_B5_P17_CO2_10)=="character") CD_edge_dt2$CON_B5_P17_CO2_10 <-as.numeric(CD_edge_dt2$CON_B5_P17_CO2_10)
if (class(CD_edge_dt2$CON_B5_P17_CO2_20)=="factor") CD_edge_dt2$CON_B5_P17_CO2_20 <-as.numeric(levels(CD_edge_dt2$CON_B5_P17_CO2_20))[as.integer(CD_edge_dt2$CON_B5_P17_CO2_20) ]               
if (class(CD_edge_dt2$CON_B5_P17_CO2_20)=="character") CD_edge_dt2$CON_B5_P17_CO2_20 <-as.numeric(CD_edge_dt2$CON_B5_P17_CO2_20)
if (class(CD_edge_dt2$CON_B5_P17_CO2_AG)=="factor") CD_edge_dt2$CON_B5_P17_CO2_AG <-as.numeric(levels(CD_edge_dt2$CON_B5_P17_CO2_AG))[as.integer(CD_edge_dt2$CON_B5_P17_CO2_AG) ]               
if (class(CD_edge_dt2$CON_B5_P17_CO2_AG)=="character") CD_edge_dt2$CON_B5_P17_CO2_AG <-as.numeric(CD_edge_dt2$CON_B5_P17_CO2_AG)
if (class(CD_edge_dt2$CON_B1_P23_CO2_5)=="factor") CD_edge_dt2$CON_B1_P23_CO2_5 <-as.numeric(levels(CD_edge_dt2$CON_B1_P23_CO2_5))[as.integer(CD_edge_dt2$CON_B1_P23_CO2_5) ]               
if (class(CD_edge_dt2$CON_B1_P23_CO2_5)=="character") CD_edge_dt2$CON_B1_P23_CO2_5 <-as.numeric(CD_edge_dt2$CON_B1_P23_CO2_5)
if (class(CD_edge_dt2$CON_B1_P23_CO2_10)=="factor") CD_edge_dt2$CON_B1_P23_CO2_10 <-as.numeric(levels(CD_edge_dt2$CON_B1_P23_CO2_10))[as.integer(CD_edge_dt2$CON_B1_P23_CO2_10) ]               
if (class(CD_edge_dt2$CON_B1_P23_CO2_10)=="character") CD_edge_dt2$CON_B1_P23_CO2_10 <-as.numeric(CD_edge_dt2$CON_B1_P23_CO2_10)
if (class(CD_edge_dt2$CON_B1_P23_CO2_20)=="factor") CD_edge_dt2$CON_B1_P23_CO2_20 <-as.numeric(levels(CD_edge_dt2$CON_B1_P23_CO2_20))[as.integer(CD_edge_dt2$CON_B1_P23_CO2_20) ]               
if (class(CD_edge_dt2$CON_B1_P23_CO2_20)=="character") CD_edge_dt2$CON_B1_P23_CO2_20 <-as.numeric(CD_edge_dt2$CON_B1_P23_CO2_20)
if (class(CD_edge_dt2$ESR_B5_P16_CO2_5)=="factor") CD_edge_dt2$ESR_B5_P16_CO2_5 <-as.numeric(levels(CD_edge_dt2$ESR_B5_P16_CO2_5))[as.integer(CD_edge_dt2$ESR_B5_P16_CO2_5) ]               
if (class(CD_edge_dt2$ESR_B5_P16_CO2_5)=="character") CD_edge_dt2$ESR_B5_P16_CO2_5 <-as.numeric(CD_edge_dt2$ESR_B5_P16_CO2_5)
if (class(CD_edge_dt2$ESR_B5_P16_CO2_10)=="factor") CD_edge_dt2$ESR_B5_P16_CO2_10 <-as.numeric(levels(CD_edge_dt2$ESR_B5_P16_CO2_10))[as.integer(CD_edge_dt2$ESR_B5_P16_CO2_10) ]               
if (class(CD_edge_dt2$ESR_B5_P16_CO2_10)=="character") CD_edge_dt2$ESR_B5_P16_CO2_10 <-as.numeric(CD_edge_dt2$ESR_B5_P16_CO2_10)
if (class(CD_edge_dt2$ESR_B5_P16_CO2_20)=="factor") CD_edge_dt2$ESR_B5_P16_CO2_20 <-as.numeric(levels(CD_edge_dt2$ESR_B5_P16_CO2_20))[as.integer(CD_edge_dt2$ESR_B5_P16_CO2_20) ]               
if (class(CD_edge_dt2$ESR_B5_P16_CO2_20)=="character") CD_edge_dt2$ESR_B5_P16_CO2_20 <-as.numeric(CD_edge_dt2$ESR_B5_P16_CO2_20)
if (class(CD_edge_dt2$ESR_B1_P22_CO2_5)=="factor") CD_edge_dt2$ESR_B1_P22_CO2_5 <-as.numeric(levels(CD_edge_dt2$ESR_B1_P22_CO2_5))[as.integer(CD_edge_dt2$ESR_B1_P22_CO2_5) ]               
if (class(CD_edge_dt2$ESR_B1_P22_CO2_5)=="character") CD_edge_dt2$ESR_B1_P22_CO2_5 <-as.numeric(CD_edge_dt2$ESR_B1_P22_CO2_5)
if (class(CD_edge_dt2$ESR_B1_P22_CO2_10)=="factor") CD_edge_dt2$ESR_B1_P22_CO2_10 <-as.numeric(levels(CD_edge_dt2$ESR_B1_P22_CO2_10))[as.integer(CD_edge_dt2$ESR_B1_P22_CO2_10) ]               
if (class(CD_edge_dt2$ESR_B1_P22_CO2_10)=="character") CD_edge_dt2$ESR_B1_P22_CO2_10 <-as.numeric(CD_edge_dt2$ESR_B1_P22_CO2_10)
if (class(CD_edge_dt2$ESR_B1_P22_CO2_20)=="factor") CD_edge_dt2$ESR_B1_P22_CO2_20 <-as.numeric(levels(CD_edge_dt2$ESR_B1_P22_CO2_20))[as.integer(CD_edge_dt2$ESR_B1_P22_CO2_20) ]               
if (class(CD_edge_dt2$ESR_B1_P22_CO2_20)=="character") CD_edge_dt2$ESR_B1_P22_CO2_20 <-as.numeric(CD_edge_dt2$ESR_B1_P22_CO2_20)
if (class(CD_edge_dt2$DRT_B5_P13_CO2_5)=="factor") CD_edge_dt2$DRT_B5_P13_CO2_5 <-as.numeric(levels(CD_edge_dt2$DRT_B5_P13_CO2_5))[as.integer(CD_edge_dt2$DRT_B5_P13_CO2_5) ]               
if (class(CD_edge_dt2$DRT_B5_P13_CO2_5)=="character") CD_edge_dt2$DRT_B5_P13_CO2_5 <-as.numeric(CD_edge_dt2$DRT_B5_P13_CO2_5)
if (class(CD_edge_dt2$DRT_B5_P13_CO2_10)=="factor") CD_edge_dt2$DRT_B5_P13_CO2_10 <-as.numeric(levels(CD_edge_dt2$DRT_B5_P13_CO2_10))[as.integer(CD_edge_dt2$DRT_B5_P13_CO2_10) ]               
if (class(CD_edge_dt2$DRT_B5_P13_CO2_10)=="character") CD_edge_dt2$DRT_B5_P13_CO2_10 <-as.numeric(CD_edge_dt2$DRT_B5_P13_CO2_10)
if (class(CD_edge_dt2$DRT_B5_P13_CO2_20)=="factor") CD_edge_dt2$DRT_B5_P13_CO2_20 <-as.numeric(levels(CD_edge_dt2$DRT_B5_P13_CO2_20))[as.integer(CD_edge_dt2$DRT_B5_P13_CO2_20) ]               
if (class(CD_edge_dt2$DRT_B5_P13_CO2_20)=="character") CD_edge_dt2$DRT_B5_P13_CO2_20 <-as.numeric(CD_edge_dt2$DRT_B5_P13_CO2_20)
if (class(CD_edge_dt2$DRT_B1_P25_CO2_5)=="factor") CD_edge_dt2$DRT_B1_P25_CO2_5 <-as.numeric(levels(CD_edge_dt2$DRT_B1_P25_CO2_5))[as.integer(CD_edge_dt2$DRT_B1_P25_CO2_5) ]               
if (class(CD_edge_dt2$DRT_B1_P25_CO2_5)=="character") CD_edge_dt2$DRT_B1_P25_CO2_5 <-as.numeric(CD_edge_dt2$DRT_B1_P25_CO2_5)
if (class(CD_edge_dt2$DRT_B1_P25_CO2_10)=="factor") CD_edge_dt2$DRT_B1_P25_CO2_10 <-as.numeric(levels(CD_edge_dt2$DRT_B1_P25_CO2_10))[as.integer(CD_edge_dt2$DRT_B1_P25_CO2_10) ]               
if (class(CD_edge_dt2$DRT_B1_P25_CO2_10)=="character") CD_edge_dt2$DRT_B1_P25_CO2_10 <-as.numeric(CD_edge_dt2$DRT_B1_P25_CO2_10)
if (class(CD_edge_dt2$DRT_B1_P25_CO2_20)=="factor") CD_edge_dt2$DRT_B1_P25_CO2_20 <-as.numeric(levels(CD_edge_dt2$DRT_B1_P25_CO2_20))[as.integer(CD_edge_dt2$DRT_B1_P25_CO2_20) ]               
if (class(CD_edge_dt2$DRT_B1_P25_CO2_20)=="character") CD_edge_dt2$DRT_B1_P25_CO2_20 <-as.numeric(CD_edge_dt2$DRT_B1_P25_CO2_20)
                
# Convert Missing Values to NA for non-dates
                
CD_edge_dt2$CON_B6_P18_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B6_P18_CO2_5))==trimws("blank")),NA,CD_edge_dt2$CON_B6_P18_CO2_5)               
suppressWarnings(CD_edge_dt2$CON_B6_P18_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B6_P18_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B6_P18_CO2_5))
CD_edge_dt2$CON_B6_P18_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B6_P18_CO2_10))==trimws("blank")),NA,CD_edge_dt2$CON_B6_P18_CO2_10)               
suppressWarnings(CD_edge_dt2$CON_B6_P18_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B6_P18_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B6_P18_CO2_10))
CD_edge_dt2$CON_B6_P18_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B6_P18_CO2_20))==trimws("blank")),NA,CD_edge_dt2$CON_B6_P18_CO2_20)               
suppressWarnings(CD_edge_dt2$CON_B6_P18_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B6_P18_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B6_P18_CO2_20))
CD_edge_dt2$CON_B6_P18_CO2_AG <- ifelse((trimws(as.character(CD_edge_dt2$CON_B6_P18_CO2_AG))==trimws("blank")),NA,CD_edge_dt2$CON_B6_P18_CO2_AG)               
suppressWarnings(CD_edge_dt2$CON_B6_P18_CO2_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B6_P18_CO2_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B6_P18_CO2_AG))
CD_edge_dt2$ESR_B6_P19_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B6_P19_CO2_5))==trimws("blank")),NA,CD_edge_dt2$ESR_B6_P19_CO2_5)               
suppressWarnings(CD_edge_dt2$ESR_B6_P19_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B6_P19_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B6_P19_CO2_5))
CD_edge_dt2$ESR_B6_P19_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B6_P19_CO2_10))==trimws("blank")),NA,CD_edge_dt2$ESR_B6_P19_CO2_10)               
suppressWarnings(CD_edge_dt2$ESR_B6_P19_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B6_P19_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B6_P19_CO2_10))
CD_edge_dt2$ESR_B6_P19_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B6_P19_CO2_20))==trimws("blank")),NA,CD_edge_dt2$ESR_B6_P19_CO2_20)               
suppressWarnings(CD_edge_dt2$ESR_B6_P19_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B6_P19_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B6_P19_CO2_20))
CD_edge_dt2$DRT_B6_P20_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B6_P20_CO2_5))==trimws("blank")),NA,CD_edge_dt2$DRT_B6_P20_CO2_5)               
suppressWarnings(CD_edge_dt2$DRT_B6_P20_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B6_P20_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B6_P20_CO2_5))
CD_edge_dt2$DRT_B6_P20_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B6_P20_CO2_10))==trimws("blank")),NA,CD_edge_dt2$DRT_B6_P20_CO2_10)               
suppressWarnings(CD_edge_dt2$DRT_B6_P20_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B6_P20_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B6_P20_CO2_10))
CD_edge_dt2$DRT_B6_P20_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B6_P20_CO2_20))==trimws("blank")),NA,CD_edge_dt2$DRT_B6_P20_CO2_20)               
suppressWarnings(CD_edge_dt2$DRT_B6_P20_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B6_P20_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B6_P20_CO2_20))
CD_edge_dt2$CON_B5_P17_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B5_P17_CO2_5))==trimws("blank")),NA,CD_edge_dt2$CON_B5_P17_CO2_5)               
suppressWarnings(CD_edge_dt2$CON_B5_P17_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B5_P17_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B5_P17_CO2_5))
CD_edge_dt2$CON_B5_P17_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B5_P17_CO2_10))==trimws("blank")),NA,CD_edge_dt2$CON_B5_P17_CO2_10)               
suppressWarnings(CD_edge_dt2$CON_B5_P17_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B5_P17_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B5_P17_CO2_10))
CD_edge_dt2$CON_B5_P17_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B5_P17_CO2_20))==trimws("blank")),NA,CD_edge_dt2$CON_B5_P17_CO2_20)               
suppressWarnings(CD_edge_dt2$CON_B5_P17_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B5_P17_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B5_P17_CO2_20))
CD_edge_dt2$CON_B5_P17_CO2_AG <- ifelse((trimws(as.character(CD_edge_dt2$CON_B5_P17_CO2_AG))==trimws("blank")),NA,CD_edge_dt2$CON_B5_P17_CO2_AG)               
suppressWarnings(CD_edge_dt2$CON_B5_P17_CO2_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B5_P17_CO2_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B5_P17_CO2_AG))
CD_edge_dt2$CON_B1_P23_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B1_P23_CO2_5))==trimws("blank")),NA,CD_edge_dt2$CON_B1_P23_CO2_5)               
suppressWarnings(CD_edge_dt2$CON_B1_P23_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B1_P23_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B1_P23_CO2_5))
CD_edge_dt2$CON_B1_P23_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B1_P23_CO2_10))==trimws("blank")),NA,CD_edge_dt2$CON_B1_P23_CO2_10)               
suppressWarnings(CD_edge_dt2$CON_B1_P23_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B1_P23_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B1_P23_CO2_10))
CD_edge_dt2$CON_B1_P23_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$CON_B1_P23_CO2_20))==trimws("blank")),NA,CD_edge_dt2$CON_B1_P23_CO2_20)               
suppressWarnings(CD_edge_dt2$CON_B1_P23_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$CON_B1_P23_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$CON_B1_P23_CO2_20))
CD_edge_dt2$ESR_B5_P16_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B5_P16_CO2_5))==trimws("blank")),NA,CD_edge_dt2$ESR_B5_P16_CO2_5)               
suppressWarnings(CD_edge_dt2$ESR_B5_P16_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B5_P16_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B5_P16_CO2_5))
CD_edge_dt2$ESR_B5_P16_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B5_P16_CO2_10))==trimws("blank")),NA,CD_edge_dt2$ESR_B5_P16_CO2_10)               
suppressWarnings(CD_edge_dt2$ESR_B5_P16_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B5_P16_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B5_P16_CO2_10))
CD_edge_dt2$ESR_B5_P16_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B5_P16_CO2_20))==trimws("blank")),NA,CD_edge_dt2$ESR_B5_P16_CO2_20)               
suppressWarnings(CD_edge_dt2$ESR_B5_P16_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B5_P16_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B5_P16_CO2_20))
CD_edge_dt2$ESR_B1_P22_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B1_P22_CO2_5))==trimws("blank")),NA,CD_edge_dt2$ESR_B1_P22_CO2_5)               
suppressWarnings(CD_edge_dt2$ESR_B1_P22_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B1_P22_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B1_P22_CO2_5))
CD_edge_dt2$ESR_B1_P22_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B1_P22_CO2_10))==trimws("blank")),NA,CD_edge_dt2$ESR_B1_P22_CO2_10)               
suppressWarnings(CD_edge_dt2$ESR_B1_P22_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B1_P22_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B1_P22_CO2_10))
CD_edge_dt2$ESR_B1_P22_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$ESR_B1_P22_CO2_20))==trimws("blank")),NA,CD_edge_dt2$ESR_B1_P22_CO2_20)               
suppressWarnings(CD_edge_dt2$ESR_B1_P22_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$ESR_B1_P22_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$ESR_B1_P22_CO2_20))
CD_edge_dt2$DRT_B5_P13_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B5_P13_CO2_5))==trimws("blank")),NA,CD_edge_dt2$DRT_B5_P13_CO2_5)               
suppressWarnings(CD_edge_dt2$DRT_B5_P13_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B5_P13_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B5_P13_CO2_5))
CD_edge_dt2$DRT_B5_P13_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B5_P13_CO2_10))==trimws("blank")),NA,CD_edge_dt2$DRT_B5_P13_CO2_10)               
suppressWarnings(CD_edge_dt2$DRT_B5_P13_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B5_P13_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B5_P13_CO2_10))
CD_edge_dt2$DRT_B5_P13_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B5_P13_CO2_20))==trimws("blank")),NA,CD_edge_dt2$DRT_B5_P13_CO2_20)               
suppressWarnings(CD_edge_dt2$DRT_B5_P13_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B5_P13_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B5_P13_CO2_20))
CD_edge_dt2$DRT_B1_P25_CO2_5 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B1_P25_CO2_5))==trimws("blank")),NA,CD_edge_dt2$DRT_B1_P25_CO2_5)               
suppressWarnings(CD_edge_dt2$DRT_B1_P25_CO2_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B1_P25_CO2_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B1_P25_CO2_5))
CD_edge_dt2$DRT_B1_P25_CO2_10 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B1_P25_CO2_10))==trimws("blank")),NA,CD_edge_dt2$DRT_B1_P25_CO2_10)               
suppressWarnings(CD_edge_dt2$DRT_B1_P25_CO2_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B1_P25_CO2_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B1_P25_CO2_10))
CD_edge_dt2$DRT_B1_P25_CO2_20 <- ifelse((trimws(as.character(CD_edge_dt2$DRT_B1_P25_CO2_20))==trimws("blank")),NA,CD_edge_dt2$DRT_B1_P25_CO2_20)               
suppressWarnings(CD_edge_dt2$DRT_B1_P25_CO2_20 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt2$DRT_B1_P25_CO2_20))==as.character(as.numeric("blank"))),NA,CD_edge_dt2$DRT_B1_P25_CO2_20))


# Here is the structure of the input data frame:
str(CD_edge_dt2)                            
attach(CD_edge_dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(TIMESTAMP)
summary(CON_B6_P18_CO2_5)
summary(CON_B6_P18_CO2_10)
summary(CON_B6_P18_CO2_20)
summary(CON_B6_P18_CO2_AG)
summary(ESR_B6_P19_CO2_5)
summary(ESR_B6_P19_CO2_10)
summary(ESR_B6_P19_CO2_20)
summary(DRT_B6_P20_CO2_5)
summary(DRT_B6_P20_CO2_10)
summary(DRT_B6_P20_CO2_20)
summary(CON_B5_P17_CO2_5)
summary(CON_B5_P17_CO2_10)
summary(CON_B5_P17_CO2_20)
summary(CON_B5_P17_CO2_AG)
summary(CON_B1_P23_CO2_5)
summary(CON_B1_P23_CO2_10)
summary(CON_B1_P23_CO2_20)
summary(ESR_B5_P16_CO2_5)
summary(ESR_B5_P16_CO2_10)
summary(ESR_B5_P16_CO2_20)
summary(ESR_B1_P22_CO2_5)
summary(ESR_B1_P22_CO2_10)
summary(ESR_B1_P22_CO2_20)
summary(DRT_B5_P13_CO2_5)
summary(DRT_B5_P13_CO2_10)
summary(DRT_B5_P13_CO2_20)
summary(DRT_B1_P25_CO2_5)
summary(DRT_B1_P25_CO2_10)
summary(DRT_B1_P25_CO2_20) 
                # Get more details on character variables
                
detach(CD_edge_dt2)               
        
	      

inUrl3  <- "https://pasta.lternet.edu/package/data/eml/edi/1594/1/53d8a089414ae53a4d0eb33bae19caa7" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")

                   
 CD_edge_dt3 <-read.csv(infile3,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "TIMESTAMP",     
                    "CON_B6_P18_AT_AG",     
                    "CON_B6_P18_ST_5",     
                    "CON_B6_P18_ST_10",     
                    "ESR_B6_P19_AT_AG",     
                    "ESR_B6_P19_ST_5",     
                    "ESR_B6_P19_ST_10",     
                    "DRT_B6_P20_AT_AG",     
                    "DRT_B6_P20_ST_5",     
                    "DRT_B6_P20_ST_10",     
                    "CON_B5_P17_AT_AG",     
                    "CON_B5_P17_ST_5",     
                    "CON_B5_P17_ST_10",     
                    "CON_B1_P23_AT_AG",     
                    "CON_B1_P23_ST_5",     
                    "CON_B1_P23_ST_10",     
                    "ESR_B5_P16_AT_AG",     
                    "ESR_B5_P16_ST_5",     
                    "ESR_B5_P16_ST_10",     
                    "ESR_B1_P22_AT_AG",     
                    "ESR_B1_P22_ST_5",     
                    "ESR_B1_P22_ST_10",     
                    "DRT_B5_P13_AT_AG",     
                    "DRT_B5_P13_ST_5",     
                    "DRT_B5_P13_ST_10",     
                    "DRT_B1_P25_AT_AG",     
                    "DRT_B1_P25_ST_5",     
                    "DRT_B1_P25_ST_10"    ), check.names=TRUE)
               
unlink(infile3)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                                                   
# attempting to convert CD_edge_dt3$TIMESTAMP dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"M/D/%y h:%M" 
tmp3TIMESTAMP<-as.POSIXct(CD_edge_dt3$TIMESTAMP,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(CD_edge_dt3[CD_edge_dt3$TIMESTAMP != "",]) == length(tmp3TIMESTAMP[!is.na(tmp3TIMESTAMP)])){CD_edge_dt3$TIMESTAMP <- tmp3TIMESTAMP } else {print("Date conversion failed for CD_edge_dt3$TIMESTAMP. Please inspect the data and do the date conversion yourself.")}                                                                    
                                
if (class(CD_edge_dt3$CON_B6_P18_AT_AG)=="factor") CD_edge_dt3$CON_B6_P18_AT_AG <-as.numeric(levels(CD_edge_dt3$CON_B6_P18_AT_AG))[as.integer(CD_edge_dt3$CON_B6_P18_AT_AG) ]               
if (class(CD_edge_dt3$CON_B6_P18_AT_AG)=="character") CD_edge_dt3$CON_B6_P18_AT_AG <-as.numeric(CD_edge_dt3$CON_B6_P18_AT_AG)
if (class(CD_edge_dt3$CON_B6_P18_ST_5)=="factor") CD_edge_dt3$CON_B6_P18_ST_5 <-as.numeric(levels(CD_edge_dt3$CON_B6_P18_ST_5))[as.integer(CD_edge_dt3$CON_B6_P18_ST_5) ]               
if (class(CD_edge_dt3$CON_B6_P18_ST_5)=="character") CD_edge_dt3$CON_B6_P18_ST_5 <-as.numeric(CD_edge_dt3$CON_B6_P18_ST_5)
if (class(CD_edge_dt3$CON_B6_P18_ST_10)=="factor") CD_edge_dt3$CON_B6_P18_ST_10 <-as.numeric(levels(CD_edge_dt3$CON_B6_P18_ST_10))[as.integer(CD_edge_dt3$CON_B6_P18_ST_10) ]               
if (class(CD_edge_dt3$CON_B6_P18_ST_10)=="character") CD_edge_dt3$CON_B6_P18_ST_10 <-as.numeric(CD_edge_dt3$CON_B6_P18_ST_10)
if (class(CD_edge_dt3$ESR_B6_P19_AT_AG)=="factor") CD_edge_dt3$ESR_B6_P19_AT_AG <-as.numeric(levels(CD_edge_dt3$ESR_B6_P19_AT_AG))[as.integer(CD_edge_dt3$ESR_B6_P19_AT_AG) ]               
if (class(CD_edge_dt3$ESR_B6_P19_AT_AG)=="character") CD_edge_dt3$ESR_B6_P19_AT_AG <-as.numeric(CD_edge_dt3$ESR_B6_P19_AT_AG)
if (class(CD_edge_dt3$ESR_B6_P19_ST_5)=="factor") CD_edge_dt3$ESR_B6_P19_ST_5 <-as.numeric(levels(CD_edge_dt3$ESR_B6_P19_ST_5))[as.integer(CD_edge_dt3$ESR_B6_P19_ST_5) ]               
if (class(CD_edge_dt3$ESR_B6_P19_ST_5)=="character") CD_edge_dt3$ESR_B6_P19_ST_5 <-as.numeric(CD_edge_dt3$ESR_B6_P19_ST_5)
if (class(CD_edge_dt3$ESR_B6_P19_ST_10)=="factor") CD_edge_dt3$ESR_B6_P19_ST_10 <-as.numeric(levels(CD_edge_dt3$ESR_B6_P19_ST_10))[as.integer(CD_edge_dt3$ESR_B6_P19_ST_10) ]               
if (class(CD_edge_dt3$ESR_B6_P19_ST_10)=="character") CD_edge_dt3$ESR_B6_P19_ST_10 <-as.numeric(CD_edge_dt3$ESR_B6_P19_ST_10)
if (class(CD_edge_dt3$DRT_B6_P20_AT_AG)=="factor") CD_edge_dt3$DRT_B6_P20_AT_AG <-as.numeric(levels(CD_edge_dt3$DRT_B6_P20_AT_AG))[as.integer(CD_edge_dt3$DRT_B6_P20_AT_AG) ]               
if (class(CD_edge_dt3$DRT_B6_P20_AT_AG)=="character") CD_edge_dt3$DRT_B6_P20_AT_AG <-as.numeric(CD_edge_dt3$DRT_B6_P20_AT_AG)
if (class(CD_edge_dt3$DRT_B6_P20_ST_5)=="factor") CD_edge_dt3$DRT_B6_P20_ST_5 <-as.numeric(levels(CD_edge_dt3$DRT_B6_P20_ST_5))[as.integer(CD_edge_dt3$DRT_B6_P20_ST_5) ]               
if (class(CD_edge_dt3$DRT_B6_P20_ST_5)=="character") CD_edge_dt3$DRT_B6_P20_ST_5 <-as.numeric(CD_edge_dt3$DRT_B6_P20_ST_5)
if (class(CD_edge_dt3$DRT_B6_P20_ST_10)=="factor") CD_edge_dt3$DRT_B6_P20_ST_10 <-as.numeric(levels(CD_edge_dt3$DRT_B6_P20_ST_10))[as.integer(CD_edge_dt3$DRT_B6_P20_ST_10) ]               
if (class(CD_edge_dt3$DRT_B6_P20_ST_10)=="character") CD_edge_dt3$DRT_B6_P20_ST_10 <-as.numeric(CD_edge_dt3$DRT_B6_P20_ST_10)
if (class(CD_edge_dt3$CON_B5_P17_AT_AG)=="factor") CD_edge_dt3$CON_B5_P17_AT_AG <-as.numeric(levels(CD_edge_dt3$CON_B5_P17_AT_AG))[as.integer(CD_edge_dt3$CON_B5_P17_AT_AG) ]               
if (class(CD_edge_dt3$CON_B5_P17_AT_AG)=="character") CD_edge_dt3$CON_B5_P17_AT_AG <-as.numeric(CD_edge_dt3$CON_B5_P17_AT_AG)
if (class(CD_edge_dt3$CON_B5_P17_ST_5)=="factor") CD_edge_dt3$CON_B5_P17_ST_5 <-as.numeric(levels(CD_edge_dt3$CON_B5_P17_ST_5))[as.integer(CD_edge_dt3$CON_B5_P17_ST_5) ]               
if (class(CD_edge_dt3$CON_B5_P17_ST_5)=="character") CD_edge_dt3$CON_B5_P17_ST_5 <-as.numeric(CD_edge_dt3$CON_B5_P17_ST_5)
if (class(CD_edge_dt3$CON_B5_P17_ST_10)=="factor") CD_edge_dt3$CON_B5_P17_ST_10 <-as.numeric(levels(CD_edge_dt3$CON_B5_P17_ST_10))[as.integer(CD_edge_dt3$CON_B5_P17_ST_10) ]               
if (class(CD_edge_dt3$CON_B5_P17_ST_10)=="character") CD_edge_dt3$CON_B5_P17_ST_10 <-as.numeric(CD_edge_dt3$CON_B5_P17_ST_10)
if (class(CD_edge_dt3$CON_B1_P23_AT_AG)=="factor") CD_edge_dt3$CON_B1_P23_AT_AG <-as.numeric(levels(CD_edge_dt3$CON_B1_P23_AT_AG))[as.integer(CD_edge_dt3$CON_B1_P23_AT_AG) ]               
if (class(CD_edge_dt3$CON_B1_P23_AT_AG)=="character") CD_edge_dt3$CON_B1_P23_AT_AG <-as.numeric(CD_edge_dt3$CON_B1_P23_AT_AG)
if (class(CD_edge_dt3$CON_B1_P23_ST_5)=="factor") CD_edge_dt3$CON_B1_P23_ST_5 <-as.numeric(levels(CD_edge_dt3$CON_B1_P23_ST_5))[as.integer(CD_edge_dt3$CON_B1_P23_ST_5) ]               
if (class(CD_edge_dt3$CON_B1_P23_ST_5)=="character") CD_edge_dt3$CON_B1_P23_ST_5 <-as.numeric(CD_edge_dt3$CON_B1_P23_ST_5)
if (class(CD_edge_dt3$CON_B1_P23_ST_10)=="factor") CD_edge_dt3$CON_B1_P23_ST_10 <-as.numeric(levels(CD_edge_dt3$CON_B1_P23_ST_10))[as.integer(CD_edge_dt3$CON_B1_P23_ST_10) ]               
if (class(CD_edge_dt3$CON_B1_P23_ST_10)=="character") CD_edge_dt3$CON_B1_P23_ST_10 <-as.numeric(CD_edge_dt3$CON_B1_P23_ST_10)
if (class(CD_edge_dt3$ESR_B5_P16_AT_AG)=="factor") CD_edge_dt3$ESR_B5_P16_AT_AG <-as.numeric(levels(CD_edge_dt3$ESR_B5_P16_AT_AG))[as.integer(CD_edge_dt3$ESR_B5_P16_AT_AG) ]               
if (class(CD_edge_dt3$ESR_B5_P16_AT_AG)=="character") CD_edge_dt3$ESR_B5_P16_AT_AG <-as.numeric(CD_edge_dt3$ESR_B5_P16_AT_AG)
if (class(CD_edge_dt3$ESR_B5_P16_ST_5)=="factor") CD_edge_dt3$ESR_B5_P16_ST_5 <-as.numeric(levels(CD_edge_dt3$ESR_B5_P16_ST_5))[as.integer(CD_edge_dt3$ESR_B5_P16_ST_5) ]               
if (class(CD_edge_dt3$ESR_B5_P16_ST_5)=="character") CD_edge_dt3$ESR_B5_P16_ST_5 <-as.numeric(CD_edge_dt3$ESR_B5_P16_ST_5)
if (class(CD_edge_dt3$ESR_B5_P16_ST_10)=="factor") CD_edge_dt3$ESR_B5_P16_ST_10 <-as.numeric(levels(CD_edge_dt3$ESR_B5_P16_ST_10))[as.integer(CD_edge_dt3$ESR_B5_P16_ST_10) ]               
if (class(CD_edge_dt3$ESR_B5_P16_ST_10)=="character") CD_edge_dt3$ESR_B5_P16_ST_10 <-as.numeric(CD_edge_dt3$ESR_B5_P16_ST_10)
if (class(CD_edge_dt3$ESR_B1_P22_AT_AG)=="factor") CD_edge_dt3$ESR_B1_P22_AT_AG <-as.numeric(levels(CD_edge_dt3$ESR_B1_P22_AT_AG))[as.integer(CD_edge_dt3$ESR_B1_P22_AT_AG) ]               
if (class(CD_edge_dt3$ESR_B1_P22_AT_AG)=="character") CD_edge_dt3$ESR_B1_P22_AT_AG <-as.numeric(CD_edge_dt3$ESR_B1_P22_AT_AG)
if (class(CD_edge_dt3$ESR_B1_P22_ST_5)=="factor") CD_edge_dt3$ESR_B1_P22_ST_5 <-as.numeric(levels(CD_edge_dt3$ESR_B1_P22_ST_5))[as.integer(CD_edge_dt3$ESR_B1_P22_ST_5) ]               
if (class(CD_edge_dt3$ESR_B1_P22_ST_5)=="character") CD_edge_dt3$ESR_B1_P22_ST_5 <-as.numeric(CD_edge_dt3$ESR_B1_P22_ST_5)
if (class(CD_edge_dt3$ESR_B1_P22_ST_10)=="factor") CD_edge_dt3$ESR_B1_P22_ST_10 <-as.numeric(levels(CD_edge_dt3$ESR_B1_P22_ST_10))[as.integer(CD_edge_dt3$ESR_B1_P22_ST_10) ]               
if (class(CD_edge_dt3$ESR_B1_P22_ST_10)=="character") CD_edge_dt3$ESR_B1_P22_ST_10 <-as.numeric(CD_edge_dt3$ESR_B1_P22_ST_10)
if (class(CD_edge_dt3$DRT_B5_P13_AT_AG)=="factor") CD_edge_dt3$DRT_B5_P13_AT_AG <-as.numeric(levels(CD_edge_dt3$DRT_B5_P13_AT_AG))[as.integer(CD_edge_dt3$DRT_B5_P13_AT_AG) ]               
if (class(CD_edge_dt3$DRT_B5_P13_AT_AG)=="character") CD_edge_dt3$DRT_B5_P13_AT_AG <-as.numeric(CD_edge_dt3$DRT_B5_P13_AT_AG)
if (class(CD_edge_dt3$DRT_B5_P13_ST_5)=="factor") CD_edge_dt3$DRT_B5_P13_ST_5 <-as.numeric(levels(CD_edge_dt3$DRT_B5_P13_ST_5))[as.integer(CD_edge_dt3$DRT_B5_P13_ST_5) ]               
if (class(CD_edge_dt3$DRT_B5_P13_ST_5)=="character") CD_edge_dt3$DRT_B5_P13_ST_5 <-as.numeric(CD_edge_dt3$DRT_B5_P13_ST_5)
if (class(CD_edge_dt3$DRT_B5_P13_ST_10)=="factor") CD_edge_dt3$DRT_B5_P13_ST_10 <-as.numeric(levels(CD_edge_dt3$DRT_B5_P13_ST_10))[as.integer(CD_edge_dt3$DRT_B5_P13_ST_10) ]               
if (class(CD_edge_dt3$DRT_B5_P13_ST_10)=="character") CD_edge_dt3$DRT_B5_P13_ST_10 <-as.numeric(CD_edge_dt3$DRT_B5_P13_ST_10)
if (class(CD_edge_dt3$DRT_B1_P25_AT_AG)=="factor") CD_edge_dt3$DRT_B1_P25_AT_AG <-as.numeric(levels(CD_edge_dt3$DRT_B1_P25_AT_AG))[as.integer(CD_edge_dt3$DRT_B1_P25_AT_AG) ]               
if (class(CD_edge_dt3$DRT_B1_P25_AT_AG)=="character") CD_edge_dt3$DRT_B1_P25_AT_AG <-as.numeric(CD_edge_dt3$DRT_B1_P25_AT_AG)
if (class(CD_edge_dt3$DRT_B1_P25_ST_5)=="factor") CD_edge_dt3$DRT_B1_P25_ST_5 <-as.numeric(levels(CD_edge_dt3$DRT_B1_P25_ST_5))[as.integer(CD_edge_dt3$DRT_B1_P25_ST_5) ]               
if (class(CD_edge_dt3$DRT_B1_P25_ST_5)=="character") CD_edge_dt3$DRT_B1_P25_ST_5 <-as.numeric(CD_edge_dt3$DRT_B1_P25_ST_5)
if (class(CD_edge_dt3$DRT_B1_P25_ST_10)=="factor") CD_edge_dt3$DRT_B1_P25_ST_10 <-as.numeric(levels(CD_edge_dt3$DRT_B1_P25_ST_10))[as.integer(CD_edge_dt3$DRT_B1_P25_ST_10) ]               
if (class(CD_edge_dt3$DRT_B1_P25_ST_10)=="character") CD_edge_dt3$DRT_B1_P25_ST_10 <-as.numeric(CD_edge_dt3$DRT_B1_P25_ST_10)
                
# Convert Missing Values to NA for non-dates
                
CD_edge_dt3$CON_B6_P18_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$CON_B6_P18_AT_AG))==trimws("blank")),NA,CD_edge_dt3$CON_B6_P18_AT_AG)               
suppressWarnings(CD_edge_dt3$CON_B6_P18_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B6_P18_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B6_P18_AT_AG))
CD_edge_dt3$CON_B6_P18_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$CON_B6_P18_ST_5))==trimws("blank")),NA,CD_edge_dt3$CON_B6_P18_ST_5)               
suppressWarnings(CD_edge_dt3$CON_B6_P18_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B6_P18_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B6_P18_ST_5))
CD_edge_dt3$CON_B6_P18_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$CON_B6_P18_ST_10))==trimws("blank")),NA,CD_edge_dt3$CON_B6_P18_ST_10)               
suppressWarnings(CD_edge_dt3$CON_B6_P18_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B6_P18_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B6_P18_ST_10))
CD_edge_dt3$ESR_B6_P19_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B6_P19_AT_AG))==trimws("blank")),NA,CD_edge_dt3$ESR_B6_P19_AT_AG)               
suppressWarnings(CD_edge_dt3$ESR_B6_P19_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B6_P19_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B6_P19_AT_AG))
CD_edge_dt3$ESR_B6_P19_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B6_P19_ST_5))==trimws("blank")),NA,CD_edge_dt3$ESR_B6_P19_ST_5)               
suppressWarnings(CD_edge_dt3$ESR_B6_P19_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B6_P19_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B6_P19_ST_5))
CD_edge_dt3$ESR_B6_P19_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B6_P19_ST_10))==trimws("blank")),NA,CD_edge_dt3$ESR_B6_P19_ST_10)               
suppressWarnings(CD_edge_dt3$ESR_B6_P19_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B6_P19_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B6_P19_ST_10))
CD_edge_dt3$DRT_B6_P20_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B6_P20_AT_AG))==trimws("blank")),NA,CD_edge_dt3$DRT_B6_P20_AT_AG)               
suppressWarnings(CD_edge_dt3$DRT_B6_P20_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B6_P20_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B6_P20_AT_AG))
CD_edge_dt3$DRT_B6_P20_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B6_P20_ST_5))==trimws("blank")),NA,CD_edge_dt3$DRT_B6_P20_ST_5)               
suppressWarnings(CD_edge_dt3$DRT_B6_P20_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B6_P20_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B6_P20_ST_5))
CD_edge_dt3$DRT_B6_P20_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B6_P20_ST_10))==trimws("blank")),NA,CD_edge_dt3$DRT_B6_P20_ST_10)               
suppressWarnings(CD_edge_dt3$DRT_B6_P20_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B6_P20_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B6_P20_ST_10))
CD_edge_dt3$CON_B5_P17_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$CON_B5_P17_AT_AG))==trimws("blank")),NA,CD_edge_dt3$CON_B5_P17_AT_AG)               
suppressWarnings(CD_edge_dt3$CON_B5_P17_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B5_P17_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B5_P17_AT_AG))
CD_edge_dt3$CON_B5_P17_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$CON_B5_P17_ST_5))==trimws("blank")),NA,CD_edge_dt3$CON_B5_P17_ST_5)               
suppressWarnings(CD_edge_dt3$CON_B5_P17_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B5_P17_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B5_P17_ST_5))
CD_edge_dt3$CON_B5_P17_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$CON_B5_P17_ST_10))==trimws("blank")),NA,CD_edge_dt3$CON_B5_P17_ST_10)               
suppressWarnings(CD_edge_dt3$CON_B5_P17_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B5_P17_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B5_P17_ST_10))
CD_edge_dt3$CON_B1_P23_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$CON_B1_P23_AT_AG))==trimws("blank")),NA,CD_edge_dt3$CON_B1_P23_AT_AG)               
suppressWarnings(CD_edge_dt3$CON_B1_P23_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B1_P23_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B1_P23_AT_AG))
CD_edge_dt3$CON_B1_P23_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$CON_B1_P23_ST_5))==trimws("blank")),NA,CD_edge_dt3$CON_B1_P23_ST_5)               
suppressWarnings(CD_edge_dt3$CON_B1_P23_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B1_P23_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B1_P23_ST_5))
CD_edge_dt3$CON_B1_P23_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$CON_B1_P23_ST_10))==trimws("blank")),NA,CD_edge_dt3$CON_B1_P23_ST_10)               
suppressWarnings(CD_edge_dt3$CON_B1_P23_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$CON_B1_P23_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$CON_B1_P23_ST_10))
CD_edge_dt3$ESR_B5_P16_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B5_P16_AT_AG))==trimws("blank")),NA,CD_edge_dt3$ESR_B5_P16_AT_AG)               
suppressWarnings(CD_edge_dt3$ESR_B5_P16_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B5_P16_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B5_P16_AT_AG))
CD_edge_dt3$ESR_B5_P16_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B5_P16_ST_5))==trimws("blank")),NA,CD_edge_dt3$ESR_B5_P16_ST_5)               
suppressWarnings(CD_edge_dt3$ESR_B5_P16_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B5_P16_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B5_P16_ST_5))
CD_edge_dt3$ESR_B5_P16_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B5_P16_ST_10))==trimws("blank")),NA,CD_edge_dt3$ESR_B5_P16_ST_10)               
suppressWarnings(CD_edge_dt3$ESR_B5_P16_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B5_P16_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B5_P16_ST_10))
CD_edge_dt3$ESR_B1_P22_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B1_P22_AT_AG))==trimws("blank")),NA,CD_edge_dt3$ESR_B1_P22_AT_AG)               
suppressWarnings(CD_edge_dt3$ESR_B1_P22_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B1_P22_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B1_P22_AT_AG))
CD_edge_dt3$ESR_B1_P22_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B1_P22_ST_5))==trimws("blank")),NA,CD_edge_dt3$ESR_B1_P22_ST_5)               
suppressWarnings(CD_edge_dt3$ESR_B1_P22_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B1_P22_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B1_P22_ST_5))
CD_edge_dt3$ESR_B1_P22_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$ESR_B1_P22_ST_10))==trimws("blank")),NA,CD_edge_dt3$ESR_B1_P22_ST_10)               
suppressWarnings(CD_edge_dt3$ESR_B1_P22_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$ESR_B1_P22_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$ESR_B1_P22_ST_10))
CD_edge_dt3$DRT_B5_P13_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B5_P13_AT_AG))==trimws("blank")),NA,CD_edge_dt3$DRT_B5_P13_AT_AG)               
suppressWarnings(CD_edge_dt3$DRT_B5_P13_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B5_P13_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B5_P13_AT_AG))
CD_edge_dt3$DRT_B5_P13_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B5_P13_ST_5))==trimws("blank")),NA,CD_edge_dt3$DRT_B5_P13_ST_5)               
suppressWarnings(CD_edge_dt3$DRT_B5_P13_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B5_P13_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B5_P13_ST_5))
CD_edge_dt3$DRT_B5_P13_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B5_P13_ST_10))==trimws("blank")),NA,CD_edge_dt3$DRT_B5_P13_ST_10)               
suppressWarnings(CD_edge_dt3$DRT_B5_P13_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B5_P13_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B5_P13_ST_10))
CD_edge_dt3$DRT_B1_P25_AT_AG <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B1_P25_AT_AG))==trimws("blank")),NA,CD_edge_dt3$DRT_B1_P25_AT_AG)               
suppressWarnings(CD_edge_dt3$DRT_B1_P25_AT_AG <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B1_P25_AT_AG))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B1_P25_AT_AG))
CD_edge_dt3$DRT_B1_P25_ST_5 <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B1_P25_ST_5))==trimws("blank")),NA,CD_edge_dt3$DRT_B1_P25_ST_5)               
suppressWarnings(CD_edge_dt3$DRT_B1_P25_ST_5 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B1_P25_ST_5))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B1_P25_ST_5))
CD_edge_dt3$DRT_B1_P25_ST_10 <- ifelse((trimws(as.character(CD_edge_dt3$DRT_B1_P25_ST_10))==trimws("blank")),NA,CD_edge_dt3$DRT_B1_P25_ST_10)               
suppressWarnings(CD_edge_dt3$DRT_B1_P25_ST_10 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt3$DRT_B1_P25_ST_10))==as.character(as.numeric("blank"))),NA,CD_edge_dt3$DRT_B1_P25_ST_10))


# Here is the structure of the input data frame:
str(CD_edge_dt3)                            
attach(CD_edge_dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(TIMESTAMP)
summary(CON_B6_P18_AT_AG)
summary(CON_B6_P18_ST_5)
summary(CON_B6_P18_ST_10)
summary(ESR_B6_P19_AT_AG)
summary(ESR_B6_P19_ST_5)
summary(ESR_B6_P19_ST_10)
summary(DRT_B6_P20_AT_AG)
summary(DRT_B6_P20_ST_5)
summary(DRT_B6_P20_ST_10)
summary(CON_B5_P17_AT_AG)
summary(CON_B5_P17_ST_5)
summary(CON_B5_P17_ST_10)
summary(CON_B1_P23_AT_AG)
summary(CON_B1_P23_ST_5)
summary(CON_B1_P23_ST_10)
summary(ESR_B5_P16_AT_AG)
summary(ESR_B5_P16_ST_5)
summary(ESR_B5_P16_ST_10)
summary(ESR_B1_P22_AT_AG)
summary(ESR_B1_P22_ST_5)
summary(ESR_B1_P22_ST_10)
summary(DRT_B5_P13_AT_AG)
summary(DRT_B5_P13_ST_5)
summary(DRT_B5_P13_ST_10)
summary(DRT_B1_P25_AT_AG)
summary(DRT_B1_P25_ST_5)
summary(DRT_B1_P25_ST_10) 
                # Get more details on character variables
                
detach(CD_edge_dt3)               
        
	      

inUrl4  <- "https://pasta.lternet.edu/package/data/eml/edi/1594/1/c43fbd721e8bc2c2b603bb1019bc6917" 
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")

                   
 CD_edge_dt4 <-read.csv(infile4,header=F 
          ,skip=1
            ,sep=","  
                ,quot='"' 
        , col.names=c(
                    "TIMESTAMP",     
                    "CON_B3_P27_VWC_45",     
                    "CON_B3_P27_VWC_90",     
                    "CON_B6_P18_VWC_45",     
                    "CON_B6_P18_VWC_90",     
                    "CON_B9_P11_VWC_45",     
                    "CON_B9_P11_VWC_90",     
                    "CON_B10_P1_VWC_45",     
                    "CON_B10_P1_VWC_90",     
                    "ESR_B3_P28_VWC_45",     
                    "ESR_B3_P28_VWC_90",     
                    "ESR_B6_P19_VWC_45",     
                    "ESR_B6_P19_VWC_90",     
                    "ESR_B9_P2_VWC_45",     
                    "ESR_B9_P2_VWC_90",     
                    "ESR_B10_P10_VWC_45",     
                    "ESR_B10_P10_VWC_90",     
                    "DRT_B3_P29_VWC_45",     
                    "DRT_B3_P29_VWC_90",     
                    "DRT_B6_P20_VWC_45",     
                    "DRT_B6_P20_VWC_90",     
                    "DRT_B9_P8_VWC_45",     
                    "DRT_B9_P8_VWC_90",     
                    "DRT_B10_P9_VWC_45",     
                    "DRT_B10_P9_VWC_90",     
                    "CON_B5_P17_VWC_45",     
                    "CON_B5_P17_VWC_90",     
                    "CON_B7_P4_VWC_45",     
                    "CON_B7_P4_VWC_90",     
                    "CON_B8_P7_VWC_45",     
                    "CON_B8_P7_VWC_90",     
                    "CON_B1_P23_VWC_45",     
                    "CON_B1_P23_VWC_90",     
                    "CON_B2_P21_VWC_45",     
                    "CON_B2_P21_VWC_90",     
                    "CON_B4_P15_VWC_45",     
                    "CON_B4_P15_VWC_90",     
                    "ESR_B5_P16_VWC_45",     
                    "ESR_B5_P16_VWC_90",     
                    "ESR_B7_P6_VWC_45",     
                    "ESR_B7_P6_VWC_90",     
                    "ESR_B8_P3_VWC_45",     
                    "ESR_B8_P3_VWC_90",     
                    "ESR_B1_P22_VWC_45",     
                    "ESR_B1_P22_VWC_90",     
                    "ESR_B2_P26_VWC_45",     
                    "ESR_B2_P26_VWC_90",     
                    "ESR_B4_P24_VWC_45",     
                    "ESR_B4_P24_VWC_90",     
                    "DRT_B5_P13_VWC_45",     
                    "DRT_B5_P13_VWC_90",     
                    "DRT_B7_P5_VWC_45",     
                    "DRT_B7_P5_VWC_90",     
                    "DRT_B8_P12_VWC_45",     
                    "DRT_B8_P12_VWC_90",     
                    "DRT_B1_P25_VWC_45",     
                    "DRT_B1_P25_VWC_90",     
                    "DRT_B2_P30_VWC_45",     
                    "DRT_B2_P30_VWC_90",     
                    "DRT_B4_P14_VWC_45",     
                    "DRT_B4_P14_VWC_90"    ), check.names=TRUE)
               
unlink(infile4)
		    
# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings
                                                   
# attempting to convert CD_edge_dt4$TIMESTAMP dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"M/D/%y h:%M" 
tmp4TIMESTAMP<-as.POSIXct(CD_edge_dt4$TIMESTAMP,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(CD_edge_dt4[CD_edge_dt4$TIMESTAMP != "",]) == length(tmp4TIMESTAMP[!is.na(tmp4TIMESTAMP)])){CD_edge_dt4$TIMESTAMP <- tmp4TIMESTAMP } else {print("Date conversion failed for CD_edge_dt4$TIMESTAMP. Please inspect the data and do the date conversion yourself.")}                                                                    
                                
if (class(CD_edge_dt4$CON_B3_P27_VWC_45)=="factor") CD_edge_dt4$CON_B3_P27_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B3_P27_VWC_45))[as.integer(CD_edge_dt4$CON_B3_P27_VWC_45) ]               
if (class(CD_edge_dt4$CON_B3_P27_VWC_45)=="character") CD_edge_dt4$CON_B3_P27_VWC_45 <-as.numeric(CD_edge_dt4$CON_B3_P27_VWC_45)
if (class(CD_edge_dt4$CON_B3_P27_VWC_90)=="factor") CD_edge_dt4$CON_B3_P27_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B3_P27_VWC_90))[as.integer(CD_edge_dt4$CON_B3_P27_VWC_90) ]               
if (class(CD_edge_dt4$CON_B3_P27_VWC_90)=="character") CD_edge_dt4$CON_B3_P27_VWC_90 <-as.numeric(CD_edge_dt4$CON_B3_P27_VWC_90)
if (class(CD_edge_dt4$CON_B6_P18_VWC_45)=="factor") CD_edge_dt4$CON_B6_P18_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B6_P18_VWC_45))[as.integer(CD_edge_dt4$CON_B6_P18_VWC_45) ]               
if (class(CD_edge_dt4$CON_B6_P18_VWC_45)=="character") CD_edge_dt4$CON_B6_P18_VWC_45 <-as.numeric(CD_edge_dt4$CON_B6_P18_VWC_45)
if (class(CD_edge_dt4$CON_B6_P18_VWC_90)=="factor") CD_edge_dt4$CON_B6_P18_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B6_P18_VWC_90))[as.integer(CD_edge_dt4$CON_B6_P18_VWC_90) ]               
if (class(CD_edge_dt4$CON_B6_P18_VWC_90)=="character") CD_edge_dt4$CON_B6_P18_VWC_90 <-as.numeric(CD_edge_dt4$CON_B6_P18_VWC_90)
if (class(CD_edge_dt4$CON_B9_P11_VWC_45)=="factor") CD_edge_dt4$CON_B9_P11_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B9_P11_VWC_45))[as.integer(CD_edge_dt4$CON_B9_P11_VWC_45) ]               
if (class(CD_edge_dt4$CON_B9_P11_VWC_45)=="character") CD_edge_dt4$CON_B9_P11_VWC_45 <-as.numeric(CD_edge_dt4$CON_B9_P11_VWC_45)
if (class(CD_edge_dt4$CON_B9_P11_VWC_90)=="factor") CD_edge_dt4$CON_B9_P11_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B9_P11_VWC_90))[as.integer(CD_edge_dt4$CON_B9_P11_VWC_90) ]               
if (class(CD_edge_dt4$CON_B9_P11_VWC_90)=="character") CD_edge_dt4$CON_B9_P11_VWC_90 <-as.numeric(CD_edge_dt4$CON_B9_P11_VWC_90)
if (class(CD_edge_dt4$CON_B10_P1_VWC_45)=="factor") CD_edge_dt4$CON_B10_P1_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B10_P1_VWC_45))[as.integer(CD_edge_dt4$CON_B10_P1_VWC_45) ]               
if (class(CD_edge_dt4$CON_B10_P1_VWC_45)=="character") CD_edge_dt4$CON_B10_P1_VWC_45 <-as.numeric(CD_edge_dt4$CON_B10_P1_VWC_45)
if (class(CD_edge_dt4$CON_B10_P1_VWC_90)=="factor") CD_edge_dt4$CON_B10_P1_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B10_P1_VWC_90))[as.integer(CD_edge_dt4$CON_B10_P1_VWC_90) ]               
if (class(CD_edge_dt4$CON_B10_P1_VWC_90)=="character") CD_edge_dt4$CON_B10_P1_VWC_90 <-as.numeric(CD_edge_dt4$CON_B10_P1_VWC_90)
if (class(CD_edge_dt4$ESR_B3_P28_VWC_45)=="factor") CD_edge_dt4$ESR_B3_P28_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B3_P28_VWC_45))[as.integer(CD_edge_dt4$ESR_B3_P28_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B3_P28_VWC_45)=="character") CD_edge_dt4$ESR_B3_P28_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B3_P28_VWC_45)
if (class(CD_edge_dt4$ESR_B3_P28_VWC_90)=="factor") CD_edge_dt4$ESR_B3_P28_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B3_P28_VWC_90))[as.integer(CD_edge_dt4$ESR_B3_P28_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B3_P28_VWC_90)=="character") CD_edge_dt4$ESR_B3_P28_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B3_P28_VWC_90)
if (class(CD_edge_dt4$ESR_B6_P19_VWC_45)=="factor") CD_edge_dt4$ESR_B6_P19_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B6_P19_VWC_45))[as.integer(CD_edge_dt4$ESR_B6_P19_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B6_P19_VWC_45)=="character") CD_edge_dt4$ESR_B6_P19_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B6_P19_VWC_45)
if (class(CD_edge_dt4$ESR_B6_P19_VWC_90)=="factor") CD_edge_dt4$ESR_B6_P19_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B6_P19_VWC_90))[as.integer(CD_edge_dt4$ESR_B6_P19_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B6_P19_VWC_90)=="character") CD_edge_dt4$ESR_B6_P19_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B6_P19_VWC_90)
if (class(CD_edge_dt4$ESR_B9_P2_VWC_45)=="factor") CD_edge_dt4$ESR_B9_P2_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B9_P2_VWC_45))[as.integer(CD_edge_dt4$ESR_B9_P2_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B9_P2_VWC_45)=="character") CD_edge_dt4$ESR_B9_P2_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B9_P2_VWC_45)
if (class(CD_edge_dt4$ESR_B9_P2_VWC_90)=="factor") CD_edge_dt4$ESR_B9_P2_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B9_P2_VWC_90))[as.integer(CD_edge_dt4$ESR_B9_P2_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B9_P2_VWC_90)=="character") CD_edge_dt4$ESR_B9_P2_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B9_P2_VWC_90)
if (class(CD_edge_dt4$ESR_B10_P10_VWC_45)=="factor") CD_edge_dt4$ESR_B10_P10_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B10_P10_VWC_45))[as.integer(CD_edge_dt4$ESR_B10_P10_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B10_P10_VWC_45)=="character") CD_edge_dt4$ESR_B10_P10_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B10_P10_VWC_45)
if (class(CD_edge_dt4$ESR_B10_P10_VWC_90)=="factor") CD_edge_dt4$ESR_B10_P10_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B10_P10_VWC_90))[as.integer(CD_edge_dt4$ESR_B10_P10_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B10_P10_VWC_90)=="character") CD_edge_dt4$ESR_B10_P10_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B10_P10_VWC_90)
if (class(CD_edge_dt4$DRT_B3_P29_VWC_45)=="factor") CD_edge_dt4$DRT_B3_P29_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B3_P29_VWC_45))[as.integer(CD_edge_dt4$DRT_B3_P29_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B3_P29_VWC_45)=="character") CD_edge_dt4$DRT_B3_P29_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B3_P29_VWC_45)
if (class(CD_edge_dt4$DRT_B3_P29_VWC_90)=="factor") CD_edge_dt4$DRT_B3_P29_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B3_P29_VWC_90))[as.integer(CD_edge_dt4$DRT_B3_P29_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B3_P29_VWC_90)=="character") CD_edge_dt4$DRT_B3_P29_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B3_P29_VWC_90)
if (class(CD_edge_dt4$DRT_B6_P20_VWC_45)=="factor") CD_edge_dt4$DRT_B6_P20_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B6_P20_VWC_45))[as.integer(CD_edge_dt4$DRT_B6_P20_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B6_P20_VWC_45)=="character") CD_edge_dt4$DRT_B6_P20_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B6_P20_VWC_45)
if (class(CD_edge_dt4$DRT_B6_P20_VWC_90)=="factor") CD_edge_dt4$DRT_B6_P20_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B6_P20_VWC_90))[as.integer(CD_edge_dt4$DRT_B6_P20_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B6_P20_VWC_90)=="character") CD_edge_dt4$DRT_B6_P20_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B6_P20_VWC_90)
if (class(CD_edge_dt4$DRT_B9_P8_VWC_45)=="factor") CD_edge_dt4$DRT_B9_P8_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B9_P8_VWC_45))[as.integer(CD_edge_dt4$DRT_B9_P8_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B9_P8_VWC_45)=="character") CD_edge_dt4$DRT_B9_P8_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B9_P8_VWC_45)
if (class(CD_edge_dt4$DRT_B9_P8_VWC_90)=="factor") CD_edge_dt4$DRT_B9_P8_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B9_P8_VWC_90))[as.integer(CD_edge_dt4$DRT_B9_P8_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B9_P8_VWC_90)=="character") CD_edge_dt4$DRT_B9_P8_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B9_P8_VWC_90)
if (class(CD_edge_dt4$DRT_B10_P9_VWC_45)=="factor") CD_edge_dt4$DRT_B10_P9_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B10_P9_VWC_45))[as.integer(CD_edge_dt4$DRT_B10_P9_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B10_P9_VWC_45)=="character") CD_edge_dt4$DRT_B10_P9_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B10_P9_VWC_45)
if (class(CD_edge_dt4$DRT_B10_P9_VWC_90)=="factor") CD_edge_dt4$DRT_B10_P9_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B10_P9_VWC_90))[as.integer(CD_edge_dt4$DRT_B10_P9_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B10_P9_VWC_90)=="character") CD_edge_dt4$DRT_B10_P9_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B10_P9_VWC_90)
if (class(CD_edge_dt4$CON_B5_P17_VWC_45)=="factor") CD_edge_dt4$CON_B5_P17_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B5_P17_VWC_45))[as.integer(CD_edge_dt4$CON_B5_P17_VWC_45) ]               
if (class(CD_edge_dt4$CON_B5_P17_VWC_45)=="character") CD_edge_dt4$CON_B5_P17_VWC_45 <-as.numeric(CD_edge_dt4$CON_B5_P17_VWC_45)
if (class(CD_edge_dt4$CON_B5_P17_VWC_90)=="factor") CD_edge_dt4$CON_B5_P17_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B5_P17_VWC_90))[as.integer(CD_edge_dt4$CON_B5_P17_VWC_90) ]               
if (class(CD_edge_dt4$CON_B5_P17_VWC_90)=="character") CD_edge_dt4$CON_B5_P17_VWC_90 <-as.numeric(CD_edge_dt4$CON_B5_P17_VWC_90)
if (class(CD_edge_dt4$CON_B7_P4_VWC_45)=="factor") CD_edge_dt4$CON_B7_P4_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B7_P4_VWC_45))[as.integer(CD_edge_dt4$CON_B7_P4_VWC_45) ]               
if (class(CD_edge_dt4$CON_B7_P4_VWC_45)=="character") CD_edge_dt4$CON_B7_P4_VWC_45 <-as.numeric(CD_edge_dt4$CON_B7_P4_VWC_45)
if (class(CD_edge_dt4$CON_B7_P4_VWC_90)=="factor") CD_edge_dt4$CON_B7_P4_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B7_P4_VWC_90))[as.integer(CD_edge_dt4$CON_B7_P4_VWC_90) ]               
if (class(CD_edge_dt4$CON_B7_P4_VWC_90)=="character") CD_edge_dt4$CON_B7_P4_VWC_90 <-as.numeric(CD_edge_dt4$CON_B7_P4_VWC_90)
if (class(CD_edge_dt4$CON_B8_P7_VWC_45)=="factor") CD_edge_dt4$CON_B8_P7_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B8_P7_VWC_45))[as.integer(CD_edge_dt4$CON_B8_P7_VWC_45) ]               
if (class(CD_edge_dt4$CON_B8_P7_VWC_45)=="character") CD_edge_dt4$CON_B8_P7_VWC_45 <-as.numeric(CD_edge_dt4$CON_B8_P7_VWC_45)
if (class(CD_edge_dt4$CON_B8_P7_VWC_90)=="factor") CD_edge_dt4$CON_B8_P7_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B8_P7_VWC_90))[as.integer(CD_edge_dt4$CON_B8_P7_VWC_90) ]               
if (class(CD_edge_dt4$CON_B8_P7_VWC_90)=="character") CD_edge_dt4$CON_B8_P7_VWC_90 <-as.numeric(CD_edge_dt4$CON_B8_P7_VWC_90)
if (class(CD_edge_dt4$CON_B1_P23_VWC_45)=="factor") CD_edge_dt4$CON_B1_P23_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B1_P23_VWC_45))[as.integer(CD_edge_dt4$CON_B1_P23_VWC_45) ]               
if (class(CD_edge_dt4$CON_B1_P23_VWC_45)=="character") CD_edge_dt4$CON_B1_P23_VWC_45 <-as.numeric(CD_edge_dt4$CON_B1_P23_VWC_45)
if (class(CD_edge_dt4$CON_B1_P23_VWC_90)=="factor") CD_edge_dt4$CON_B1_P23_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B1_P23_VWC_90))[as.integer(CD_edge_dt4$CON_B1_P23_VWC_90) ]               
if (class(CD_edge_dt4$CON_B1_P23_VWC_90)=="character") CD_edge_dt4$CON_B1_P23_VWC_90 <-as.numeric(CD_edge_dt4$CON_B1_P23_VWC_90)
if (class(CD_edge_dt4$CON_B2_P21_VWC_45)=="factor") CD_edge_dt4$CON_B2_P21_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B2_P21_VWC_45))[as.integer(CD_edge_dt4$CON_B2_P21_VWC_45) ]               
if (class(CD_edge_dt4$CON_B2_P21_VWC_45)=="character") CD_edge_dt4$CON_B2_P21_VWC_45 <-as.numeric(CD_edge_dt4$CON_B2_P21_VWC_45)
if (class(CD_edge_dt4$CON_B2_P21_VWC_90)=="factor") CD_edge_dt4$CON_B2_P21_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B2_P21_VWC_90))[as.integer(CD_edge_dt4$CON_B2_P21_VWC_90) ]               
if (class(CD_edge_dt4$CON_B2_P21_VWC_90)=="character") CD_edge_dt4$CON_B2_P21_VWC_90 <-as.numeric(CD_edge_dt4$CON_B2_P21_VWC_90)
if (class(CD_edge_dt4$CON_B4_P15_VWC_45)=="factor") CD_edge_dt4$CON_B4_P15_VWC_45 <-as.numeric(levels(CD_edge_dt4$CON_B4_P15_VWC_45))[as.integer(CD_edge_dt4$CON_B4_P15_VWC_45) ]               
if (class(CD_edge_dt4$CON_B4_P15_VWC_45)=="character") CD_edge_dt4$CON_B4_P15_VWC_45 <-as.numeric(CD_edge_dt4$CON_B4_P15_VWC_45)
if (class(CD_edge_dt4$CON_B4_P15_VWC_90)=="factor") CD_edge_dt4$CON_B4_P15_VWC_90 <-as.numeric(levels(CD_edge_dt4$CON_B4_P15_VWC_90))[as.integer(CD_edge_dt4$CON_B4_P15_VWC_90) ]               
if (class(CD_edge_dt4$CON_B4_P15_VWC_90)=="character") CD_edge_dt4$CON_B4_P15_VWC_90 <-as.numeric(CD_edge_dt4$CON_B4_P15_VWC_90)
if (class(CD_edge_dt4$ESR_B5_P16_VWC_45)=="factor") CD_edge_dt4$ESR_B5_P16_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B5_P16_VWC_45))[as.integer(CD_edge_dt4$ESR_B5_P16_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B5_P16_VWC_45)=="character") CD_edge_dt4$ESR_B5_P16_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B5_P16_VWC_45)
if (class(CD_edge_dt4$ESR_B5_P16_VWC_90)=="factor") CD_edge_dt4$ESR_B5_P16_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B5_P16_VWC_90))[as.integer(CD_edge_dt4$ESR_B5_P16_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B5_P16_VWC_90)=="character") CD_edge_dt4$ESR_B5_P16_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B5_P16_VWC_90)
if (class(CD_edge_dt4$ESR_B7_P6_VWC_45)=="factor") CD_edge_dt4$ESR_B7_P6_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B7_P6_VWC_45))[as.integer(CD_edge_dt4$ESR_B7_P6_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B7_P6_VWC_45)=="character") CD_edge_dt4$ESR_B7_P6_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B7_P6_VWC_45)
if (class(CD_edge_dt4$ESR_B7_P6_VWC_90)=="factor") CD_edge_dt4$ESR_B7_P6_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B7_P6_VWC_90))[as.integer(CD_edge_dt4$ESR_B7_P6_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B7_P6_VWC_90)=="character") CD_edge_dt4$ESR_B7_P6_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B7_P6_VWC_90)
if (class(CD_edge_dt4$ESR_B8_P3_VWC_45)=="factor") CD_edge_dt4$ESR_B8_P3_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B8_P3_VWC_45))[as.integer(CD_edge_dt4$ESR_B8_P3_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B8_P3_VWC_45)=="character") CD_edge_dt4$ESR_B8_P3_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B8_P3_VWC_45)
if (class(CD_edge_dt4$ESR_B8_P3_VWC_90)=="factor") CD_edge_dt4$ESR_B8_P3_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B8_P3_VWC_90))[as.integer(CD_edge_dt4$ESR_B8_P3_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B8_P3_VWC_90)=="character") CD_edge_dt4$ESR_B8_P3_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B8_P3_VWC_90)
if (class(CD_edge_dt4$ESR_B1_P22_VWC_45)=="factor") CD_edge_dt4$ESR_B1_P22_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B1_P22_VWC_45))[as.integer(CD_edge_dt4$ESR_B1_P22_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B1_P22_VWC_45)=="character") CD_edge_dt4$ESR_B1_P22_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B1_P22_VWC_45)
if (class(CD_edge_dt4$ESR_B1_P22_VWC_90)=="factor") CD_edge_dt4$ESR_B1_P22_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B1_P22_VWC_90))[as.integer(CD_edge_dt4$ESR_B1_P22_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B1_P22_VWC_90)=="character") CD_edge_dt4$ESR_B1_P22_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B1_P22_VWC_90)
if (class(CD_edge_dt4$ESR_B2_P26_VWC_45)=="factor") CD_edge_dt4$ESR_B2_P26_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B2_P26_VWC_45))[as.integer(CD_edge_dt4$ESR_B2_P26_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B2_P26_VWC_45)=="character") CD_edge_dt4$ESR_B2_P26_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B2_P26_VWC_45)
if (class(CD_edge_dt4$ESR_B2_P26_VWC_90)=="factor") CD_edge_dt4$ESR_B2_P26_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B2_P26_VWC_90))[as.integer(CD_edge_dt4$ESR_B2_P26_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B2_P26_VWC_90)=="character") CD_edge_dt4$ESR_B2_P26_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B2_P26_VWC_90)
if (class(CD_edge_dt4$ESR_B4_P24_VWC_45)=="factor") CD_edge_dt4$ESR_B4_P24_VWC_45 <-as.numeric(levels(CD_edge_dt4$ESR_B4_P24_VWC_45))[as.integer(CD_edge_dt4$ESR_B4_P24_VWC_45) ]               
if (class(CD_edge_dt4$ESR_B4_P24_VWC_45)=="character") CD_edge_dt4$ESR_B4_P24_VWC_45 <-as.numeric(CD_edge_dt4$ESR_B4_P24_VWC_45)
if (class(CD_edge_dt4$ESR_B4_P24_VWC_90)=="factor") CD_edge_dt4$ESR_B4_P24_VWC_90 <-as.numeric(levels(CD_edge_dt4$ESR_B4_P24_VWC_90))[as.integer(CD_edge_dt4$ESR_B4_P24_VWC_90) ]               
if (class(CD_edge_dt4$ESR_B4_P24_VWC_90)=="character") CD_edge_dt4$ESR_B4_P24_VWC_90 <-as.numeric(CD_edge_dt4$ESR_B4_P24_VWC_90)
if (class(CD_edge_dt4$DRT_B5_P13_VWC_45)=="factor") CD_edge_dt4$DRT_B5_P13_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B5_P13_VWC_45))[as.integer(CD_edge_dt4$DRT_B5_P13_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B5_P13_VWC_45)=="character") CD_edge_dt4$DRT_B5_P13_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B5_P13_VWC_45)
if (class(CD_edge_dt4$DRT_B5_P13_VWC_90)=="factor") CD_edge_dt4$DRT_B5_P13_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B5_P13_VWC_90))[as.integer(CD_edge_dt4$DRT_B5_P13_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B5_P13_VWC_90)=="character") CD_edge_dt4$DRT_B5_P13_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B5_P13_VWC_90)
if (class(CD_edge_dt4$DRT_B7_P5_VWC_45)=="factor") CD_edge_dt4$DRT_B7_P5_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B7_P5_VWC_45))[as.integer(CD_edge_dt4$DRT_B7_P5_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B7_P5_VWC_45)=="character") CD_edge_dt4$DRT_B7_P5_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B7_P5_VWC_45)
if (class(CD_edge_dt4$DRT_B7_P5_VWC_90)=="factor") CD_edge_dt4$DRT_B7_P5_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B7_P5_VWC_90))[as.integer(CD_edge_dt4$DRT_B7_P5_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B7_P5_VWC_90)=="character") CD_edge_dt4$DRT_B7_P5_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B7_P5_VWC_90)
if (class(CD_edge_dt4$DRT_B8_P12_VWC_45)=="factor") CD_edge_dt4$DRT_B8_P12_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B8_P12_VWC_45))[as.integer(CD_edge_dt4$DRT_B8_P12_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B8_P12_VWC_45)=="character") CD_edge_dt4$DRT_B8_P12_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B8_P12_VWC_45)
if (class(CD_edge_dt4$DRT_B8_P12_VWC_90)=="factor") CD_edge_dt4$DRT_B8_P12_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B8_P12_VWC_90))[as.integer(CD_edge_dt4$DRT_B8_P12_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B8_P12_VWC_90)=="character") CD_edge_dt4$DRT_B8_P12_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B8_P12_VWC_90)
if (class(CD_edge_dt4$DRT_B1_P25_VWC_45)=="factor") CD_edge_dt4$DRT_B1_P25_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B1_P25_VWC_45))[as.integer(CD_edge_dt4$DRT_B1_P25_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B1_P25_VWC_45)=="character") CD_edge_dt4$DRT_B1_P25_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B1_P25_VWC_45)
if (class(CD_edge_dt4$DRT_B1_P25_VWC_90)=="factor") CD_edge_dt4$DRT_B1_P25_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B1_P25_VWC_90))[as.integer(CD_edge_dt4$DRT_B1_P25_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B1_P25_VWC_90)=="character") CD_edge_dt4$DRT_B1_P25_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B1_P25_VWC_90)
if (class(CD_edge_dt4$DRT_B2_P30_VWC_45)=="factor") CD_edge_dt4$DRT_B2_P30_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B2_P30_VWC_45))[as.integer(CD_edge_dt4$DRT_B2_P30_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B2_P30_VWC_45)=="character") CD_edge_dt4$DRT_B2_P30_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B2_P30_VWC_45)
if (class(CD_edge_dt4$DRT_B2_P30_VWC_90)=="factor") CD_edge_dt4$DRT_B2_P30_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B2_P30_VWC_90))[as.integer(CD_edge_dt4$DRT_B2_P30_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B2_P30_VWC_90)=="character") CD_edge_dt4$DRT_B2_P30_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B2_P30_VWC_90)
if (class(CD_edge_dt4$DRT_B4_P14_VWC_45)=="factor") CD_edge_dt4$DRT_B4_P14_VWC_45 <-as.numeric(levels(CD_edge_dt4$DRT_B4_P14_VWC_45))[as.integer(CD_edge_dt4$DRT_B4_P14_VWC_45) ]               
if (class(CD_edge_dt4$DRT_B4_P14_VWC_45)=="character") CD_edge_dt4$DRT_B4_P14_VWC_45 <-as.numeric(CD_edge_dt4$DRT_B4_P14_VWC_45)
if (class(CD_edge_dt4$DRT_B4_P14_VWC_90)=="factor") CD_edge_dt4$DRT_B4_P14_VWC_90 <-as.numeric(levels(CD_edge_dt4$DRT_B4_P14_VWC_90))[as.integer(CD_edge_dt4$DRT_B4_P14_VWC_90) ]               
if (class(CD_edge_dt4$DRT_B4_P14_VWC_90)=="character") CD_edge_dt4$DRT_B4_P14_VWC_90 <-as.numeric(CD_edge_dt4$DRT_B4_P14_VWC_90)
                
# Convert Missing Values to NA for non-dates
                
CD_edge_dt4$CON_B3_P27_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B3_P27_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B3_P27_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B3_P27_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B3_P27_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B3_P27_VWC_45))
CD_edge_dt4$CON_B3_P27_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B3_P27_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B3_P27_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B3_P27_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B3_P27_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B3_P27_VWC_90))
CD_edge_dt4$CON_B6_P18_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B6_P18_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B6_P18_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B6_P18_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B6_P18_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B6_P18_VWC_45))
CD_edge_dt4$CON_B6_P18_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B6_P18_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B6_P18_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B6_P18_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B6_P18_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B6_P18_VWC_90))
CD_edge_dt4$CON_B9_P11_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B9_P11_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B9_P11_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B9_P11_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B9_P11_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B9_P11_VWC_45))
CD_edge_dt4$CON_B9_P11_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B9_P11_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B9_P11_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B9_P11_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B9_P11_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B9_P11_VWC_90))
CD_edge_dt4$CON_B10_P1_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B10_P1_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B10_P1_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B10_P1_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B10_P1_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B10_P1_VWC_45))
CD_edge_dt4$CON_B10_P1_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B10_P1_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B10_P1_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B10_P1_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B10_P1_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B10_P1_VWC_90))
CD_edge_dt4$ESR_B3_P28_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B3_P28_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B3_P28_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B3_P28_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B3_P28_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B3_P28_VWC_45))
CD_edge_dt4$ESR_B3_P28_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B3_P28_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B3_P28_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B3_P28_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B3_P28_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B3_P28_VWC_90))
CD_edge_dt4$ESR_B6_P19_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B6_P19_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B6_P19_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B6_P19_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B6_P19_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B6_P19_VWC_45))
CD_edge_dt4$ESR_B6_P19_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B6_P19_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B6_P19_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B6_P19_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B6_P19_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B6_P19_VWC_90))
CD_edge_dt4$ESR_B9_P2_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B9_P2_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B9_P2_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B9_P2_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B9_P2_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B9_P2_VWC_45))
CD_edge_dt4$ESR_B9_P2_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B9_P2_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B9_P2_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B9_P2_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B9_P2_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B9_P2_VWC_90))
CD_edge_dt4$ESR_B10_P10_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B10_P10_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B10_P10_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B10_P10_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B10_P10_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B10_P10_VWC_45))
CD_edge_dt4$ESR_B10_P10_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B10_P10_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B10_P10_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B10_P10_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B10_P10_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B10_P10_VWC_90))
CD_edge_dt4$DRT_B3_P29_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B3_P29_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B3_P29_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B3_P29_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B3_P29_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B3_P29_VWC_45))
CD_edge_dt4$DRT_B3_P29_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B3_P29_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B3_P29_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B3_P29_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B3_P29_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B3_P29_VWC_90))
CD_edge_dt4$DRT_B6_P20_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B6_P20_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B6_P20_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B6_P20_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B6_P20_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B6_P20_VWC_45))
CD_edge_dt4$DRT_B6_P20_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B6_P20_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B6_P20_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B6_P20_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B6_P20_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B6_P20_VWC_90))
CD_edge_dt4$DRT_B9_P8_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B9_P8_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B9_P8_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B9_P8_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B9_P8_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B9_P8_VWC_45))
CD_edge_dt4$DRT_B9_P8_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B9_P8_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B9_P8_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B9_P8_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B9_P8_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B9_P8_VWC_90))
CD_edge_dt4$DRT_B10_P9_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B10_P9_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B10_P9_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B10_P9_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B10_P9_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B10_P9_VWC_45))
CD_edge_dt4$DRT_B10_P9_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B10_P9_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B10_P9_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B10_P9_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B10_P9_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B10_P9_VWC_90))
CD_edge_dt4$CON_B5_P17_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B5_P17_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B5_P17_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B5_P17_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B5_P17_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B5_P17_VWC_45))
CD_edge_dt4$CON_B5_P17_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B5_P17_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B5_P17_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B5_P17_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B5_P17_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B5_P17_VWC_90))
CD_edge_dt4$CON_B7_P4_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B7_P4_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B7_P4_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B7_P4_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B7_P4_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B7_P4_VWC_45))
CD_edge_dt4$CON_B7_P4_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B7_P4_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B7_P4_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B7_P4_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B7_P4_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B7_P4_VWC_90))
CD_edge_dt4$CON_B8_P7_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B8_P7_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B8_P7_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B8_P7_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B8_P7_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B8_P7_VWC_45))
CD_edge_dt4$CON_B8_P7_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B8_P7_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B8_P7_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B8_P7_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B8_P7_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B8_P7_VWC_90))
CD_edge_dt4$CON_B1_P23_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B1_P23_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B1_P23_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B1_P23_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B1_P23_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B1_P23_VWC_45))
CD_edge_dt4$CON_B1_P23_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B1_P23_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B1_P23_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B1_P23_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B1_P23_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B1_P23_VWC_90))
CD_edge_dt4$CON_B2_P21_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B2_P21_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B2_P21_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B2_P21_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B2_P21_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B2_P21_VWC_45))
CD_edge_dt4$CON_B2_P21_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B2_P21_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B2_P21_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B2_P21_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B2_P21_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B2_P21_VWC_90))
CD_edge_dt4$CON_B4_P15_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B4_P15_VWC_45))==trimws("blank")),NA,CD_edge_dt4$CON_B4_P15_VWC_45)               
suppressWarnings(CD_edge_dt4$CON_B4_P15_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B4_P15_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B4_P15_VWC_45))
CD_edge_dt4$CON_B4_P15_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$CON_B4_P15_VWC_90))==trimws("blank")),NA,CD_edge_dt4$CON_B4_P15_VWC_90)               
suppressWarnings(CD_edge_dt4$CON_B4_P15_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$CON_B4_P15_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$CON_B4_P15_VWC_90))
CD_edge_dt4$ESR_B5_P16_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B5_P16_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B5_P16_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B5_P16_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B5_P16_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B5_P16_VWC_45))
CD_edge_dt4$ESR_B5_P16_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B5_P16_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B5_P16_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B5_P16_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B5_P16_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B5_P16_VWC_90))
CD_edge_dt4$ESR_B7_P6_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B7_P6_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B7_P6_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B7_P6_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B7_P6_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B7_P6_VWC_45))
CD_edge_dt4$ESR_B7_P6_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B7_P6_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B7_P6_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B7_P6_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B7_P6_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B7_P6_VWC_90))
CD_edge_dt4$ESR_B8_P3_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B8_P3_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B8_P3_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B8_P3_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B8_P3_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B8_P3_VWC_45))
CD_edge_dt4$ESR_B8_P3_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B8_P3_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B8_P3_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B8_P3_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B8_P3_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B8_P3_VWC_90))
CD_edge_dt4$ESR_B1_P22_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B1_P22_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B1_P22_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B1_P22_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B1_P22_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B1_P22_VWC_45))
CD_edge_dt4$ESR_B1_P22_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B1_P22_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B1_P22_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B1_P22_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B1_P22_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B1_P22_VWC_90))
CD_edge_dt4$ESR_B2_P26_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B2_P26_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B2_P26_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B2_P26_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B2_P26_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B2_P26_VWC_45))
CD_edge_dt4$ESR_B2_P26_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B2_P26_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B2_P26_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B2_P26_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B2_P26_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B2_P26_VWC_90))
CD_edge_dt4$ESR_B4_P24_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B4_P24_VWC_45))==trimws("blank")),NA,CD_edge_dt4$ESR_B4_P24_VWC_45)               
suppressWarnings(CD_edge_dt4$ESR_B4_P24_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B4_P24_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B4_P24_VWC_45))
CD_edge_dt4$ESR_B4_P24_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$ESR_B4_P24_VWC_90))==trimws("blank")),NA,CD_edge_dt4$ESR_B4_P24_VWC_90)               
suppressWarnings(CD_edge_dt4$ESR_B4_P24_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$ESR_B4_P24_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$ESR_B4_P24_VWC_90))
CD_edge_dt4$DRT_B5_P13_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B5_P13_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B5_P13_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B5_P13_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B5_P13_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B5_P13_VWC_45))
CD_edge_dt4$DRT_B5_P13_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B5_P13_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B5_P13_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B5_P13_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B5_P13_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B5_P13_VWC_90))
CD_edge_dt4$DRT_B7_P5_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B7_P5_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B7_P5_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B7_P5_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B7_P5_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B7_P5_VWC_45))
CD_edge_dt4$DRT_B7_P5_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B7_P5_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B7_P5_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B7_P5_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B7_P5_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B7_P5_VWC_90))
CD_edge_dt4$DRT_B8_P12_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B8_P12_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B8_P12_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B8_P12_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B8_P12_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B8_P12_VWC_45))
CD_edge_dt4$DRT_B8_P12_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B8_P12_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B8_P12_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B8_P12_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B8_P12_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B8_P12_VWC_90))
CD_edge_dt4$DRT_B1_P25_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B1_P25_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B1_P25_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B1_P25_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B1_P25_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B1_P25_VWC_45))
CD_edge_dt4$DRT_B1_P25_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B1_P25_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B1_P25_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B1_P25_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B1_P25_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B1_P25_VWC_90))
CD_edge_dt4$DRT_B2_P30_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B2_P30_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B2_P30_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B2_P30_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B2_P30_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B2_P30_VWC_45))
CD_edge_dt4$DRT_B2_P30_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B2_P30_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B2_P30_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B2_P30_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B2_P30_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B2_P30_VWC_90))
CD_edge_dt4$DRT_B4_P14_VWC_45 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B4_P14_VWC_45))==trimws("blank")),NA,CD_edge_dt4$DRT_B4_P14_VWC_45)               
suppressWarnings(CD_edge_dt4$DRT_B4_P14_VWC_45 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B4_P14_VWC_45))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B4_P14_VWC_45))
CD_edge_dt4$DRT_B4_P14_VWC_90 <- ifelse((trimws(as.character(CD_edge_dt4$DRT_B4_P14_VWC_90))==trimws("blank")),NA,CD_edge_dt4$DRT_B4_P14_VWC_90)               
suppressWarnings(CD_edge_dt4$DRT_B4_P14_VWC_90 <- ifelse(!is.na(as.numeric("blank")) & (trimws(as.character(CD_edge_dt4$DRT_B4_P14_VWC_90))==as.character(as.numeric("blank"))),NA,CD_edge_dt4$DRT_B4_P14_VWC_90))


# Here is the structure of the input data frame:
str(CD_edge_dt4)                            
attach(CD_edge_dt4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(TIMESTAMP)
summary(CON_B3_P27_VWC_45)
summary(CON_B3_P27_VWC_90)
summary(CON_B6_P18_VWC_45)
summary(CON_B6_P18_VWC_90)
summary(CON_B9_P11_VWC_45)
summary(CON_B9_P11_VWC_90)
summary(CON_B10_P1_VWC_45)
summary(CON_B10_P1_VWC_90)
summary(ESR_B3_P28_VWC_45)
summary(ESR_B3_P28_VWC_90)
summary(ESR_B6_P19_VWC_45)
summary(ESR_B6_P19_VWC_90)
summary(ESR_B9_P2_VWC_45)
summary(ESR_B9_P2_VWC_90)
summary(ESR_B10_P10_VWC_45)
summary(ESR_B10_P10_VWC_90)
summary(DRT_B3_P29_VWC_45)
summary(DRT_B3_P29_VWC_90)
summary(DRT_B6_P20_VWC_45)
summary(DRT_B6_P20_VWC_90)
summary(DRT_B9_P8_VWC_45)
summary(DRT_B9_P8_VWC_90)
summary(DRT_B10_P9_VWC_45)
summary(DRT_B10_P9_VWC_90)
summary(CON_B5_P17_VWC_45)
summary(CON_B5_P17_VWC_90)
summary(CON_B7_P4_VWC_45)
summary(CON_B7_P4_VWC_90)
summary(CON_B8_P7_VWC_45)
summary(CON_B8_P7_VWC_90)
summary(CON_B1_P23_VWC_45)
summary(CON_B1_P23_VWC_90)
summary(CON_B2_P21_VWC_45)
summary(CON_B2_P21_VWC_90)
summary(CON_B4_P15_VWC_45)
summary(CON_B4_P15_VWC_90)
summary(ESR_B5_P16_VWC_45)
summary(ESR_B5_P16_VWC_90)
summary(ESR_B7_P6_VWC_45)
summary(ESR_B7_P6_VWC_90)
summary(ESR_B8_P3_VWC_45)
summary(ESR_B8_P3_VWC_90)
summary(ESR_B1_P22_VWC_45)
summary(ESR_B1_P22_VWC_90)
summary(ESR_B2_P26_VWC_45)
summary(ESR_B2_P26_VWC_90)
summary(ESR_B4_P24_VWC_45)
summary(ESR_B4_P24_VWC_90)
summary(DRT_B5_P13_VWC_45)
summary(DRT_B5_P13_VWC_90)
summary(DRT_B7_P5_VWC_45)
summary(DRT_B7_P5_VWC_90)
summary(DRT_B8_P12_VWC_45)
summary(DRT_B8_P12_VWC_90)
summary(DRT_B1_P25_VWC_45)
summary(DRT_B1_P25_VWC_90)
summary(DRT_B2_P30_VWC_45)
summary(DRT_B2_P30_VWC_90)
summary(DRT_B4_P14_VWC_45)
summary(DRT_B4_P14_VWC_90) 
                # Get more details on character variables
                
detach(CD_edge_dt4)               

full_ds <- 
        
ggplot(CD_edge_dt4$TIMESTAMP, CD_edge_dt4$ESR_B6_P19_VWC_45, 
     xlab = "timestamp", ylab = "vwc_random", 
     main = "day by vwc")

ggplot(CD_edge_dt4, aes(x=TIMESTAMP, y=ESR_B6_P19_VWC_45)) + 
  geom_point() + 
  labs(title = "plot of wvc by year", 
       x = "year", y = "vwc")

CD_edge_dt4$TIMESTAMP <- as.POSIXct(CD_edge_dt4$TIMESTAMP, format = "%m/%d/%y %H:%M")
CD_edge_dt2$TIMESTAMP <- as.POSIXct(CD_edge_dt2$TIMESTAMP, format = "%m/%d/%y %H:%M")

CD_edge_dt4$DAY <- as.Date(CD_edge_dt4$TIMESTAMP)
CD_edge_dt2$DAY <- as.Date(CD_edge_dt2$TIMESTAMP)

CD_edge_CO2_VWC <- merge(CD_edge_dt2, CD_edge_dt4, by= "TIMESTAMP", all = TRUE)
CD_edge_CO2_VWC$DAY <- as.Date(CD_edge_CO2_VWC$TIMESTAMP)

##TRY 1 ON CO2 + VWC
ggplot(CD_edge_CO2_VWC, aes(x = DAY, y = DRT_B1_P25_VWC_45)) +
  geom_point(size = 0.01) +
  facet_wrap(~DRT_B1_P25_CO2_20, ncol = 1) + 
  labs(x = "Day", y = "VWC + CO2", title = "VWC + CO2 by Day")
  

##DIF WAY..
ggplot(CD_edge_CO2_VWC, aes(x = DAY, y = DRT_B1_P25_VWC_45)) +
  geom_point(size = 0.01) +
  facet_wrap(~DRT_B1_P25_CO2_20, ncol = 1) + 
  labs(x = "Day", y = "VWC + CO2", title = "VWC + CO2 by Day")
  

library(tidyr)
install.packages("dplyr")
library(dplyr)
library(ggplot2)


##copied fully with chat gbt 
df_long <- CD_edge_CO2_VWC %>%
  select(DAY, VWC = DRT_B1_P25_VWC_45, CO2 = DRT_B1_P25_CO2_20) %>%
  pivot_longer(cols = c(VWC, CO2), names_to = "Variable", values_to = "Value")

ggplot(df_long, aes(x = DAY, y = Value, color = Variable)) +
  geom_line(size = 0.3) +
  labs(x = "Day", y = "Value", title = "VWC and CO2 over Time")

#FIX SCALE. 
library(ggplot2)

ggplot(CD_edge_CO2_VWC, aes(x = DAY)) +
  geom_line(aes(y = DRT_B1_P25_VWC_45/ 10 ), color = "blue") +
  geom_line(aes(y = DRT_B1_P25_CO2_20) , color = "green") +
  scale_y_continuous(
    name = "VWC",
    sec.axis = sec_axis(~ . * 10, name = "CO2")
  ) +
  labs(
    x = "Day",
    title = "VWC and CO₂ Over Time"
  ) +
  theme_minimal()





