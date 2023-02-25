# Controlling Commits

## Objective

1. At the time of writing this documentation, github classroom is not transparent in revoking write access past the deadline. This allows students to manipulate timestamps on their local desktop and make commits way after the deadline.
2. Our objective here is to provide scripts to help the course administration with relevant documentation on how to go about revoking/giving write access to repositories.

## Usage
Assuming you are part of the administrative group (generally TAs), do the following to give or take write access.

If you are not part of the administrative group and you are a student, kindly contact your TAs for read/write access.

### Pre-requisites
1. `Github Authentication Token` : Create your personal access token following the steps from [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).
2. `CSV File`: csv file (no header), with each row having the following format - 
```.csv
<student-user-name>,<assignment-repository-name>
```
Look at [this](./sample_csv.csv) sample csv file to get an idea. To automatically generate this, checkout [these tips](#automatic-csv-file-generation).
### Give Push Access
```.sh
./access.sh /path/to/csv/file give
```

### Revoke Push Access
```.sh
./access.sh /path/to/csv/file <any string other than "give", including nothing>
```

### Tips for TAs

#### Automatic CSV File Generation
1. Creaing CSV File: Automatically generate the required csv file by going to your assignment page on github classroom.
2. Click on `download -> download grades`
3. At the time of writing this repository, column `D` and `F` (named with the headers `github_username`, `student_repository_name`) are the columns required.
4. Note: remove the header.