clear all
clc
A=input('Enter Data:');
b=size(A);
n=1;
while n<=b(2)
    for m=b(1):-1:n+1
        A(m,:)=A(m,:)-(A(m-1,:)*A(m,n)/A(m-1,n));
    end
    n=n+1;
end
X=zeros(b(1),0);
for n=b(1):-1:1
    X(n)=A(n,b(2));
    for i=b(1):-1:n+1
        X(n)=X(n)-A(n,i)*X(i);
    end
    X(n)=X(n)/A(n,n);
end
X
