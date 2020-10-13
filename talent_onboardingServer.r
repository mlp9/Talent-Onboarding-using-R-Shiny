level<-function(path)
{
  x <- read.csv(path)
  data <- data.frame(x)
  level<-unique(x['branch'])
  return(level)
}
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
employeelevel<-function(path)
{
  e <- read.csv(path)
  edata <- data.frame(e)
  employeelevel<-unique(e['branch'])
  return(employeelevel)
}
#dist(stren,input$project$datapath,input$emp$datapath,input$comp,input$branch,ip$empid)

dist_emp<-function(stren1,datapath_project,datapath_emp,ip_comp,ip_empid){
  stren=stren1
  comp <<- as.data.frame(stren[,ip_comp])
  #  features <<- as.data.frame(stren[,ip_subid2])
  #datapath
  x <- read.csv(datapath_project)
  data <- data.frame(x)
  
  #data<-subset(data, branch==ip_branch)##ip_level
  #print(data)
  data2<<-subset(data, select = c(ip_comp))
  data2<<-rbind(data2)
  ######################################################################################
  data <- read.csv(datapath_emp)
  employee_id<<-subset(data,enroll_no==ip_empid)##ip_empid
  
  employee_id<<-subset(employee_id, select = c(ip_comp))
  a<-as.matrix(data2)
  b<-as.matrix(employee_id)
  
  df_new_1<<-data.frame(sqrt(abs(a-b[1,])))
  #df_name_data<<-data.frame(data_name$name,df_new_1)
  #print(employee_id,digits = 2)
  ref<-employee_id
  result<<-apply(data2,1,function(x) sqrt(sum((x-ref)^2)))
  result<-normalize(result)
  result<-round(c(result), digits=3)
  result<<-as.data.frame(result)
  result
  # result<-normalize(result)
  # result<-signif(c(result), digits=3)
  data <- data.frame(read.csv(datapath_project))
  #data<-subset(data,branch==ip_branch)
  newDf<<-data.frame("Project Name"=data[,2],
                     "Distance"=result)
  df_sorted_asc <<- newDf[with(newDf, order(result)), ]
  final<-head(df_sorted_asc)
}

dist_project<-function(stren1,datapath_project,datapath_emp,ip_comp,ip_projectid){
  stren=stren1
  comp <<- as.data.frame(stren[,ip_comp])
  x <- read.csv(datapath_emp)
  data <- data.frame(x)
  #data<-subset(data,branch==ip_branch)
  data2<-subset(data, select = c(ip_comp))
  data2<<-as.data.frame(rbind(data2))
  ######################################################################################
  x1 <- as.data.frame(read.csv(datapath_project))
  project_id<-subset(x1,projectid==ip_projectid)
  project_id<<-subset(project_id, select = c(ip_comp))
  
  #a<-as.matrix(data2)
  #b<-as.matrix(project_id)
  #df_new_1<<-data.frame(sqrt(abs(a-b[1,])))
  #df_name_data<<-data.frame(data_name$name,df_new_1)
  #print(employee_id,digits = 2)
  
  ref<-as.data.frame(project_id)
  result<-apply(data2,1,function(x) sqrt(sum((x-ref)^2)))
  result<<-round(c(result), digits=3)
  result<-normalize(result)
  result<<-as.data.frame(result)
  
  # result<-normalize(result)
  # result<-signif(c(result), digits=3)
  data <- data.frame(read.csv(datapath_emp))
  #data<-subset(data,branch==ip_branch)
  newDf<<-data.frame("Student Name"=data[,2],
                     "Distance"=result)
  df_sorted_asc <<- newDf[with(newDf, order(result)), ]
  final<-head(df_sorted_asc)
}