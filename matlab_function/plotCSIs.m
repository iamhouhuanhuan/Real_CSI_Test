%plot CSI by manual
%j is package index;i is subcarriers
y1=zeros(131,30);
y2=zeros(131,30);
y3=zeros(131,30);
k1=zeros(1,131);
k2=zeros(1,131);
k3=zeros(1,131);
z1=zeros(30,131);
z2=zeros(30,131);
z3=zeros(30,131);
for j=1:131
    for i=1:30
        y1(j,i)=x(j,i);
    end
    for k=31:60
        y1(j,k-30)=x(j,k);
    end
    for m=61:90
        y1(j,m-60)=x(j,m);
    end
end
for j=1:131
    z1=y1';
    z2=y2';
    z3=y3';
    k1=y(:,j);
    k2=y(:,j);
    k2=y(:,j);
    plot(y1,'r-');
    hold on;
    plot(y2,'b-');
    hold on;
    plot(y3,'g-');
    hold on;
end
%axis([0 30 -5 35]);
legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'SouthEast' );
xlabel('Subcarrier index');
ylabel('SNR [dB]');