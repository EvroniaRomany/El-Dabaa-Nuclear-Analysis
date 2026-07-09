##Import Libraries
import pandas as pd

##Read File
## NOTE: update this path to point to your local copy of the dataset
## (e.g. export the "Table1" sheet from excel/nuclear_dataset.xlsx to CSV)
df = pd.read_csv("excel_2.csv")
#print (df)

### Explore Data

## Size of Data
#print(df.shape)

## First 5 Rows 
#print(df.head())

## Last 5 Rows
#print(df.tail())

## Random 1 Sample
#print(df.sample())

## Information
#print(df.info())

## Statistical Summary of Numeric columns only
#print(df.describe())

## Statistical Summary of Object Columns only
#print(df.describe(include = object).T)

## Distinct Countries 
#print(df["Country"].unique())

## Distinct Count of Unique Countries
#print(df["Country"].nunique())

## Names of All Columns
#print(df.columns)

## Data type of each Column
#print(df.dtypes)

## Top 3 Counts of Countries
#print(df["Country"].value_counts().head(3))

## Number of Nulls in each Column
#print(df.isna().sum())

## Number of duplicates
print(df.duplicated().sum()) 
