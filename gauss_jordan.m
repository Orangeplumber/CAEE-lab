clear all
clc
A=input('Enter Data:');
% A=[2 1 1;3 2 3;1 4 9];
b=size(A);
n=1;
while n<=b(1)
    for m=b(1):-1:n+1
        A(m,:)=A(m,:)-(A(m-1,:)*A(m,n)/A(m-1,n));
    end
    n=n+1;
end
n=b(1);
while n>1
    for m=1:1:n-1
        A(m,:)=A(m,:)-A(m+1,:)*A(m,n)/A(m+1,n);
    end
    n=n-1;
end
X=zeros(b(1),1);
for i=1:b(1)
    X(i)=A(i,b(2))/A(i,i);
end
X