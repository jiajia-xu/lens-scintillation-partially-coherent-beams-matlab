clear
clc
%改变deltayy
sigma_S=0.5; %the effective beamwidth

%delta_yy=0.045;
delta_xx=0.03;
%delta_yy=delta_xx;
Ax=1;
Ay=1;
Bxy=0.5;
delta_yy=[0.01;
    0.015;
    0.03;
    0.045;
    0.06];
c=[0.2 0.1 0.5
    0.1 0.5 0.8
    0.2 0.7 0.6
    0.8 0.7 0.3
    0.6 1 0.4];
% c=[0 0 1;
%     1 1 0;
%     0 1 0;
%     1 0 0;
%     0 1 1;];
 %c = rand(5,3);
% A = 1:5;
%%
%  for i=1:5
for i=1:5
    %%
    delta_yy(i)=delta_yy(i,:); 
min=((delta_xx^2+delta_yy(i)^2)/2)^0.5;
max=((delta_xx*delta_yy(i))/Bxy)^0.5;
mmax=((delta_xx*delta_yy(1))/Bxy)^0.5+0.0001;
N=300;
delta_xy=linspace(min,max,N);                                                           
Sintillation_focus=zeros(N);
%delta_xy=min:0.0001:max;
%%
Sintillation_in=((Ax.^2).^2+2.*(Ax.*Ay.*Bxy).^2+(Ay.^2).^2)./((Ax.^2+Ay^2).^2);
%%
omiga_xx=((1/(4*sigma_S^2))+(1/(delta_xx^2)))^(-0.5);
omiga_yy=((1/(4*sigma_S^2))+(1/(delta_yy(i)^2)))^(-0.5);
omiga_xy=((1/(4.*sigma_S.^2))+(1./(delta_xy.^2))).^(-0.5);
Sintillation_focus=((Ax.^2.*omiga_xx).^2+2.*(Ax.*Ay.*Bxy.*omiga_xy).^2+(Ay.^2.*omiga_yy).^2)./((Ax.^2.*omiga_xx+Ay^2.*omiga_yy).^2);

%%
plot(delta_xy,Sintillation_focus,'Linewidth',2.5,'color',c(i,:))
hold on
xlabel('\delta_{xy}','Fontsize',20,'Fontname','Times');
ylabel('\sigma^2','Fontsize',20,'Fontname','Times');
%set(gca,'XTick',[min,mmax],'fontname','Times New Roman','FontSize',20);
set(gca,'YTick',[0.5,0.6,0.7,0.8,0.9,1],'fontname','Times New Roman','FontSize',20);
%xlim([min,mmax]),
ylim([0.5,1])
set(gca,'xTickLabel',num2str(get(gca,'XTick')'))
set(gca,'yTickLabel',num2str(get(gca,'YTick')'))
xtickformat('%.3f')
%ylim([0,1]);
%set(gca,'Linewidth',3,'Fontname','Times','Fontsize',17,'Fontweight','Bold','Ytick',[0,0.5,1],'Color','blue',);
title('Scintillation coefficient','fontname','Times New Roman','FontSize',20)

%%
Ox=[min, max];
Oy=[Sintillation_in, Sintillation_in];
%Oz=[1,2];
plot(Ox,Oy,'Linewidth',2.5,'LineStyle','--','color',c(i,:));
hold on
%p1.LineWidth = 1;
end

%%

%%
%hold on
legend('\delta_{xx}/\delta_{yy}=3','','\delta_{xx}/\delta_{yy}=2','','\delta_{xx}/\delta_{yy}=1','','\delta_{xx}/\delta_{yy}=2/3','','\delta_{xx}/\delta_{yy}=1/2','')
