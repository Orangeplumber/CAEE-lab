clear all;
clc
Data=input('Enter Data:');
shape=size(Data);
data_points=shape(1);
x=input('Enter Prediction point:');
degree=input('Enter degree of Polynomial:');
nearest_data=1;
for i=1:data_points
    if abs(Data(i,1)-x)<abs(Data(nearest_data,1)-x)
        nearest_data=i;
    end
end
n1=0;
n2=degree;
diff=abs(Data(data_points,1)-Data(1,1));
for i=0:degree
    j=abs(degree-i);
    if j+nearest_data<data_points+1 && i<nearest_data
        if (Data(nearest_data+j,1)-Data(nearest_data-i,1))<=diff
            diff=Data(nearest_data+j,1)-Data(nearest_data-i,1);
            n1=i;
            n2=j;
        end
    end
end
X=zeros(1,degree+1);
Y=zeros(1,degree+1);
j=1;
for i=nearest_data-n1:n2+nearest_data
    X(1,j)=Data(i,1);
    Y(1,j)=Data(i,2);
    j=j+1;
end
% X=[1 2 3];
% Y=[1 2 3];
% Langragian method
sum=0;
for i=1:degree+1
    prod=1;
    for j=1:degree+1
        if i~=j
            prod=prod*(x-X(1,j))/(X(1,i)-X(1,j));
        end
    end
    sum=sum+(prod*Y(i));
end