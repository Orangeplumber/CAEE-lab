clear all
x=zeros(200,1);
y=zeros(200,1);
y(1)=1;
x(1)=0;
h=0.01;
F=inline('-(1+0.5*y^(0.7))/(2+0.6*y^(1.6))','x','y');
k1=0;
k2=0;
n=200;
for j=1:n-1
    k1=F(x(j),y(j));
    k2=F(x(j)+h,y(j)+h*k1);
    y(j+1)=y(j)+(h/2)*(k1+k2);
    x(j+1)=x(j)+h;
    n=n+1;
end