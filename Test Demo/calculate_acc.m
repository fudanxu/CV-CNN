%*****************************************************************
%Description: classification accuracy and confusion matrix
%             e.g. accuracy1 refers to the accuracy of the 1st class. 
%             m1_2 refers to the probability of misclassifying the 1st class into the 2nd class.
%input: class predict from test_imaging.m; label
%output: accuracy; confusion matrix
%*****************************************************************
function [accuracy, confusion_matrix] = calculate_acc(label,class_img)
c = class_img;
[row,col] = size(c);
num1 = length(find(label(1:row,1:col)==1));
num2 = length(find(label(1:row,1:col)==2));
num3 = length(find(label(1:row,1:col)==3));
num4 = length(find(label(1:row,1:col)==4));
num5 = length(find(label(1:row,1:col)==5));
num6 = length(find(label(1:row,1:col)==6));
num7 = length(find(label(1:row,1:col)==7));
num8 = length(find(label(1:row,1:col)==8));
num9 = length(find(label(1:row,1:col)==9));
num10 = length(find(label(1:row,1:col)==10));
num11 = length(find(label(1:row,1:col)==11));
num12 = length(find(label(1:row,1:col)==12));
num13 = length(find(label(1:row,1:col)==13));
num14 = length(find(label(1:row,1:col)==14));
mask = zeros(row,col);
for i = 1:row
    for j = 1:col       
        if (label(i,j)==1)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp1 = mask.*c;
m1_1 = length(find(temp1==1));  m1_2 = length(find(temp1==2)); m1_3 = length(find(temp1==3));
m1_4 = length(find(temp1==4));  m1_5 = length(find(temp1==5)); m1_6 = length(find(temp1==6));
m1_7 = length(find(temp1==7));  m1_8 = length(find(temp1==8)); m1_9 = length(find(temp1==9));
m1_10 = length(find(temp1==10)); m1_11 = length(find(temp1==11)); m1_12 = length(find(temp1==12));
m1_13 = length(find(temp1==13)); m1_14 = length(find(temp1==14)); m1= [m1_1/num1, m1_2/num1,m1_3/num1,m1_4/num1, m1_5/num1,m1_6/num1,m1_7/num1,m1_8/num1 , m1_9/num1,m1_10/num1,m1_11/num1 ,m1_12/num1,m1_13/num1,m1_14/num1];
accuracy1 = m1_1/num1;

for i = 1:row
    for j = 1:col          
        if (label(i,j)==2)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp2 = mask.*c;
m2_1 = length(find(temp2==1));  m2_2 = length(find(temp2==2)); m2_3 = length(find(temp2==3));
m2_4 = length(find(temp2==4));  m2_5 = length(find(temp2==5)); m2_6 = length(find(temp2==6));
m2_7 = length(find(temp2==7));  m2_8 = length(find(temp2==8)); m2_9 = length(find(temp2==9));
m2_10 = length(find(temp2==10)); m2_11 = length(find(temp2==11)); m2_12 = length(find(temp2==12));
m2_13 = length(find(temp2==13)); m2_14 = length(find(temp2==14));
m2= [m2_1/num2, m2_2/num2,m2_3/num2,m2_4/num2, m2_5/num2,m2_6/num2,m2_7/num2,m2_8/num2 , m2_9/num2,m2_10/num2,m2_11/num2 ,m2_12/num2,m2_13/num2,m2_14/num2];
accuracy2 = m2_2/num2;

for i = 1:row
    for j = 1:col         
        if (label(i,j)==3)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp3 = mask.*c;
m3_1 = length(find(temp3==1));  m3_2 = length(find(temp3==2)); m3_3 = length(find(temp3==3));
m3_4 = length(find(temp3==4));  m3_5 = length(find(temp3==5)); m3_6 = length(find(temp3==6));
m3_7 = length(find(temp3==7));  m3_8 = length(find(temp3==8)); m3_9 = length(find(temp3==9));
m3_10 = length(find(temp3==10)); m3_11 = length(find(temp3==11)); m3_12 = length(find(temp3==12));
m3_13 = length(find(temp3==13)); m3_14 = length(find(temp3==14));
m3= [m3_1/num3, m3_2/num3,m3_3/num3,m3_4/num3, m3_5/num3,m3_6/num3,m3_7/num3,m3_8/num3 , m3_9/num3,m3_10/num3,m3_11/num3 ,m3_12/num3,m3_13/num3,m3_14/num3];
accuracy3 = m3_3/num3;

