clc
clear all
% user input of equations as a matrix %
A=input('Enter A Matrix:');
B=input('Enter B Matrix:');
tic
s=size(A);
L=eye(s(1));
U(1,:)=A(1,:);
L(:,1)=A(:,1)/A(1,1);
for i=2:1:s(1)
     for j=1:1:i-1
        L(i,j)=A(i,j)/U(j,j);
        for k=1:1:j-1
            L(i,j)=L(i,j)-L(i,j-k)*U(j-k,i-1)/U(j,j);
        end
    end
    for j=i:1:s(1)
        U(i,j)=A(i,j);
        for k=i-1:-1:1
            U(i,j)=U(i,j)-L(i,k)*U(k,j);
        end
    end
end
% output %
L
U
disp('Y')
Y=(L^(-1))*B
disp('X')
X=(U^(-1))*Y
toc
% [1;12;34]