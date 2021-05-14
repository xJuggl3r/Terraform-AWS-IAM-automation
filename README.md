## CSV2MAP

### A little IaaC to migrate on-prem users to AWS using Terraform
***
<br/>

### Why and How
<br/>
Why: A company is migrating to AWS. It needs to migrate the users, set their passwords and add them to their respective groups.
     Howerver, they only provided a .csv file with the date.
<br/><br/>
How: Instead of manually creating the users in AWS IAM, a better alternative is to automate the task using Terraform.
<br/><br/>
What it does:
<br/>  
- Creates groups<br/>
- Creates Policies<br/>
- Creates Users<br/>
- Sets password to Users<br/>
- Enforces MFA to Users<br/>
- Adds Users to Groups
