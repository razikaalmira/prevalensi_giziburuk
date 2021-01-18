library(ggplot2)
library(outliers)
# import dataset gizi buruk dengan nama data
data <- read.csv("D:\\Semester 7\\Sains Data dan Pembelajaran Mesin\\Midterm Project\\giziburuk.csv", header=T)
melek_huruf<-read.csv("D:\\Semester 7\\Sains Data dan Pembelajaran Mesin\\Midterm Project\\MelekHuruf.csv", header=T)
air_layak<-read.csv("D:\\Semester 7\\Sains Data dan Pembelajaran Mesin\\Midterm Project\\AirLayak.csv", header=T)
sanitasi<-read.csv("D:\\Semester 7\\Sains Data dan Pembelajaran Mesin\\Midterm Project\\sanitasi.csv", header=T)
kemiskinan<-read.csv("D:\\Semester 7\\Sains Data dan Pembelajaran Mesin\\Midterm Project\\kemiskinan.csv", header=T)
posisi<-read.csv("D:\\Semester 7\\Sains Data dan Pembelajaran Mesin\\Midterm Project\\posisi.csv", header=T)

# menghilangkan baris yang kosong
melek_huruf<-melek_huruf[-c(35),]
air_layak<-air_layak[-c(35:37),]
sanitasi<-sanitasi[-c(35:38),]
kemiskinan<-kemiskinan[-c(35:38),]

# mengambil rata-rata indeks pada data kemiskinan dan memasukkannya ke kolom baru
kemiskinan<-ave(kemiskinan$Indeks.Kemiskinan.Semester.1, kemiskinan$Indeks.Kemiskinan.Semester.2)

# mengganti nama kolom yang terlalu panjang agar memudahkan dalam mengolah data
colnames(data)[2] <- "giziburuk"
colnames(data)[3] <- "asi"
colnames(data)[4] <- "kalori"
colnames(data)[5] <- "imunisasi"
colnames(data)[6] <- "puskesmas"
colnames(data)[7] <- "rs"
colnames(data)[8] <- "dokter"
colnames(data)[12] <- "nakes"
colnames(data)[13] <- "protein"
colnames(data)[14] <- "expense"
colnames(data)[15] <- "unmet"

#menggabungkan keenam data frame
data<-cbind(data, melek_huruf)
data<-cbind(data,air_layak)
data<-cbind(data,sanitasi)
data<-cbind(data,kemiskinan)
data<-cbind(data,posisi)

#menghapus kolom ke 16, 18, 20, dan 23
data<-data[,-c(16, 18, 20, 23)]

#------
#melihat ringkasan data
summary(data)
sd(data)

#-----
# data cleaning: membersihkan missing value dan memeriksa outlier
# cek apakah ada missing value pada data
is.na(data)
# memeriksa jumlah missing value pada data
sum(is.na(data))

