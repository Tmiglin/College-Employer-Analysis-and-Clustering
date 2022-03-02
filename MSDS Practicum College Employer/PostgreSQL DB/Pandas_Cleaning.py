import pandas as pd
import random
import numpy as np
from sqlalchemy import create_engine

schools = pd.read_csv('MSDS Practicum College Employer\Datasets\Schools.csv')
admit = pd.read_csv('MSDS Practicum College Employer\Datasets\Admissions_and_Completions.csv')
awards = pd.read_csv('MSDS Practicum College Employer\Datasets\Awards.csv')
instructors = pd.read_csv('MSDS Practicum College Employer\Datasets\Instructors.csv')
instructors = instructors.iloc[:,:61]

nacol = dict.fromkeys(['schoolint','schoolfloat','schoolobj','admitint','admitfloat','admitobj','awardsint','awardsfloat','awardsobj','instructorsint','instructorsfloat','instructorsobj'])

i=1
j=1
for key in nacol:
    if j==1:
        df=schools
        if i==1:
            nacol[key] = list(df.select_dtypes('int64').columns)
        elif i==2:
            nacol[key] = list(df.select_dtypes('float64').columns)
        elif i==3:
            nacol[key] = list(df.select_dtypes('object').columns)
            i=0
            j+=1
    if j==2:
        df=admit
        if i==1:
            nacol[key] = list(df.select_dtypes('int64').columns)
        elif i==2:
            nacol[key] = list(df.select_dtypes('float64').columns)
        elif i==3:
            nacol[key] = list(df.select_dtypes('object').columns)
            i=0
            j+=1
    if j==3:
        df=awards
        if i==1:
            nacol[key] = list(df.select_dtypes('int64').columns)
        elif i==2:
            nacol[key] = list(df.select_dtypes('float64').columns)
        elif i==3:
            nacol[key] = list(df.select_dtypes('object').columns)
            i=0
            j+=1
    if j==4:
        df=instructors
        if i==1:
            nacol[key] = list(df.select_dtypes('int64').columns)
        elif i==2:
            nacol[key] = list(df.select_dtypes('float64').columns)
        elif i==3:
            nacol[key] = list(df.select_dtypes('object').columns)
            i=0
            j+=1
    
    i+=1

intNa = {k: v for k, v in nacol.items() if k.endswith('int')}
floatNa = {k: v for k, v in nacol.items() if k.endswith('float')}
objNa = {k: v for k, v in nacol.items() if k.endswith('obj')}


for key in intNa:
    for item in intNa[key]:
        if key.startswith('school'):
            schools[item] = schools[item].fillna(random.randint(int(schools[item].mean() - schools[item].std()), int(schools[item].mean() + schools[item].std())))
        if key.startswith('admit'):
            admit[item] = admit[item].fillna(random.randint(int(admit[item].mean() - admit[item].std()), int(admit[item].mean() + admit[item].std())))
        if key.startswith('awards'):
            awards[item] = awards[item].fillna(random.randint(int(awards[item].mean() - awards[item].std()), int(awards[item].mean() + awards[item].std())))
        if key.startswith('instructors'):
            instructors[item] = instructors[item].fillna(random.randint(int(instructors[item].mean() - instructors[item].std()), int(instructors[item].mean() + instructors[item].std())))

for key in floatNa:
    if floatNa[key]:
        for item in floatNa[key]:
            if key.startswith('school'):
                schools[item] = schools[item].fillna(random.randrange(int(schools[item].mean() - schools[item].std()), int(schools[item].mean() + schools[item].std())))
            if key.startswith('admit'):
                try:
                    admit[item] = admit[item].fillna(random.randrange(int(admit[item].mean() - admit[item].std()), int(admit[item].mean() + admit[item].std())))
                except:
                    continue
            if key.startswith('awards'):
                try:
                    awards[item] = awards[item].fillna(random.randrange(int(awards[item].mean() - awards[item].std()), int(awards[item].mean() + awards[item].std())))
                except:
                    continue
            if key.startswith('instructors'):
                try:
                    instructors[item] = instructors[item].fillna(random.randint(int(instructors[item].mean() - instructors[item].std()), int(instructors[item].mean() + instructors[item].std())))
                except:
                    continue

for key in objNa:
    if key.startswith('school'):
        schools[objNa[key]].fillna('N/A')
    if key.startswith('admit'):
        admit[objNa[key]].fillna('N/A')
    if key.startswith('awards'):
        awards[objNa[key]].fillna('N/A')
    if key.startswith('instructors'):
        instructors[objNa[key]].fillna('N/A')


schools.to_csv('MSDS Practicum College Employer\Datasets\Schools.csv')
admit.to_csv('MSDS Practicum College Employer\Datasets\Admissions_and_Completions.csv')
awards.to_csv('MSDS Practicum College Employer\Datasets\Awards.csv')
instructors.to_csv('MSDS Practicum College Employer\Datasets\Instructors.csv')

table_names = ['Awards','Schools','Admissions_and_Completions','Instructors']

engine = create_engine('postgresql://postgres:3124@localhost:5433/college_employer')

def find_duplicated_columns(df):
    dupes = []

    columns = df.columns

    for i in range(len(columns)):
        col1 = df.iloc[:, i]
        for j in range(i + 1, len(columns)):
            col2 = df.iloc[:, j]
            # break early if dtypes aren't the same (helps deal with
            # categorical dtypes)
            if col1.dtype is not col2.dtype:
                break
            # otherwise compare values
            if col1.equals(col2):
                dupes.append(columns[i])
                break

    return dupes

for name in table_names:
    df=pd.read_csv(f'MSDS Practicum College Employer\Datasets\{name}.csv')
    dups = find_duplicated_columns(df)
    df.drop(dups, axis=1, inplace=True)
    df.to_sql(name, engine)