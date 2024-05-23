clear
clc
%改变Bxy=0  for a fully polarized source
%delta_ratio= delta_xx/delta_yy
%%
sigma_S=0.01; %the effective beamwidth
delta_xx=0.02;
%delta_yy=0.045;
%delta_yy=delta_xx/1.2;
Ax=1;
Ay=Ax;
Bxy=0; 
%%
%for i=1:5
%%   
%min=((delta_xx^2+delta_yy^2)/2)^0.5;
%max=((delta_xx*delta_yy)/Bxy)^0.5;
%mmax=((delta_xx*delta_yy)/Bxy)^0.5+0.0001;
N=300;
%delta_xy=linspace(min,max,N);     
delta_ratio=linspace(1,3,N);    
Sintillation_focus=zeros(N);
%delta_xy=min:0.0001:max;
%%
Sintillation_in=((Ax.^2).^2+2.*(Ax.*Ay.*Bxy).^2+(Ay.^2).^2)./((Ax.^2+Ay^2).^2);
%%
omiga_xx=((1/(4*sigma_S^2))+(1/(delta_xx^2)))^(-0.5);
omiga_yy=((1./(4.*sigma_S^2))+(1./((delta_ratio.*delta_xx).^2))).^(-0.5);
%omiga_xy=((1/(4.*sigma_S.^2))+(1./(delta_xy.^2))).^(-0.5);
Sintillation_focus=((Ax.*omiga_xx).^4+(Ay.*omiga_yy).^4)./((Ax.^2.*omiga_xx.^2+Ay^2.*omiga_yy).^2);

%%
plot(delta_ratio,Sintillation_focus,'Linewidth',2.5)
%
ax = gca();
ax.YRuler.Exponent = -4; 
ax.YRuler.TickLabelFormat = '%.2f';
%
ax = gca();
ax.XRuler.Exponent = 0; 
ax.XRuler.TickLabelFormat = '%.2f';
%hold on
xlabel('\delta_{\itxx}/\delta_{\ityy}','Fontsize',20,'Fontname','Times');
ylabel('\sigma_{\itF}^2','Fontsize',20,'Fontname','Times');
set(gca,'fontname','Times New Roman','FontSize',16);
set(gca,'fontname','Times New Roman','FontSize',16);
%set(gca,'XTick',[min,0.033,0.036,0.039,0.042,0.045,mmax],'fontname','Times New Roman','FontSize',20);
%set(gca,'YTick',[0.5,0.6,0.7,0.8,0.9,1],'fontname','Times New Roman','FontSize',20);
%xlim([min,mmax]),
%ylim([0.5,1])

%set(gca,'xTickLabel',num2str(get(gca,'XTick')'))
%set(gca,'yTickLabel',num2str(get(gca,'YTick')'))
%xtickformat('%.4f')

%ylim([0,1]);
%set(gca,'Linewidth',3,'Fontname','Times','Fontsize',17,'Fontweight','Bold','Ytick',[0,0.5,1],'Color','blue',);
title('For an unpolarized source A_{\itx}=A_{\ity} and B_{\itxy}=0','fontname','Times New Roman','FontSize',20)

%%
%Ox=[min, max];
%Oy=[Sintillation_in, Sintillation_in];
%Oz=[1,2];
%plot(Ox,Oy,'Linewidth',2.5,'LineStyle','--','color',c(i,:));
%hold on
%p1.LineWidth = 1;
%end

%%

%%
%hold on
%legend('|B_{xy}|=0.4','','|B_{xy}|=0.5','','|B_{xy}|=0.6','','|B_{xy}|=0.7','','|B_{xy}|=0.8','')
