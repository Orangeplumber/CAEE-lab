clear all;
clc
A=input('Enter Data:');
err=0.01;
% intial guesses
x1=zeros(2,1);
x2=zeros(2,1);
x3=zeros(2,1);
x1(1)=1;
x2(1)=1;
x3(1)=1;
x1(2)=0;
x2(2)=0;
x3(2)=0;
i=0;
while abs(x1(2)-x1(1))>err || abs(x2(2)-x2(1))>err || abs(x3(2)-x3(1))>err
    x1(1)=x1(2);
    x2(1)=x2(2);
    x3(1)=x3(2);
    x1(2)=(A(1,4)-x2(1)*A(1,2)-x3(1)*A(1,3))/A(1,1);
    x2(2)=(A(2,4)-x1(2)*A(2,1)-x3(1)*A(2,3))/A(2,2);
    x3(2)=(A(3,4)-x1(2)*A(3,1)-x2(2)*A(3,2))/A(3,3);
    i=i+1;
end
