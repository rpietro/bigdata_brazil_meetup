# Basics of data management 
# all scripts from Phil Spectors' outstanding book "Data manipulation with R"




#--------------------------------------------------------------------------------
mylist = list(a=c(1,2,3),b=c("cat","dog","duck"),
d=factor("a","b","a"))
sapply(mylist,mode)
          a           b           d
  "numeric" "character"   "numeric"
sapply(mylist,class)
          a           b           d
  "numeric" "character"    "factor"
#--------------------------------------------------------------------------------
x = c(1,2,5,10)
x
[1]  1  2  5 10
mode(x)
[1] "numeric"
y = c(1,2,"cat",3)
y
[1] "1"   "2"   "cat" "3"
mode(y)
[1] "character"
z = c(5,TRUE,3,7)
z
[1] 5 1 3 7
mode(z)
[1] "numeric"
#--------------------------------------------------------------------------------
all = c(x,y,z)
all
 [1] "1"   "2"   "5"   "10"  "1"   "2"   "cat" "3"   "5"   
[10] "1"   "3"   "7"
#--------------------------------------------------------------------------------
x = c(one=1,two=2,three=3)
x
  one   two three
    1     2     3
x = c(1,2,3)
x
[1] 1 2 3
names(x) = c('one','two','three')
x
  one   two three
    1     2     3
#--------------------------------------------------------------------------------
names(x)[1:2] = c('uno','dos')
x
  uno   dos three
    1     2     3
#--------------------------------------------------------------------------------
nums = 1:10
nums + 1
 [1]  2  3  4  5  6  7  8  9 10 11
#--------------------------------------------------------------------------------
nums = 1:10
nums + c(1,2)
 [1]  2  4  4  6  6  8  8 10 10 12
#--------------------------------------------------------------------------------
nums = 1:10
nums + c(1,2,3)
 [1]  2  4  6  5  7  9  8 10 12 11
Warning message:
longer object length
        is not a multiple of shorter object length in: 
                   nums + c(1, 2, 3)
#--------------------------------------------------------------------------------
rmat = matrix(rnorm(15),5,3,
              dimnames=list(NULL,c('A','B','C')))
rmat
               A          B            C
[1,] -1.15822190 -1.1431019  0.464873841
[2,] -0.04083058  0.3705789  0.320723479
[3,] -0.25480412 -0.5972248 -0.004061773
[4,]  0.48423349 -0.8727114 -0.663439822
[5,]  1.93566841 -0.2338928 -0.605026563
#--------------------------------------------------------------------------------
dimnames(rmat) = list(NULL,c('A','B','C'))
#--------------------------------------------------------------------------------
mylist = list(c(1,4,6),"dog",3,"cat",TRUE,c(9,10,11))
mylist
[[1]]
[1] 1 4 6

[[2]]
[1] "dog"

[[3]]
[1] 3

[[4]]
[1] "cat"

[[5]]
[1] TRUE

[[6]]
[1]  9 10 11

sapply(mylist,mode)
[1] "numeric"   "character" "numeric"   "character" 
[5] "logical"   "numeric"
#--------------------------------------------------------------------------------
mylist = list(first=c(1,3,5),second=c('one','three','five'),
              third='end')
mylist
$first
[1] 1 3 5

$second
[1] "one"   "three" "five"

$third
[1] "end"
#--------------------------------------------------------------------------------
mylist = list(c(1,3,5),c('one','three','five'),'end')
names(mylist) = c('first','second','third')
#--------------------------------------------------------------------------------
mylist = list(a=c(1,2,3),b=c("cat","dog","duck"),
              d=factor("a","b","a"))
#--------------------------------------------------------------------------------
summary(mylist)
  Length Class  Mode
a 3      -none- numeric
b 3      -none- character
d 1      factor numeric
#--------------------------------------------------------------------------------
nestlist = list(a=list(matrix(rnorm(10),5,2),val=3),
                b=list(sample(letters,10),values=runif(5)),
                c=list(list(1:10,1:20),list(1:5,1:10)))
summary(nestlist)
  Length Class  Mode
a 2      -none- list
b 2      -none- list
c 2      -none- list
#--------------------------------------------------------------------------------
str(nestlist)
List of 3
 $ a:List of 2
  ..$    : num [1:5, 1:2]  0.302 -1.534  1.133 -2.304  0.305 ...
  ..$ val: num 3
 $ b:List of 2
  ..$       : chr [1:10] "v" "i" "e" "z" ...
  ..$ values: num [1:5] 0.438 0.696 0.722 0.164 0.435
 $ c:List of 2
  ..$ :List of 2
  .. ..$ : int [1:10] 1 2 3 4 5 6 7 8 9 10
  .. ..$ : int [1:20] 1 2 3 4 5 6 7 8 9 10 ...
  ..$ :List of 2
  .. ..$ : int [1:5] 1 2 3 4 5
  .. ..$ : int [1:10] 1 2 3 4 5 6 7 8 9 10
#--------------------------------------------------------------------------------
nums = c(12,10,8,12,10,12,8,10,12,8)
tt = table(nums)
tt
nums
 8 10 12
 3  3  4
names(tt)
[1] "8"  "10" "12"
sum(names(tt) * tt)
Error in names(tt) * tt : non-numeric argument 
     to binary operator
#--------------------------------------------------------------------------------
sum(as.numeric(names(tt)) * tt)
[1] 102
#--------------------------------------------------------------------------------
x = c(1,2,3,4,5)
list(x)
[[1]]
[1] 1 2 3 4 5

as.list(x)
[[1]]
[1] 1

[[2]]
[1] 2

[[3]]
[1] 3

[[4]]
[1] 4

[[5]]
[1] 5
#--------------------------------------------------------------------------------
names = scan(what="")
1: joe fred bob john
5: sam sue robin
8:
Read 7 items
names
[1] "joe"   "fred"  "bob"   "john"  "sam"   "sue"   "robin"
#--------------------------------------------------------------------------------
names = scan(what=list(a=0,b="",c=0))
1: 1 dog 3
2: 2 cat 5
3: 3 duck 7
4:
Read 3 records
names
$a
[1] 1 2 3

$b
[1] "dog"  "cat"  "duck"

$c
[1] 3 5 7
#--------------------------------------------------------------------------------
mymat = matrix(scan(),ncol=3,byrow=TRUE)
1: 19 17 12
4: 15 18 9
7: 9 10 14
10: 7 12 15
13:
Read 12 items
mymat
     [,1] [,2] [,3]
[1,]   19   17   12
[2,]   15   18    9
[3,]    9   10   14
[4,]    7   12   15
#--------------------------------------------------------------------------------
values = scan(filename,
             what=c(f1=0,NULL,f3=0,rep(list(NULL),6),f10=0))
#--------------------------------------------------------------------------------
result = cbind(values$f1,values$f3,values$f10)
#--------------------------------------------------------------------------------
options(stringsAsFactors=FALSE)
#--------------------------------------------------------------------------------
New York, NY                         66,834.6
Kings, NY                            34,722.9
Bronx, NY                            31,729.8
Queens, NY                           20,453.0
San Francisco, CA                    16,526.2
Hudson, NJ                           12,956.9
Suffolk, MA                          11,691.6
Philadelphia, PA                     11,241.1
Washington, DC                        9,378.0
Alexandria IC, VA                     8,552.2
#--------------------------------------------------------------------------------
city = read.fwf("city.txt",widths=c(18,-19,8),as.is=TRUE)
city
                   V1       V2
1  New York, NY       66,834.6
2  Kings, NY          34,722.9
3  Bronx, NY          31,729.8
4  Queens, NY         20,453.0
5  San Francisco, CA  16,526.2
6  Hudson, NJ         12,956.9
7  Suffolk, MA        11,691.6
8  Philadelphia, PA   11,241.1
9  Washington, DC      9,378.0
10 Alexandria IC, VA   8,552.2
#--------------------------------------------------------------------------------
city$V2 = as.numeric(gsub(',','',city$V2))
#--------------------------------------------------------------------------------
slm = lm(stack.loss ~ Air.Flow + Water.Temp,data=stackloss)
class(slm)
[1] "lm"
slm

Call:
lm(formula = stack.loss ~ Air.Flow + Water.Temp, data = stackloss)

Coefficients:
(Intercept)     Air.Flow   Water.Temp
   -50.3588       0.6712       1.2954
#--------------------------------------------------------------------------------
apropos('.*\\.lm$')
 [1] "anovalist.lm"    "anova.lm"        "hatvalues.lm"
 [4] "model.frame.lm"  "model.matrix.lm" "plot.lm"
 [7] "predict.lm"      "print.lm"        "residuals.lm"
[10] "rstandard.lm"    "rstudent.lm"     "summary.lm"
[13] "kappa.lm"
#--------------------------------------------------------------------------------
names(slm)
 [1] "coefficients"  "residuals"     "effects"
 [4] "rank"          "fitted.values" "assign"
 [7] "qr"            "df.residual"   "xlevels"
[10] "call"          "terms"         "model"
#--------------------------------------------------------------------------------
slm$df.residual
[1] 18
#--------------------------------------------------------------------------------
slm['df.residual']
[1] 18
#--------------------------------------------------------------------------------
library(methods)
#--------------------------------------------------------------------------------
library(stats4)
set.seed(19)
gamdata = rgamma(100,shape=1.5,rate=5)
loglik = function(shape=1.5,rate=5)
           -sum(dgamma(gamdata,shape=shape,rate=rate,log=TRUE))
mgam = mle(loglik)
#--------------------------------------------------------------------------------
class(mgam)
[1] "mle"
attr(,"package")
[1] "stats4"
isS4(mgam)
[1] TRUE
#--------------------------------------------------------------------------------
showMethods(class='mle')
Function: coef (package stats)
object="mle"

Function: confint (package stats)
object="mle"

Function: initialize (package methods)
.Object="mle"
    (inherited from: .Object="ANY")

Function: logLik (package stats)
object="mle"

Function: profile (package stats)
fitted="mle"

Function: show (package methods)
object="mle"

Function: summary (package base)
object="mle"

Function: update (package stats)
object="mle"

Function: vcov (package stats)
object="mle"
#--------------------------------------------------------------------------------
vcov(mgam)
           shape      rate
shape 0.05464054 0.1724472
rate  0.17244719 0.7228044
#--------------------------------------------------------------------------------
getClass(class(mgam))
Slots:

Name:       call      coef  fullcoef      vcov       min
Class:  language   numeric   numeric    matrix   numeric

Name:    details minuslogl    method
Class:      list  function character
mgam@minuslogl
function(shape=1.5,rate=5)
    -sum(dgamma(gamdata,shape=shape,rate=rate,log=TRUE))
#--------------------------------------------------------------------------------
want = 'minuslogl'
slot(mgam,want)
function(shape=1.5,rate=5)
    -sum(dgamma(gamdata,shape=shape,rate=rate,log=TRUE))
#--------------------------------------------------------------------------------
sslm = summary(slm)
class(sslm)
[1] "summary.lm"
#--------------------------------------------------------------------------------
names(sslm)
 [1] "call"          "terms"         "residuals"
 [4] "coefficients"  "aliased"       "sigma"
 [7] "df"            "r.squared"     "adj.r.squared"
