﻿## R for SQL Professionals Lab (Student).R
## Buck Woody, Microsoft
## Last Updated: 25 July 2017
## Based on the CRAN Course located here:https://cran.r-project.org/doc/manuals/r-release/R-intro.html
## You will read through the material below along with the course "R for SQL Professionals"
## Anything using one # or two ## signs is for you to read and follow along, anything with ### is your assignment when you get to that portion of the class.
## Note - R Allows you to work with Statistics, which this course does not cover. You should be familiar with the following terms:
## Finite and infinite probability, Joint/addition/multiplication/conditional probability operations, Combination and permutation, the seven fundamental rules of probability theory, Random sampling, Over - fitting, Sampling with and without replacement, Histograms and ogives, Cumulative percentages, Population distribution, Stem and leaf graphs, S - shaped curve, Data distribution(middle value measurements and range), Central tendency and dispersion(variance), Tchebysheff Inequality Theorem, Central Limit Theorem, Binomial distributions, Normal distribution,  Chi - squared, t and F distributions, Hypothesis testing, Confidence intervals, Standard error, Type I and II errors, Correlation, Regression, Significance testing, Cross validation, jackknife and bootstrap replication of study

#1.0 Planning, setup and environment
	##1.1 R Ecostructure, Installation
	##1.2 Microsoft R
	##1.3 R Client and Environment
		### Start the HTML interface to on-line help (using a web browser available at your machine). OPen help this way and briefly explore the features of this facility with the mouse:

		### Show one example of the help function. Is there more than one way to do that?

		### Show the R version:

		### Show all system environment settings:

		## These are stored in the "Workspace", which is persisted at .RData
		## The commands you type are persisted in .Rhistory
		## ( More on workspaces here - http://www.statmethods.net/interface/workspace.html)
		### Show the Working Directory:

		### Set it with setwd() to a temporary location:

		### Show the files in your R home directory:

		### Save your Workspace:

		## Show the files in your Workspace:
		list.files(all.files = "TRUE")
		### Remove individual objects no longer needed, show all currently loaded objects:
		x <- 10
		X <- 5

		## Danger: rm(list = ls()) removes everything, so use with care! (There is no "Recycle Bin")

		## .Rprofile - http://www.statmethods.net/interface/customizing.html
		## Edit the .Last element of the .Rprofile file to print "Goodnight, Dave" when you exit
		## .Last <- function(){cat("\n Goodnight, Dave. \n")}

		### Show the sample data sets in R, obtain help for one of them:

		### Using the anscombe sample dataset, view the data and then edit it in a graphical window:

		## Programming and Flow
		x <- 1
		if (x > 1) "Higher than 1" else "Not higher than 1"

		0xFFFF

		### loop types
		i <- 5
		repeat { if (i > 25) break else { print(i); i <- i + 5; }}

		i <- 5
		while (i <= 25) { print(i); i <- i + 5; }

		for (i in seq(from = 5, to = 25, by = 5))
			print(i)

		install.packages("iterators")
		library(iterators)
		help.search("iterators")

		i <- iter(1:5)
		nextElem(i)


		### Clean up - use with care!

	#1.4 Package Management
		### Show the libraries that are currently loaded:

		### Show the libraries that are available:

		### Show how to get help with one of them:

		### Show where R stores packages:

		### Install the dplyr package:

		### Update all packages:

		## More info on packages for MRS: https: / / msdn.microsoft.com / en - us / library / mt591989.aspx
		## More great packages - http://www.computerworld.com/article/2921176/business-intelligence/great-r-packages-for-data-import-wrangling-visualization.html

		## Remove a Package
		? remove.packages

