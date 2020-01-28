ins<- read.csv("~/insurance.csv")
str(ins)

summmary(ins$age)
sd(ins$age)
boxplot(ins$bmi, main="Boxplot of Insurance BMI",ylab="BMI")
hist(ins$charges, main="Histogram of Insurance Charges",xlab="Charges")
plot(x=ins$bmi, y=ins$charges, main="Scatterplot of BMIvs Charges", xlab="BMI", ylab="Charges")
plot(density(ins$bmi), main=”Density Plot For InsuranceBMI”)

cov(ins$age, ins$bmi)
cov(ins[, c(“age”, “bmi”, “children”, “charges”)])
cor(ins$age, ins$bmi)cor(ins[, c("age", "bmi", “children”, “charges”)])
aggregate(bmi ~ sex, summary, data = ins)

boxplot(bmi ~ age, data = ins)


# Scatter plot
with(ins, plot(age, bmi, col = sex, pch =as.numeric(sex))
# Scatter plot with jitter(jitter utk data tdk overfloat)
with(ins, plot(jitter(children), jitter(age)))
# Scatter plot with ggplot2
install.packages("ggplot2")
library(ggplot2)
qplot(age, charges, data = ins, facets = sex ~ .)

#3D Scatter Plot
# Static 3D scatter plot
install.packages("scatterplot3d")
library(scatterplot3d)
with(ins, scatterplot3d(age, bmi, charges))
# Interactive 3D scatter plot
install.packages("rgl")
library(rgl)
with(ins, plot3d(age, bmi, charges))

#Pairs plot
pairs(ins[, c("age", "bmi", "children", "charges")])

#heatmap
distMatrix <- as.matrix(dist(ins[, c("age", "bmi","children", "charges")])
heatmap(distMatrix)

#LevelPlot
install.packages("lattice")
library(lattice)
levelplot(children ~ bmi * age, ins, cuts = 5,col.regions = grey.colors(6)[6:1])

#Contour
filled.contour(volcano, color = terrain.colors, asp = 1,plot.axes = contour(volcano, add = T))

#3DSurface
persp(volcano, theta = 25, phi = 30, expand = 0.5, col ="lightblue")

#Parallel Coordinat
# Parallel coordinates
install.packages("MASS")
library(MASS)
parcoord(ins[, c("age", "bmi", "children", "charges")],col = ins$sex)
# Parallel coordinates with lattice
library(lattice)
parallelplot(~ins[, c("age", "bmi", "children","charges")] | sex, data = ins)

#Menyimpan gambar
# Save as a PNG 
filepng(“myPlot.png”)
plot(1:10, log(1:10))
graphics.off()
# Save as a JPEG 
filejpeg(“myPlot.jpeg”)
plot(1:10, log(1:10))
graphics.off()
# Save as a PDF 
filepdf(“myPlot.pdf”)
plot(1:10, log(1:10))
graphics.off()
# Save as a Postscript 
filepostscript(“myPlot.ps”)
plot(1:10, log(1:10))
graphics.off()
