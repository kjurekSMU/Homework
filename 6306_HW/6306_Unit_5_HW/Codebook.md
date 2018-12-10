## CODEBOOK FOR: 6306 Unit 5 Homework

### RAW FILES
1. yob2016.txt
<ul>
		1.A. Delimiter: semi-colon (;) <br />
		1.B. Header / Column / Variables: Originally none <br />
		<ul>
			1.B.1) Column 1: Name <br />
			1.B.2) Column 2: Gender <br />
			1.B.3) Column 3: Count (number of children born given this name) <br />
		</ul>
</ul>
2. yob2015.txt <br />
<ul>
		2.A. Delimiter: comma (,) <br />
		2.B. Header / Column / Variables: Originally none <br />
		<ul>
				2.B.1) Column 1: Name <br />
				2.B.2) Column 2: Gender <br />
				2.B.3) Column 3: Count (number of children born given this name) <br />
		</ul>
</ul>
  
### DATA FRAMES
1. df
<ul>
    <ul>
		1.A. Populating code:
        <ul>
            df=read.delim("https://raw.githubusercontent.com/kjurekSMU/Homework/2018-11-26_HW_Start/6306_HW/6306_Unit_5_HW/yob2016.txt", header=FALSE, sep=";", stringsAsFactors=FALSE)<br />
        </ul>
    1.B. Header / Column / Variables <br />
        <ul>

Number | Original Name | Valid Name | Cleaned Name
:-------: | --------| --------- | ------------------------- 
1 | (not in yob2016.txt) | (not in yob2016.txt) | Name
2 | (not in yob2016.txt) | (not in yob2016.txt) | Gender
3 | (not in yob2016.txt) | (not in yob2016.txt) | Count

2. y2016
<ul>
    <ul>
		2.A. Populating code:
        <ul>
           y2016=df[-212,]<br />
        </ul>
    2.B. Header / Column / Variables <br />
        <ul>

Number | Original Name | Valid Name | Cleaned Name
:-------: | --------| --------- | ------------------------- 
1 | Name | Name | ----
2 | Gender | Gender | ----
3 | Count | Count | ----

3. y2015
<ul>
    <ul>
		3.A. Populating code:
        <ul>
            y2015=read.delim("https://raw.githubusercontent.com/kjurekSMU/Homework/2018-11-26_HW_Start/6306_HW/6306_Unit_5_HW/yob2015.txt", header=FALSE, sep=",", stringsAsFactors=FALSE)<br />
        </ul>
    3.B. Header / Column / Variables <br />
        <ul>

Number | Original Name | Valid Name | Cleaned Name
:-------: | --------| --------- | ------------------------- 
1 | (not in yob2015.txt) | (not in yob2015.txt) | Name
2 | (not in yob2015.txt) | (not in yob2015.txt) | Gender
3 | (not in yob2015.txt) | (not in yob2015.txt) | Count

4. final
<ul>
    <ul>
		4.A. Populating code:
        <ul>
            final=merge(y2016, y2015, by.x=c("Name", "Gender"), by.y=c("Name", "Gender"))
        </ul>
    4.B. Header / Column / Variables <br />
        <ul>


Number | Original Name | Valid Name | Cleaned Name
:-------: | --------| --------- | ------------------------- 
1 | Name | Name | ----
2 | Gender | Gender) | ----
3 | Count.x | Count | Count_2016
4 | Count.y | Count | Count_2015
5 | (not present) | (not present) | Total