#2.0 Data Structures - http://adv-r.had.co.nz/Data-structures.html
	##2.1 R Data Types
	##2.2 R Data Structures

	### Create an object holding a range of values from 1 to 20. Create another object showing whether all values are higher than 15. Show the type of the two objects:

	### Create an object and cast an object to another class:

	## Lengths of objects

	### Make an object of a given length:

	### Truncate the length:

	### Clean up - use with care!

		#2.2.1 Vectors
		### Vectors have implied distribution during operations. Set up two objects - x and y. Make x a vector from 1 to 10, and y a vector of 2 * x. Show both x and y. Then show the 4th element of y:

		## Logical vectors are generated by conditions
		temp1 <- x > 7
		temp1
		## And repetition is very useful
		s5 <- rep(x, times = 5)
		s5
		### Make a new object that replicates the numbers 1-7, seven times:

		#2.2.2 Lists
		## Lists can mix item types:
		Lst <- list(name = "Fred", wife = "Mary", no.children = 3, child.ages = c(4, 7, 9))
		Lst
		Lst[2]
		Lst$name
		Lst[["name"]]

		### Create an object called pts that uses the cars sample data to create an x-value of the speed and a y-value of the distance. then type plot(pts) to show the result:

		#2.2.3 Matrix
		### Create an object from 1-20, then create a 2-dimension matrix from that object, then show the 3rd value from the second dimension:

		#2.2.4 Array
		## You can create an array with the dim function
		z <- c(1:24)
		dim(z) <- c(3, 4, 2)
		z

		### Create a A 4x5 array using an array function:

		### Show 3rd row, 2nd column:

		### Replace that value with 0:

		## You can make this look more like tables and rows, with headers and names
		x1 <- c(1, 2, 3)
		x2 <- c(4, 5, 6, 7, 8, 9)
		matrix.name <- c("Mat1", "Mat2")
		column.name <- c("Col1", "Col2", "Col3")
		row.name <- c("Row1", "Row2", "Row3")
		y <- array(c(x1, x2), dim = c(3, 3, 2), dimnames = list(row.name, column.name, matrix.name))
		y
		y[,, 2]

		## You can perform math across arrays with apply: array, data set, function
		x
		sums <- apply(x, 1, sum) # sum the rows across
		sums
		sums <- apply(x, 2, sum) # sum the columns down
		sums
		### Clean up - use with care!

		## Dataframes
		## Data frames are similar to a Matrix, but different "columns" can have different datatypes.
		x <- c(10, 20, 30)
		y <- c("Red", "Green", "Blue")
		z <- c(TRUE, FALSE, TRUE)
		df <- data.frame(x, y, z)
		df

		## Dates - and the lubridate package
		startDate <- as.Date("2017-12-25")
		endDate <- as.Date("2018-12-25")
		elapsedDays <- endDate - startDate
		elapsedDays

		### Get the difference in dates in weeks


		install.packages("lubridate")
		vignette("lubridate")

#3.0 Data Ingress and Connection Options
	#3.1 Scripts
		## Load an R Script:
		source("c:\\temp\\SampleScript.R")

	#3.2 Reading in data from a file
		## Reads a file in from c:\temp and uses the first lines as headers
		HousePrice <- read.table("c:\\temp\\houses.csv", header = TRUE)
		### Use a graphical menu to select a file and it read in, and explore that data (you may have to create one first):

		### Read the file "		data <- read.csv("https://aql.datapress.com/leeds/dataset/polling-station-locations/2016-03-17T10:33:18/Polling%20stations.csv")" and load it into an object called webdata
		data <- read.csv("https://aql.datapress.com/leeds/dataset/polling-station-locations/2016-03-17T10:33:18/Polling%20stations.csv")

	#3.3 Exporting Data
		## Send all output to file
		sink("c:\\temp\\output.txt")
		## Return to sending to StdOut
		sink()
		### Open a sample dataset, assign it to an object of x, and write the x object as data out:

	## 3.3 Working with ODBC
	## Note: Refer to https://packages.revolutionanalytics.com/doc/8.0.0/win/RevoScaleR_ODBC.pdf for a comprehensive discussion on working with ODBC data sources in Microsoft R.
	## Create the SQL Statement you want
	bikesSQL = "SELECT * FROM Production.Product"
	## Point to the ODBC DSN Name
	bikesDS2 <- RxOdbcData(sqlQuery = bikesSQL, connectionString = "DSN=MSSQLDSN;Uid=<username>;Pwd=<password>;")
	## A place to store the returned data - using the Extended Data Frame function
	bikesFile <- RxXdfData("DataFromODBC.xdf")
	## Move the data to the file
	rxImport(bikesDS2, bikesFile, overwrite = TRUE)
	## Display information about the file
	rxGetInfo(bikesFile, getVarInfo = TRUE, numRows = 10)

	### Clean up - use with care!