# memeriksa outlier: menggunakan persentil 1 dan 99 serta 
# menggunakan Grubb's test
# memeriksa outlier variabel independen menggunakan persentil
lower_bound <- quantile(data$giziburuk, 0.01)
upper_bound <- quantile(data$giziburuk, 0.99)
outlier_ind <- c(which(data$giziburuk< lower_bound | data$giziburuk > upper_bound))
outlier_all <- data[outlier_ind, ]
#memeriksa outlier variabel "Persentase Bayi Usia Kurang Dari 6 Bulan Yang Mendapatkan Asi Ekslusif"
lower_bound <- quantile(data$asi, 0.01)
upper_bound <- quantile(data$asi, 0.99)
outlier_ind <- c(which(data$asi< lower_bound | data$asi > upper_bound))
outlier_asi <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_asi)
#memeriksa outlier variabel 3
lower_bound <- quantile(data$kalori, 0.01)
upper_bound <- quantile(data$kalori, 0.99)
outlier_ind <- c(which(data$kalori< lower_bound | data$kalori > upper_bound))
outlier_kalori <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_kalori)
#memeriksa outlier variabel 4
lower_bound <- quantile(data$imunisasi, 0.01)
upper_bound <- quantile(data$imunisasi, 0.99)
outlier_ind <- c(which(data$imunisasi< lower_bound | data$imunisasi > upper_bound))
outlier_imunisasi <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_imunisasi)
#memeriksa outlier variabel 5
lower_bound <- quantile(data$puskesmas, 0.01)
upper_bound <- quantile(data$puskesmas, 0.99)
outlier_ind <- c(which(data$puskesmas< lower_bound | data$puskesmas > upper_bound))
outlier_puskesmas <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_puskesmas)
#memeriksa outlier variabel 6
lower_bound <- quantile(data$rs, 0.01)
upper_bound <- quantile(data$rs, 0.99)
outlier_ind <- c(which(data$rs< lower_bound | data$rs > upper_bound))
outlier_rs<- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_rs)
#memeriksa outlier variabel 7
lower_bound <- quantile(data$dokter, 0.01)
upper_bound <- quantile(data$dokter, 0.99)
outlier_ind <- c(which(data$dokter< lower_bound | data$dokter > upper_bound))
outlier_dokter <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_dokter)
#memeriksa outlier variabel 8
lower_bound <- quantile(data$Keperawatan, 0.01)
upper_bound <- quantile(data$Keperawatan, 0.99)
outlier_ind <- c(which(data$Keperawatan< lower_bound | data$Keperawatan > upper_bound))
outlier_keperawatan <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_keperawatan)
#memeriksa outlier variabel 9
lower_bound <- quantile(data$Kebidanan, 0.01)
upper_bound <- quantile(data$Kebidanan, 0.99)
outlier_ind <- c(which(data$Kebidanan< lower_bound | data$Kebidanan > upper_bound))
outlier_kebidanan <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_kebidanan)
#memeriksa outlier variabel 10
lower_bound <- quantile(data$Farmasi, 0.01)
upper_bound <- quantile(data$Farmasi, 0.99)
outlier_ind <- c(which(data$Farmasi< lower_bound | data$Farmasi > upper_bound))
outlier_farmasi <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_farmasi)
#memeriksa outlier variabel 11
lower_bound <- quantile(data$nakes, 0.01)
upper_bound <- quantile(data$nakes, 0.99)
outlier_ind <- c(which(data$nakes< lower_bound | data$nakes > upper_bound))
outlier_nakes <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_nakes)
#memeriksa outlier variabel 12
lower_bound <- quantile(data$protein, 0.01)
upper_bound <- quantile(data$protein, 0.99)
outlier_ind <- c(which(data$protein< lower_bound | data$protein > upper_bound))
outlier_protein <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_protein)
#memeriksa outlier variabel 13
lower_bound <- quantile(data$expense, 0.01)
upper_bound <- quantile(data$expense, 0.99)
outlier_ind <- c(which(data$expense< lower_bound | data$expense > upper_bound))
outlier_expense <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_expense)
#memeriksa outlier variabel 14
lower_bound <- quantile(data$unmet, 0.01)
upper_bound <- quantile(data$unmet, 0.99)
outlier_ind <- c(which(data$unmet< lower_bound | data$unmet > upper_bound))
outlier_unmet <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_unmet)
#memeriksa outlier variabel 15
lower_bound <- quantile(data$MelekHuruf, 0.01)
upper_bound <- quantile(data$MelekHuruf, 0.99)
outlier_ind <- c(which(data$MelekHuruf< lower_bound | data$MelekHuruf > upper_bound))
outlier_MelekHuruf <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_MelekHuruf)
#memeriksa outlier variabel 16
lower_bound <- quantile(data$AirLayak, 0.01)
upper_bound <- quantile(data$AirLayak, 0.99)
outlier_ind <- c(which(data$AirLayak< lower_bound | data$AirLayak > upper_bound))
outlier_AirLayak <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_AirLayak)
#memeriksa outlier variabel 17
lower_bound <- quantile(data$Sanitasi, 0.01)
upper_bound <- quantile(data$Sanitasi, 0.99)
outlier_ind <- c(which(data$Sanitasi< lower_bound | data$Sanitasi > upper_bound))
outlier_Sanitasi <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_Sanitasi)
#memeriksa outlier variabel 18
lower_bound <- quantile(data$kemiskinan, 0.01)
upper_bound <- quantile(data$kemiskinan, 0.99)
outlier_ind <- c(which(data$kemiskinan< lower_bound | data$kemiskinan > upper_bound))
outlier_kemiskinan <- data[outlier_ind, ]
outlier_all<-rbind(outlier_all, outlier_kemiskinan)

# uji outlier menggunakan Grubbs test
grubbs_giziburuk = grubbs.test(data$giziburuk, type = 10)
grubbs_asi = grubbs.test(data$asi, type = 10)
grubbs_kalori = grubbs.test(data$kalori, type = 10)
grubbs_imunisasi = grubbs.test(data$imunisasi, type = 10)
grubbs_puskesmas = grubbs.test(data$puskesmas, type = 10)
grubbs_rs = grubbs.test(data$rs, type = 10)
grubbs_dokter = grubbs.test(data$dokter, type = 10)
grubbs_keperawatan = grubbs.test(data$Keperawatan, type = 10)
grubbs_kebidanan = grubbs.test(data$Kebidanan, type = 10)
grubbs_farmasi = grubbs.test(data$Farmasi, type = 10)
grubbs_nakes = grubbs.test(data$nakes, type = 10)
grubbs_protein = grubbs.test(data$protein, type = 10)
grubbs_expense = grubbs.test(data$expense, type = 10)
grubbs_unmet = grubbs.test(data$unmet, type = 10)
grubbs_melekhuruf = grubbs.test(data$MelekHuruf, type = 10)
grubbs_airlayak = grubbs.test(data$AirLayak, type = 10)
grubbs_sanitasi = grubbs.test(data$Sanitasi, type = 10)
grubbs_kemiskinan = grubbs.test(data$kemiskinan, type = 10)
grubbs_imunisasi

