# Talent-Onboarding-using-R-Shiny

Millions of dollars are wasted in talent management life cycle. There are various task that are the part of talent management life cycle, finding the right kind of candidate for the company that fits perfectly with the job description and company requirements. Then once a talent in hired, lots of resource are spent in conducting skill assessment to identify what are the competency of that candidate. After that, finding the best projects for the candidates so that they do well. Our platform focuses in automating all these cumbersome tasks involved in a talent management life cycle for finding the ideal projects for a new candidate based on their competency level.
Through the process of onboarding, we help new talent find their place in the company, both in terms of job responsibilities as well as within organizational culture. During this process, the new hire is likely to become more and more emotionally and intellectually invested in not only their position but also in the company as a whole. During this process, companies can use this tool to find the right set of projects for the new hires based on a competency match between the candidate skills and the ongoing project competencies.

Once a candidate joins the company, it is very crucial to identify the right skills of that candidate and then finding the right projects that the candidate that can be assigned. In this module, based on the competency of the candidate, the module while find the nearest best matching projects that the candidate can be assigned.

# Application Link : https://mlp9csk.shinyapps.io/TALENT_ONBOARDING/

## Problem:
Finding best projects for a new candidate to assign based on their matching technical and behavioral competency.

## Approach: 
o	From the dataset we are fetching the competency of a particular employee and the competencies required to successfully complete the project.
o	Using Euclidean distance method, we are calculating the distance between the selected employee’s competency and project's required set of competencies. 
o	Based on the distance we find the most matching projects for a candidate. 

## Using the application:
1) Upload the data "talent_onboarding_project" and "talent_onboarding_employee" to relevant sections in the application 
2) Select what type of fit you want to find, that is you want to find a project fit for a particular employee or a list of perfect fit employee for a particular project. 
#### Candidate to project fit: 
      • User inputs the employee details file which consist of candidate’s demographic details and competency results.
      • User selects the desired competency of the selected candidates to match with the project.
      • Dynamically selects the desired domain of projects to match
#### Project to candidate fit:
      • User inputs the project details file which consist of project details and competency requirement for those projects.
      • aUser selects the desired competency of the selected project to match with the pool of candidates.
      • Dynamically selects the desired domain of candidates to match.
