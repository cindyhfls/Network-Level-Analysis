% Example 6: get parcel files for visualization from text
% assumes that the cifti files is cortex only with 59412 vertices (fsLR32k)
addpath(genpath(pwd));

parceldata = importdata('Yeo_7Network.txt'); % read assignment of all cortical vertices

Linds=with_without_mw_conversion('Lindfull');
Rinds=with_without_mw_conversion('Rindfull');

n_verts_per_hem = 32492;
Parcels.CtxL = zeros(n_verts_per_hem,1);% total vertices
Parcels.CtxR = zeros(n_verts_per_hem,1);

Parcels.CtxL(Linds) = parceldata(1:length(Linds));
Parcels.CtxR(Rinds-n_verts_per_hem) = parceldata(length(Linds)+1:end);

%% View all parcels on MNI
load('MNI_coord_meshes_32k.mat')
Anat.CtxL = MNIl;Anat.CtxR = MNIr;
clear MNIl MNIr

Nparcels = length(setdiff(unique([Parcels.CtxL;Parcels.CtxR]),0))

% (1) Add parcel nodes to Cortices
% Parcels.CtxL(Parcels.CtxL==0) = Nparcels+1; % set the last one to black to draw borders (if available) and medial wall
% Parcels.CtxR(Parcels.CtxR==0) = Nparcels+1;
Anat.CtxL.data=Parcels.CtxL;
Anat.CtxR.data=Parcels.CtxR;
% (2) Set parameters to view as desired
params.Cmap.P=jet(Nparcels);
params.Cmap.P(Nparcels+1,:) = [0 0 0];
params.TC=1;
params.ctx='inf';           % 'std','inf','vinf'
figure;
ax = subplot(2,1,1);
params.fig_handle = ax;
params.view= 'lat';       % 'dorsal','post','lat','med'
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);
title(parcelname,'interpreter','none','color','k')
ax = subplot(2,1,2);
params.fig_handle = ax;
params.view ='med';
PlotLRMeshes_mod(Anat.CtxL,Anat.CtxR, params);

set(gcf,'color','w','InvertHardCopy','off');
print('Example6.png','-dpng');
% print(gcf,fullfile(outdir,[parcelname,'.png']),'-dpng');
return