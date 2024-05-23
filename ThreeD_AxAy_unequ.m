
clear
clc
%%
Ax=1;
%Ay=Ax*A_ratio;
N=300;
x=linspace(0,0.6,N);                                                           
y=linspace(1,4,N);
Sintillation_in=zeros(N,N);
%%
for B =1:N
    for A=1:N
        Bxy=x(B);
        A_ratio=y(A);
        Sintillation_in(B,A)=((Ax.^2).^2+2.*(Ax.*(Ax.*A_ratio).*Bxy).^2+((Ax.*A_ratio).^2).^2)./((Ax.^2+(Ax.*A_ratio)^2).^2);
    end
end
%%
Sintillation_in=Sintillation_in';
figure();
[Bxy,A_ratio]=meshgrid(x,y);
surf(Bxy,A_ratio,Sintillation_in);
%%
shading interp
axis square
%%
%set(gca,'XTick',[-r1,-r1/2,0,r1/2, r1],'fontname','Times New Roman','FontSize',20);
%set(gca,'YTick',[0,r2/4, r2/2, 3*r2/4, r2],'fontname','Times New Roman','FontSize',20);
%xlim([-r1 r1])
%zlim([0 1])
%ylim([0 r2])
%set(gca,'ylim',[-r2,r2]);%设置x轴坐标范围
% set(gca,'ytick',-r2:pi/4:r2);%设置x轴坐标间隔
% set(gca,'YTickLabel',{'-\pi/2','-\pi/4','0','\pi/4','\pi/2'});%\pi=π
% 
% set(gca,'ZTickLabel',{'0','0.2','0.4','0.6','0.8','1'});
% 
% set(gca,'xTickLabel',num2str(get(gca,'xTick')'))
%set(gca,'yTickLabel',num2str(get(gca,'yTick')'))
%ytickformat('%.2f')
xlabel('|{(\itB_{xy}})|','fontname','Times New Roman','FontSize',20)
ylabel('{  A_{\it y}/A_{\it x}} ','fontname','Times New Roman','FontSize',20)
zlabel('\sigma^2 ','fontname','Times New Roman','FontSize',20)
h=colorbar;
%set(h,'ylim',[0,1],'Ticks',[0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1])