#4.0 R Functions
	## 4.1 Basic Functions:
	x <- cars
	str(x)
	mean(x$speed)
	median(x$speed)
	quantile(x$speed)
	sum(x$speed)
	sd(x$speed)
	rbind(x$speed)
	y = merge(x$speed, x$dist)
	y
	order(x$speed)

	#4.2 Quantitative Analysis (Continuous, Numeric Values)
	? faithful
	attach(faithful)
	View(faithful)
	summary(eruptions)
	fivenum(eruptions)
	plot(eruptions)
	hist(eruptions)
	stem(eruptions)
	range(eruptions)
	seq(1.5, 5.5, by = .5)
	table(cut(faithful$eruptions, seq(1.5, 5.5, by = 0.5)))

	#4.3 Qualitative Analysis
	## Aggregate is a useful parsing tool for qualitative measurements
	? chickwts
	attach(chickwts)
	aggregate(weight ~ feed, data = chickwts, mean)
	### Create a simple plot of the data above:

	## Tables are a more powerful way to work with arrays of data
	price <- matrix(c(53, 47, 21, 90, 45, 15, 65, 27, 11), ncol = 3, byrow = TRUE)
	colnames(price) <- c("High", "Middle", "Low")
	rownames(price) <- c("Stock1", "Stock2", "Stock3")
	price <- as.table(price)
	prop.table(price) # proportions of all rows and columns
	prop.table(price, 1) # proportions of rows
	prop.table(price, 2) # proportion of columns

	### A far more common tool for qualitative selection and "wrangling" of data is dplyr. Install it:
	install.packages("dplyr")
	library(dplyr)
	# Documentation: https://www.r-project.org/nosvn/pandoc/dplyr.html

	### Get the data for most examples:
	install.packages(c("hflights", "Lahman"))

	### Work through this tutorial:
	vignette("introduction", package = "dplyr")

	## More information on how dplyr works - you can look up examples for using each of these:
	select() # Like the SQL SELECT Statement
		# starts_with()
		# ends_with()
		# contains()
		# matches()
		# num_range()
		# one_of()
		# everything()

	filter() # Like the SQL WHERE Statement - remember, R uses == for equality test. Can also be use with %in%
	group_by() # Like the SQL GROUP BY Statement
	summarise() # Like the SQL aggregate statements
	arrange() # Like the SQL ORDER BY Statement
	join() # Like the SQL JOIN Statement
			# inner_join()
			# left_join()
			# semi_join()
			# anti_join()
			# intersect()
			# union()

	mutate() # Like the SQL ALIAS Statement
	distinct() # Like the SQL DISTINCT Statement
	do() # Like SQL Cursors

	#4.4 Probability Analysis
	### Look up the help for at least three of the functions below, locate an example, type and run it here:
	help(qnorm)
	beta()
	log()
	gamma()
	logis()
	norm()
	pois()
	t()
	unif()
	chisq()

	## Predictions
	x <- rnorm(15)
	y <- x + rnorm(15)
	predict(lm(y ~ x))

	new <- data.frame(x = seq(-3, 3, 0.5))
	predict(lm(y ~ x), new, se.fit = TRUE)
	pred.w.plim <- predict(lm(y ~ x), new, interval = "prediction")
	pred.w.clim <- predict(lm(y ~ x), new, interval = "confidence")
	matplot(new$x, cbind(pred.w.clim, pred.w.plim[, -1]),
		lty = c(1, 2, 2, 3, 3), type = "l", ylab = "predicted y")

	#4.5 Creating your own functions
	myFunction <- function(arg1, arg2, ...)
	{
			#statements...
		return(object)
	}

		### Create a function that calculates the amount of money spent on a meeting by the number of people in that meeting. If the cost is higher than 1,000, tell the person they are wasting money:

