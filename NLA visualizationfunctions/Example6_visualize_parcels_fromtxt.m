% Example 6: get parcel files for visualization from text
% assumes that the cifti files is cortex only with 59412 vertices (fsLR32k)
addpath(genpath(pwd));

parceldata = importdata('Yeo_7Network.txt'); % read assignment of all cortical vertices

View_Single_Assignment_Cortex(parceldata,jet(7),'Yeo_7Network');

Linds=with_without_mw_conversion('Lindfull');
Rinds=with_without_mw_conversion('Rindfull');

n_verts_per_hem = 32492;
Parcels.CtxL = zeros(n_verts_per_hem,1);% total vertices
Parcels.CtxR = zeros(n_verts_per_hem,1);

Parcels.CtxL(Linds) = parceldata(1:length(Linds));
Parcels.CtxR(Rinds-n_verts_per_hem) = parceldata(length(Linds)+1:end);

print('Example6.png','-dpng');

return