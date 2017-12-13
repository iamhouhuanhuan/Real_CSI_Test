for num =  1:30
    title = 'sample_data/CSIdata/';
    endtxt = '.txt';
    enddat = '.dat';
    file = sprintf('%s%d%s',title,num,endtxt);
    dat = sprintf('%s%d%s',title,num,enddat);
    fid = fopen(file,'w');
    csi_trace = read_bf_file(dat);
    % figure(1);
    % for index = 1:length(csi_trace)
    for index = 101:200
        csi_entry = csi_trace{index};
        csi = get_scaled_csi(csi_entry);
        [n,m,l] = size(csi);
        if n > 1
            for count = 1:n
                csix = csi(count,:,:);
                amplitude = abs(squeeze(csix).');
                [r,c] = size(amplitude);
                for i = 1:c
                    antenna = amplitude(:,i);
                    for j = 1:r
                        fprintf(fid,'%f\t',amplitude(j,i));
                    end
                end
            end
              fprintf(fid,'\n');
        end
    end
    fclose(fid);
end