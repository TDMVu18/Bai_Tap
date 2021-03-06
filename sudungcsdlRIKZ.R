#Sample C1 P1 P2 P3 P4 P5 P6 P7 P8 P9 P10
#P11 P12 P13 P14 P15 P16 P17 P18 P19 P20 P21 P22 P24
#P25 N1 CR1 CR2 CR3 CR4 CR5 CR6 CR7 CR8 CR9 CR10
#CR11 CR12 CR13 CR14 CR15 CR16 CR17 CR18 CR19
#CR20 CR21 CR22 CR23 CR24 CR25 CR26 CR27 CR28
#M1 M2 M3 M4 M5 M6 M7 M8 M9 M10 M11 M12 M14 M15 M16
#M17 I1 I2 I3 I4 I5
#week angle1 angle2 exposure salinity
#temperature NAP penetrability grainsize


#Thiết lập thư mục hiện hành
setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data")
#RIKZ.txt
Benthic <- read.table("RIKZ.txt", header = TRUE)
names(Benthic)
str(Benthic)
#Biến Species (loài) từ cột thứ 2 đến 76 trong biến Benthic
Species <- Benthic[,2:76]
names(Species)
str(Species)
#Kiểm tra dimensions - chiều của biến Species
n <- dim(Species)
n
# 45 dòng - tương ứng với 45 sites - vị trí thu thập mẫu vật
# Tương ứng với mỗi vị trí thì sẽ ghi nhận được những loài
#sinh vật biển nào?
#Có bao nhiêu loài sinh vật biển ở vị trí số 1
sum(Species[1,], na.rm = TRUE)
#Kết quả 143 loài sinh vật biển xuất hiện ở site #1
sum(Species[2,], na.rm = TRUE)
#... Làm 45 lần để kiểm tra số lượng sinh vật biển
#xuất hiện tại các sites
TA <- vector(length = n[1])
for (i in 1:n[1]) {
  TA[i] <- sum(Species[i,], na.rm = TRUE)
}
TA
#Hàm rowSums: tính toán tổng của các cột ở trong hàng
#tham số na.rm=TRUE => Loại bỏ các giá trị rỗng


TA02 <- rowSums(Species, na.rm = TRUE)
TA02
#Đi vào chi tiết tại từng vị trí quan sát
sum(Species[1,]>0, na.rm = TRUE)
#Kết quả chúng ta có 11 loài khác nhau xuất hiện tại vị trí 1
Richness <- vector(length=n[1])
for (i in 1:n[1]) {
  Richness[i] <- sum(Species[i,]>0, na.rm=TRUE)
}
Richness


Richness02 <- rowSums(Species>0, na.rm = TRUE)
Richness02


# Chỉ số đa dạng loài
#https://en.wikipedia.org/wiki/Diversity_index
#Tìm hiểu cách tính chỉ số đa dạng loài
#10h40.
#H - sum biến chạy từ i -> m của biến p: xác xuất * log10 p
RS <- rowSums(Species, na.rm=TRUE)
prop <- Species / RS
H <- -rowSums(prop * log10(prop), na.rm= TRUE)
H
# Kết hợp lại hết những gì đã làm vô 1 hàm của riêng mình
# sau này sử dụng lại để phân tích những dữ liệu tương tự
Index.function <-function(Spec, Choice){
  if (Choice=="Richness") {
    Index <- rowSums(Species>0, na.rm = TRUE)
  }
  if (Choice=="Total Abundance") {
    Index <- rowSums(Species, na.rm = TRUE)
  }
  if (Choice=="Shannon") {
    RS <- rowSums(Species, na.rm=TRUE)
    prop <- Species / RS
    Index <- -rowSums(prop * log10(prop), na.rm= TRUE)
  }
  list(Index=Index, MyChoice= Choice)
}


Index.function(Species,"Shannon")