[10] "fstatistic"    "cov.unscaled"
#--------------------------------------------------------------------------------
rpage = url('http://www.r-project.org/main.shtml','r')
while(1){
    l = readLines(rpage,1)
    if(length(l) == 0)break;
    if(regexpr('has been released',l) > -1){
           ver = sub('</a.*$','',l)
           print(gsub('^ *','',ver))
           break
    }
}
[1] "R version 2.2.1"
close(rpage)
#--------------------------------------------------------------------------------
gfile = gzfile('mydata.gz')
write.table(mydata,sep=',',file=gfile)
#--------------------------------------------------------------------------------
sample = textConnection('2000-2-29 1 0
2002-4-29 1 5
2004-10-4 2 0')
#--------------------------------------------------------------------------------
read.table(sample,colClasses=c('Date',NA,NA))
          V1 V2 V3
1 2000-02-29  1  0
2 2002-04-29  1  5
3 2004-10-04  2  0
#--------------------------------------------------------------------------------
mydata = scan(unz('data.zip','mydata.txt'))
#--------------------------------------------------------------------------------
readbig = function(file,samplesz,chunksz,nrec=0){
   if(nrec <= 0)nrec = length(count.fields(file))
   f = file(file,'r')
   on.exit(close(f))
   use = sort(sample(nrec,samplesz))
   now = readLines(f,1)
   k = length(strsplit(now,' +')[[1]])
   seek(f,0)
   
   result = matrix(0,samplesz,k)

   read = 0
   left = nrec
   got = 1
   while(left > 0){
        now = matrix(scan(f,n=chunksz*k),ncol=k,byrow=TRUE)
        begin = read + 1
        end = read + chunksz
        want = (begin:end)[begin:end %in% use] - read
        if(length(want) > 0){
           nowdat = now[want,]
           newgot =  got + length(want) - 1
           result[got:newgot,] = nowdat
           got = newgot + 1
        }
        read = read + chunksz
        left = left - chunksz
   }
   return(result)
}
#--------------------------------------------------------------------------------
nrec = as.numeric(shell('type "comma.txt" | find /c ","',
                        intern=TRUE))
#--------------------------------------------------------------------------------
nrec = as.numeric(system('cat comma.txt | wc -l',
                         intern=TRUE))    
#--------------------------------------------------------------------------------
1:10
 [1]  1  2  3  4  5  6  7  8  9 10
#--------------------------------------------------------------------------------
seq(1,10)
 [1]  1  2  3  4  5  6  7  8  9 10
#--------------------------------------------------------------------------------
seq(10,100,5)
 [1]  10  15  20  25  30  35  40  45  50  55  60  65  70  75
[15]  80  85  90  95 100
#--------------------------------------------------------------------------------
seq(10,by=5,length=10)
 [1] 10 15 20 25 30 35 40 45 50 55
#--------------------------------------------------------------------------------
thelevels = data.frame(group=gl(3,10,length=30),
                    subgroup=gl(5,2,length=30),
                    obs=gl(2,1,length=30))
head(thelevels)
  group subgroup obs
1     1        1   1
2     1        1   2
3     1        2   1
4     1        2   2
5     1        3   1
6     1        3   2
#--------------------------------------------------------------------------------
oe = expand.grid(odd=seq(1,5,by=2),even=seq(2,5,by=2))
oe
  odd even
1   1    2
2   3    2
3   5    2
4   1    4
5   3    4
6   5    4
#--------------------------------------------------------------------------------
input = expand.grid(x=0:10,y=0:10)
#--------------------------------------------------------------------------------
res = apply(input,1,function(row)row[1]^2 + row[2]^2)
head(cbind(input,res))
  x y res
1 0 0   0
2 1 0   1
3 2 0   4
4 3 0   9
5 4 0  16
6 5 0  25
#--------------------------------------------------------------------------------
sequence = sample(1:10)
rle(sequence)
Run Length Encoding
  lengths: int [1:10] 1 1 1 1 1 1 1 1 1 1
  values : int [1:10] 10 5 2 8 3 1 7 4 6 9
#--------------------------------------------------------------------------------
seq1 = c(1,3,5,2,4,2,2,2,7,6)
rle.seq1 = rle(seq1)
any(rle.seq1$values == 2 & rle.seq1$lengths >= 3)
[1] TRUE
seq2 = c(7,5,3,2,1,2,2,3,5,8)
rle.seq2 = rle(seq2)
any(rle.seq2$values == 2 & rle.seq2$lengths >= 3)
[1] FALSE 
#--------------------------------------------------------------------------------
seq1 = c(1,3,5,2,4,2,2,2,7,6)
rle.seq1 = rle(seq1)
index = which(rle.seq1$values == 2 & rle.seq1$lengths >= 3)
cumsum(rle.seq1$lengths)[index]
[1] 8
#--------------------------------------------------------------------------------
index = which(rle.seq1$values == 2 & rle.seq1$lengths >= 3)
newindex = ifelse(index > 1,index - 1,0)
starts = cumsum(rle.seq1$lengths)[newindex] + 1
if(0 %in% newindex)starts = c(1,starts)
starts
#--------------------------------------------------------------------------------
seq3 = c(2,2,2,2,3,5,2,7,8,2,2,2,4,5,9,2,2,2)
rle.seq3 = rle(seq3)
cumsum.seq3 = cumsum(rle.seq3$lengths)
myruns = which(rle.seq3$values == 2 & 
               rle.seq3$lengths >= 3)
ends = cumsum.seq3[myruns]
newindex = ifelse(myruns > 1,myruns - 1,0)
starts = cumsum.seq3[newindex] + 1
if(0 %in% newindex)starts = c(1,starts)
starts
[1]  1 10 16
ends
[1]  4 12 18
#--------------------------------------------------------------------------------
set.seed(19)
randvals = rnorm(100)
rle.randvals = rle(randvals > 0)
myruns = which(rle.randvals$values == TRUE & 
               rle.randvals$lengths >= 5)
any(myruns)
[1] TRUE
cumsum.randvals = cumsum(rle.randvals$lengths)
ends = cumsum.randvals[myruns]
newindex = ifelse(myruns > 1,myruns - 1,0)
starts = cumsum.randvals[newindex] + 1
if(0 %in% newindex)starts = c(1,starts)
starts
[1] 47
ends
[1] 51
randvals[starts:ends]
[1] 0.5783932 0.8276480 1.3111752 0.1783597 1.7036697
#--------------------------------------------------------------------------------
library(RODBC)
sheet = 'c:\\Documents and Settings\\user\\My Documents\\sheet.xls'
con = odbcConnectExcel(sheet)
#--------------------------------------------------------------------------------
tbls = sqlTables(con)
#--------------------------------------------------------------------------------
qry = paste("SELECT * FROM",tbls$TABLE_NAME[1],sep=' ')
result = sqlQuery(con,qry)
#--------------------------------------------------------------------------------
qry = paste("SELECT * FROM `",tbls$TABLE_NAME[1],"`",sep="")
result = sqlQuery(con,qry)
#--------------------------------------------------------------------------------
save(x,y,z,file='mydata.rda')
#--------------------------------------------------------------------------------
save(list=c('x','y','z'),file='mydata.rda')
#--------------------------------------------------------------------------------
load('mydata.rda')
#--------------------------------------------------------------------------------
bincon = file('data.bin','rb')
#--------------------------------------------------------------------------------
result = matrix(0,20,6)
for(i in 1:20){
   theint = readBin(bincon,integer(),1)
   thedoubles = readBin(bincon,double(),5)
   result[i,] = c(theint,thedoubles)
}
close(bincon)
#--------------------------------------------------------------------------------
mystates = data.frame(name=row.names(state.x77),state.x77,
                      row.names=NULL,stringsAsFactors=FALSE)
#--------------------------------------------------------------------------------
maxl = max(nchar(mystates$name))
mystates$newname = sprintf(paste('%-',maxl,'s',sep=''),
                           mystates$name)
#--------------------------------------------------------------------------------
f = file('states.bin','wb')
for(i in 1:nrow(mystates)){
   writeBin(mystates$newname[i],f)
   writeBin(unlist(mystates[i,2:9]),f)
}
#--------------------------------------------------------------------------------
write(t(state.x77),file='state.txt',ncolumns=ncol(state.x77))
#--------------------------------------------------------------------------------
write.table(CO2,file='co2.txt',row.names=FALSE,sep=',')
#--------------------------------------------------------------------------------
write.foreign(mydata,'mydata.txt','mydata.stata',
              package='Stata')
#--------------------------------------------------------------------------------
          SELECT columns or computations
               FROM table
               WHERE condition
               GROUP BY columns
               HAVING condition
               ORDER BY column  [ASC | DESC]
               LIMIT offset,count;
#--------------------------------------------------------------------------------
SELECT * FROM tablename;
#--------------------------------------------------------------------------------
SELECT var1,var2,var2/var1 from tablename;
#--------------------------------------------------------------------------------
SELECT var1,var2,var2/var1 AS ratio FROM tablename;
#--------------------------------------------------------------------------------
SELECT * FROM tablename WHERE var1 > 10 AND var2 < var1;
#--------------------------------------------------------------------------------
SELECT var1,var2,var2/var1 AS ratio 
   FROM tablename HAVING ratio > 10;
#--------------------------------------------------------------------------------
SELECT type,AVG(x) AS mean FROM table GROUP BY type;
#--------------------------------------------------------------------------------
SELECT type,COUNT(*) FROM table GROUP BY type;
#--------------------------------------------------------------------------------
SELECT type,COUNT(*),AVG(x) AS mean,STDDEV_SAMP(x) AS std 
   FROM accounts GROUP BY type;
#--------------------------------------------------------------------------------
SELECT height,weight,income FROM children
   INNER JOIN mothers USING(family_id);
#--------------------------------------------------------------------------------
SELECT children.id,mothers.id,height,weight,income 
   FROM children INNER JOIN mothers USING(family_id);
#--------------------------------------------------------------------------------
SELECT c.id as kidid,m.id as momid,height,weight,income 
   FROM children AS c
   INNER JOIN mothers AS m USING(family_id);
#--------------------------------------------------------------------------------
SELECT family_id,COUNT(*) AS ct FROM children 
   GROUP BY family_id;
#--------------------------------------------------------------------------------
SELECT ct,COUNT(*) as n 
  FROM (SELECT COUNT(*) AS ct FROM children 
        GROUP BY family_id) AS x
  GROUP BY ct;
#--------------------------------------------------------------------------------
SELECT * FROM children WHERE height = MAX(height);
#--------------------------------------------------------------------------------
SELECT * FROM children 
   WHERE height = (SELECT MAX(height) as height from children);
#--------------------------------------------------------------------------------
UPDATE table SET var=value 
   WHERE condition
   LIMIT n;
#--------------------------------------------------------------------------------
UPDATE children SET weight=100,height=55
   WHERE id = 12345;
#--------------------------------------------------------------------------------
DELETE FROM table 
   WHERE condition 
   LIMIT n;
#--------------------------------------------------------------------------------
DROP TABLE tablename;
#--------------------------------------------------------------------------------
DROP DATABASE dbname;
#--------------------------------------------------------------------------------
DROP DATABASE IF EXISTS dbname;
#--------------------------------------------------------------------------------
[myodbc]
Driver       = MySQL
Description  = MySQL ODBC 2.50 Driver DSN
Server       = localhost
Port         = 3306
User         = user
Password     = password
Database     = test
#--------------------------------------------------------------------------------
library(RODBC)
con = odbcConnect('myodbc')
#--------------------------------------------------------------------------------
con = odbcConnect('myodbc;password=xxxxx')
#--------------------------------------------------------------------------------
library(RMySQL)
drv = dbDriver("MySQL")
#--------------------------------------------------------------------------------
con = dbConnect(drv,dbname='test',user='sqluser',
                password='secret',host='sql.company.com')
#--------------------------------------------------------------------------------
mydata = dbGetQuery(con,'select * from mydata')
#--------------------------------------------------------------------------------
result = dbGetQuery(con,'SELECT parts.name,parts.description,
                         supplier.name AS supplier 
                         FROM parts INNER JOIN 
                         suppliers USING(supplierid)')
#--------------------------------------------------------------------------------
parts = dbGetQuery(con,'SELECT * FROM parts')
suppliers = dbGetQuery(con,'SELECT * FROM suppliers')
result = merge(parts,suppliers,by='supplierid')
#--------------------------------------------------------------------------------
parts = dbGetQuery(con,'SELECT * FROM parts')
suppliers = dbGetQuery(con,'SELECT * FROM suppliers')
result = data.frame(name=parts$name,price=parts$price,
                         supplier=factor(parts$supplierid,
                         levels=suppliers$supplierid,
                         labels=suppliers$name))
#--------------------------------------------------------------------------------
CREATE TABLE mydata (name text, number double);
#--------------------------------------------------------------------------------
x = data.frame(name='',number=0.)
cat(dbBuildTableDefinition(dbDriver('MySQL'),
                           'mydata',x),"\n")
CREATE TABLE mydata
( row_names text,
        name text,
        number double
)
#--------------------------------------------------------------------------------
CREATE TABLE newtable LIKE oldtable;
#--------------------------------------------------------------------------------
INSERT INTO mydata VALUES('fred',7);
#--------------------------------------------------------------------------------
INSERT INTO mydata (number,name) values(7,'fred');
#--------------------------------------------------------------------------------
INSERT INTO mydata VALUES('tim',12),('sue',9);
#--------------------------------------------------------------------------------
mysqlimport -u sqluser -p --delete --local \
            --fields-terminated-by=',' test mydata.txt
#--------------------------------------------------------------------------------
dbGetQuery(con,"LOAD DATA INFILE 'mydata.txt'\
           INTO TABLE mydata\  FIELDS TERMINATED BY ','")
#--------------------------------------------------------------------------------
res1 = dbSendQuery(con,
           'SELECT group,x,y FROM cordata ORDER BY group')
#--------------------------------------------------------------------------------
correlations = dbApply(res1,INDEX='group',
                       FUN=function(df,group)cor(df$x,df$y))
#--------------------------------------------------------------------------------
mydbapply = function(con,table,groupv,otherv,fun){
    query = paste('select ',groupv,' from ',table,
                  ' group by ',groupv,sep='')
    queryresult = dbGetQuery(con,query)
    answer = list()
    k = 1
    varlist = paste(c(groupv,otherv),collapse=',')
    for(gg in queryresult[[groupv]]){
        qry = paste('select ',varlist,' from ',table,' where ',
                     groupv,' = "',gg,'"',sep='')
        qryresult = dbGetQuery(con,qry)
        answer[[k]] = fun(qryresult)
        names(answer)[k] = as.character(gg)
        k = k + 1
     }
    return(answer)
}
#--------------------------------------------------------------------------------
correlations = mydbapply(con,'cordata','group',c('x','y'),
                       function(df)cor(df$x,df$y))
#--------------------------------------------------------------------------------
as.Date('1915-6-16')
[1] "1915-06-16"
as.Date('1990/02/17')
[1] "1990-02-17"
#--------------------------------------------------------------------------------
as.Date('1/15/2001',format='%m/%d/%Y')
[1] "2001-01-15"
as.Date('April 26, 2001',format='%B %d, %Y')
[1] "2001-04-26"
as.Date('22JUN01',format='%d%b%y')   
[1] "2001-06-22"
#--------------------------------------------------------------------------------
thedate = as.Date('1/15/2001',format='%m/%d/%Y')
ndate = as.numeric(thedate)
ndate
[1] 11337
class(ndate) = 'Date'
ndate
[1] "2001-01-15"
#--------------------------------------------------------------------------------
f = url('http://cran.cnr.berkeley.edu/src/base/R-2','r')
rdates = data.frame()
while(1){
    l = readLines(f,1)
    if(length(l) == 0)break
    if(regexpr('href="R-',l) > -1){
           parts = strsplit(l,' ')[[1]]
           rver = sub('^.*>(R-.*).tar.gz.*','\\1',l)
	   date = parts[18]
	   rdates = rbind(rdates,data.frame(ver=rver,Date=date))
       }
}
rdates$Date = as.Date(rdates$Date,'%d-%B-%Y')
#--------------------------------------------------------------------------------
table(weekdays(rdates$Date))

  Monday Thursday  Tuesday
       5        3        4
#--------------------------------------------------------------------------------
library(chron)
dtimes = c("2002-06-09 12:45:40","2003-01-29 09:30:40",
           "2002-09-04 16:45:40","2002-11-13 20:00:40",
           "2002-07-07 17:30:40")
dtparts = t(as.data.frame(strsplit(dtimes,' ')))
row.names(dtparts) = NULL
thetimes = chron(dates=dtparts[,1],times=dtparts[,2],
                 format=c('y-m-d','h:m:s'))
thetimes
[1] (02-06-09 12:45:40) (03-01-29 09:30:40) (02-09-04 16:45:40)
[4] (02-11-13 20:00:40) (02-07-07 17:30:40)
#--------------------------------------------------------------------------------
1915/6/16
2005-06-24 11:25
1990/2/17 12:20:05
#--------------------------------------------------------------------------------
dts = c("2005-10-21 18:47:22","2005-12-24 16:39:58",
        "2005-10-28 07:30:05 PDT")
as.POSIXlt(dts)
[1] "2005-10-21 18:47:22" "2005-12-24 16:39:58" 
[3] "2005-10-28 07:30:05"
#--------------------------------------------------------------------------------
dts = c(1127056501,1104295502,1129233601,1113547501,
        1119826801,1132519502,1125298801,1113289201)
mydates = dts
class(mydates) = c('POSIXt','POSIXct')
mydates
[1] "2005-09-18 08:15:01 PDT" "2004-12-28 20:45:02 PST"
[3] "2005-10-13 13:00:01 PDT" "2005-04-14 23:45:01 PDT"
[5] "2005-06-26 16:00:01 PDT" "2005-11-20 12:45:02 PST"
[7] "2005-08-29 00:00:01 PDT" "2005-04-12 00:00:01 PDT"
#--------------------------------------------------------------------------------
mydates = structure(dts,class=c('POSIXt','POSIXct'))
#--------------------------------------------------------------------------------
mydate = strptime('16/Oct/2005:07:51:00',
                  format='%d/%b/%Y:%H:%M:%S')
[1] "2005-10-16 07:51:00"
#--------------------------------------------------------------------------------
mydates = c('20060515 112504.5','20060518 101000.3',
            '20060520 20035.1')
#--------------------------------------------------------------------------------
dtparts = t(as.data.frame(strsplit(mydates,' ')))                       
dtimes = strptime(dtparts[,1],format='%Y%m%d') + 
                        as.numeric(dtparts[,2])
dtimes
[1] "2006-05-16 07:15:04 PDT" "2006-05-19 04:03:20 PDT"
[3] "2006-05-20 05:33:55 PDT"
#--------------------------------------------------------------------------------
ISOdate(2006,5,16,7,15,04,tz="PDT")
[1] "2006-05-16 07:15:04 PDT"
#--------------------------------------------------------------------------------
thedate = ISOdate(2005,10,21,18,47,22,tz="PDT")
format(thedate,'%A, %B %d, %Y %H:%M:%S')
[1] "Friday, October 21, 2005 18:47:22"
#--------------------------------------------------------------------------------
mydate = as.POSIXlt('2005-4-19 7:01:00')
names(mydate)
[1] "sec"   "min"   "hour"  "mday"  "mon"   "year"  
[7] "wday"  "yday"  "isdst"
mydate$mday
[1] 19
#--------------------------------------------------------------------------------
rdates = scan(what="")
1: 1.0 29Feb2000
3: 1.1 15Jun2000
5: 1.2 15Dec2000
7: 1.3 22Jun2001
9: 1.4 19Dec2001
11: 1.5 29Apr2002
13: 1.6 1Oct2002
15: 1.7 16Apr2003
17: 1.8 8Oct2003
19: 1.9 12Apr2004
21: 2.0 4Oct2004
23:
Read 22 items
rdates = as.data.frame(matrix(rdates,ncol=2,byrow=TRUE))
rdates[,2] = as.Date(rdates[,2],format='%d%b%Y')
names(rdates) = c("Release","Date")
rdates
   Release       Date
1      1.0 2000-02-29
2      1.1 2000-06-15
3      1.2 2000-12-15
4      1.3 2001-06-22
5      1.4 2001-12-19
6      1.5 2002-04-29
7      1.6 2002-10-01
8      1.7 2003-04-16
9      1.8 2003-10-08
10     1.9 2004-04-12
11     2.0 2004-10-04
#--------------------------------------------------------------------------------
mean(rdates$Date)
[1] "2002-05-19"
range(rdates$Date)
[1] "2000-02-29" "2004-10-04"
rdates$Date[11] - rdates$Date[1]
Time difference of 1679 days
#--------------------------------------------------------------------------------
b1 = ISOdate(1977,7,13)
b2 = ISOdate(2003,8,14)
b2 - b1
Time difference of 9528 days
#--------------------------------------------------------------------------------
difftime(b2,b1,units='weeks')
Time difference of 1361.143 weeks
#--------------------------------------------------------------------------------
ydiff = (b2 - b1) / 365.25
ydiff
Time difference of 26.08624 days
attr(ydiff,'units') = 'years'
ydiff
Time difference of 26.08624 years
#--------------------------------------------------------------------------------
seq(as.Date('1976-7-4'),by='days',length=10)
 [1] "1976-07-04" "1976-07-05" "1976-07-06"
 [4] "1976-07-07" "1976-07-08" "1976-07-09"
 [7] "1976-07-10" "1976-07-11" "1976-07-12"
[10] "1976-07-13"
#--------------------------------------------------------------------------------
seq(as.Date('2000-6-1'),to=as.Date('2000-8-1'),by='2 weeks')
[1] "2000-06-01" "2000-06-15" "2000-06-29" "2000-07-13"
[5] "2000-07-27"
#--------------------------------------------------------------------------------
table(format(rdates$Date,'%A'))

  Monday Thursday  Tuesday
       5        3        4
#--------------------------------------------------------------------------------
fdate = factor(format(rdates$Date,'%Y'))
fdate
 [1] 2004 2004 2005 2005 2005 2005 2006 2006 2006 2006 2007 2007
Levels: 2004 2005 2006 2007
#--------------------------------------------------------------------------------
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata
 [1] 1 2 2 3 1 2 3 3 1 2 3 3 1
Levels: 1 2 3
rdata = factor(data,labels=c("I","II","III"))
rdata
 [1] I   II  II  III I   II  III III I   II  III III I
Levels: I II III
#--------------------------------------------------------------------------------
levels(fdata) = c('I','II','III')
fdata
 [1] I   II  II  III I   II  III III I   II  III III I
Levels: I II III
#--------------------------------------------------------------------------------
mons = c("March","April","January","November","January",
"September","October","September","November","August",
"January","November","November","February","May","August",
"July","December","August","August","September","November",
"February","April")
mons = factor(mons)
table(mons)
mons
    April    August  December  February   January      July
        2         4         1         2         3         1
    March       May  November   October September
        1         1         5         1         3
#--------------------------------------------------------------------------------
mons = factor(mons,levels=c("January","February","March",
              "April","May","June","July","August","September",
              "October","November","December"),ordered=TRUE)
mons[1] < mons[2]
[1] TRUE
table(mons)
mons
  January  February     March     April       May      June
        3         2         1         2         1         0
     July    August September   October  November  December
        1         4         3         1         5         1
#--------------------------------------------------------------------------------
levels(InsectSprays$spray)
[1] "A" "B" "C" "D" "E" "F"
#--------------------------------------------------------------------------------
InsectSprays$spray = with(InsectSprays,
                          reorder(spray,count,mean))
levels(InsectSprays$spray)
[1] "C" "E" "D" "A" "B" "F"
#--------------------------------------------------------------------------------
attr(InsectSprays$spray,'scores')
        A         B         C         D         E         F
14.500000 15.333333  2.083333  4.916667  3.500000 16.666667
#--------------------------------------------------------------------------------
levels(InsectSprays$spray)
[1] "A" "B" "C" "D" "E" "F"
InsectSprays$spray = relevel(InsectSprays$spray,'C')
levels(InsectSprays$spray)
[1] "C" "A" "B" "D" "E" "F"
#--------------------------------------------------------------------------------
fert = c(10,20,20,50,10,20,10,50,20)
fert = factor(fert,levels=c(10,20,50),ordered=TRUE)
fert
[1] 10 20 20 50 10 20 10 50 20
Levels: 10 < 20 < 50
#--------------------------------------------------------------------------------
mean(fert)
[1] NA
Warning message:
argument is not numeric or logical: 
      returning NA in: mean.default(fert)
mean(as.numeric(levels(fert)[fert]))
[1] 23.33333
mean(as.numeric(as.character(fert)))
[1] 23.33333
#--------------------------------------------------------------------------------
lets = sample(letters,size=100,replace=TRUE)
lets = factor(lets)
table(lets[1:5])

a b c d e f g h i j k l m n o p q r s t u v w x y z
0 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0
#--------------------------------------------------------------------------------
table(lets[1:5,drop=TRUE])

c h j w x
1 1 1 1 1
#--------------------------------------------------------------------------------
table(factor(lets[1:5]))

c h j w x
1 1 1 1 1
#--------------------------------------------------------------------------------
fact1 = factor(sample(letters,size=10,replace=TRUE))
fact2 = factor(sample(letters,size=10,replace=TRUE))
fact1
 [1] o b i v q n q w e z
Levels: b e i n o q v w z
fact2
 [1] b a s b l r g m z o
Levels: a b g l m o r s z
fact12 = factor(c(levels(fact1)[fact1],levels(fact2)[fact2]))
fact12
 [1] o b i v q n q w e z b a s b l r g m z o
Levels: a b e g i l m n o q r s v w z
#--------------------------------------------------------------------------------
wfact = cut(women$weight,3)
table(wfact)
wfact
(115,131] (131,148] (148,164]
        6         5         4
#--------------------------------------------------------------------------------
wfact = cut(women$weight,pretty(women$weight,3))
wfact
 [1] (100,120] (100,120] (100,120] (120,140]
 [5] (120,140] (120,140] (120,140] (120,140]
 [9] (120,140] (140,160] (140,160] (140,160]
[13] (140,160] (140,160] (160,180]
4 Levels: (100,120] (120,140] (140,160] (160,180]
table(wfact)
wfact
(100,120] (120,140] (140,160] (160,180]
        3         6         5         1
#--------------------------------------------------------------------------------
wfact = cut(women$weight,3,labels=c('Low','Medium','High'))
table(wfact)
wfact
   Low Medium   High
     6      5      4
#--------------------------------------------------------------------------------
wfact = cut(women$weight,quantile(women$weight,(0:4)/4))
table(wfact)
wfact
(115,124] (124,135] (135,148] (148,164]
        3         4         3         4
#--------------------------------------------------------------------------------
everyday = seq(from=as.Date('2005-1-1'),
               to=as.Date('2005-12-31'),by='day')
#--------------------------------------------------------------------------------
cmonth = format(everyday,'%b')
months = factor(cmonth,levels=unique(cmonth),ordered=TRUE)
table(months)
months
Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
 31  28  31  30  31  30  31  31  30  31  30  31
#--------------------------------------------------------------------------------
wks = cut(everyday,breaks='week')
head(wks)
[1] 2004-12-27 2004-12-27 2005-01-03 2005-01-03
[5] 2005-01-03 2005-01-03
53 Levels: 2004-12-27 2005-01-03 ... 2005-12-26
#--------------------------------------------------------------------------------
qtrs = cut(everyday,"3 months",labels=paste('Q',1:4,sep=''))
head(qtrs)
[1] Q1 Q1 Q1 Q1 Q1 Q1
Levels: Q1 Q2 Q3 Q4
#--------------------------------------------------------------------------------
data(CO2)
newfact = interaction(CO2$Plant,CO2$Type)
nlevels(newfact)
[1] 24
#--------------------------------------------------------------------------------
newfact1 = interaction(CO2$Plant,CO2$Type,drop=TRUE)
nlevels(newfact1)
[1] 12
#--------------------------------------------------------------------------------
nums = c(12,9,8,14,7,16,3,2,9)
nums > 10
[1]  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
#--------------------------------------------------------------------------------
nums[nums>10]
[1] 12 14 16
#--------------------------------------------------------------------------------
which(nums>10)
[1] 1 4 6
#--------------------------------------------------------------------------------
seq(along=nums)[nums > 10]
[1] 1 4 6
#--------------------------------------------------------------------------------
nums[nums > 10] = 0
nums
[1] 0 9 8 0 7 0 3 2 9
#--------------------------------------------------------------------------------
x = matrix(1:12,4,3)
x
     [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
[3,]    3    7   11
[4,]    4    8   12
x[,1]
[1] 1 2 3 4
x[,c(3,1)]
     [,1] [,2]
[1,]    9    1
[2,]   10    2
[3,]   11    3
[4,]   12    4
x[2,]
[1]  2  6 10
x[10]
[1] 10
#--------------------------------------------------------------------------------
stack.x.a = stack.x[order(stack.x[,'Air.Flow']),]
head(stack.x.a)
   Air.Flow Water.Temp Acid.Conc.
15       50         18         89
16       50         18         86
17       50         19         72
18       50         19         79
19       50         20         80
20       56         20         82
#--------------------------------------------------------------------------------
sortframe = function(df,...)df[do.call(order,list(...)),]      
#--------------------------------------------------------------------------------
with(iris,sortframe(iris,Sepal.Length,Sepal.Width))
    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
14           4.3         3.0          1.1         0.1     setosa
9            4.4         2.9          1.4         0.2     setosa
39           4.4         3.0          1.3         0.2     setosa
43           4.4         3.2          1.3         0.2     setosa
42           4.5         2.3          1.3         0.3     setosa
4            4.6         3.1          1.5         0.2     setosa
48           4.6         3.2          1.4         0.2     setosa
7            4.6         3.4          1.4         0.3     setosa
23           4.6         3.6          1.0         0.2     setosa
                            . . .
#--------------------------------------------------------------------------------
riris = iris[rev(1:nrow(iris)),]
head(riris)
    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
150          5.9         3.0          5.1         1.8 virginica
149          6.2         3.4          5.4         2.3 virginica
148          6.5         3.0          5.2         2.0 virginica
147          6.3         2.5          5.0         1.9 virginica
146          6.7         3.0          5.2         2.3 virginica
145          6.7         3.3          5.7         2.5 virginica
#--------------------------------------------------------------------------------
x = matrix(1:12,4,3)
x[,1]
[1] 1 2 3 4
x[,1,drop=FALSE]
     [,1]
[1,]    1
[2,]    2
[3,]    3
[4,]    4
#--------------------------------------------------------------------------------
x[,1] < 3
[1]  TRUE  TRUE FALSE FALSE
x[x[,1] < 3,]
     [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
#--------------------------------------------------------------------------------
mat = matrix(scan(),ncol=3,byrow=TRUE)
1: 1 1 12 1 2 7 2 1 9 2 2 16 3 1 12 3 2 15
19:
Read 18 items
mat
     [,1] [,2] [,3]
[1,]    1    1   12
[2,]    1    2    7
[3,]    2    1    9
[4,]    2    2   16
[5,]    3    1   12
[6,]    3    2   15
#--------------------------------------------------------------------------------
newmat = matrix(NA,3,2)
newmat[mat[,1:2]] = mat[,3]
newmat
     [,1] [,2]
[1,]   12    7
[2,]    9   16
[3,]   12   15
#--------------------------------------------------------------------------------
method1 = c(1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4)
method2 = c(1,2,2,3,2,2,1,3,3,3,2,4,1,4,4,3)
tt = table(method1,method2)
tt
       method2
method1 1 2 3 4
      1 1 2 1 0
      2 1 2 1 0
      3 0 1 2 1
      4 1 0 1 2
#--------------------------------------------------------------------------------
offd = row(tt) != col(tt)
offd
      [,1]  [,2]  [,3]  [,4]
[1,] FALSE  TRUE  TRUE  TRUE
[2,]  TRUE FALSE  TRUE  TRUE
[3,]  TRUE  TRUE FALSE  TRUE
[4,]  TRUE  TRUE  TRUE FALSE
#--------------------------------------------------------------------------------
tt[offd]
 [1] 1 0 1 2 1 0 1 1 1 0 0 1
#--------------------------------------------------------------------------------
sum(tt[offd])
#--------------------------------------------------------------------------------
simple = list(a=c('fred','sam','harry'),b=c(24,17,19,22))
mode(simple)
[1] "list"
simple[2]
$b
[1] 24 17 19 22

mode(simple[2])
[1] "list"
#--------------------------------------------------------------------------------
mean(simple[2])
[1] NA
Warning message:
argument is not numeric or logical: 
       returning NA in: mean.default(simple[2])
#--------------------------------------------------------------------------------
mean(simple$b)
[1] 20.5
mean(simple[[2]])
[1] 20.5
mean(simple[['b']])
[1] 20.5
#--------------------------------------------------------------------------------
simple[1]
$a
[1] "fred"  "sam"   "harry"

simple[[1]]
[1] "fred"  "sam"   "harry"
#--------------------------------------------------------------------------------
dd = data.frame(a=c(5,9,12,15,17,11),b=c(8,NA,12,10,NA,15))
dd[dd$b > 10,]
      a  b
NA   NA NA
3    12 12
NA.1 NA NA
6    11 15
#--------------------------------------------------------------------------------
dd[!is.na(dd$b) & dd$b > 10,]
   a  b
3 12 12
6 11 15
#--------------------------------------------------------------------------------
subset(dd,b>10)
   a  b
3 12 12
6 11 15
#--------------------------------------------------------------------------------
some = subset(LifeCycleSavings,sr>10,select=c(pop15,pop75))
#--------------------------------------------------------------------------------
life1 = subset(LifeCycleSavings,select=pop15:dpi)
#--------------------------------------------------------------------------------
life1 = subset(LifeCycleSavings,select=1:3)
#--------------------------------------------------------------------------------
life2 = subset(LifeCycleSavings,select=c(-pop15,-pop75))
#--------------------------------------------------------------------------------
life2 = subset(LifeCycleSavings,select=-c(2,3))
#--------------------------------------------------------------------------------
nchar(state.name)
[1]  7  6  7  8 10  8 11  8  7  7  6  5  8  7  4
[16]  6  8  9  5  8 13  8  9 11  8  7  8  6 13 10
[31] 10  8 14 12  4  8  6 12 12 14 12  9  5  4  7
[46]  8 10 13  9  7
#--------------------------------------------------------------------------------
x = 7
y = 10
cat('x should be greater than y, but x=',x,'and y=',y,'\n')
x should be greater than y, but x= 7 and y= 10
#--------------------------------------------------------------------------------
cat('Long strings can','be displayed over',
    'several lines using','the fill= argument',
    fill=40)
Long strings can be displayed over
several lines using the fill= argument
#--------------------------------------------------------------------------------
paste('one',2,'three',4,'five')
[1] "one 2 three 4 five"
#--------------------------------------------------------------------------------
paste(c('one','two','three','four'),collapse=' ')
[1] "one two three four"
#--------------------------------------------------------------------------------
paste('X',1:5,sep='')
[1] "X1" "X2" "X3" "X4" "X5"
paste(c('X','Y'),1:5,sep='')
[1] "X1" "Y2" "X3" "Y4" "X5"
#--------------------------------------------------------------------------------
paste(c('X','Y'),1:5,sep='_',collapse='|')
[1] "X_1|Y_2|X_3|Y_4|X_5"
#--------------------------------------------------------------------------------
paste(c('X','Y'),1:5,'^',c('a','b'),sep='_',collapse='|')
[1] "X_1_^_a|Y_2_^_b|X_3_^_a|Y_4_^_b|X_5_^_a"
#--------------------------------------------------------------------------------
paste(c('X','Y'),1:5,'^',c('a','b'),sep='_')
[1] "X_1_^_a" "Y_2_^_b" "X_3_^_a" "Y_4_^_b" "X_5_^_a"
#--------------------------------------------------------------------------------
substring(state.name,2,6)
 [1] "labam" "laska" "rizon" "rkans" "alifo" "olora" "onnec"
 [8] "elawa" "lorid" "eorgi" "awaii" "daho"  "llino" "ndian"
[15] "owa"   "ansas" "entuc" "ouisi" "aine"  "aryla" "assac"
[22] "ichig" "innes" "issis" "issou" "ontan" "ebras" "evada"
[29] "ew Ha" "ew Je" "ew Me" "ew Yo" "orth " "orth " "hio"
[36] "klaho" "regon" "ennsy" "hode " "outh " "outh " "ennes"
[43] "exas"  "tah"   "ermon" "irgin" "ashin" "est V" "iscon"
[50] "yomin"
#--------------------------------------------------------------------------------
mystring = 'dog cat duck'
substring(mystring,c(1,5,9),c(3,7,12))
[1] "dog"  "cat"  "duck"
#--------------------------------------------------------------------------------
state = 'Mississippi'
ll = nchar(state)
ltrs = substring(state,1:ll,1:ll)
ltrs
 [1] "M" "i" "s" "s" "i" "s" "s" "i" "p" "p" "i"
which(ltrs == 's')
[1] 3 4 6 7
#--------------------------------------------------------------------------------
mystring = 'dog cat duck'
substring(mystring,5,7) = 'feline'
mystring
[1] "dog fel duck"
mystring = 'dog cat duck'
substring(mystring,5,7) = 'a'
mystring
[1] "dog aat duck"
#--------------------------------------------------------------------------------
expr = '.*\\.txt'
nchar(expr)
[1] 7
cat(expr,'\n')
.*\.txt
#--------------------------------------------------------------------------------
expr = readline()
.*\.txt
nchar(expr)
[1] 7
#--------------------------------------------------------------------------------
. ^ $ + ? * ( ) [ ] { } | \
#--------------------------------------------------------------------------------
strs = c('chicken','dog','cat')
expr = paste(strs,collapse='|')
expr
[1] "chicken|dog|cat"
#--------------------------------------------------------------------------------
sentence = 
  'R is a free software environment for statistical computing'
parts = strsplit(sentence,' ')
parts
[[1]]
[1] "R"           "is"          "a"           "free"
[5] "software"    "environment" "for"         "statistical"
[9] "computing"
#--------------------------------------------------------------------------------
length(parts)
[1] 1
length(parts[[1]])
[1] 9
#--------------------------------------------------------------------------------
more = c('R is a free software environment for statistical computing',
         'It compiles and runs on a wide variety of UNIX platforms')
result = strsplit(more,' ')
sapply(result,length)
[1]  9 11
#--------------------------------------------------------------------------------
allparts = unlist(result)
allparts
 [1] "R"           "is"          "a"           "free"
 [5] "software"    "environment" "for"         "statistical"
 [9] "computing"   "It"          "compiles"    "and"
[13] "runs"        "on"          "a"           "wide"
[17] "variety"     "of"          "UNIX"        "platforms"
#--------------------------------------------------------------------------------
str = 'one  two   three four'
strsplit(str,' ')
[[1]]
[1] "one"   ""      "two"   ""      ""      "three" "four"
#--------------------------------------------------------------------------------
strsplit(str,' +')
[[1]]
[1] "one"   "two"   "three" "four"
#--------------------------------------------------------------------------------
words = c('one two','three four')
strsplit(words,'')
[[1]]
[1] "o" "n" "e" " " "t" "w" "o"

[[2]]
 [1] "t" "h" "r" "e" "e" " " "f" "o" "u" "r"
#--------------------------------------------------------------------------------
grep('^pop',names(LifeCycleSavings))
[1] 2 3
grep('^pop',names(LifeCycleSavings),value=TRUE)
[1] "pop15" "pop75"
#--------------------------------------------------------------------------------
head(LifeCycleSavings[,grep('^pop',names(LifeCycleSavings))])
          pop15 pop75
Australia 29.35  2.87
Austria   23.32  4.41
Belgium   23.80  4.43
Bolivia   41.89  1.67
Brazil    42.19  0.83
Canada    31.72  2.85
#--------------------------------------------------------------------------------
inp = c('run dog run','work doggedly','CAT AND DOG')
grep('\\<dog\\>',inp,ignore.case=TRUE)
[1] 1 3
#--------------------------------------------------------------------------------
str1 = c('The R Foundation','is a not for profit organization',
         'working in the public interest')
str2 = c(' It was founded by the members',
         'of the R Core Team in order',
         'to provide support for the R project')
any(grep('profit',str1))
[1] TRUE
any(grep('profit',str2))
[1] FALSE
#--------------------------------------------------------------------------------
tst = c('one x7 two b1','three c5 four b9',
        'five six seven','a8 eight nine')
wh = regexpr('[a-z][0-9]',tst)
wh
[1]  5  7 -1  1
attr(,"match.length")
[1]  2  2 -1  2
res = substring(tst,wh,wh + attr(wh,'match.length') - 1)
res
[1] "x7" "c5" ""   "a8"
#--------------------------------------------------------------------------------
res[res != '']
[1] "x7" "c5" "a8"
#--------------------------------------------------------------------------------
wh1 = gregexpr('[a-z][0-9]',tst)
wh1
[[1]]
[1]  5 12
attr(,"match.length")
[1] 2 2

[[2]]
[1]  7 15
attr(,"match.length")
[1] 2 2

[[3]]
[1] -1
attr(,"match.length")
[1] -1

[[4]]
[1] 1
attr(,"match.length")
[1] 2
#--------------------------------------------------------------------------------
res1 = list()
for(i in 1:length(wh1))
         res1[[i]] = substring(tst[i],wh1[[i]],
                     wh1[[i]] + 
                     attr(wh1[[i]],'match.length') -1)
res1
[[1]]
[1] "x7" "b1"

[[2]]
[1] "c5" "b9"

[[3]]
[1] ""

[[4]]
[1] "a8"
#--------------------------------------------------------------------------------
getexpr = function(str,greg)substring(str,greg,
                       greg + attr(greg,'match.length') - 1)
#--------------------------------------------------------------------------------
res2 = mapply(getexpr,tst,wh1)
res2
$"one x7 two b1"
[1] "x7" "b1"

$"three c5 four b9"
[1] "c5" "b9"

$"five six seven"
[1] ""

$"a8 eight nine"
[1] "a8"
#--------------------------------------------------------------------------------
values = c('$11,317.35','$11,234.51','$11,275.89',
           '$11,278.93','$11,294.94')
#--------------------------------------------------------------------------------
as.numeric(gsub('[$,]','',values))
[1] 11317.35 11234.51 11275.89 11278.93 11294.94
#--------------------------------------------------------------------------------
str = 'report: 17 value=12 time=2:00'
sub('value=([^ ]+)','\\1',str)
[1] "report: 17 12 time=2:00"
#--------------------------------------------------------------------------------
sub('^.*value=([^ ]+).*$','\\1',str)
[1] "12"
#--------------------------------------------------------------------------------
str = 'report: 17 value=12 time=2:00'
greg = gregexpr('value=[^ ]+',str)[[1]]
sub('value=([^ ]+)','\\1',
     substring(str,greg,greg + attr(greg,'match.length') - 1))
[1] "12"
#--------------------------------------------------------------------------------
pets = c('dog','cat','duck','chicken','duck','cat','dog')
tt = table(pets)
#--------------------------------------------------------------------------------
tt
pets
    cat chicken     dog    duck
      2       1       2       2
tt['duck']
duck
   2
tt['dog']
dog
  2
#--------------------------------------------------------------------------------
as.data.frame(tt)
     pets Freq
1     cat    2
2 chicken    1
3     dog    2
4    duck    2
#--------------------------------------------------------------------------------
hiinc = state.x77[,'Income'] > median(state.x77[,'Income'])
stateinc = table(state.region,hiinc)
stateinc
               hiinc
state.region    FALSE TRUE
  Northeast         4    5
  South            12    4
  North Central     5    7
  West              4    9
#--------------------------------------------------------------------------------
x = data.frame(a=c(1,2,2,1,2,2,1),b=c(1,2,2,1,1,2,1),
               c=c(1,1,2,1,2,2,1)) 
x
  a b c
1 1 1 1
2 2 2 1
3 2 2 2
4 1 1 1
5 2 1 2
6 2 2 2
7 1 1 1
as.data.frame(table(x))
  a b c Freq
1 1 1 1    3
2 2 1 1    0
3 1 2 1    0
4 2 2 1    1
5 1 1 2    0
6 2 1 2    1
7 1 2 2    0
8 2 2 2    2
#--------------------------------------------------------------------------------
tt = table(infert$education,infert$parity)
#--------------------------------------------------------------------------------
tt

           1  2  3  4  5  6
  0-5yrs   3  0  0  3  0  6
  6-11yrs 42 42 21 12  3  0
  12+ yrs 54 39 15  3  3  2
#--------------------------------------------------------------------------------
tt1 = addmargins(tt,1)
tt1

           1  2  3  4  5  6
  0-5yrs   3  0  0  3  0  6
  6-11yrs 42 42 21 12  3  0
  12+ yrs 54 39 15  3  3  2
  Sum     99 81 36 18  6  8
#--------------------------------------------------------------------------------
tt12 = addmargins(tt,c(1,2))
tt12

            1   2   3   4   5   6 Sum
  0-5yrs    3   0   0   3   0   6  12
  6-11yrs  42  42  21  12   3   0 120
  12+ yrs  54  39  15   3   3   2 116
  Sum      99  81  36  18   6   8 248
dimnames(tt12)
[[1]]
[1] "0-5yrs"  "6-11yrs" "12+ yrs" "Sum"

[[2]]
[1] "1"   "2"   "3"   "4"   "5"   "6"   "Sum"
#--------------------------------------------------------------------------------
prop.table(tt,2)

                1       2       3       4       5       6
  0-5yrs  0.03030 0.00000 0.00000 0.16667 0.00000 0.75000
  6-11yrs 0.42424 0.51852 0.58333 0.66667 0.50000 0.00000
  12+ yrs 0.54545 0.48148 0.41667 0.16667 0.50000 0.25000
#--------------------------------------------------------------------------------
ftable(UCBAdmissions)
                Dept   A   B   C   D   E   F
Admit    Gender
Admitted Male        512 353 120 138  53  22
         Female       89  17 202 131  94  24
Rejected Male        313 207 205 279 138 351
         Female       19   8 391 244 299 317
#--------------------------------------------------------------------------------
xtabs(~state.region + hiinc)
               hiinc
state.region    FALSE TRUE
  Northeast         4    5
  South            12    4
  North Central     5    7
  West              4    9
#--------------------------------------------------------------------------------
x = data.frame(a=c(1,2,2,1,2,2,1),b=c(1,2,2,1,1,2,1),
               c=c(1,1,2,1,2,2,1)) 
dfx = as.data.frame(table(x))
xtabs(Freq ~ a + b + c,data=dfx)
, , c = 1

   b
a   1 2
  1 3 0
  2 0 1

, , c = 2

   b
a   1 2
  1 0 0
  2 1 2
#--------------------------------------------------------------------------------
text = c('R is a free environment for statistical analysis',
            'It compiles and runs on a variety of platforms',
            'Visit the R home page for more information')
result = strsplit(text,' ')
result
[[1]]
[1] "R"           "is"          "a"
[4] "free"        "environment" "for"
[7] "statistical" "analysis"
#--------------------------------------------------------------------------------
[[2]]
[1] "It"        "compiles"  "and"
[4] "runs"      "on"        "a"
[7] "variety"   "of"        "platforms"

[[3]]
[1] "Visit"       "the"         "R"
[4] "home"        "page"        "for"
[7] "more"        "information"
#--------------------------------------------------------------------------------
length(result)
[1] 3
#--------------------------------------------------------------------------------
nwords = sapply(result,length)
nwords
[1] 8 9 8
#--------------------------------------------------------------------------------
class(ChickWeight)
[1] "nfnGroupedData" "nfGroupedData"
[3] "groupedData"    "data.frame"
#--------------------------------------------------------------------------------
sapply(ChickWeight,class)
$weight
[1] "numeric"

$Time
[1] "numeric"

$Chick
[1] "ordered" "factor"

$Diet
[1] "factor"
#--------------------------------------------------------------------------------
df[,sapply(df,class) == 'numeric']
#--------------------------------------------------------------------------------
maxcor = function(i,n=10,m=5){
   mat = matrix(rnorm(n*m),n,m)
   corr = cor(mat)
   diag(corr) = NA
   max(corr,na.rm=TRUE)
}
#--------------------------------------------------------------------------------
maxcors = sapply(1:1000,maxcor,n=100) 
mean(maxcors)
[1] 0.1548143
#--------------------------------------------------------------------------------
t.test(rnorm(10),rnorm(10))$statistic
        t
0.2946709
#--------------------------------------------------------------------------------
tsim = replicate(10000,t.test(rnorm(10),rnorm(10))$statistic)
quantile(tsim,c(0.5,0.75,0.9,0.95,0.99))
       50%        75%        90%        95%        99%
0.00882914 0.69811345 1.36578668 1.74995603 2.62827515
#--------------------------------------------------------------------------------
sstate = scale(state.x77,center=apply(state.x77,2,median), 
                         scale=apply(state.x77,2,mad))
#--------------------------------------------------------------------------------
summfn = function(x)c(n=sum(!is.na(x)),mean=mean(x),sd=sd(x))
#--------------------------------------------------------------------------------
x = apply(state.x77,2,sumfun)
#--------------------------------------------------------------------------------
t(x)
            n       mean           sd
Population 50  4246.4200 4.464491e+03
Income     50  4435.8000 6.144699e+02
Illiteracy 50     1.1700 6.095331e-01
Life Exp   50    70.8786 1.342394e+00
Murder     50     7.3780 3.691540e+00
HS Grad    50    53.1080 8.076998e+00
Frost      50   104.4600 5.198085e+01
Area       50 70735.8800 8.532730e+04
#--------------------------------------------------------------------------------
x = 1:12
apply(matrix(x,ncol=3,byrow=TRUE),1,sum)
[1]  6 15 24 33
#--------------------------------------------------------------------------------
mns = colMeans(USJudgeRatings)
mns
    CONT     INTG     DMNR     DILG     CFMG
7.437209 8.020930 7.516279 7.693023 7.479070
    DECI     PREP     FAMI     ORAL     WRIT
7.565116 7.467442 7.488372 7.293023 7.383721
    PHYS     RTEN
7.934884 7.602326
#--------------------------------------------------------------------------------
jscore = rowSums(USJudgeRatings >= 8)
head(jscore)
 AARONSON,L.H. ALEXANDER,J.M. ARMENTANO,A.J.
             1              8              1
   BERDON,R.I.   BRACKEN,J.J.     BURNS,E.B.
            11              0             10
#--------------------------------------------------------------------------------
maxes = apply(state.x77,2,max)
swept = sweep(state.x77,2,maxes,"/")
head(swept)
           Population    Income Illiteracy  Life Exp    Murder
Alabama    0.17053496 0.5738717  0.7500000 0.9381793 1.0000000
Alaska     0.01721861 1.0000000  0.5357143 0.9417120 0.7483444
Arizona    0.10434947 0.7173397  0.6428571 0.9585598 0.5165563
Arkansas   0.09953769 0.5349169  0.6785714 0.9600543 0.6688742
California 1.00000000 0.8098179  0.3928571 0.9743207 0.6821192
Colorado   0.11986980 0.7733967  0.2500000 0.9790761 0.4503311
             HS Grad      Frost       Area
Alabama    0.6136701 0.10638298 0.08952178
Alaska     0.9910847 0.80851064 1.00000000
Arizona    0.8632987 0.07978723 0.20023057
Arkansas   0.5928678 0.34574468 0.09170562
California 0.9301634 0.10638298 0.27604549
Colorado   0.9494799 0.88297872 0.18319233
#--------------------------------------------------------------------------------
meds = apply(state.x77,2,median)
meanmed = function(var,med)mean(var[var>med])
meanmed(state.x77[,1],meds[1])
[1] 7136.16
meanmed(state.x77[,2],meds[2])
[1] 4917.92
#--------------------------------------------------------------------------------
sweep(state.x77,2,meds,meanmed)
[1] 15569.75
#--------------------------------------------------------------------------------
mapply(meanmed,as.data.frame(state.x77),meds)
[1]   7136.160   4917.920      1.660     71.950     10.544
[6]     59.524    146.840 112213.400
#--------------------------------------------------------------------------------
aggregate(iris[-5],iris[5],mean)
     Species Sepal.Length Sepal.Width Petal.Length Petal.Width
1     setosa        5.006       3.428        1.462       0.246
2 versicolor        5.936       2.770        4.260       1.326
3  virginica        6.588       2.974        5.552       2.026
#--------------------------------------------------------------------------------
cweights = > aggregate(ChickWeight$weight,
                       ChickWeight[c('Time','Diet')],mean)
head(cweights)
  Time Diet        x
1    0    1 41.40000
2    2    1 47.25000
3    4    1 56.47368
4    6    1 66.78947
5    8    1 79.68421
6   10    1 93.05263
#--------------------------------------------------------------------------------
list(Time=ChickWeight$Time,Diet=ChickWeight$Diet)
#--------------------------------------------------------------------------------
maxweight = tapply(PlantGrowth$weight,PlantGrowth$group,max)
maxweight
ctrl trt1 trt2
6.11 6.03 6.31
#--------------------------------------------------------------------------------
as.data.frame(as.table(maxweight))
  Var1 Freq
1 ctrl 6.11
2 trt1 6.03
3 trt2 6.31
#--------------------------------------------------------------------------------
as.data.frame.table(as.table(maxweight),responseName='MaxWeight')
  Var1 MaxWeight
1 ctrl      6.11
2 trt1      6.03
3 trt2      6.31
#--------------------------------------------------------------------------------
ranges = tapply(PlantGrowth$weight,PlantGrowth$group,range)
ranges
$ctrl
[1] 4.17 6.11

$trt1
[1] 3.59 6.03

$trt2
[1] 4.92 6.31
#--------------------------------------------------------------------------------
ranges[[1]]
[1] 4.17 6.11
ranges[['trt1']]
[1] 3.59 6.03
#--------------------------------------------------------------------------------
data.frame(group=dimnames(ranges)[[1]],
           matrix(unlist(ranges),ncol=2,byrow=TRUE))
  group   X1   X2
1  ctrl 4.17 6.11
2  trt1 3.59 6.03
3  trt2 4.92 6.31
#--------------------------------------------------------------------------------
ranges1 = tapply(CO2$uptake,CO2[c('Type','Treatment')],range)
ranges1
             Treatment
Type          nonchilled chilled
  Quebec      Numeric,2  Numeric,2
  Mississippi Numeric,2  Numeric,2
#--------------------------------------------------------------------------------
ranges[['Quebec','chilled']]
[1]  9.3 42.4
#--------------------------------------------------------------------------------
data.frame(expand.grid(dimnames(ranges1)),
           matrix(unlist(ranges1),byrow=TRUE,ncol=2))
         Type  Treatment   X1   X2
1      Quebec nonchilled 13.6 45.5
2 Mississippi nonchilled 10.6 35.5
3      Quebec    chilled  9.3 42.4
4 Mississippi    chilled  7.7 22.2
#--------------------------------------------------------------------------------
meds = tapply(CO2$uptake,CO2[c('Type','Treatment')],median)
#--------------------------------------------------------------------------------
inds = tapply(CO2$uptake,CO2[c('Type','Treatment')])
inds
 [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 3 3 3 3 3 3 3 3
[31] 3 3 3 3 3 3 3 3 3 3 3 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
[61] 2 2 2 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
adj.uptake = CO2$uptake - meds[inds]
#--------------------------------------------------------------------------------
adj.uptake = CO2$uptake - 
      ave(CO2$uptake,CO2[c('Type','Treatment')],FUN=median)
#--------------------------------------------------------------------------------
adj.uptake = CO2$uptake - 
      ave(CO2$uptake,CO2$Type,CO2$Treatment,FUN=median)
#--------------------------------------------------------------------------------
maxeig = function(df)eigen(cor(df))$val[1]
#--------------------------------------------------------------------------------
frames = split(iris[-5],iris[5])
#--------------------------------------------------------------------------------
sapply(frames,maxeig)
    setosa versicolor  virginica
  2.058540   2.926341   2.454737
#--------------------------------------------------------------------------------
sapply(split(iris[-5],iris[5]),
       function(df)eigen(cor(df))$val[1])
    setosa versicolor  virginica
  2.058540   2.926341   2.454737
#--------------------------------------------------------------------------------
tapply(1:nrow(iris),iris['Species'],
  function(ind,data)eigen(cor(data[ind,-5]))$val[1],data=iris)
Species
    setosa versicolor  virginica
  2.058540   2.926341   2.454737
#--------------------------------------------------------------------------------
max.e = by(iris,iris$Species,
                function(df)eigen(cor(df[-5]))$val[1])
max.e
iris$Species: setosa
[1] 2.058540
------------------------------------------------------------
iris$Species: versicolor
[1] 2.926341
------------------------------------------------------------
iris$Species: virginica
[1] 2.454737
#--------------------------------------------------------------------------------
as.data.frame(as.table(max.e))
  iris.Species     Freq
1       setosa 2.058540
2   versicolor 2.926341
3    virginica 2.454737
#--------------------------------------------------------------------------------
sumfun = function(x)data.frame(n=length(x$uptake),
                    mean=mean(x$uptake),sd=sd(x$uptake))
bb = by(CO2,CO2[c('Type','Treatment')],sumfun)
bb
Type: Quebec
Treatment: nonchilled
   n     mean      sd
1 21 35.33333 9.59637
------------------------------------------------------------
Type: Mississippi
Treatment: nonchilled
   n     mean       sd
1 21 25.95238 7.402136
------------------------------------------------------------
Type: Quebec
Treatment: chilled
   n     mean       sd
1 21 31.75238 9.644823
------------------------------------------------------------
Type: Mississippi
Treatment: chilled
   n     mean       sd
1 21 15.81429 4.058976
#--------------------------------------------------------------------------------
do.call(rbind,bb)
    n     mean       sd
1  21 35.33333 9.596371
11 21 25.95238 7.402136
12 21 31.75238 9.644823
13 21 15.81429 4.058976
#--------------------------------------------------------------------------------
cbind(expand.grid(dimnames(bb)),do.call(rbind,bb))
         Type  Treatment  n     mean       sd
1      Quebec nonchilled 21 35.33333 9.596371
2 Mississippi nonchilled 21 25.95238 7.402136
3      Quebec    chilled 21 31.75238 9.644823
4 Mississippi    chilled 21 15.81429 4.058976
#--------------------------------------------------------------------------------
states = data.frame(state.x77,state=row.names(state.x77),
                    region=state.region,row.names=1:50)
#--------------------------------------------------------------------------------
library(reshape)
mstates = melt(states)
Using state, region as id variables
#--------------------------------------------------------------------------------
cast(mstates,region~variable,mean)
         region Population   Income Illiteracy Life.Exp
1     Northeast   5495.111 4570.222   1.000000 71.26444
2         South   4208.125 4011.938   1.737500 69.70625
3 North Central   4803.000 4611.083   0.700000 71.76667
4          West   2915.308 4702.615   1.023077 71.23462
     Murder  HS.Grad    Frost      Area
1  4.722222 53.96667 132.7778  18141.00
2 10.581250 44.34375  64.6250  54605.12
3  5.275000 54.51667 138.8333  62652.00
4  7.215385 62.00000 102.1538 134463.00
#--------------------------------------------------------------------------------
cast(mstates,variable~region,mean)
    variable    Northeast       South North Central
1 Population  5495.111111  4208.12500    4803.00000
2     Income  4570.222222  4011.93750    4611.08333
3 Illiteracy     1.000000     1.73750       0.70000
4   Life.Exp    71.264444    69.70625      71.76667
5     Murder     4.722222    10.58125       5.27500
6    HS.Grad    53.966667    44.34375      54.51667
7      Frost   132.777778    64.62500     138.83333
8       Area 18141.000000 54605.12500   62652.00000
          West
1 2.915308e+03
2 4.702615e+03
3 1.023077e+00
4 7.123462e+01
5 7.215385e+00
6 6.200000e+01
7 1.021538e+02
8 1.344630e+05
#--------------------------------------------------------------------------------
cast(mstates,region~variable,mean,
             subset=variable %in% c('Population','Life.Exp'))
         region Population Life.Exp
1     Northeast   5495.111 71.26444
2         South   4208.125 69.70625
3 North Central   4803.000 71.76667
4          West   2915.308 71.23462
#--------------------------------------------------------------------------------
cast(mstates,.~variable,c(mean,median,sd),
             subset=variable %in% c('Population','Life.Exp'))
  value Population_mean Population_median Population_sd
1 (all)         4246.42            2838.5      4464.491
  Life.Exp_mean Life.Exp_median Life.Exp_sd
1       70.8786          70.675    1.342394
#--------------------------------------------------------------------------------
cast(mstates,variable~.,c(mean,median,sd),
     subset=variable %in% c('Population','Life.Exp'))
    variable      mean   median          sd
1 Population 4246.4200 2838.500 4464.491433
2   Life.Exp   70.8786   70.675    1.342394
#--------------------------------------------------------------------------------
cast(mstates,region~variable,c(mean,median,sd),
             subset=variable %in% c('Population','Life.Exp'))
         region Population_mean Population_median Population_sd
1     Northeast        5495.111            3100.0      6079.565
2         South        4208.125            3710.5      2779.508
3 North Central        4803.000            4255.0      3702.828
4          West        2915.308            1144.0      5578.607
  Life.Exp_mean Life.Exp_median Life.Exp_sd
1      71.26444           71.23   0.7438769
2      69.70625           70.07   1.0221994
3      71.76667           72.28   1.0367285
4      71.23462           71.71   1.3519715
#--------------------------------------------------------------------------------
cast(mstates,variable~.|region,
             c(mean,median,sd),
             subset=variable%in%c('Population','Life.Exp'))
$Northeast
    variable       mean  median           sd
1 Population 5495.11111 3100.00 6079.5651457
2   Life.Exp   71.26444   71.23    0.7438769

$South
    variable       mean  median          sd
1 Population 4208.12500 3710.50 2779.508251
2   Life.Exp   69.70625   70.07    1.022199

$`North Central`
    variable       mean  median          sd
1 Population 4803.00000 4255.00 3702.827593
2   Life.Exp   71.76667   72.28    1.036729

$West
    variable       mean  median          sd
1 Population 2915.30769 1144.00 5578.607015
2   Life.Exp   71.23462   71.71    1.351971
#--------------------------------------------------------------------------------
mChick = melt(ChickWeight,measure.var='weight')
#--------------------------------------------------------------------------------
head(cast(mChick,Diet + Time ~ variable,median))
  Diet Time weight
1    1    0     41
2    1    2     49
3    1    4     56
4    1    6     67
5    1    8     79
6    1   10     93
#--------------------------------------------------------------------------------
cast(mChick,Diet ~ Time + variable,mean)
  Diet  0_weight  2_weight  4_weight  6_weight  8_weight
1    1      41.4     47.25  56.47368  66.78947  79.68421
2    2      40.7     49.40  59.80000  75.40000  91.70000
3    3      40.8     50.40  62.20000  77.90000  98.40000
4    4      41.0     51.80  64.50000  83.90000 105.60000
  10_weight 12_weight 14_weight 16_weight 18_weight 20_weight
1  93.05263  108.5263  123.3889  144.6471  158.9412  170.4118
2 108.50000  131.3000  141.9000  164.7000  187.7000  205.6000
3 117.10000  144.4000  164.5000  197.4000  233.1000  258.9000
4 126.00000  151.4000  161.8000  182.0000  202.9000  233.8889
  21_weight
1  177.7500
2  214.7000
3  270.3000
4  238.5556
#--------------------------------------------------------------------------------
cast(mChick,Time ~ variable|Diet,mean)
$`1`
   Time    weight
1     0  41.40000
2     2  47.25000
3     4  56.47368
4     6  66.78947
5     8  79.68421
6    10  93.05263

     .  .  .

$`4`
   Time   weight
1     0  41.0000
2     2  51.8000
3     4  64.5000
4     6  83.9000
5     8 105.6000
6    10 126.0000

     .   .  .
#--------------------------------------------------------------------------------
xChickWeight = subset(ChickWeight,
               !(Diet == 1 & Time == 4))
mxChick = melt(xChickWeight,measure.var='weight')
head(cast(mxChick,Diet + Time ~ variable,median))
  Diet Time weight
1    1    0     41
2    1    2     49
3    1    6     67
4    1    8     79
5    1   10     93
6    1   12    106
#--------------------------------------------------------------------------------
head(cast(mxChick,Diet + Time ~ variable,median,
          add.missing=TRUE))
  Diet Time weight
1    1    0     41
2    1    2     49
3    1    4     NA
4    1    6     67
5    1    8     79
6    1   10     93
#--------------------------------------------------------------------------------
head(recast(xChickWeight,measure.var='weight',
            Diet + Time ~ variable,median,
            add.missing=TRUE))
  Diet Time weight
1    1    0     41
2    1    2     49
3    1    4     NA
4    1    6     67
5    1    8     79
6    1   10     93
#--------------------------------------------------------------------------------
dat = matrix(rnorm(1000000),10000,100)
system.time(mns <- rowMeans(dat))
[1] 0.008 0.000 0.010 0.000 0.000
#--------------------------------------------------------------------------------
system.time(mns <- apply(dat,2,mean))
[1] 0.032 0.020 0.056 0.000 0.000
#--------------------------------------------------------------------------------
system.time({m <- ncol(dat)
             for(i in 1:m)mns[i] <- mean(dat[,i])})
[1] 0.032 0.004 0.036 0.000 0.000
#--------------------------------------------------------------------------------
slowmean = function(dat){
  n = dim(dat)[1]
  m = dim(dat)[2]
  mns = numeric(m)
  for(i in 1:n){
     sum = 0;
     for(j in 1:m)sum = sum + dat[j]
     mns[i] = sum / n
  }
  return(mns)
+}
system.time(mns <- slowmean(dat))
[1] 2.100 0.000 2.097 0.000 0.000
#--------------------------------------------------------------------------------
system.time({m = dim(dat)[1];mns = rep(1,m) %*% dat / m})
[1] 0.020 0.000 0.021 0.000 0.000
#--------------------------------------------------------------------------------
system.time(m <- matrix(1:100,10000,100,byrow=TRUE))
[1] 0.022 0.003 0.025 0.000 0.000
#--------------------------------------------------------------------------------
buildrow = function(){
   res = NULL
   for(i in 1:10000)res = rbind(res,1:100)
   res
}
system.time(buildrow())
[1] 239.236  21.446 260.707   0.000   0.000
#--------------------------------------------------------------------------------
buildcol = function(){
   res = NULL
   for(i in 1:10000)res = cbind(res,1:100)
   t(res)
}
system.time(buildcol())
[1] 142.666  20.596 163.289   0.000   0.000
#--------------------------------------------------------------------------------
buildrow1 = function(){
   res = matrix(0,10000,100)
   for(i in 1:10000)res[i,] = 1:100
   res
}
system.time(buildrow1())
[1] 0.242 0.015 0.257 0.000 0.000
#--------------------------------------------------------------------------------
somerow1 = function(){
  res = NULL
  for(i in 1:10000)if(runif(1) < .5)res = rbind(res,1:100)
  res
}
system.time(somerow1())
[1] 51.007  6.062 57.125  0.000  0.000
#--------------------------------------------------------------------------------
somerow2 = function(){
  res = matrix(0,10000,100)
  k = 0
  for(i in 1:10000)if(runif(1) < .5){
       k = k + 1
       res[k,] = 1:100
  }
  res[1:k,]
}
system.time(somerow2())
[1] 0.376 0.027 0.404 0.000 0.000
#--------------------------------------------------------------------------------
somerow3 = function(){
   res = list()
   for(i in 1:10000)if(runif(1) < .5)res = c(res,list(1:100))
   do.call(rbind,res)
}
system.time(somerow3())
[1] 33.308  0.247 33.575  0.000  0.000
#--------------------------------------------------------------------------------
Loblolly$logheight = log(Loblolly$height)
#--------------------------------------------------------------------------------
Loblolly['logheight'] = log(Loblolly['height'])
#--------------------------------------------------------------------------------
with(Loblolly,log(height))
#--------------------------------------------------------------------------------
Loblolly = transform(Loblolly,logheight = log(height))
#--------------------------------------------------------------------------------
iris[,-5] = sapply(iris[,-5],function(x)x/2.54)
#--------------------------------------------------------------------------------
bigsepal = iris$Sepal.Length > 6
#--------------------------------------------------------------------------------
sepalgroup = 1 + (iris$Sepal.Length >= 5) 
               + (iris$Sepal.Length >= 7)
#--------------------------------------------------------------------------------
sepalgroup = cut(iris$Sepal.Length,c(0,5,7,10),
                 include.lowest=TRUE,right=FALSE)
#--------------------------------------------------------------------------------
newgroup = ifelse(group %in% c(1,5),1,2)
#--------------------------------------------------------------------------------
newgroup = ifelse(group %in% c(1,5),1,
                  ifelse(group %in% c(2,4),2,3))
#--------------------------------------------------------------------------------
x = c(-1.2,-3.5,-2.8,-1.1,-0.7)
newx = ifelse(x > 0,log(x),abs(x))
newx
[1] 1.2 3.5 2.8 1.1 0.7
#--------------------------------------------------------------------------------
x = c(-1.2,-3.5,-2.8,1.1,-0.7)
newx = ifelse(x > 0,log(x),abs(x))
Warning message:
NaNs produced in: log(x)
newx
[1] 1.20000000 3.50000000 2.80000000 0.09531018 0.70000000
#--------------------------------------------------------------------------------
newx = numeric(length(x))
newx[x > 0] = log(x[x > 0])
newx[x <= 0] = abs(x[x <= 0])
newx
[1] 1.20000000 3.50000000 2.80000000 0.09531018 0.70000000
#--------------------------------------------------------------------------------
newx = sapply(x,function(t)if(t > 0)log(t) else abs(t))
#--------------------------------------------------------------------------------
newgroup = recode(group,'c(1,5)=1;c(2,4)=2;else=3')
#--------------------------------------------------------------------------------
mydata = data.frame(grp1=c(12,15,19,22,25),
                  grp2=c(18,12,42,29,44),
                  grp3=c(8,17,22,19,31))
mydata
  grp1 grp2 grp3
1   12   18    8
2   15   12   17
3   19   42   22
4   22   29   19
5   25   44   31
#--------------------------------------------------------------------------------
sdata = stack(mydata)
head(sdata)
  values  ind
1     12 grp1
2     15 grp1
3     19 grp1
4     22 grp1
5     25 grp1
6     18 grp2
#--------------------------------------------------------------------------------
mydata = unstack(sdata,values~ind)
head(mydata)
  grp1 grp2 grp3
1   12   18    8
2   15   12   17
3   19   42   22
4   22   29   19
5   25   44   31
#--------------------------------------------------------------------------------
set.seed(17)
obs = data.frame(subj=rep(1:4,rep(3,4)),
                 time=rep(1:3),
                 x=rnorm(12),y=rnorm(12))
obs
   subj time           x           y
1     1    1 -1.01500872  1.29532187
2     1    2 -0.07963674  0.18791807
3     1    3 -0.23298702  1.59120510
                   . . .
9     3    3  0.25523700  0.68102765
10    4    1  0.36658112 -0.68203337
11    4    2  1.18078924 -0.72325674
12    4    3  0.64319207  1.67352596
#--------------------------------------------------------------------------------
wideobs = reshape(obs,idvar='subj',v.names=c('x','y'),
                  timevar='time',direction='wide')
wideobs
   subj        x.1         y.1         x.2        y.2
1     1 -1.0150087  1.29532187 -0.07963674  0.1879181
4     2 -0.8172679 -0.05517906  0.77209084  0.8384711
7     3  0.9728744  0.62595440  1.71653398  0.6335847
10    4  0.3665811 -0.68203337  1.18078924 -0.7232567
          x.3       y.3
1  -0.2329870 1.5912051
4  -0.1656119 0.1593701
7   0.2552370 0.6810276
10  0.6431921 1.6735260
#--------------------------------------------------------------------------------
obs = reshape(wideobs)
head(obs)
    subj time           x           y
1.1    1    1 -1.01500872  1.29532187
2.1    2    1 -0.81726793 -0.05517906
3.1    3    1  0.97287443  0.62595440
4.1    4    1  0.36658112 -0.68203337
1.2    1    2 -0.07963674  0.18791807
2.2    2    2  0.77209084  0.83847112
#--------------------------------------------------------------------------------
usp = data.frame(type=rownames(USPersonalExpenditure),
                      USPersonalExpenditure,row.names=NULL)
usp
                 type  X1940  X1945 X1950 X1955 X1960
1    Food and Tobacco 22.200 44.500 59.60  73.2 86.80
2 Household Operation 10.500 15.500 29.00  36.5 46.20
3  Medical and Health  3.530  5.760  9.71  14.0 21.10
4       Personal Care  1.040  1.980  2.45   3.4  5.40
5   Private Education  0.341  0.974  1.80   2.6  3.64
#--------------------------------------------------------------------------------
rr = reshape(usp,varying=list(names(usp)[-1]),direction='long')
head(rr)
                   type time  X1940 id
1.1    Food and Tobacco    1 22.200  1
2.1 Household Operation    1 10.500  2
3.1  Medical and Health    1  3.530  3
4.1       Personal Care    1  1.040  4
5.1   Private Education    1  0.341  5
1.2    Food and Tobacco    2 44.500  1
#--------------------------------------------------------------------------------
rr=reshape(usp,varying=list(names(usp)[-1]),idvar='type',
           times=seq(1940,1960,by=5),v.names='expend',
           direction='long')
head(rr)
                                        type time expend
Food and Tobacco.1940       Food and Tobacco 1940 22.200
Household Operation.1940 Household Operation 1940 10.500
Medical and Health.1940   Medical and Health 1940  3.530
Personal Care.1940             Personal Care 1940  1.040
Private Education.1940     Private Education 1940  0.341
Food and Tobacco.1945       Food and Tobacco 1945 44.500
#--------------------------------------------------------------------------------
rr1 = reshape(usp,varying=names(usp)[-1],idvar='type',
       split=list(regexp='X1',include=TRUE),direction='long')
head(rr1)
                                        type time      X
Food and Tobacco.1940       Food and Tobacco 1940 22.200
Household Operation.1940 Household Operation 1940 10.500
Medical and Health.1940   Medical and Health 1940  3.530
Personal Care.1940             Personal Care 1940  1.040
Private Education.1940     Private Education 1940  0.341
Food and Tobacco.1945       Food and Tobacco 1945 44.500
#--------------------------------------------------------------------------------
library(reshape)
usp = data.frame(type=rownames(USPersonalExpenditure),
                      USPersonalExpenditure,row.names=NULL)
musp = melt(usp)
head(musp)
                 type variable  value
1    Food and Tobacco    X1940 22.200
2 Household Operation    X1940 10.500
3  Medical and Health    X1940  3.530
4       Personal Care    X1940  1.040
5   Private Education    X1940  0.341
6    Food and Tobacco    X1945 44.500
#--------------------------------------------------------------------------------
musp$variable = as.numeric(sub('X','',musp$variable))
names(musp)[2:3] = c('time','expend')
head(musp)
                 type time expend
1    Food and Tobacco 1940 22.200
2 Household Operation 1940 10.500
3  Medical and Health 1940  3.530
4       Personal Care 1940  1.040
5   Private Education 1940  0.341
6    Food and Tobacco 1945 44.500
#--------------------------------------------------------------------------------
cast(musp,variable + type ~ .)
#--------------------------------------------------------------------------------
set.seed(17)
obs = data.frame(subj=rep(1:4,rep(3,4)),
                 time=rep(1:3),
                 x=rnorm(12),y=rnorm(12))
mobs = melt(obs)
cast(subj ~ variable + time,data=mobs)
  subj        x_1         x_2        x_3         y_1        y_2
1    1 -1.0150087 -0.07963674 -0.2329870  1.29532187  0.1879181
2    2 -0.8172679  0.77209084 -0.1656119 -0.05517906  0.8384711
3    3  0.9728744  1.71653398  0.2552370  0.62595440  0.6335847
4    4  0.3665811  1.18078924  0.6431921 -0.68203337 -0.7232567
        y_3
1 1.5912051
2 0.1593701
3 0.6810276
4 1.6735260
#--------------------------------------------------------------------------------
cast(subj ~variable|time,data=mobs)
$`1`
  subj          x           y
1    1 -1.0150087  1.29532187
2    2 -0.8172679 -0.05517906
3    3  0.9728744  0.62595440
4    4  0.3665811 -0.68203337

$`2`
  subj           x          y
1    1 -0.07963674  0.1879181
2    2  0.77209084  0.8384711
3    3  1.71653398  0.6335847
4    4  1.18078924 -0.7232567

$`3`
  subj          x         y
1    1 -0.2329870 1.5912051
2    2 -0.1656119 0.1593701
3    3  0.2552370 0.6810276
4    4  0.6431921 1.6735260
#--------------------------------------------------------------------------------
cast(subj ~ variable + time,subset = variable == 'x',data=mobs)
  subj        x_1         x_2        x_3
1    1 -1.0150087 -0.07963674 -0.2329870
2    2 -0.8172679  0.77209084 -0.1656119
3    3  0.9728744  1.71653398  0.2552370
4    4  0.3665811  1.18078924  0.6431921
#--------------------------------------------------------------------------------
x = data.frame(a=c('A','B','C'),x=c(12,15,19))
y = data.frame(a=c('D','E','F','G'),x=c(19,21,14,12))
#--------------------------------------------------------------------------------
cbind(y,z=c(1,2))
  a  x z
1 D 19 1
2 E 21 2
3 F 14 1
4 G 12 2
#--------------------------------------------------------------------------------
cbind(x,y[1:3,])
  a  x a  x
1 A 12 D 19
2 B 15 E 21
3 C 19 F 14
#--------------------------------------------------------------------------------
intersect(names(x),names(y))
[1] "a" "x"
#--------------------------------------------------------------------------------
z = rbind(x,c(a='X',x=12))
Warning message:
invalid factor level, NAs generated in: 
"[<-.factor"(`*tmp*`, ri, value = "X")
z = rbind(x,data.frame(a='X',x=12))
levels(z$a)
[1] "A" "B" "C" "X"
#--------------------------------------------------------------------------------
x = data.frame(a=c(1,2,4,5,6),x=c(9,12,14,21,8))
y = data.frame(a=c(1,3,4,6),y=c(8,14,19,2))
merge(x,y)
  a  x  y
1 1  9  8
2 4 14 19
3 6  8  2
#--------------------------------------------------------------------------------
merge(x,y,all=TRUE)
  a  x  y
1 1  9  8
2 2 12 NA
3 3 NA 14
4 4 14 19
5 5 21 NA
6 6  8  2
merge(x,y,all.x=TRUE)
  a  x  y
1 1  9  8
2 2 12 NA
3 4 14 19
4 5 21 NA
5 6  8  2
merge(x,y,all.y=TRUE)
  a  x  y
1 1  9  8
2 3 NA 14
3 4 14 19
4 6  8  2
#--------------------------------------------------------------------------------
cities = data.frame(city=c('New York','Boston','Juneau',
                     'Anchorage','San Diego','Philadelphia',
                     'Los Angeles','Fairbanks','Ann Arbor',
                     'Seattle'),
                    state.abb= c('NY','MA','AK','AK','CA',
                                 'PA','CA','AK','MI','WA'))
#--------------------------------------------------------------------------------
cities
           city state.abb
1      New York        NY
2        Boston        MA
3        Juneau        AK
4     Anchorage        AK
5     San Diego        CA
6  Philadelphia        PA
7   Los Angeles        CA
8     Fairbanks        AK
9     Ann Arbor        MI
10      Seattle        WA
#--------------------------------------------------------------------------------
states = data.frame(state.abb= c('NY','MA','AK','CA',
                                 'PA','MI','WA'),
              state=c('New York','Massachusetts','Alaska',
                      'California','Pennsylvania','Michigan',
                      'Washington'))
#--------------------------------------------------------------------------------
merge(cities,states)
   state.abb         city         state
1         AK       Juneau        Alaska
2         AK    Anchorage        Alaska
3         AK    Fairbanks        Alaska
4         CA    San Diego    California
5         CA  Los Angeles    California
6         MA       Boston Massachusetts
7         MI    Ann Arbor      Michigan
8         NY     New York      New York
9         PA Philadelphia  Pennsylvania
10        WA      Seattle    Washington
#--------------------------------------------------------------------------------
zips = data.frame(state.abb=c('NY','MA','AK','AK','CA',
                              'PA','CA','AK','MI','WA'),
           zip=c('10044','02129','99801','99516','92113',
                 '19127','90012','99709','48104','98104'))
merge(cities,zips)
   state.abb         city   zip
1         AK       Juneau 99801
2         AK       Juneau 99516
3         AK       Juneau 99709
4         AK    Anchorage 99801
5         AK    Anchorage 99516
6         AK    Anchorage 99709
7         AK    Fairbanks 99801
8         AK    Fairbanks 99516
9         AK    Fairbanks 99709
10        CA    San Diego 92113
11        CA    San Diego 90012
12        CA  Los Angeles 92113
13        CA  Los Angeles 90012
14        MA       Boston 02129
15        MI    Ann Arbor 48104
16        NY     New York 10044
17        PA Philadelphia 19127
18        WA      Seattle 98104
#--------------------------------------------------------------------------------
match(cities$state.abb,states$state.abb)
 [1] 1 2 3 3 4 5 4 3 6 7
#--------------------------------------------------------------------------------
indices = match(x$a,y$a,nomatch=0)
y$a[indices]
[1] 1 4 6
#--------------------------------------------------------------------------------
x$a %in% y$a
[1]  TRUE FALSE  TRUE FALSE  TRUE