for i = 1:row
    for j = 1:col          
        if (label(i,j)==4)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp4 = mask.*c;
m4_1 = length(find(temp4==1));  m4_2 = length(find(temp4==2)); m4_3 = length(find(temp4==3));
m4_4 = length(find(temp4==4));  m4_5 = length(find(temp4==5)); m4_6 = length(find(temp4==6));
m4_7 = length(find(temp4==7));  m4_8 = length(find(temp4==8)); m4_9 = length(find(temp4==9));
m4_10 = length(find(temp4==10)); m4_11 = length(find(temp4==11)); m4_12 = length(find(temp4==12));
m4_13 = length(find(temp4==13)); m4_14 = length(find(temp4==14)); 
m4= [m4_1/num4, m4_2/num4,m4_3/num4,m4_4/num4, m4_5/num4,m4_6/num4,m4_7/num4,m4_8/num4 , m4_9/num4,m4_10/num4,m4_11/num4 ,m4_12/num4,m4_13/num4,m4_14/num4];
accuracy4 = m4_4/num4;

for i = 1:row
    for j = 1:col          
        if (label(i,j)==5)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp5 = mask.*c;
m5_1 = length(find(temp5==1));  m5_2 = length(find(temp5==2)); m5_3 = length(find(temp5==3));
m5_4 = length(find(temp5==4));  m5_5 = length(find(temp5==5)); m5_6 = length(find(temp5==6));
m5_7 = length(find(temp5==7));  m5_8 = length(find(temp5==8)); m5_9 = length(find(temp5==9));
m5_10 = length(find(temp5==10)); m5_11 = length(find(temp5==11)); m5_12 = length(find(temp5==12));
m5_13 = length(find(temp5==13)); m5_14 = length(find(temp5==14));
m5= [m5_1/num5, m5_2/num5,m5_3/num5,m5_4/num5, m5_5/num5,m5_6/num5,m5_7/num5,m5_8/num5 , m5_9/num5,m5_10/num5,m5_11/num5 ,m5_12/num5,m5_13/num5,m5_14/num5];
accuracy5 = m5_5/num5;

for i = 1:row
    for j = 1:col         
        if (label(i,j)==6)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp6 = mask.*c;
m6_1 = length(find(temp6==1));  m6_2 = length(find(temp6==2)); m6_3 = length(find(temp6==3));
m6_4 = length(find(temp6==4));  m6_5 = length(find(temp6==5)); m6_6 = length(find(temp6==6));
m6_7 = length(find(temp6==7));  m6_8 = length(find(temp6==8)); m6_9 = length(find(temp6==9));
m6_10 = length(find(temp6==10)); m6_11 = length(find(temp6==11)); m6_12 = length(find(temp6==12));
m6_13 = length(find(temp6==13)); m6_14 = length(find(temp6==14));
m6= [m6_1/num6, m6_2/num6,m6_3/num6,m6_4/num6, m6_5/num6,m6_6/num6,m6_7/num6,m6_8/num6 , m6_9/num6,m6_10/num6,m6_11/num6 ,m6_12/num6,m6_13/num6,m6_14/num6];
accuracy6 = m6_6/num6;

for i = 1:row
    for j = 1:col          
        if (label(i,j)==7)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp7 = mask.*c;
