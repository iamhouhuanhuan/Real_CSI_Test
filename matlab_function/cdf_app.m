y1=b;
x1=linspace(0,3,13);
h_rtl=hist(y1,x1); %计算各个区间的个数 
% yy=yy/length(y); %计算各个区间的个数 
% bar(x,yy) %画出概率密度分布图 
pr_approx_cdf = 100*cumsum(h_rtl) / ( sum(h_rtl) );
figure; plot(x1,pr_approx_cdf,'-or');
hold on;

y2=c;
h_rtl=hist(y2,x1);
pr_approx_cdf = 100*cumsum(h_rtl) / ( sum(h_rtl) );
plot(x1,pr_approx_cdf,'-*g');
hold on;
% 
% y3=pair1;
% h_rtl=hist(y3,x1);
% pr_approx_cdf = 100*cumsum(h_rtl) / ( sum(h_rtl) );
% plot(x1,pr_approx_cdf,'-sb');
% hold on;

y4=x;
h_rtl=hist(y4,x1);
pr_approx_cdf = 100*cumsum(h_rtl) / ( sum(h_rtl) );
plot(x1,pr_approx_cdf,'-dk');

xlabel('Error distance(m)');
ylabel('Cumulative error probability(%)');
legend('420', '410', 'Location', 'SouthEast' );
% set(gca,'box','off','Ytick',[]);
% s=0 ;
% for i=2:length(x) 
%     
% s=[s,trapz(x([1:i]),yy([1:i]))]; 
% 
% end 
% 
% figure;
% plot(x,s,x,s,'*')  