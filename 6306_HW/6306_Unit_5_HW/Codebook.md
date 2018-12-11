## CODE BOOK FOR: 6306 Unit 5 Homework

### RAW FILES

1. yob2016.txt
1.A. Delimiter: semi-colon (;) <br />
1.B. Header / Column / Variables: Originally none <br />
1.B.1) Column 1: Name <br />
1.B.2) Column 2: Gender <br />
1.B.3) Column 3: Count (number of children born given this name) <br />

2. yob2015.txt <br />
2.A. Delimiter: comma (,) <br />
2.B. Header / Column / Variables: Originally none <br />
2.B.1) Column 1: Name <br />
2.B.2) Column 2: Gender <br />
2.B.3) Column 3: Count (number of children born given this name) <br />
  
### DATA FRAMES

Data Frame | Number | Original Name | New Name
:-------: | --------| --------| ---------  
df | 01 | (not in yob2016.txt) | Name
df | 02 | (not in yob2016.txt) | Gender
df | 03 | (not in yob2016.txt) | Count
----- | -----| -----| ----- | ----- 
y2016 | 01 | (not in yob2016.txt) | Name
y2016 | 02 | (not in yob2016.txt) | Gender
y2016 | 03 | (not in yob2016.txt) | Count
----- | -----| -----| ----- 
y2015 | 01 | (not in yob2015.txt) | Name
y2015 | 02 | (not in yob2015.txt) | Gender
y2015 | 03 | (not in yob2015.txt) | Count
----- | -----| -----| ----- 
final | 01 | Name | -----
final | 02 | Gender | -----
final | 03 | Count.x | Count_2016
final | 04 | Count.y | Count_2015
final | 05 | (not present) | Total
----- | -----| -----| ----- 
girls | 01 | Name | -----
girls | 02 | Gender | -----
girls | 03 | Count_2016 | -----
girls | 04 | Count_2016 | -----
girls | 05 | Total | -----

### DATA FRAMES POPULATING CODE

1. df <br />
1.A df=read.delim("https://raw.githubusercontent.com/kjurekSMU/Homework/2018-11-26_HW_Start/6306_HW/6306_Unit_5_HW/yob2016.txt", header=FALSE, sep=";", stringsAsFactors=FALSE) <br />
<br />
2. y2016 <br />
2.A y2016=df[-212,] <br />
<br />
3. y2015 <br />
3.A. y2015=read.delim("https://raw.githubusercontent.com/kjurekSMU/Homework/2018-11-26_HW_Start/6306_HW/6306_Unit_5_HW/yob2015.txt", header=FALSE, sep=",", stringsAsFactors=FALSE) <br />
<br />
4. final <br />
4.A. final=merge(y2016, y2015, by.x=c("Name", "Gender"), by.y=c("Name", "Gender")) <br />
<br />
5. girls <br />
5.A. girls=final[grepl("F", final$Gender),] <br />

### VARIABLES / COLUMNS POPULATING CODE

1. Data Frame: final<br />
1.A Column:  Total<br />
1.A.1) Code: final$Total=final$Count.x + final$Count.y <br />

### OUTPUT FILES

1. Top_10_Girl_Names.csv <br />
1.A. write.csv(girls[1:10, c(1,5)], file="Top_10_Girl_Names.csv", row.names=FALSE) <br />
