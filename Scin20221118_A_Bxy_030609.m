clear
clc
%改变Bxy=0.3 0.6 0.9 for a partially polarized source
%Ax not = Ay
sigma_S=10; %the effective beamwidth
delta_xx=1;
%delta_yy=0.045;
delta_yy=delta_xx/1.2;
Ax=1;
Ay=Ax/2;
Bmax=2/(delta_xx/delta_yy+delta_yy/delta_xx);
Bxy=[0.3;
    0.5;
    0.8];
c=[0.2 0.1 0.5
    0.1 0.5 0.8
    0.6 1 0.4];
    %0.2 0.7 0.6
   % 0.8 0.7 0.3
%%
for i=1:3
  Bxy(i)=Bxy(i,:); 
min=((delta_xx^2+delta_yy^2)/2)^0.5;
max=((delta_xx*delta_yy)/Bxy(i))^0.5;
mmax=((delta_xx*delta_yy)/Bxy(1))^0.5+0.001;
N=300;

delta_xy=linspace(min,max,N);                                                           
Sintillation_focus=zeros(N);
Sintillation_focus_i=zeros(N);
Sintillation_in = zeros(N);
%delta_xy=min:0.0001:max;
%%
Sintillation_in=((Ax.^2).^2+2.*(Ax.*Ay.*Bxy(i)).^2+(Ay.^2).^2)./((Ax.^2+Ay^2).^2);
%%
omiga_xx=((1/(4*sigma_S^2))+(1/(delta_xx^2)))^(-0.5);
omiga_yy=((1/(4*sigma_S^2))+(1/(delta_yy^2)))^(-0.5);
omiga_xy=((1/(4.*sigma_S.^2))+(1./(delta_xy.^2))).^(-0.5);
%Sintillation_focus=((Ax.*omiga_xx).^4+2.*(Ax.^2.*Ay.^2.*Bxy(i).^2.*omiga_xy.^4)+(Ay.*omiga_yy).^4)./((Ax.^2.*omiga_xx.^2+Ay^2.*omiga_yy).^2);
P=( 1 -( 4.*(Ax^2.*Ay^2.*omiga_xx.^2.*omiga_yy.^2  - Ax.^2 .*Ay.^2 .*Bxy(i).^2 .*omiga_xy.^4  )./(Ax^2.*omiga_xx.^2 + Ay^2.*omiga_yy.^2 ) )   ).^0.5;
%Sintillation_focus=(1/2).*(1+P.^2);
Sintillation_focus=((Ax.*omiga_xx).^4+2.*(Ax.^2.*Ay.^2.*Bxy(i).^2.*omiga_xy.^4)+(Ay.*omiga_yy).^4)./((Ax.^2.*omiga_xx.^2+Ay.^2.*omiga_yy.^2).^2);
%%
plot(delta_xy,Sintillation_focus,'Linewidth',2.5,'color',c(i,:))
hold on

%%
 Ox=[min, max];
 Oy=[Sintillation_in, Sintillation_in];
 plot(Ox,Oy,'Linewidth',2.5,'LineStyle','--','color',c(i,:));

%Oz=[1,2];
%hold on
%p1.LineWidth = 1;
end
%%
ax = gca();
ax.YRuler.Exponent = 0; 
ax.YRuler.TickLabelFormat = '%.2f';

ax = gca();
ax.XRuler.Exponent = 0; 
ax.XRuler.TickLabelFormat = '%.2f';
%%

xlabel('\delta_{xy}','Fontsize',26,'Fontname','Times');
ylabel('\sigma^2','Fontsize',26,'Fontname','Times');
set(gca,'fontname','Times New Roman','FontSize',22);
set(gca,'fontname','Times New Roman','FontSize',22);
%%
%set(gca,'XTick',[min,0.033,0.036,0.039,0.042,0.045,mmax],'fontname','Times New Roman','FontSize',20);
%set(gca,'YTick',[0.50,0.60,0.70,0.80,0.90,1.00],'fontname','Times New Roman','FontSize',20);
xlim([min,mmax]),
%ylim([0.5,1])

%set(gca,'xTickLabel',num2str(get(gca,'XTick')'))
%set(gca,'yTickLabel',num2str(get(gca,'YTick')'))
%xtickformat('%.4f')

%ylim([0,1]);
%set(gca,'Linewidth',3,'Fontname','Times','Fontsize',17,'Fontweight','Bold','Ytick',[0,0.5,1],'Color','blue',);
title('\sigma^2 for a partially polarized source with A_{\itx}\neq A_{\ity}','fontname','Times New Roman','FontSize',20)
%title('For a partially polarized source with A_{\itx}=A_{\ity}','fontname','Times New Roman','FontSize',20)

%%
%hold on
legend('|\itB_{xy}|=0.3','','|\itB_{xy}|=0.5','','|\itB_{xy}|=0.8','')
