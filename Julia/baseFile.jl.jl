#Load Packages
cd("C:\\Users\\AMSATA NIANG\\Documents\\Julia")

using Pkg
Pkg.add("CSV")
Pkg.add("DataFrames")
using CSV
using DataFrames

#Addition function
function addition(x, y)
    return (x + y)
end
addition(1, 2)

addition(addition(1, 2), 4)

#changing working directory

#display the current orking directory
pwd()
#list files in the working directory
readdir()

#create a folder in the directory
#mkdir("Folder_testing")
mtime("testing")



df = CSV.read("ShareUpDown_toCorrect_188.csv")

head(df)
first(df, 10)
tail(df)
last(df, 10)
names(df)

#creat an empty dataframe
edf = DataFrame()
edf1 = DataFrame(A = Int[], B = String[])

size(df) #41 rows and 5 column


#write a df to a csv
CSV.write("dataframe.csv", df)

# store DataFrame in an SQLite database table
SQLite.load!(df, db, "dataframe_table")
