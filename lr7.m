function var11
% �������
% y''(x)-y'(x)/x=-3/x^2
% y'(0.5) = 2
% y(1) = 0
% 0.5 <= x<= 1
% �������� ������
function dxdy = twoode(x, y)
dxdy = [y(2)
y(2)/x-2/x^2];
end
% ������� �������
function res = twobc(ya, yb)
% ... (1) = �������
% ... (2) = �����������
res = [ya(2)-2
yb(1)];
end
% ��������� ��������� �������
% 10 ������� �������������� ����� � ��������� [0,5; 1}
% ������ ��������� �������� ��� ������ ����� � [y y']
solinit = bvpinit(linspace(0,1,50), [-0.5 1]);
% �������� ������, ������� ������� � ��������� �������
sol = bvp4c( @twoode, @twobc, solinit);
x = linspace(0.5,1);
y1 = deval (sol,x);
figure;
hold on
plot (x,y1(1, :), 'r.-');
xlabel('x');
ylabel('y');
plot(sol.x,sol.y (2, :), 'k.:');
% ����� ��������� �� ������
title('������� {ity} primeprime-(1/x){ity} prime = -2/x^2{it}')
legend('����������','�����������',4);
grid on;
hold off;
end