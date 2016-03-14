import sys
from pandas import DataFrame
import pandas as pd


in_file = sys.argv[1]

df = pd.read_csv(in_file, header=None)
df.columns = ['a', 'b']
print(df)
x = df.groupby(['b'])['a'].mean()
print(x)
y = df['b'].drop_duplicates()
print(y)
df1 = DataFrame(x, y)
print(df1)
df1.to_csv('output.tsv', index=False)
