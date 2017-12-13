function cet = change(path,filename,lab)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

fpname=strcat(path,'data11111','.svm')
fp = fopen(fpname,'a+');

filepath=strcat(path,filename);
csi_trace = read_bf_file(filepath);
[p,q]=size(csi_trace)
for i=1:p
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    [a, j, k]=size(csi);
    fprintf(fp,'%d',lab);
    if (a==3&&j==3&&k==30)
        num=1;
        for count = 1:a
             csix = csi(count,:,:);
             amplitude = abs(squeeze(csix).');
             [r,c] = size(amplitude);
             for i = 1:c
                    for j = 1:r
                        fprintf(fp,' %d:%f',num,amplitude(j,i));
                        num=num+1;
                    end
             end
        end
        fprintf(fp,'\n');
    end
end
fclose(fp);

