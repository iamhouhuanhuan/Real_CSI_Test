file = 'sample_data/test/2/csi_test2.csv';
fid = fopen(file,'w');
for num =  1:5
%   title_net = 'sample_data/csi_net/test_net';
    title_cisco = 'sample_data/test/2/q';
    enddat = '.dat';
%   dat_net = sprintf('%s%d%s',title_net,num,enddat);
    dat_cisco = sprintf('%s%d%s',title_cisco,num,enddat);
%   csi_trace_net = read_bf_file(dat_net);
    csi_trace_cisco = read_bf_file(dat_cisco);
%     count_100=0;
    for index=201:300
    
        csi_entry_cisco = csi_trace_cisco{index};
        csi_cisco = get_scaled_csi(csi_entry_cisco);
%         csi_entry_net = csi_trace_net{1700+index};
%         csi_net = get_scaled_csi(csi_entry_net);
        [n1,m1,k1] = size(csi_cisco);
%         [n2,m2,k2] = size(csi_net);
        if (n1==3&&m1==3&&k1==30)
%             count_100=count_100+1;
            for count = 1:n1
                csix_cisco = csi_cisco(count,:,:);
                amplitude_cisco = (abs(squeeze(csix_cisco).'));
                [r,c] = size(amplitude_cisco);
                for i = 1:c
                    antenna_cisco = amplitude_cisco(:,i);
                    for j = 1:r
                        fprintf(fid,'%f,',amplitude_cisco(j,i));
                    end
                end
            end
            
%             for count = 1:n2
%                 csix_net = csi_net(count,:,:);
%                 amplitude_net = db(abs(squeeze(csix_net).'));
%                 [r,c] = size(amplitude_net);
%                 for i = 1:c
%                     antenna_net = amplitude_net(:,i);
%                     for j = 1:r
%                         fprintf(fid,'%f,',amplitude_net(j,i));
%                     end
%                 end
%             end
            fprintf(fid,'q%d',num);
            fprintf(fid,'\n');
        end
%         if(count_100>=100) 
%             break;
%         end 
    end
end
fclose(fid);