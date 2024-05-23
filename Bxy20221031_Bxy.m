clear
clc
%20221031改变Bxy 2
sigma_S=0.5; %the effective beamwidth
delta_xx=0.03;
%delta_yy=0.045;
delta_yy=delta_xx;
delta_xy=0.033;
Ax=1;
Ay=1;
%Bxy=0.5;
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
%for i=1:5
    %%
 % Bxy(i)=Bxy(i,:); 
min=0.0001;
max=2/((delta_xx/delta_yy)+(delta_yy/delta_xx));
N=300;
Bxy=linspace(min,max,N);                                                           
Sintillation_focus=zeros(N);
%delta_xy=min:0.0001:max;
%%
Sintillation_in=((Ax.^2).^2+2.*(Ax.*Ay.*Bxy).^2+(Ay.^2).^2)./((Ax.^2+Ay^2).^2);
%%
omiga_xx=((1/(4*sigma_S^2))+(1/(delta_xx^2)))^(-0.5);
omiga_yy=((1/(4*sigma_S^2))+(1/(delta_yy^2)))^(-0.5);
omiga_xy=((1/(4.*sigma_S.^2))+(1./(delta_xy.^2))).^(-0.5);
Sintillation_focus=((Ax.*omiga_xx).^4+2.*(Ax.^2.*Ay.^2.*Bxy.^2.*omiga_xy.^4)+(Ay.*omiga_yy).^4)./((Ax.^2.*omiga_xx.^2+Ay^2.*omiga_yy).^2);

%%
plot(Bxy,Sintillation_focus,'Linewidth',2.5)
%plot(delta_xy,Sintillation_focus,'Linewidth',2.5,'color',c(i,:))
hold on
xlabel('|B_{xy}|','Fontsize',20,'Fontname','Times');
ylabel('\sigma^2','Fontsize',20,'Fontname','Times');
set(gca,'XTick',[min,max],'fontname','Times New Roman','FontSize',20);
set(gca,'YTick',[0.5,0.6,0.7,0.8,0.9,1],'fontname','Times New Roman','FontSize',20);
xlim([min,max]),
%ylim([0.5,1])
set(gca,'xTickLabel',num2str(get(gca,'XTick')'))
set(gca,'yTickLabel',num2str(get(gca,'YTick')'))
xtickformat('%.3f')
%ylim([0,1]);
%set(gca,'Linewidth',3,'Fontname','Times','Fontsize',17,'Fontweight','Bold','Ytick',[0,0.5,1],'Color','blue',);
title('Scintillation coefficient','fontname','Times New Roman','FontSize',20)

%%
%Ox=[min, max];
%Oy=[Sintillation_in, Sintillation_in];
%Oz=[1,2];
%plot(Ox,Oy,'Linewidth',2.5,'LineStyle','--');
%hold on
%p1.LineWidth = 1;
%end

%%

%%
%hold on
%legend('|B_{xy}|=0.4','','|B_{xy}|=0.5','','|B_{xy}|=0.6','','|B_{xy}|=0.7','','|B_{xy}|=0.8','')
