y1=err;
x1=linspace(0,5,21);
a=zeros(1,21);
b=zeros(1,21);
c=zeros(1,21);
d=zeros(1,21);
e=zeros(1,21);
figure;
for i = 1:1000
    j = ceil(err(i,1)/0.25)+1;
	for k = j:21
		a(1,k)=a(1,k)+1;
	end
end
a=a/10;
plot(x1,a,'-or');
hold on;

for i = 1:1000
    j = ceil(err(i,2)/0.25)+1;
	for k = j:21
		b(1,k)=b(1,k)+1;
	end
end
b=b/10;
plot(x1,b,'-*g');
hold on;

% for i = 1:1000
%     j = ceil(err(i,3)/0.25)+1;
% 	for k = j:21
% 		c(1,k)=c(1,k)+1;
% 	end
% end
% c=c/10;
% plot(x1,c,'-sb');
% hold on;
% 
% for i = 1:1000
%     j = ceil(err(i,4)/0.25)+1;
% 	for k = j:21
% 		d(1,k)=d(1,k)+1;
% 	end
% end
% d=d/10;
% plot(x1,d,'-dk');
% hold on;
% 
% for i = 1:1000
%     j = ceil(err(i,5)/0.25)+1;
% 	for k = j:21
% 		e(1,k)=e(1,k)+1;
% 	end
% end
% e=e/10;
% plot(x1,e,'-dm');
% hold on;

xlabel('Error distance(m)','fontsize',30);
ylabel('Cumulative error probability(%)','fontsize',30);
legend('PCA 99%','No PCA','Location', 'SouthEast','fontsize',24 );
