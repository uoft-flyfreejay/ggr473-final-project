import csv
import pandas as pd

# Read in the left and right CSV files into DataFrames
df1 = pd.read_csv('T:\Hard drive random\ggr473\ggr473-final-project\code\cleaned_data.csv')
df2 = pd.read_csv('T:\Hard drive random\ggr473\ggr473-final-project\code\cleaned_census.csv')

# Specify the join columns with different names 
left_on = 'NAMELSAD10'
right_on = 'Geographic Area Name'

# Perform left join 
merged = pd.merge(df1, df2[[right_on,'percent_households_with_car']], how='left', left_on=left_on, right_on=right_on)

# Drop the redundant right join column
merged.drop(right_on, axis=1, inplace=True)

# Export back to CSV
merged.to_csv('merged.csv', index=False)