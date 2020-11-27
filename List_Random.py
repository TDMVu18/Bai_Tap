
import random
n=random.randrange(50,1000)
list1=[]
#Tạo list nguyên
for i in range(0,n):
    x1=random.randrange(0,1000)
    dau=random.randrange(0,2)
    if dau == 1:
        list1.append(x1)
    else:
        x1=-1*x1
        list1.append(x1)
print(list1)
#Tạo list thực
list2=[]
for i in range(0,n):
    x2=random.random()
    dau=random.randrange(0,2)
    heso=random.randrange(0,1000)
    if dau == 1:
        x2=x2*heso
        list2.append(x2)
    else:
        x2=x2*heso*-1
        list2.append(x2)
print(list2)
        

    
