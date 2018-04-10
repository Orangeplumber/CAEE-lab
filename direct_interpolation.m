clc
clear all
disp('Enter all the values in the form of Column matrix:');
% Enter the Data %
x(:,2)=input('Enter first column of Details:');
x(:,3)=input('Enter second column of Details:');
[x(:,2),x(:,3)]
% point where value is required %
t=input('Enter point where you want to find the value:');
n=input('Enter the Order:');
% finding differece and sortind whole row %
x(:,1)=abs(t-x(:,2));
x=sortrows(x);
for i=1:1:(n+1)
    for j=1:1:(n+1)
        A(i,j)=power(x(i,2),(n+1-j));
    end
end
B=x(1:(n+1),3);
K=inv(A)*B;
V=0;
for i=1:1:(n+1)
    V=V+K(i)*t^(n+1-i);
end
disp('THE CO-EFFICIENTS OF POLYNOMIAL:');
K
disp('THE FINAL ANSWER:');
V
% < Example--------
% Enter all the values in the form of Column matrix:
% Enter first column of Details:[2 4 7 16]
% Enter second column of Details:[3 5 8 1]
% ans =
%      2     3
%      4     5
%      7     8clc
clear all
disp('Enter all the values in the form of Column matrix:');
% Enter the Data %
x(:,2)=input('Enter first column of Details:');
x(:,3)=input('Enter second column of Details:');
[x(:,2),x(:,3)]
% point where value is required %
t=input('Enter point where you want to find the value:');
n=input('Enter the Order:');
% finding differece and sortind whole row %
x(:,1)=abs(t-x(:,2));
x=sortrows(x);
for i=1:1:(n+1)
    for j=1:1:(n+1)
        A(i,j)=power(x(i,2),(n+1-j));
    end
end
B=x(1:(n+1),3);
K=inv(A)*B;
V=0;
for i=1:1:(n+1)
    V=V+K(i)*t^(n+1-i);
end
disp('THE CO-EFFICIENTS OF POLYNOMIAL:');
K
disp('THE FINAL ANSWER:');
V
% < Example--------
% Enter all the values in the form of Column matrix:
% Enter first column of Details:[2 4 7 16]
% Enter second column of Details:[3 5 8 1]
% ans =
%      2     3
%      4     5
%      7     8
%     16     1
% Enter point where you want to find the value:2.5
% Enter the Order:2
% THE CO-EFFICIENTS OF POLYNOMIAL:
% K =
%          0
%     1.0000
%     1.0000
% THE FINAL ANSWER:
% V = 3.5000
% ----->
%     16     1
% Enter point where you want to find the value:2.5
% Enter the Order:2
% THE CO-EFFICIENTS OF POLYNOMIAL:
% K =
%          0
%     1.0000
%     1.0000
% THE FINAL ANSWER:
% V = 3.5000
% ----->