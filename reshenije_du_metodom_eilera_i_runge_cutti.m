clc
clf
clear
format short
syms x y
f=(x^2*y^2-6)/x^2;
xx=1:.01:1.5;
h=0.01;
df=xx;
df(1)=2;
for i=2:length(xx)
    df(i)=df(i-1)+h*(xx(i-1)^2*df(i-1)^2-6)/xx(i-1)^2
end
plot(xx,df);
grid on
hold on
xx=1:.01:1.5;
df=xx;
df(1)=2;
for i=2:length(xx)
    k1=(xx(i-1)^2*df(i-1)^2-6)/xx(i-1)^2
    k2=((xx(i-1)+h/2)^2*(df(i-1)+h*k1/2)^2-6)/(xx(i-1)+h/2)^2;
    k3=((xx(i-1)+h/2)^2*(df(i-1)+h*k2/2)^2-6)/(xx(i-1)+h/2)^2;
    k4=((xx(i-1)+h)^2*(df(i-1)+h*k3)^2-6)/(xx(i-1)+h)^2;
    df(i)=df(i-1)+h/6*(k1+2*k2+2*k3+k4);
end
plot(xx,df,'r')
tspan=[1 1.5];
y0=2;
[t,y]=ode45(@(t,y)(t^2*y^2-6)/t^2,tspan,y0);
plot(t,y,'g.')
title('решение ДУ')
legend('метод Эйлера','метод Рунге-Кутты 4 порядка','ode45')

