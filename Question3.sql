#Show first name of patients that start with the letter 'C'


select
first_name
From patients
where first_name LIKE 'C%'