[csi_trace,cur]  = read_file_realtime('/home/luxiang/linux-80211n-csitool-supplementary/CSI_data/1111.dat',0);
while(1)
    [csi_trace,cur]  = read_file_realtime('/home/luxiang/linux-80211n-csitool-supplementary/CSI_data/1111.dat',cur);
    len = length(csi_trace);
    for i = 1:len
        csi_entry = csi_trace{i};
        csi = get_scaled_csi(csi_entry);
        [a, j, k]=size(csi); 

        if (a==2&&j==3&&k==30)
            csi=csi(1,:,:);
            csi_1=csi(:,1,:);
            plot ((abs(squeeze(csi_1).')), '-r');
            hold on;
        end
    end
    
%     drawnow;
    pause(1);
    cla;
end