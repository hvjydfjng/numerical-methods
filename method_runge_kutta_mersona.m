xx=1:.1:1.5;
df=xx;
df(1)=2;
h=0.1;
for i=2:length(xx)
    k0=h*(xx(i-1)^2*df(i-1)^2-6)/xx(i-1)^2
    k1=h*((xx(i-1)+h/3)^2*(df(i-1)+k0/3)^2-6)/(xx(i-1)+h/3)^2
    k2=h*((xx(i-1)+h/3)^2*(df(i-1)+k0/6+k1/6)^2-6)/(xx(i-1)+h/3)^2
    k3=h*((xx(i-1)+h/2)^2*(df(i-1)+k0/8+3*k2/8)^2-6)/(xx(i-1)+h/2)^2
    k4=h*((xx(i-1)+h)^2*(df(i-1)+k0/2-3*k2/2+2*k3)^2-6)/(xx(i-1)+h)^2
    df(i)=df(i-1)+1/6*(k0+4*k3+k4);
end
plot(xx,df)
grid on
hold on
tspan=[1 1.5];
y0=2;
[t,y]=ode45(@(t,y)(t^2*y^2-6)/t^2,tspan,y0);
plot(t,y,'g.')
legend('метод Рунге-Кутта-Мерсона','ode45')
title('Дополнительное исследование')