# outlier tidak dibuang karena mengandung valuable information
# mengingat jumlah observasi yang sedikit

#----
# exploratory data analysis menggunakan visualisasi
# membuat scatterplot
ggplot(data, aes(x = asi , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = kalori , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = imunisasi , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = puskesmas , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = rs , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = dokter , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = Keperawatan , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = Kebidanan , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = Farmasi , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = nakes , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = protein , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = expense , y = giziburuk)) + geom_point() + stat_smooth()
ggplot(data, aes(x = unmet , y = giziburuk)) + geom_point() + stat_smooth()

dotchart(data$giziburuk,labels=data$Provinsi, xlab="Prevalensi Gizi Buruk")

# urutkan data berdasarkan nilai prevalensi gizi buruk dari yang terbesar
datasort<-data[order(-data$giziburuk),]
datasort<-datasort[-c(11:34),]
ggplot(datasort, aes(x = Provinsi,	y = giziburuk)) + geom_col(colour = 'orange', fill="orange")+
  theme(text = element_text(size=6))
#------
# menguji asumsi statistika dasar: normalitas dan linearitas
# memeriksa apakah semua variabel apakah memenuhi distribusi normal
normal_test<-c(shapiro.test(data$giziburuk))
shapiro.test(data$asi)
shapiro.test(data$kalori)
shapiro.test(data$imunisasi)
shapiro.test(data$puskesmas)
shapiro.test(data$rs)
shapiro.test(data$dokter)
shapiro.test(data$Keperawatan)
shapiro.test(data$Kebidanan)
shapiro.test(data$Farmasi)
shapiro.test(data$nakes)
shapiro.test(data$protein)
shapiro.test(data$expense)
shapiro.test(data$unmet)
shapiro.test(data$MelekHuruf)
shapiro.test(data$AirLayak)
shapiro.test(data$Sanitasi)
shapiro.test(data$kemiskinan)

# melakukan transformasi data pada variabel
# yang datanya tidak normal
library(MASS)
Box = boxcox(data$kalori ~ 1,             
             lambda = seq(-5,5,0.5))
             Cox = data.frame(Box$x, Box$y)         
             Cox2 = Cox[with(Cox, order(-Cox$Box.y)),]
             Cox2[1,]
            lambda = Cox2[1, "Box.x"]
            lambda
            T_box = (data$kalori ^ lambda - 1)/lambda
            T_box
            data$kalori<-T_box
            library(rcompanion)

