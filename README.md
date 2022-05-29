# P2_Probstat_E_5025201227

Bimantara Tito Wahyudi  <-->  5025201227


## Soal 1

### 1.a

#### Source Code
```r
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
diff <- y-x
sdev <- sd(diff)
sdev
```

#### Hasil
![1a](img/1a.png)

### 1.b

#### Source Code
```r
n <- 9
t <- mean(diff)/(sdev/sqrt(n))
pval <- pt(t, n-1,lower.tail = TRUE) # left tailed
pval
```

#### Hasil
![1b](img/1b.png)

### 1.c

#### Penjelasan

## Soal 2

#### Source Code
```r
zsum.test(mean.x=23500, sigma.x=3900, n.x=100, alternative = "less", mu=20000, conf.level=0.95)
```

#### Hasil
![2](img/2.png)

### 2.a

#### Penjelasan

### 2.b

#### Penjelasan

### 2.c

#### Penjelasan

## Soal 3

### 3.a

#### Penjelasan

### 3.b

#### Source Code
```r
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, alternative = "less", conf.level = 0.95)
```

#### Hasil
![3b](img/3b.png)

### 3.c

#### Source Code
```r
z <- (3.64-2.79)/sqrt(1.67*1.67/19+1.32*1.32/27)
z
```

#### Hasil
![3c](img/3c.png)

### 3.d

#### Source Code
```r
qt(0.05, 2, lower.tail = TRUE)
```

#### Hasil
![3d](img/3d.png)

### 3.e

#### Penjelasan

### 3.f

#### Penjelasan

## Soal 4

### 4.a

#### Source Code
```r
data <- read.delim("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")
set.seed(format(Sys.time(), "%H%M%S"))
dplyr::sample_n(data, 10)
ggboxplot(data, x = "Group", y = "Length",
          color = "Group", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("1", "2", "3"),
          ylab = "Length", xlab = "Grup")
```

#### Hasil
![4a](img/4a.png)

### 4.b

#### Source Code
```r
bartlett.test(Length ~ Group, data)
```

#### Hasil
![4b](img/4b.png)

### 4.c

#### Source Code
```r
model1 <- lm(formula = Group ~ Length, data)
model1
```

#### Hasil
![4c](img/4c.png)

### 4.d

#### Penjelasan

### 4.e

#### Penjelasan

### 4.f

#### Source Code
```r
ggplot(data) +
  geom_point(aes(x = Group , y = Length,
                 color = Group), size = 4) +
  
  ggtitle("Scatter Plot with feature differentiation - 1") +
  xlab("Length") +
  ylab("Group") +
  theme_bw() +
  theme(axis.text.x = element_text(face = 'bold.italic', 
                                   color = 'darkgreen',
                                   size = 10, angle = 0),
        axis.text.y = element_text(face = 'bold', 
                                   color = 'blue',
                                   size = 10, angle = 45))
```

#### Hasil
![4f](img/4f.png)

## Soal 5

### 5.a

#### Source Code
```r
GTL <- read_csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
head(GTL)
str(GTL)
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
```

#### Hasil
![5a1](img/5a1.png)
![5a2](img/5a2.png)

### 5.b

#### Source Code
```r
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

#### Hasil
![5b](img/5b.png)

### 5.c

#### Source Code
```r
data_summary <- group_by(GTL, Glass, Temp) %>% summarise(mean=mean(Light), sd=sd(Light)) %>% arrange(desc(mean))
data_summary
```

#### Hasil
![5c](img/5c.png)

### 5.d

#### Source Code
```r
tukey <- TukeyHSD(anova)
tukey
```

#### Hasil
![5d](img/5d.png)

### 5.e

#### Source Code
```r
tukey.cld <- multcompLetters4(anova, tukey)
tukey.cld
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
data_summary
```

#### Hasil
![5e](img/5e.png)