m7_1 = length(find(temp7==1));  m7_2 = length(find(temp7==2)); m7_3 = length(find(temp7==3));
m7_4 = length(find(temp7==4));  m7_5 = length(find(temp7==5)); m7_6 = length(find(temp7==6));
m7_7 = length(find(temp7==7));  m7_8 = length(find(temp7==8)); m7_9 = length(find(temp7==9));
m7_10 = length(find(temp7==10)); m7_11 = length(find(temp7==11)); m7_12 = length(find(temp7==12));
m7_13 = length(find(temp7==13)); m7_14 = length(find(temp7==14)); 
m7= [m7_1/num7, m7_2/num7,m7_3/num7,m7_4/num7, m7_5/num7,m7_6/num7,m7_7/num7,m7_8/num7 , m7_9/num7,m7_10/num7,m7_11/num7 ,m7_12/num7,m7_13/num7,m7_14/num7];
accuracy7 = m7_7/num7;

for i = 1:row
    for j = 1:col          
        if (label(i,j)==8)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp8 = mask.*c;
m8_1 = length(find(temp8==1));  m8_2 = length(find(temp8==2)); m8_3 = length(find(temp8==3));
m8_4 = length(find(temp8==4));  m8_5 = length(find(temp8==5)); m8_6 = length(find(temp8==6));
m8_7 = length(find(temp8==7));  m8_8 = length(find(temp8==8)); m8_9 = length(find(temp8==9));
m8_10 = length(find(temp8==10)); m8_11 = length(find(temp8==11)); m8_12 = length(find(temp8==12));
m8_13 = length(find(temp8==13)); m8_14 = length(find(temp8==14));
m8= [m8_1/num8, m8_2/num8,m8_3/num8,m8_4/num8, m8_5/num8,m8_6/num8,m8_7/num8,m8_8/num8 , m8_9/num8,m8_10/num8,m8_11/num8 ,m8_12/num8,m8_13/num8,m8_14/num8 ];
accuracy8 = m8_8/num8;

for i = 1:row
    for j = 1:col          
        if (label(i,j)==9)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp9 = mask.*c;
m9_1 = length(find(temp9==1));  m9_2 = length(find(temp9==2)); m9_3 = length(find(temp9==3));
m9_4 = length(find(temp9==4));  m9_5 = length(find(temp9==5)); m9_6 = length(find(temp9==6));
m9_7 = length(find(temp9==7));  m9_8 = length(find(temp9==8)); m9_9 = length(find(temp9==9));
m9_10 = length(find(temp9==10)); m9_11 = length(find(temp9==11)); m9_12 = length(find(temp9==12));
m9_13 = length(find(temp9==13)); m9_14 = length(find(temp9==14)); 
m9= [m9_1/num9, m9_2/num9,m9_3/num9,m9_4/num9, m9_5/num9,m9_6/num9,m9_7/num9,m9_8/num9 , m9_9/num9,m9_10/num9,m9_11/num9 ,m9_12/num9,m9_13/num9,m9_14/num9 ];
accuracy9 = m9_9/num9;

for i = 1:row
    for j = 1:col       
        if (label(i,j)==10)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp10 = mask.*c;
m10_1 = length(find(temp10==1));  m10_2 = length(find(temp10==2)); m10_3 = length(find(temp10==3));
m10_4 = length(find(temp10==4));  m10_5 = length(find(temp10==5)); m10_6 = length(find(temp10==6));
m10_7 = length(find(temp10==7));  m10_8 = length(find(temp10==8)); m10_9 = length(find(temp10==9));
m10_10 = length(find(temp10==10)); m10_11 = length(find(temp10==11)); m10_12 = length(find(temp10==12));
m10_13 = length(find(temp10==13)); m10_14 = length(find(temp10==14)); 
m10= [m10_1/num10, m10_2/num10,m10_3/num10,m10_4/num10, m10_5/num10,m10_6/num10,m10_7/num10,m10_8/num10 , m10_9/num10,m10_10/num10,m10_11/num10 ,m10_12/num10,m10_13/num10,m10_14/num10];
accuracy10 = m10_10/num10;

for i = 1:row
    for j = 1:col      
        if (label(i,j)==11)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp11 = mask.*c;
