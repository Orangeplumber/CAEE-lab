clear all
k=100; % number of iterations
% declaration of variables
time=zeros(k,1);
theta1=zeros(k,1);
theta2=zeros(k,1);
w1=zeros(k,1);
w2=zeros(k,1);
x1=zeros(k,1);
x2=zeros(k,1);
y1=zeros(k,1);
y2=zeros(k,1);
% intial values
theta1(1)=0.9948; % 57 degree
theta2(1)=0.4363; % 25 degree
w1(1)=0; % pendulum released from rest
w2(1)=0;
% constants
g=9.80;
l1=1;
l2=1;
% geometry
x1(1)=l1*sin(theta1(1));
x2(1)=x1(1)+(l2*sin(theta2(1)));
y1(1)=-(l1*cos(theta1(1)));
y2(1)=y1(1)-(l2*cos(theta2(1)));

m1=0.1;
m2=0.1;
h=0.1;
% four single degree diff equation
F1=inline('w1','w1');
F2=inline('w2','w2');
F3=inline('((-g*((2*m1)+m2)*sin(theta1))-(m2*g*sin(theta1-2*theta2))-(2*sin(theta1-theta2)*m2*((w2)^2*l2 + (w1)^2*l1*cos(theta1-theta2))))/(l1*((2*m1)+m2-m2*(cos(2*theta1-2*theta2))))','theta1','theta2','w1','w2','g','m2','m1','l1','l2');
F4=inline('(2*sin(theta1-theta2)*((w1)^2*l1*(m1+m2)+g*(m1+m2)*cos(theta1)+(w2)^2*l2*m2*(cos(theta1-theta2))))/(l2*((2*m1)+m2-m2*cos(2*theta1-2*theta2)))','theta1','theta2','w1','w2','g','m1','m2','l1','l2');
n=99; % number of iterations 
for j=1:1:n
      theta1(j+1)=theta1(j)+(h*F1(w1(j)));
      theta2(j+1)=theta2(j)+(h*F2(w2(j)));
      w1(j+1) = w1(j)+(h*(F3(theta1(j),theta2(j),w1(j),w2(j),g,m1,m2,l1,l2)));
      w2(j+1) = w2(j)+(h*(F4(theta1(j),theta2(j),w1(j),w2(j),g,m1,m2,l1,l2)));
      
      x1(j+1)=l1*sin(theta1(j+1));
      x2(j+1)=x1(j+1)+(l2*sin(theta2(j+1)));
      time(j+1)=time(j)+h;
      y1(j+1)=-(l1*cos(theta1(j+1)));
      y2(j+1)=y1(j+1)-(l2*cos(theta2(j+1)));
end
plot(time,theta1,time,theta2);
plot(time,w1,time,w2);