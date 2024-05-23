
clear
clc
%%
Ax=1;
sigma_S=10; %the effective beamwidth
delta_xx=2;
%delta_yy=0.045;
delta_yy=delta_xx;
delta_xy=2.5;
%Ay=Ax*A_ratio;
N=300;
x=linspace(0,0.6,N);                                                           
y=linspace(1,4,N);
Sintillation_in=zeros(N,N);
Sintillation_focus=zeros(N,N);
%%

%%
for B =1:N
    for A=1:N
        Bxy=x(B);
        A_ratio=y(A);
        Sintillation_in=((Ax.^2).^2+2.*(Ax.*(Ax.*A_ratio).*Bxy).^2+((Ax.*A_ratio).^2).^2)./((Ax.^2+(Ax.*A_ratio)^2).^2);
%%
        omiga_xx=((1/(4*sigma_S^2))+(1/(delta_xx^2)))^(-0.5);
omiga_yy=((1/(4*sigma_S^2))+(1/(delta_yy^2)))^(-0.5);
omiga_xy=((1/(4.*sigma_S.^2))+(1./(delta_xy.^2))).^(-0.5);
%Sintillation_focus=((Ax.*omiga_xx).^4+2.*(Ax.^2.*Ay.^2.*Bxy(i).^2.*omiga_xy.^4)+(Ay.*omiga_yy).^4)./((Ax.^2.*omiga_xx.^2+Ay^2.*omiga_yy).^2);
P=( 1 -( 4.*(Ax^2.*(Ax.*A_ratio)^2.*omiga_xx.^2.*omiga_yy.^2  - Ax.^2 .*(Ax.*A_ratio).^2 .*Bxy.^2 .*omiga_xy.^4  )./(Ax^2.*omiga_xx.^2 + (Ax.*A_ratio)^2.*omiga_yy.^2 ) )   ).^0.5;
%Sintillation_focus=(1/2).*(1+P.^2);
Sintillation_focus=((Ax.*omiga_xx).^4+2.*(Ax.^2.*(Ax.*A_ratio).^2.*Bxy.^2.*omiga_xy.^4)+((Ax.*A_ratio).*omiga_yy).^4)./((Ax.^2.*omiga_xx.^2+(Ax.*A_ratio).^2.*omiga_yy.^2).^2);
Sintillation_delta(B,A)=Sintillation_focus-Sintillation_in;
    end
end
%%
Sintillation_delta=Sintillation_delta';
figure();
[Bxy,A_ratio]=meshgrid(x,y);
surf(Bxy,A_ratio,Sintillation_delta);
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
