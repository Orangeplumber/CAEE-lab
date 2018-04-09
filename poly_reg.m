clear all;
clc
% in=input('Enter input matrix:');
in=csvread('input.csv');
% out=input('Enter output matrix:');
out=csvread('data_for_linear_reg.csv');
degree=input('Enter the degree:');
data_size=size(in);
in_new=ones(data_size(1),degree*data_size(2)+1);
for i=1:data_size(1)
    for j=1:data_size(2)
        in_new(i,j+1)=in(i,j);
    end
end
for i=degree:-1:2
    for k=1:data_size(2)
        for j=1:data_size(1)
            in_new(j,i*data_size(2)+1+k)=power(in(j,i*data_size(2)+k),i);
        end
    end
end

theta=in_new\out;
price=theta(1,1)+theta(2,1)*150;