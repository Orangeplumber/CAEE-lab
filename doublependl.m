time=zeros(7,1);
theta1=zeros(7,1);
theta2=zeros(7,1);
w1=zeros(7,1);
w2=zeros(7,1);
theta1(1)=1;
theta2(1)=0;
g=9.80;
l1=1;
l2=1;
m1=1;
m2=1;
h=0.5;
F1=inline('w1','w1');

F2=inline('w2','w2');
F3=inline('((-g*((2*m1)+m2)*sin(theta1))-(m2*g*sin(theta1-2*theta2))-(2*sin(theta1-theta2)*m2*((w2)^2*l2 + (w1)^2*l1*cos(theta1-theta2))))/(l1*((2*m1)+m2-m2*(cos(2*theta1-2*theta2))))','theta1','theta2','w1','w2','g','m2','m1','l1','l2');
F4=inline('(2*sin(theta1-theta2)*((w1)^2*l1*(m1+m2)+g*(m1+m2)*cos(theta1)+(w2)^2*l2*m2*(cos(theta1-theta2))))/(l2*((2*m1)+m2-m2*cos(2*theta1-2*theta2)))','theta1','theta2','w1','w2','g','m1','m2','l1','l2');
n=7;
for j=1:1:n
    k11=F1(w1(j));
    k21=F1(w1(j)+(h*k11));
   
    k12 = F2(w2(j));
    k22 = F2(w2(j)+(h*k12));
   
    k13 = F3(theta1(j),theta2(j),w1(j),w2(j),m1,m2,l1,l2,g);
    k23 = F3(theta1(j)+h*k13,theta2(j)+h*k13,w1(j)+h*k13,w2(j)+h*k13,m1,m2,l1,l2,g);
    
    k14 = F4(theta1(j),theta2(j),w1(j),w2(j),m1,m2,l1,l2,g);
    k24 = F4(theta1(j)+h*k13,theta2(j)+h*k13,w1(j)+h*k13,w2(j)+h*k13,m1,m2,l1,l2,g);
    
    w1(j+1) = w1(j) + (h*(k13+k23)/2);
    w2(j+1) = w2(j) + (h*(k14+k24)/2);
    theta1(j+1) = theta1(j) + (h*(k11+k12)/2);
    theta2(j+1) = theta2(j) +(h*(k12+k22)/2);
end
