DROP TABLE IF EXISTS DataScienceJobs;
DROP TABLE IF exists DataScienceSkills;

CREATE TABLE DataScienceJobs(
  JobId int auto_increment primary key,
  JobTitle nvarchar(255),
  JobLocation nvarchar(255),
  JobSalary nvarchar(255)
 
  );
  
  CREATE TABLE DataScienceSkills(
  SkillId int auto_increment primary key,
  JobId int,
  SkillName nvarchar(255)
 
 
  );

