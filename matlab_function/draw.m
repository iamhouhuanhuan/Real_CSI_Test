csi_trace = read_bf_file('/home/luxiang/linux-80211n-csitool-supplementary/CSI_data/kongshuiping.dat');                          
figure;
for i=201:300
%     if i==894||i==893
%         continue;
%     end
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    [a, j, k]=size(csi); 

    if (a==3&&j==3&&k==30)
        csi=csi(3,:,:);
        csi_1=csi(:,1,:);
        plot ((abs(squeeze(csi_1).')),'r-');
        hold on;
        csi_2=csi(:,2,:);
        plot ((abs(squeeze(csi_2)).'),'b-');
        hold on;
        csi_3=csi(:,3,:);
        plot ((abs(squeeze(csi_3).')),'g-');
        hold on;
    end
end
 xlabel('Subcarrier index');
 ylabel('SNR (dB)');
 set(gca,'looseInset',[0 0 0 0]);
 axis([0 30 0 60]);
 title('nothing');
%  legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'SouthEast' );