#5.0 Visualization - check out http://www.joyce-robbins.com/wp-content/uploads/2016/04/effectivegraphsmro1.pdf
	## packages: base, ggplot2, lattice, HH, MASS and micromapST

	#5.1 Plot
	## Example for cars dataset
	require(stats) # for lowess, rpois, rnorm
	plot(cars)
	lines(lowess(cars))
		## Sine Wave Plot
	plot(sin, - pi, 2 * pi)

	## Discrete Distribution Plot:
	plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10, main = "rpois(100, lambda = 5)")

	## Simple quantiles/ECDF, see ecdf() {library(stats)} for a better one
	plot(x <- sort(rnorm(47)), type = "s", main = "plot(x, type = \"s\")")
	points(x, cex = .5, col = "dark red")

	#5.2 Boxplot
	## Two samples of data, showing the latent heat of the fusion of ice
	A <- c(79.98, 80.04, 80.02, 80.04, 80.03, 80.03, 80.04, 79.97, 80.05, 80.03, 80.02, 80.00, 80.02)
	B <- c(80.02, 79.94, 79.98, 79.97, 79.97, 80.03, 79.95, 79.97)
	### Create a box plot using A and B data from above:


	#5.3 Histograms
	attach(faithful)
		### Examine the faithful dataset. What is it? What does it show? How can we graph the eruptions?


	#5.4 Barplot
	barplot(x, y)

	#5.5 Piechart
	x <- c(1, 6, 7, 4, 1)
	pie(x)

	### Using the anscombe dataset, create a visual for the data:

#### 6: Optional full examples

# An interesting experience, which puts your knowledge together -
# Wordcloud in R
# https://cran.r-project.org/web/packages/wordcloud/wordcloud.pdf
install.packages("tm")
install.packages("wordcloud")
install.packages("SnowballC")
require(tm)
require(wordcloud)
require(SnowballC)
## - Note: Create a directory, and any files you put there will be read in by this command!
x <- Corpus(DirSource("d:/test/"))
inspect(x)
x <- tm_map(x, stripWhitespace)
x <- tm_map(x, tolower)
x <- tm_map(x, removeWords, stopwords("english"))
x <- tm_map(x, stemDocument)
wordcloud(x, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))


## make the bins smaller, make a plot of density
hist(faithful$eruptions, seq(1.6, 5.2, 0.2), prob = TRUE)
lines(density(faithful$eruptions, bw = 0.1))
rug(faithful$eruptions) # show the actual data points

## Two samples of data, showing the latent heat of the fusion of ice
A <- c(79.98, 80.04, 80.02, 80.04, 80.03, 80.03, 80.04, 79.97, 80.05, 80.03, 80.02, 80.00, 80.02)
B <- c(80.02, 79.94, 79.98, 79.97, 79.97, 80.03, 79.95, 79.97)
boxplot(A, B)
### Are they significantly different? (yes)
t.test(A, B)

# A complete example using sample data
## Get the path to the data file.
filepath <- system.file("data", "morley.tab", package = "datasets")
filepath
## Look at the file
file.show(filepath)
## Read in the Michelson data as a data frame, and look at it. There are five experiments (column Expt) and each has 20 runs (column Run) and sl is the recorded speed of light, suitably coded
mm <- read.table(filepath)
mm
## Change Expt and Run into factors
mm$Expt <- factor(mm$Expt)
mm$Run <- factor(mm$Run)
## Make the data frame visible at position 3 (the default)
attach(mm)
## Compare the five experiments with simple boxplots
plot(Expt, Speed, main = "Speed of Light Data", xlab = "Experiment No.")
## Analyze as a randomized block, with �runs� and �experiments� as factors.
fm <- aov(Speed ~ Run + Expt, data = mm)
summary(fm)
## Fit the sub-model omitting runs, and compare using a formal analysis of variance
fm0 <- update(fm, . ~ . - Run)
anova(fm0, fm)
## Clean up before moving on
detach()
rm(fm, fm0)


# Ordered and unordered factors
# A sample of 30 tax accountants from Australia
state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa",
			 "qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas",
			 "sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa",
			 "sa", "act", "nsw", "vic", "vic", "act")

## Group those into a factor set, show the groupings
statef <- factor(state)
levels(statef)
table(statef)
## The salaries, in thousands, for the accountants
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
			   61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
			   59, 46, 58, 43)
## Now we can use tapply to put them together
incmeans <- tapply(incomes, statef, mean)
incmeans

## the cut function can break things further into ranges:
wfact <- cut(incomes, breaks = 3, labels = c("Low", "Med", "High"))
wfact
table(wfact)

## Ordered example:
m <- c("March", "April", "January", "November", "January", "September", "October", "September", "November", "August", "January", "November", "November", "February", "May", "August", "July", "December", "August", "August", "September", "November", "February", "April")
m = factor(m)
table(m)

om <- factor(m, levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"), ordered = TRUE)
table(om)

########################### EOF: R for SQL Professionals Lab (Student).R