Box = boxcox(data$puskesmas ~ 1,             
             lambda = seq(-5,5,0.5)      
             Cox = data.frame(Box$x, Box$y)            
             Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
             Cox2[1,]                                  
             lambda = Cox2[1, "Box.x"]
             lambda
             T_box = (data$puskesmas ^ lambda - 1)/lambda
             T_box
            data$puskesmas<-T_box             
Box = boxcox(data$rs ~ 1,             
             lambda = seq(-5,5,0.5)      
             Cox = data.frame(Box$x, Box$y)            
             Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
             Cox2[1,]                                  
             lambda = Cox2[1, "Box.x"]
             lambda
             T_box = (data$rs ^ lambda - 1)/lambda
             T_box
data$rs<-T_box 
Box = boxcox(data$dokter ~ 1,             
             lambda = seq(-5,5,0.5)      
             Cox = data.frame(Box$x, Box$y)            
             Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
             Cox2[1,]                                  
             lambda = Cox2[1, "Box.x"]
             lambda
             T_box = (data$dokter ^ lambda - 1)/lambda
             T_box
             data$dokter<-T_box 
Box = boxcox(data$Keperawatan ~ 1,             
              lambda = seq(-5,5,0.5)      
              Cox = data.frame(Box$x, Box$y)            
              Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
              Cox2[1,]                                  
              lambda = Cox2[1, "Box.x"]
              lambda
              T_box = (data$Keperawatan ^ lambda - 1)/lambda
              T_box
              data$Keperawatan<-T_box
Box = boxcox(data$Kebidanan ~ 1,             
             lambda = seq(-5,5,0.5),      
             Cox = data.frame(Box$x, Box$y),            
             Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
             Cox2[1,]                                  
             lambda = Cox2[1, "Box.x"]
             lambda
             T_box = (data$Kebidanan ^ lambda - 1)/lambda
             T_box
             data$Kebidanan<-T_box
Box = boxcox(data$Farmasi ~ 1,             
             lambda = seq(-5,5,0.5)      
            Cox = data.frame(Box$x, Box$y)            
             Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
             Cox2[1,]                                  
             lambda = Cox2[1, "Box.x"]
             lambda
             T_box = (data$Farmasi ^ lambda - 1)/lambda
             T_box
             data$Farmasi<-T_box
Box = boxcox(data$nakes ~ 1,             
            lambda = seq(-5,5,0.5)      
            Cox = data.frame(Box$x, Box$y)            
            Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
            Cox2[1,]                                  
            lambda = Cox2[1, "Box.x"]
            lambda
            T_box = (data$nakes ^ lambda - 1)/lambda
            T_box
            data$nakes<-T_box
Box = boxcox(data$MelekHuruf ~ 1,             
             lambda = seq(-5,5,0.5)      
             Cox = data.frame(Box$x, Box$y)            
             Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
             Cox2[1,]                                  
            lambda = Cox2[1, "Box.x"]
             lambda
             T_box = (data$MelekHuruf ^ lambda - 1)/lambda
             T_box
             data$MelekHuruf<-T_box   
Box = boxcox(data$kemiskinan ~ 1,             
              lambda = seq(-5,5,0.5)      
              Cox = data.frame(Box$x, Box$y)            
              Cox2 = Cox[with(Cox, order(-Cox$Box.y)),] 
              Cox2[1,]                                  
              lambda = Cox2[1, "Box.x"]
              lambda
              T_box = (data$kemiskinan ^ lambda - 1)/lambda
              T_box
              data$kemiskinan<-T_box

# memeriksa linearitas tiap variabel independen terhadap variabel dependen
purrr::map(
data[,-1:-2],
~lm(giziburuk ~ .x, data = data)
) %>%
# summary tiap output menggunakan broom::glance
purrr::map(broom::glance) %>%
# menggabungkan tiap summary
dplyr::bind_rows(.id = "variable") %>%
# pilih variabel yang diinginkan
dplyr::select(variable, r.squared)

#------
#menguji berbagai model: linear model, distribusi poisson, generalized linear model
#dan melihat mana model yang menunjukkan variabel yang signifikan

#menguji linear model
lm_model<-lm(giziburuk~asi+kalori+imunisasi+puskesmas+rs+dokter+Keperawatan+Kebidanan+Farmasi+nakes+protein+expense+unmet+MelekHuruf+AirLayak+Sanitasi+kemiskinan, data=data)
summary(lm_model)              

# memeriksa apakah variabel dependennya memenuhi distribusi poisson
dispersion_test <- function(x) 
{
res <- 1-2 * abs((1 - pchisq((sum((x - mean(x))^2)/mean(x)), length(x) - 1))-0.5)

cat("Dispersion test of count data:\n",
length(x), " data points.\n",
"Mean: ",mean(x),"\n",
"Variance: ",var(x),"\n",
"Probability of being drawn from Poisson distribution: ", 
round(res, 3),"\n", sep = "")

invisible(res)
}

dispersion_test(data$giziburuk)

# menguji menggunakan generalized regression model
poisson.model <- glm(giziburuk ~ asi+kalori+imunisasi+puskesmas+rs+dokter+Keperawatan+Kebidanan+Farmasi+nakes+protein+expense+unmet+MelekHuruf+air_layak+sanitasi+kemiskinan, data=data, family = poisson(link = "log"))
summary(poisson.model)

library(mlbench)
linear_model<-lm(giziburuk ~ asi+imunisasi+kalori+puskesmas+rs+dokter+Keperawatan+Kebidanan+Farmasi+nakes+protein+expense+unmet+MelekHuruf+AirLayak+Sanitasi+kemiskinan, data=data)
summary(linear_model)
signifikan<-data[,c(1,5,10,14)] # hanya menggunakan variabel yang signifikan

#------
# melakukan Principal Component Analysis untuk menentukan
# daerah yang memiliki urgensi tinggi untuk diberi rekomendasi kebijakan

data_pca<-prcomp(signifikan[,c(2:4)], center = TRUE, scale = TRUE)
data_pca
summary(data_pca)                                  
#ekstrak PCA scores
str(data_pca)
data_pca$x
data2<-cbind(signifikan, data_pca$x[,1:2])
head(data2)
# plotting PCA
biplot(data_pca, scale=0)

#PCA untuk 10 provinsi dengan prevalensi tertinggi
signifikan10<-datasort[,c(1,5,10,14)]
data_pca10<-prcomp(signifikan10[,c(2:4)], center = TRUE, scale = TRUE)
data_pca10
summary(data_pca10)    
biplot(data_pca10, scale=0, cex=1)