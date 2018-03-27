clear all
A=[1.1 2.2 3.3 1.1;5.5 6.6 7.7 3.3;2.2 3.3 4.4 2];
j=1;
for i=1:3
    for j=i:3
        for k=4:-1:i
            A(j,k)=A(j,k)/A(j,i);
            disp(A(j,i));
            disp(j);
            disp(i);
        end
    end
    for j=i+1:3
        for k=i:4
            A(j,k)=A(j,k)-A(i,k);
        end
    end
end
disp(size(k));
disp(size(j));
x3=A(3,4);
x2=A(2,4)-A(2,3)*x3;
x1=A(1,4)-A(1,3)*x3-A(1,2)*x2;