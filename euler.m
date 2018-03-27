clear all
x=zeros(7,1);
y=zeros(7,1);
y(1)=1;
x(1)=0;
h=0.5;
F=inline('x*y+1','x','y');
n=7;
for j=1:n
    y(j+1)=y(j)+h*F(x(j),y(j));
    x(j+1)=x(j)+h;
    n=n+1;
end
