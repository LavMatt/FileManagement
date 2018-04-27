# ---------------------------------------------------------------------------------
# Program Name: FileManFunctions.r
# Date created: 25 April 2018
# Author: Matt Laverty
# Purpose: Library of File Management functions to call from other r scripts
# 
# ---------------------------------------------------------------------------------
# Requisites:
# None
# 
# ---------------------------------------------------------------------------------
# Functions:
# fnGetFolderPath
# fnSetDir
# fnChooseGetFolderPath
# fnSelectFilesForBackup
#
# ---------------------------------------------------------------------------------
# Notes:
#
# 
# ---------------------------------------------------------------------------------
# Update history:
# 2018-04-25 - Creation
# 2018-04-26 - added functions; fnSetDir, fnChooseGetFolderPath, fnSelectFilesForBackup


# Function to return the path of the folder held within the textfile in the lib folder
  fnGetFolderPath<- function()
  {
    #set the directory to be able to get folder paths
    
      fnSetDir()
    #get the folder path of this script
      thisFilePath <- getwd()
    
    #combine the path and sriptname
      TextFilePath <- paste(thisFilePath,"/FolderPath.txt",sep="")
    
    #read the path from the text file 
      f<-read.delim(TextFilePath)
    
    #convert the list to character object
      destFolder <- as.character(f[1,1])
    
    
    return (destFolder)
  }

# Function to set the directory to where this project is saved
  fnSetDir<- function()
  {
    #set directory to required folder
      setwd("I:/Analytics/lib")
   return()   
  }

# Here the file containing folder path is chosen by the person running the script
  fnChooseGetFolderPath<-function()
  {
    #get the folder path of this script
      chosenFilePath <- file.choose(new = FALSE)
    
    #read the path from the text file 
      f<-read.delim(chosenFilePath)
    
    #convert the list to character object
      destFolder <- as.character(f[1,1])
    
    
    return (destFolder)
  }

  
  
  

# Function to Backup a file or multiple files
  fnSelectFilesForBackup<- function()
  {
    #Choose file to be backed up and load containing folder to variable
      fileToBackUp <- gsub("\\\\", "/",choose.files(caption = "Select one or more files to backup"))
    #find last '/' and uses that as last character of string, i.e the folder path
      fileFolder <- substr(fileToBackUp[1],1,regexpr("\\/[^\\/]*$",fileToBackUp)) 
    
      
    #Create a Dated folder for Backup
      mainDir <- fileFolder
      subDir <- "Backup" 
      
      if (file.exists(file.path(mainDir, subDir))){
        setwd(file.path(mainDir, subDir))
      } else {
        dir.create(file.path(mainDir, subDir))
        setwd(file.path(mainDir, subDir))
        
      }
    
    #load today's date as a string
      DateText<-as.character(Sys.Date())
    
    #create a subfolder in Backup of today's date
      if (file.exists(file.path(mainDir, subDir,DateText))){
        setwd(file.path(mainDir, subDir,DateText))
      } else {
        dir.create(file.path(mainDir, subDir,DateText))
        setwd(file.path(mainDir, subDir,DateText))
        
      }
        
    #Make a copy of the file selected for backup to the newly created folder
      file.copy(fileToBackUp, file.path(mainDir, subDir,DateText), overwrite = FALSE, recursive = FALSE,copy.mode = TRUE, copy.date = FALSE)
    
  }


  
  