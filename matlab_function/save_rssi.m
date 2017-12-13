%for num =  1:10
    title = 'sample_data/410/door-in';
    endtxt = '.csv';
    enddat = '.dat';
%     file = sprintf('%s%d%s',title,num,endtxt);
%     dat = sprintf('%s%d%s',title,num,enddat);
    file = sprintf('%s%s',title,endtxt);
    dat = sprintf('%s%s',title,enddat);
    fid = fopen(file,'w');
    csi_trace = read_bf_file(dat);
    for index = 1001:3000
        csi_entry = csi_trace{index};
        fprintf(fid,'%f,',csi_entry.rssi_a);
        fprintf(fid,'%f,',csi_entry.rssi_b);
        fprintf(fid,'%f,',csi_entry.rssi_c);
        fprintf(fid,'in\n');
    end
    fclose(fid);
%end