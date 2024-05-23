c = rand(5,3);
x = 0:pi/50:2*pi;
A = 1:5;
for i=1:5
plot(x,A(i)*sin(x),'color',c(i,:))  % 用数组c的第i行作为颜色数组
hold on

end