clear all;
clc;
tic
% declarations
time=zeros(100,1);
theta1=zeros(100,1);
theta2=zeros(100,1);
x1=zeros(100,1);
x2=zeros(100,1);
y1=zeros(100,1);
y2=zeros(100,1);
w1=zeros(100,1);
w2=zeros(100,1);
% initial values
theta1(1)=0.9948; % 57 degree
theta2(1)=0.4363; % 25 degree
% constants
l1=1;
l2=1;
g=9.80;
m1=0.1;
m2=0.1;
% by geometry
x1(1)=l1*sin(theta1(1));
x2(1)=x1(1)+(l2*sin(theta2(1)));
y1(1)=-(l1*cos(theta1(1)));
y2(1)=y1(1)-(l2*cos(theta2(1)));
% stepsize
h=0.01;
% four single degree equations
F1=inline('w1','w1');
F2=inline('w2','w2');
F3=inline('((-g*((2*m1)+m2)*sin(theta1))-(m2*g*sin(theta1-2*theta2))-(2*sin(theta1-theta2)*m2*((w2)^2*l2 + (w1)^2*l1*cos(theta1-theta2))))/(l1*((2*m1)+m2-m2*(cos(2*theta1-2*theta2))))','theta1','theta2','w1','w2','g','m2','m1','l1','l2');
F4=inline('(2*sin(theta1-theta2)*((w1)^2*l1*(m1+m2)+g*(m1+m2)*cos(theta1)+(w2)^2*l2*m2*(cos(theta1-theta2))))/(l2*((2*m1)+m2-m2*cos(2*theta1-2*theta2)))','theta1','theta2','w1','w2','g','m1','m2','l1','l2');
%  number of iterations
n=99;
for j=1:1:n
    % k1
    k11=F1(w1(j));
    k12=F2(w2(j));
    k13=F3(theta1(j),theta2(j),w1(j),w2(j),g,m1,m2,l1,l2);
    k14=F4(theta1(j),theta2(j),w1(j),w2(j),g,m1,m2,l1,l2);
    % k2
    k21=F1(w1(j)+(h*k13)/2);
    k22=F2(w2(j)+(h*k14)/2);
    k23=F3(theta1(j)+(h*k11)/2,theta2(j)+(h*k12)/2,w1(j)+(h*k13)/2,w2(j)+(h*k14)/2,g,m1,m2,l1,l2);
    k24=F4(theta1(j)+(h*k11)/2,theta2(j)+(h*k12)/2,w1(j)+(h*k13)/2,w2(j)+(h*k14)/2,g,m1,m2,l1,l2);
    % k3
    k31=F1(w1(j)+(h*k23)/2);
    k32=F2(w2(j)+(h*k24)/2);
    k33=F3(theta1(j)+(h*k21)/2,theta2(j)+(h*k22)/2,w1(j)+(h*k23)/2,w2(j)+(h*k24)/2,g,m1,m2,l1,l2);
    k34=F4(theta1(j)+(h*k21)/2,theta2(j)+(h*k22)/2,w1(j)+(h*k23)/2,w2(j)+(h*k24)/2,g,m1,m2,l1,l2);
    % k4
    k41=F1(w1(j)+(h*k33));
    k42=F2(w2(j)+(h*k34));
    k43=F3(theta1(j)+(h*k31),theta2(j)+(h*k32),w1(j)+(h*k33),w2(j)+(h*k34),g,m1,m2,l1,l2);
    k44=F4(theta1(j)+(h*k31),theta2(j)+(h*k32),w1(j)+(h*k33),w2(j)+(h*k34),g,m1,m2,l1,l2);
    % values
    theta1(j+1)=theta1(j)+(h*(k11+2*k21+2*k31+k41))/6;
    theta2(j+1)=theta2(j)+(h*(k12+2*k22+2*k32+k42))/6;
    w1(j+1) = w1(j)+(h*(k13+2*k23+2*k33+k43))/6;
    w2(j+1) = w2(j)+(h*(k14+2*k24+2*k34+k44))/6;
    
    x1(j+1)=l1*sin(theta1(j+1));
    x2(j+1)=x1(j+1)+(l2*sin(theta2(j+1)));
    time(j+1)=time(j)+h;
    y1(j+1)=-(l1*cos(theta1(j+1)));
    y2(j+1)=y1(j+1)-(l2*cos(theta2(j+1)));
end
% plotting graphs
plot(time,theta1,time,theta2);
plot(time,w1,time,w2);
toc