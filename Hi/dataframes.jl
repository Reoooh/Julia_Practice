using DataFrames

df1 = DataFrame()
df1[:clo1] = Array([1.0, 2.0, 3.0])
df1[:clo2] = Array([4.0, 5.0, 6.0])
df1[:clo3] = Array([7.0, 8.0, 9.0])
df1[:ID] = Array(['a', 'b', 'c'])

show(df1)

df2 = DataFrame(rand(3,3))

show(df2)

df3 = DataFrame([collect(1:3), collect(4:6)], [:A, :B])

show(df3)
