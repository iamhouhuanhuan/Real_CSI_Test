csi_trace = read_bf_file('sample_data/»Î«÷ºÏ≤‚/no.dat');
for i=101:500
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    [m, j, k]=size(csi);   
    if (m==3&&j==3&&k==30)
%         a(i)=csi_entry.rssi_a-44-csi_entry.agc;
%         b(i)=csi_entry.rssi_b-44-csi_entry.agc;
%         c(i)=csi_entry.rssi_c-44-csi_entry.agc;
%         d(i)=csi_entry.rssi_a+csi_entry.rssi_b+csi_entry.rssi_c;
d(i)=get_total_rss(csi_entry);
    end
end
% a1=a(1,101:500);
% b1=b(1,101:500);
% c1=c(1,101:500);
% plot(a1,'r-');
% hold on;
% plot(b1,'b-');
% hold on;
% plot(c1,'g-');
% hold on;
plot(d,'k-');
hold on;
xlabel('Package index');
ylabel('SNR [dB]');
axis([0 400 -75 -55]);
legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'SouthEast' );