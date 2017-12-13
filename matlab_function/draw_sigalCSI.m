figure;
csi_trace = read_bf_file('sample_data/test_danji.dat');
[length,one]=size(csi_trace);
sumdata=[length];
pppp=1;
for i=1:length
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    [a, j, k]=size(csi); 
    
    if (a==3&&j==3&&k==30)
        csi=csi(1,:,:);
        csi_1=csi(:,1,:);
        csi_1=abs(squeeze(csi_1).');
        ccc=csi_1(1,1,1);
%         sumdata(pppp)=sum(csi_1);
        sumdata(pppp)=ccc;
        pppp=pppp+1;
    end
end
 plot (sumdata,'r-');
 set(gca,'looseInset',[0 0 0 0]);
 xlabel('Package index');
 ylabel('SNR (dB)');
%  axis([0 30 0 40]);
%  legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'Sou
