# mortgage-default-prediction-icp4d
This is a demo for the IBM Cloud Pak for Data. This project demonstrates the various capabilities of IBM Cloud Pak for Data which is an end to end analytics tool. It shows how a bank can use this demo to predict whether a customer will default a mortgage or not in the future 

## Collect 

In collect part data connections need to be created. A Data connection was created for Db2 Warehourse on Cloud. To do that the following was done: 
1. Create a analystics project 
2. Create a data source  
3. Add host, username, password, DB name 
4. Test connection 
5. Add connection

## Organize 

This is the task of a data engineer. In this step <b>data discovery</b> will be performed, <b>business glossary terms</b> will be added and <b>governence rules and policies</b> are added. <b>Data lineage</b> will be also be demonstrated with this. 


## Analyse  

### Visualizations 
Visualizations explain the business problem in hand.

Insights gained:
1. Showing how many people have applied for loans online
2. Alot of people reside in the Sharjah and Dubai area
3. <b>Insights </b> - People with higher income default the loan more
4. </b> Insights </b> - People buying houses with higher sales price will deafault the loan more 

### Modelling - SPSS 

### Modelling - Notebook 

A notebook will have to be created for this project as well since open scale currently works with Jupyter Notebooks only.

## Infuse - Open Scale 
To avoid biases in the model, <b>open scale</b> on IBM cloud PAK was used. It gives the bank employee the explainabilty required for reporting and reasoning to customers.  

### Open Scale on IBM Cloud PAK - Explainability 
<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/Screenshot%202019-04-17%20at%2011.01.28%20PM.png" >

### Open Scale in action (On the application)
<img src= "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/openscale.gif">

## Front-End Application - Shiny App 

The front end of this project was created using a shiny app. The model API end point needs to be added which will make a call to the models and then display the results in a graph form as seen in the gif below.
