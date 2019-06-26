function [b1,b2]= pinta_barplots(data1,data2,labels,p,maxdat)

% Hight of stat sigificant line (p<0.05, *)
% maxdat = 2.5; %2.5; %2.5; 0.3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


center = 0;


% Colores
colorgrupo1 = [ 0     0.6  0.8]; % azul
colorgrupo2 = [ 0.98  0.65 0.1]; % naranja

grupo1Lin = [ 0     0.6  0.8]; % azul
grupo2Lin = [ 0.98  0.65 0.1]; % naranja


N = length(data1); % % /sqrt(N)
bw = 0.5; % Bar width
lw = 3; % Linewidth error bar


% control (Nsubjects x 2): 1) Subject name, 2) Subject data
% data = [data1  data2];


% White background
set(gcf, 'Color', [1 1 1])
box off


b1 = bar( center+1, mean(data1),bw,'FaceColor',grupo1Lin); hold on;
b2 = bar( center+1.5, mean(data2),bw,'FaceColor',grupo2Lin);
b1.EdgeColor = 'none'; % grupo1;
b2.EdgeColor = 'none'; % grupo2;
b1.LineWidth = lw;
b2.LineWidth = lw;
% b1.width = bw;
% b2.width = bw;

% area = 40;
% % s1 = scatter(1*ones(1,m),data1,area,grupo1,'filled');
% % s2 = scatter(1.5*ones(1,m),data2,area,grupo2,'filled');

% text(1.02*ones(1,m),control(:,2), num2str(control(:,1)));
% text(2.02*ones(1,m),blind(:,2), num2str(blind(:,1)));


% b1.LineStyle = 'none';
% b2.LineStyle = 'none';
e1 = errorbar( center+1, mean(data1), std(data1,1)/sqrt(N)); hold on;
e2 = errorbar( center+1.5, mean(data2), std(data2,1)/sqrt(N));

e1.LineStyle = ':';
e2.LineStyle = ':';
e1.Marker = 'none'; % '.'
e2.Marker = 'none'; % '.'
e1.LineWidth = lw-1;
e2.LineWidth = lw-1;
e1.Color = colorgrupo1; %'k'; % verde;
e2.Color = colorgrupo2; %'k'; % rojo;
% e1.CapSize = 12;



if p<0.05
%     maxdat = max(data(:)); %%%%
    xxbar = 0.1*maxdat;
    xxstar = xxbar + 0.05*maxdat;
    line(center+[1,1.5], [maxdat maxdat]+xxbar,'Color','k','LineWidth',lw-1);
    text(center+1.2,maxdat+xxstar,'*','FontSize',20)
end

% line([1-bw/2,1+bw/2], [mean(control(:,2)) mean(control(:,2))] ,'Color','k','LineWidth',lw);
% line([2-bw/2,2+bw/2], [mean(blind(:,2)) mean(blind(:,2))] ,'Color','k','LineWidth',lw);


% ylabel ('Mean Amplitude (n.u.)')
set(gca,'xTick',center+[1,1.5])
set(gca,'xTickLabel',labels)
set(gca,'FontSize',16)

% s1.MarkerFaceColor = verde;
% s2.MarkerFaceColor = rojo;


% Change error bar Caps
% Width of the top and bottom lines of errorbar
xlength = 0.05;
X = center+[ 1, 1.5];
Y = [ mean(data1),  mean(data2) ];
E = [ std(data1,1)/sqrt(N), std(data2,1)/sqrt(N) ];

% Make horizontal lines with 'line'
for k = 1:length(X)
    switch k
        case 1, ebar = e1;
        case 2, ebar = e2;
    end
    x   = [X(k) - xlength, X(k) + xlength];
    y_h = [Y(k) + E(k), Y(k) + E(k)];
    y_b = [Y(k) - E(k), Y(k) - E(k)];
    line(x, y_h, 'LineWidth',ebar.LineWidth, 'Color',ebar.Color);
    line(x, y_b, 'LineWidth',ebar.LineWidth, 'Color',ebar.Color );
end



box off
% title (titulo1)

% % % Save figure
% % 
% % set(f3,'PaperUnits','inches')
% % set(f3,'PaperPosition',[0 0 5 5])
% % % set(h,'PaperPositionMode','auto')
% % print(f3,'-dtiff','-r500',[mydir,titulo2])