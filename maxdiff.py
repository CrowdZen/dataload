import pandas

series = pandas.read_csv('denev.csv',header=[0],squeeze=True,parse_dates=[1])
print(series.head())
print(series.size)
#print(series['time_ts'])


series['time_dt']=pandas.to_datetime(series['time_ts'])
#print(series.head())
series.index=series['time_dt']
del series['time_ts']

series['activity_level']=series['activity_level'].apply(pandas.to_numeric)

from pandas import Series
series['delta'] = series.groupby([(series['time_dt'].dt.year),(series['time_dt'].dt.month),(series['time_dt'].dt.day)])['activity_level'].transform(Series.diff)
#series.to_csv('out.csv')
#print(series.head(50))
f=series.query('abs(delta)>0.09')
print(f)
#print(series)

#series['delta']=series.diff().activity_level.fillna(0)
#f=series.query('abs(delta)>0.09')
#print(f)

#print(series.head())
#print(series['time_dt'])
#print(series['activity_level'])

#grouped_series=series.groupby(series['time_dt'].dt.day)
#print(grouped_series.head())
#series['delta']=grouped_series.diff().activity_level.fillna(0)
#f=series.query('abs(delta)>0.09')
#print(f)
