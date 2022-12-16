clc
clf
clear
syms x y
y=sin(x)*exp(x)
dy=diff(y,x,1);
d2y=diff(y,x,2)
d3y=diff(y,x,3)
x=0:.1:1;
m2=abs(2.*exp(x).*cos(x));
M2=max(m2);
h1=2*sqrt(0.1/M2);
h1=0.2;
m3=abs(2.*exp(x).*cos(x)-2.*exp(x).*sin(x))
M3=max(m3)
h2=(3*0.1/M3)^(1/3);
h2=0.5;

x=0:0.2:1
y=sin(x).*exp(x)
dy1=y;
for i=2:(length(x)-1)
dy1(i)=(y(i+1)-y(i-1))/(2*h1);
end
dy1(1)=1/(2*h1)*(-3*y(1)+4*y(2)-y(3));
dy1(length(x))=(3*y(length(x))-4*y(length(x)-1)+y(length(x)-2))/(2*h1);
ezplot(dy,[0,1])
hold on
plot(x,dy1,'r')
grid on
title('первая производная')

x=-.5:0.5:1.5;
y=sin(x).*exp(x);
d2y2=0:.5:1;
for i=2:(length(x)-1)
   d2y2(i-1)=(y(i+1)-2*y(i)+y(i-1))/h2^2
end
figure(2)
ezplot(d2y,[0 1]);
hold on
x=0:.5:1;
plot(x,d2y2,'r');
grid on
title('вторая производная')
syms x
y1=(d2y2(2)-d2y2(1))/0.5*x+d2y2(1);
y2=(d2y2(3)-d2y2(2))/0.5*x+d2y2(2);
y2=y2-subs(y2,x,0.5)+2.826;
grid on
xx=0:.01:0.5;
xxx=0.51:.01:1;
fy21=xx;
fy22=xxx;
xxxx=0:.01:1;
d2y_podst=xxxx;
R1=xx;
R2=xxx;

for i=1:length(xx)
    fy21(i)=subs(y1,x,xx(i));
    if i<=length(xxx)
    fy22(i)=subs(y2,x,xxx(i));
    end
end
for i=1:length(xxxx)
d2y_podst(i)=subs(d2y,x,xxxx(i));    
end
disp('fy21')
disp(fy21)
disp('fy22')
disp(fy22)
disp('d2y_podst')
disp(d2y_podst)
for i=1:length(xx)
R1(i)=abs(abs(fy21(i)-d2y_podst(i))/d2y_podst(i));
end
for i=1:length(xxx)
R2(i)=abs(abs(fy22(i)-d2y_podst(i+length(xxx)))/d2y_podst(i+length(xxx)));
end
R1M=max(R1)
R2M=max(R2)
R=max(R1M,R2M)
