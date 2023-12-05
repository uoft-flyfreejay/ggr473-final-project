import pandas as pd
import statsmodels.api as sm

df = pd.read_csv("/content/data_for_linear_reg.csv")
print(df.head())
print(df.info())

# Set X to include multiple independent variables
X = df[['Median income (dollars)', 'density(/hectare)', 'Nearest distance (km)']]
y = df['percent_households_with_car']
# Run the regression model
X = sm.add_constant(X)  # Add a constant term for intercept
m = sm.OLS(y, X).fit()

print(m.summary())

# Update X 
X = df[['Median income (dollars)', 'density(/hectare)']]
# Re-run the regression model
X = sm.add_constant(X)  # Add a constant term for intercept
m = sm.OLS(y, X).fit()

print(m.summary())

# Update X 
X = df[['Median income (dollars)', 'Nearest distance (km)']]
# Re-run the regression model
X = sm.add_constant(X)  # Add a constant term for intercept
m = sm.OLS(y, X).fit()

print(m.summary())

# Update X 
X = df['density(/hectare)']
# Re-run the regression model
X = sm.add_constant(X)  # Add a constant term for intercept
m = sm.OLS(y, X).fit()

print(m.summary())

# Update X 
X = df['Median income (dollars)]
# Re-run the regression model
X = sm.add_constant(X)  # Add a constant term for intercept
m = sm.OLS(y, X).fit()

print(m.summary())

# Update X 
X = df['Nearest distance (km)']
# Re-run the regression model
X = sm.add_constant(X)  # Add a constant term for intercept
m = sm.OLS(y, X).fit()

print(m.summary())


