library(rvest)
library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='Welcome@1', dbname='project3', host='localhost')
InsertData<-function (url){
  selector_name<-".job-details-container"
  
  skills<-html_nodes(x = url, css = selector_name)
  for(i in 1:length(skills))
  {
    selector_name<-".job-title a"
    JobTitle<-html_nodes(x = skills[i], css = selector_name)%>%
      html_text()
    selector_name<-".location"
    Location<-html_nodes(x = skills[i], css = selector_name)%>%
      html_text()
    selector_name<-".wage"
    salary<-html_nodes(x = skills[i], css = selector_name)%>%
      html_text()
    
    selector_name<-".skill-name"
    skill<-html_nodes(x = skills[i], css = selector_name)%>%
      html_text()
    
    
    
    dbGetQuery(mydb, paste("INSERT INTO DataScienceJobs(JobTitle,JobLocation,JobSalary,Source) VALUES('" ,JobTitle,"','" ,Location,"','",salary,"','CyberCoders')" ))
    
    last_id = fetch(dbSendQuery(mydb, "SELECT LAST_INSERT_ID();"))
    
    for(j in 1 : length(skill))
    {
      
      
      dbGetQuery(mydb, paste("INSERT INTO  DataScienceSkills(JobId,SkillName) VALUES('"  ,last_id,"','",skill[j],"')" ))
      
    }
    
    
  }
  
}

InsertIndeedData<-function (url){
  selector_name<-".row"
  
  skills<-html_nodes(x = url, css = selector_name)
  for(i in 1:length(skills))
  {
    selector_name<-".jobtitle"
    JobTitle<-html_nodes(x = skills[i], css = selector_name)%>%
      html_text()
    selector_name<-".location"
    Location<-html_nodes(x = skills[i], css = selector_name)%>%
      html_text()
    
    salary<-""
    
    selector_name<-".experienceList"
    skill<-html_nodes(x = skills[i], css = selector_name)%>%
      html_text()
    
    skill<-unlist(strsplit(skill, ","))
    
    
    
    dbGetQuery(mydb, paste("INSERT INTO DataScienceJobs(JobTitle,JobLocation,JobSalary,Source) VALUES('" ,JobTitle,"','" ,Location,"','",salary,"','Indeed')" ))
    
    last_id = fetch(dbSendQuery(mydb, "SELECT LAST_INSERT_ID();"))
    
    for(j in 1 : length(skill))
    {
      
      
      dbGetQuery(mydb, paste("INSERT INTO  DataScienceSkills(JobId,SkillName) VALUES('"  ,last_id,"','",skill[j],"')" ))
      
    }
    
    
  }
  
}

dbGetQuery(mydb, "DROP TABLE IF EXISTS DataScienceJobs;" )
dbGetQuery(mydb, "DROP TABLE IF exists DataScienceSkills;" )
dbGetQuery(mydb, "CREATE TABLE DataScienceJobs(
           JobId int auto_increment primary key,
           JobTitle nvarchar(255),
           JobLocation nvarchar(255),
           JobSalary nvarchar(255),
           Source nvarchar(255)
);" )

dbGetQuery(mydb, "  CREATE TABLE DataScienceSkills(
           SkillId int auto_increment primary key,
           JobId int,
           SkillName nvarchar(255)
           
);" )

url<- read_html('https://www.cybercoders.com/jobs/data-scientist-jobs/')

InsertData(url)

url<- read_html('https://www.cybercoders.com/jobs/data-scientist-jobs/?page=2')
InsertData(url)

url<- read_html('https://www.cybercoders.com/jobs/data-scientist-jobs/?page=3')
InsertData(url)

url<- read_html('https://www.cybercoders.com/jobs/data-scientist-jobs/?page=4')
InsertData(url)

url<- read_html('https://www.cybercoders.com/jobs/data-scientist-jobs/?page=5')
InsertData(url)

url<- read_html('https://www.cybercoders.com/jobs/data-scientist-jobs/?page=6')
InsertData(url)
#pager-item

url<- read_html('https://www.indeed.com/q-data-scientist-jobs.html')
InsertIndeedData(url)

url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=10')
InsertIndeedData(url)

url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=20')
InsertIndeedData(url)

url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=30')
InsertIndeedData(url)

url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=40')
InsertIndeedData(url)
url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=50')
InsertIndeedData(url)
url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=60')
InsertIndeedData(url)
url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=70')
InsertIndeedData(url)
url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=80')
InsertIndeedData(url)
url<- read_html('https://www.indeed.com/jobs?q=Data+Scientist&start=90')
InsertIndeedData(url)