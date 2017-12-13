csi_trace = read_bf_file('sample_data/test_cicso_one.dat');
a=zeros(500,3);
for i=1:200
    csi_entry = csi_trace{i};
    a(i,1) = csi_entry.perm(1,1);
    a(i,2) = csi_entry.perm(1,2);
    a(i,3) = csi_entry.perm(1,3);
end