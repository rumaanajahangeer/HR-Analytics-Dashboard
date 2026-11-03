import pandas as pd
import random

random.seed(42)

departments = ['Sales', 'HR', 'IT', 'Finance', 'Marketing', 'Operations']
genders = ['Male', 'Female']
education = ['Bachelor', 'Master', 'MBA', 'MCA', 'PhD']
job_roles = [
    'Sales Executive', 'HR Executive', 'Software Engineer',
    'Financial Analyst', 'Marketing Specialist', 'Operations Manager'
]
satisfaction = [1, 2, 3, 4]

rows = []

for i in range(1, 5001):
    dept = random.choice(departments)

    role_map = {
        'Sales': 'Sales Executive',
        'HR': 'HR Executive',
        'IT': 'Software Engineer',
        'Finance': 'Financial Analyst',
        'Marketing': 'Marketing Specialist',
        'Operations': 'Operations Manager'
    }

    row = {
          'Employee_ID': f'EMP{i:05d}',
        'Age': random.randint(22, 60),
        'Gender': random.choice(genders),
        'Department': dept,
        'Job_Role': role_map[dept],
        'Education': random.choice(education),
        'Monthly_Income': random.randint(25000, 120000),
        'Years_at_Company': random.randint(0, 20),
        'Job_Satisfaction': random.choice(satisfaction),
        'Attrition': random.choices(['Yes', 'No'], weights=[18, 82])[0]
    }

    rows.append(row)

df = pd.DataFrame(rows)

df.to_csv('Dataset/hr_employees.csv', index=False)

print('HR dataset generated successfully!')
print(df.head())
