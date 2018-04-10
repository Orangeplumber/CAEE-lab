clear all;
clc
% clearing workspace
Data=input('Enter Data:'); % input data from user(complete input output set of the system) e.g: [2 3; 4 5; 7 8; 16 1]
shape=size(Data); % e.g: (rows,cols)
data_points=shape(1); % rows
x=input('Enter Prediction point:');
degree=input('Enter degree of Polynomial:');
% nearest_data is the data point with minimum diff. in x-values
nearest_data=1; % initial assumption
for i=1:data_points
    if abs(Data(i,1)-x)<abs(Data(nearest_data,1)-x)
        nearest_data=i;
    end
end
% n1---> number of points before nearest_data
% n2---> number of points after nearest_data
n1=0; % initial guess
n2=degree; % n1+n2=degree
diff=abs(Data(data_points,1)-Data(1,1)); % max guess possible
for i=0:degree
    j=abs(degree-i);
    if j+nearest_data<data_points+1 && i<nearest_data % condition for end points
        if (Data(nearest_data+j,1)-Data(nearest_data-i,1))<=diff
            diff=Data(nearest_data+j,1)-Data(nearest_data-i,1);
            n1=i;
            n2=j;
        end
    end
end
X=zeros(1,degree+1); % set of x values which will be used in calculation
Y=zeros(1,degree+1); % set of y values which will be used in calculation 
j=1;
for i=nearest_data-n1:n2+nearest_data
    X(1,j)=Data(i,1);
    Y(1,j)=Data(i,2);
    j=j+1;
end
% X=[1 2 3];
% Y=[1 2 3];
% Langragian method
y_tar=0; % y_target is nothing but the y value corresponding target x value.
lang=ones(1,degree+1); % declaring the langragian array with all values one.
for i=1:degree+1
    for j=1:degree+1
        if i~=j
            lang(1,i)=lang(1,i)*(x-X(1,j))/(X(1,i)-X(1,j));
        end
    end
    y_tar=y_tar+(lang(1,i)*Y(i));
end
disp('The value of y corresponding to target value of x is:');
y_tar

% example<-----
% Enter Data:[2 3; 4 5; 7 8; 16 1]
% Enter Prediction point:2.5
% Enter degree of Polynomial:2
% The value of y corresponding to target value of x is:
% y_tar = 3.5000
% ------>