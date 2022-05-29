#1.a
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
diff <- y-x
sdev <- sd(diff)
sdev

#1.b
n <- 9
t <- mean(diff)/(sdev/sqrt(n))
pval <- pt(t, n-1,lower.tail = TRUE) # left tailed
pval

#2
zsum.test(mean.x=23500, sigma.x=3900, n.x=100, alternative = "less", mu=20000, conf.level=0.95)

#3.b
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, alternative = "less", conf.level = 0.95)

#3.c
z <- (3.64-2.79)/sqrt(1.67*1.67/19+1.32*1.32/27)
z

#3.d
qt(0.05, 2, lower.tail = TRUE)

#4.a
data <- read.delim("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")
set.seed(format(Sys.time(), "%H%M%S"))
dplyr::sample_n(data, 10)
ggboxplot(data, x = "Group", y = "Length",
          color = "Group", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("1", "2", "3"),
          ylab = "Length", xlab = "Grup")

#4.b
bartlett.test(Length ~ Group, data)

#4.c
model1 <- lm(formula = Group ~ Length, data)
model1

#4.f
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

#5.a
GTL <- read_csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
head(GTL)
str(GTL)
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

#5.b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#5.c
data_summary <- group_by(GTL, Glass, Temp) %>% summarise(mean=mean(Light), sd=sd(Light)) %>% arrange(desc(mean))
data_summary

#5.d
tukey <- TukeyHSD(anova)
tukey

#5.e
tukey.cld <- multcompLetters4(anova, tukey)
tukey.cld
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
data_summary