m11_1 = length(find(temp11==1));  m11_2 = length(find(temp11==2)); m11_3 = length(find(temp11==3));
m11_4 = length(find(temp11==4));  m11_5 = length(find(temp11==5)); m11_6 = length(find(temp11==6));
m11_7 = length(find(temp11==7));  m11_8 = length(find(temp11==8)); m11_9 = length(find(temp11==9));
m11_10 = length(find(temp11==10)); m11_11 = length(find(temp11==11)); m11_12 = length(find(temp11==12));
m11_13 = length(find(temp11==13)); m11_14 = length(find(temp11==14));
m11= [m11_1/num11, m11_2/num11,m11_3/num11,m11_4/num11, m11_5/num11,m11_6/num11,m11_7/num11,m11_8/num11 , m11_9/num11,m11_10/num11,m11_11/num11 ,m11_12/num11,m11_13/num11,m11_14/num11];
accuracy11 = m11_11/num11;

for i = 1:row
    for j = 1:col       
        if (label(i,j)==12)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp12 = mask.*c;
m12_1 = length(find(temp12==1));  m12_2 = length(find(temp12==2)); m12_3 = length(find(temp12==3));
m12_4 = length(find(temp12==4));  m12_5 = length(find(temp12==5)); m12_6 = length(find(temp12==6));
m12_7 = length(find(temp12==7));  m12_8 = length(find(temp12==8)); m12_9 = length(find(temp12==9));
m12_10 = length(find(temp12==10)); m12_11 = length(find(temp12==11)); m12_12 = length(find(temp12==12));
m12_13 = length(find(temp12==13)); m12_14 = length(find(temp12==14));
m12= [m12_1/num12, m12_2/num12,m12_3/num12,m12_4/num12, m12_5/num12,m12_6/num12,m12_7/num12,m12_8/num12 , m12_9/num12,m12_10/num12,m12_11/num12 ,m12_12/num12,m12_13/num12,m12_14/num12 ];
accuracy12 = m12_12/num12;

for i = 1:row
    for j = 1:col        
        if (label(i,j)==13)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp13 = mask.*c;
m13_1 = length(find(temp13==1));  m13_2 = length(find(temp13==2)); m13_3 = length(find(temp13==3));
m13_4 = length(find(temp13==4));  m13_5 = length(find(temp13==5)); m13_6 = length(find(temp13==6));
m13_7 = length(find(temp13==7));  m13_8 = length(find(temp13==8)); m13_9 = length(find(temp13==9));
m13_10 = length(find(temp13==10)); m13_11 = length(find(temp13==11)); m13_12 = length(find(temp13==12));
m13_13 = length(find(temp13==13)); m13_14 = length(find(temp13==14));
m13= [m13_1/num13, m13_2/num13,m13_3/num13,m13_4/num13, m13_5/num13,m13_6/num13,m13_7/num13,m13_8/num13 , m13_9/num13,m13_10/num13,m13_11/num13 ,m13_12/num13,m13_13/num13,m13_14/num13];
accuracy13 = m13_13/num13;

for i = 1:row
    for j = 1:col     
        if (label(i,j)==14)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end
temp14 = mask.*c;
m14_1 = length(find(temp14==1));  m14_2 = length(find(temp14==2)); m14_3 = length(find(temp14==3));
m14_4 = length(find(temp14==4));  m14_5 = length(find(temp14==5)); m14_6 = length(find(temp14==6));
m14_7 = length(find(temp14==7));  m14_8 = length(find(temp14==8)); m14_9 = length(find(temp14==9));
m14_10 = length(find(temp14==10)); m14_11 = length(find(temp14==11)); m14_12 = length(find(temp14==12));
m14_13 = length(find(temp14==13)); m14_14 = length(find(temp14==14)); 
m14= [m14_1/num14, m14_2/num14,m14_3/num14,m14_4/num14, m14_5/num14,m14_6/num14,m14_7/num14,m14_8/num14 , m14_9/num14,m14_10/num14,m14_11/num14 ,m14_12/num14,m14_13/num14,m14_14/num14];
accuracy14 = m14_14/num14;


