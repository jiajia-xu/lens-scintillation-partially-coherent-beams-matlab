clear
clc
%
sigma_S=0.5;
delta_xx=0.03;
%delta_yy=0.045;
delta_yy=delta_xx;
Ax=0.6;
Ay=0.9;
Bxy=0.5;

% c = rand(5,3);
% A = 1:5;
%%
%  for i=1:5
for Bxy=0.499:0.1:0.999
    %%

min=((delta_xx^2+delta_yy^2)/2)^0.5;
max=((delta_xx*delta_yy)/Bxy)^0.5;
delta_xy=min:0.0001:max;
%%
Sintillation_in=((Ax.^2).^2+2.*(Ax.*Ay.*Bxy).^2+(Ay.^2).^2)./((Ax.^2+Ay^2).^2);
%%
omiga_xx=((1/(4*sigma_S^2))+(1/(delta_xx^2)))^(-0.5);
omiga_yy=((1/(4*sigma_S^2))+(1/(delta_yy^2)))^(-0.5);
omiga_xy=((1/(4.*sigma_S.^2))+(1./(delta_xy.^2))).^(-0.5);
Sintillation_focus=((Ax.^2.*omiga_xx).^2+2.*(Ax.*Ay.*Bxy.*omiga_xy).^2+(Ay.^2.*omiga_yy).^2)./((Ax.^2.*omiga_xx+Ay^2.*omiga_yy).^2);

%%
plot(delta_xy,Sintillation_focus,'Linewidth',2.5)
hold on
xlabel('\delta_{xy}','Fontsize',20);
ylabel('\sigma^2_{focus}','Fontsize',20);
%ylim([0,1]);
%set(gca,'Linewidth',3,'Fontname','Times','Fontsize',17,'Fontweight','Bold','Ytick',[0,0.5,1],'Color','blue',);
title('Scintillation coefficient at focus','fontname','Times New Roman','FontSize',20)

%%
Ox=[min, max];
Oy=[Sintillation_in, Sintillation_in];
%Oz=[1,2];
plot(Ox,Oy,'Linewidth',2.5,'LineStyle','--');
hold on
%p1.LineWidth = 1;
end

%%

%%
%hold on
%legend('1')
