# mortgage-default-prediction-icp4d
This is a demo for the IBM Cloud Pak for Data. This project demonstrates the various capabilities of IBM Cloud Pak for Data which is an end to end analytics tool. It shows how a bank can use this demo to predict whether a customer will default a mortgage or not in the future  

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/brochure-pic.png">

## Collect 

In collect part data connections need to be created. A Data connection was created for Db2 Warehourse on Cloud. To do that the following was done: 

##### Steps
1. Create a analystics project 
2. Create a data source  
3. Add host, username, password, DB name 
4. Test connection 
5. Add connection

## Organize 

This is the task of a data engineer. In this step <b>data discovery</b> will be performed, <b>business glossary terms</b> will be added and <b>governence rules and policies</b> are added. <b>Data lineage</b> will be also be demonstrated with this. 

### Data Discovery 
Used to analyse the data quality and assign terms to the datasets and project. 

##### Steps 
1. Add the connection 
2. Select analyse data quality
3. Select assign terms
4. Click Discover
5. Assign the terms from the appropriate category 

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/discovery.png">

### Business Glossary 

Create a business glossary understood by everyone

##### Steps
1. Create a category
2. Create a terms
3. Save
4. Repeat 2 to 3 until done 

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/terms.png">

### Goverence 
Compliance to rules and policies of the industry is very important for every business 

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/rules.png">

### Data Lineage  
Data lineage shows the interconnection between all terms, rules and the datasets. It can seen how the terms and rules are linked to the appropriate dataset. 

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/data-lineage.gif">

## Analyse  

### Visualizations 
Visualizations explain the business problem in hand.

Insights gained:
1. Showing how many people have applied for loans online
2. Alot of people reside in the Sharjah and Dubai area
3. <b>Insights </b> - People with higher income default the loan more
4. <b> Insights </b> - People buying houses with higher sales price will deafault the loan more  

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/visual.gif">

### Modelling - SPSS 

Various models were tried and tested using SPSS modeler on IBM Cloud Pak for Data. But the best one was <b>Random Forest</b> and it gave accuracy of <b>90%</b>.

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/spss.gif">

### Modelling - Notebook 

A notebook will have to be created for this project as well since open scale currently works with Jupyter Notebooks only. 

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/notebooks.gif">

## Infuse - Open Scale 
To avoid biases in the model, <b>open scale</b> on IBM cloud PAK was used. It gives the bank employee the explainabilty required for reporting and reasoning to customers.  

### Open Scale on IBM Cloud PAK - Explainability 
<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/Screenshot%202019-04-17%20at%2011.01.28%20PM.png" >

### Open Scale in action (On the application)
<img src= "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/openscale.gif">

## Front-End Application - Shiny App 

The front end of this project was created using a shiny app. The model API end point needs to be added which will make a call to the models and then display the results in a graph form as seen in the gif below. 

<img src = "https://github.com/anchalbhalla/mortgage-default-prediction-icp4d/blob/master/gifs/front-end.gif">
