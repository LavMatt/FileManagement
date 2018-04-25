# ---------------------------------------------------------------------------------
# Program Name: FunctionLib.r
# Date created: 25 April 2018
# Author: Matt Laverty
# Purpose: Library of various functions to call from other r scripts
# 
# ---------------------------------------------------------------------------------
# Requisites:
# None
# 
# ---------------------------------------------------------------------------------
# Functions:
# fnGetFolderPath
# ---------------------------------------------------------------------------------
# Notes:
#
# 
# ---------------------------------------------------------------------------------
# Update history:
# 2018-04-25. Creation


# Function to return the path of the folder held within the textfile in the lib folder
fnGetFolderPath<- function()
{
  
  f<-read.delim("FolderPath.txt")
  
  destFolder <- as.character(f[1,1])
  
  
  return (destFolder)
}


