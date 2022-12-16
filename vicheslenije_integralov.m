clc
clear
clf
syms x y
format long
y=(2*x^2-3)/(2*x-3);
I=0;
dx=1/15;
for i=1:15
    I=I+subs(y,x,dx*i)*dx;
end
disp(I);
I=0;
for i=0:14
    I=I+subs(y,x,dx*i)*dx;
end
    dy=diff(y,x,1);
  M1(1)=max(abs(fminbnd(@(x)((4*x)/(2*x - 3) - (2*(2*x^2 - 3))/(2*x - 3)^2),0,1)))
  R=M1/2*1/15;
  quad('(2.*x.^2-3)./(2.*x-3)',0,1,1e-3);
  disp('значение вычисленное мтодом левых прямоугольников')
  disp(I)
  Y=int(y);
  I=subs(Y,x,1)-subs(Y,x,0);
disp('значение вычисленное матлаб')
disp(I)
disp('погрешность')
disp(R)

   