m = m1_1+m2_2+m3_3+m4_4+m5_5+m6_6+m7_7+m8_8+m9_9+m10_10+m11_11+m12_12+m13_13+m14_14;
num = num1+num2+num3+num4+num5+num6+num7+num8+num9+num10+num11+num12+num13+num14;
accuracy = m/num;
confusion_matrix = [m1_1/num1,m1_2/num1,m1_3/num1,m1_4/num1,m1_5/num1,m1_6/num1,m1_7/num1,m1_8/num1,m1_9/num1,m1_10/num1,m1_11/num1,m1_12/num1,m1_3/num1,m1_14/num1;
                    m2_1/num2,m2_2/num2,m2_3/num2,m2_4/num2,m2_5/num2,m2_6/num2,m2_7/num2,m2_8/num2,m2_9/num2,m2_10/num2,m2_11/num2,m2_12/num2,m2_3/num2,m2_14/num2;
                    m3_1/num3,m3_2/num3,m3_3/num3,m3_4/num3,m3_5/num3,m3_6/num3,m3_7/num3,m3_8/num3,m3_9/num3,m3_10/num3,m3_11/num3,m3_12/num3,m3_3/num3,m3_14/num3;
                    m4_1/num4,m4_2/num1,m4_3/num4,m4_4/num4,m4_5/num4,m4_6/num4,m4_7/num4,m4_8/num4,m4_9/num4,m4_10/num4,m4_11/num4,m4_12/num4,m4_3/num4,m4_14/num4;
                    m5_1/num5,m5_2/num5,m5_3/num5,m5_4/num5,m5_5/num5,m5_6/num5,m5_7/num5,m5_8/num5,m5_9/num5,m5_10/num5,m5_11/num5,m5_12/num5,m5_3/num5,m5_14/num5;
                    m6_1/num6,m6_2/num6,m6_3/num6,m6_4/num6,m6_5/num6,m6_6/num6,m6_7/num6,m6_8/num6,m6_9/num6,m6_10/num6,m6_11/num6,m6_12/num6,m6_3/num6,m6_14/num6;
                    m7_1/num7,m7_2/num7,m7_3/num7,m7_4/num7,m7_5/num7,m7_6/num7,m7_7/num7,m7_8/num7,m7_9/num7,m7_10/num7,m7_11/num7,m7_12/num7,m7_3/num7,m7_14/num7;
                    m8_1/num8,m8_2/num8,m8_3/num8,m8_4/num8,m8_5/num8,m8_6/num8,m8_7/num8,m8_8/num8,m8_9/num8,m8_10/num8,m8_11/num8,m8_12/num8,m8_3/num8,m8_14/num8;
                    m9_1/num9,m9_2/num9,m9_3/num9,m9_4/num9,m9_5/num9,m9_6/num9,m9_7/num9,m9_8/num9,m9_9/num9,m9_10/num9,m9_11/num9,m9_12/num9,m9_3/num9,m9_14/num9;
                    m10_1/num10,m10_2/num10,m10_3/num10,m10_4/num10,m10_5/num10,m10_6/num10,m10_7/num10,m10_8/num10,m10_9/num10,m10_10/num10,m10_11/num10,m10_12/num10,m10_3/num10,m10_14/num10;
                    m11_1/num11,m11_2/num11,m11_3/num11,m11_4/num11,m11_5/num11,m11_6/num11,m11_7/num11,m11_8/num11,m11_9/num11,m11_10/num11,m11_11/num11,m11_12/num11,m11_3/num11,m11_14/num11;
                    m12_1/num12,m12_2/num12,m12_3/num12,m12_4/num12,m12_5/num12,m12_6/num12,m12_7/num12,m12_8/num12,m12_9/num12,m12_10/num12,m12_11/num12,m12_12/num12,m12_3/num12,m12_14/num12;
                    m13_1/num13,m13_2/num13,m13_3/num13,m13_4/num13,m13_5/num13,m13_6/num13,m13_7/num13,m13_8/num13,m13_9/num13,m13_10/num13,m13_11/num13,m13_12/num13,m13_13/num13,m13_14/num13;
                    m14_1/num14,m14_2/num14,m14_3/num14,m14_4/num14,m14_5/num14,m14_6/num14,m14_7/num14,m14_8/num14,m14_9/num14,m14_10/num14,m14_11/num14,m14_12/num14,m14_3/num14,m14_14/num14;
                   ];
