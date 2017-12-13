%归一化
FlattenedData = OriginalData(:)'; % 展开矩阵为一列，然后转置为一行。
MappedFlattened = mapminmax(FlattenedData, 0, 1); % 归一化。
MappedData = reshape(MappedFlattened, size(OriginalData)); % 还原为原始矩阵形式。此处不需转置回去，因为reshape恰好是按列重新排序
