% Example 7: plot the nodes with edges connecting them on a glass brain
% model
path_to_code = '/data/wheelock/data1/people/Cindy/NLA_toolbox_070319'; % replace with your downloaded directory
addpath(genpath(path_to_code));
%% Load brain surface
load('MNI_coord_meshes_32k.mat');
Anat.CtxL = MNIl;Anat.CtxR = MNIr;
clear MNIl MNIr
%% Load FC
load('/data/wheelock/data1/datasets/WashU120/Parcels_LR_avgcorr_120.mat','corrmat'); % 333x333 average FC data
load('Parcels_Gordon.mat','ROIxyz')

for ii = 1:size(corrmat,1),corrmat(ii,ii) = 0;end % set diagonals to 0
zmat = corrmat;zmat(zmat<0.6) = 0; % remove correlation<0.6
clear CONN
[CONN(:,1),CONN(:,2),CONN(:,3)] = find(zmat);
%% Draw 3D view

params.ctx='inf';           % 'std','inf','vinf'
params.fig = 0;
params.lighting = 'gouraud';
params.edgewidth = 1;

ROI.coord = ROIxyz;
nroi = size(ROIxyz,1);
ROI.color = repmat([0 0 0],nroi,1);
ROI.radius = repmat(2,nroi,1);

Draw_ROIs_Through_Cortex_3_Views(Anat,ROI,CONN,params)
set(gcf,'color','w','InvertHardCopy','off');
print('Example7.png','-dpng');
%% Draw single view
params.ctx='inf';           % 'std','inf','vinf'
params.fig = 1;
params.lighting = 'gouraud';
params.edgewidth = 1;

ROI.coord = ROIxyz;
nroi = size(ROIxyz,1);
ROI.color = repmat([0 0 0],nroi,1);
ROI.radius = repmat(2,nroi,1);

Draw_ROIs_Through_Cortex(Anat,ROI,CONN,params)
view([0,0]) % posterior
% view([-90,0]) % left lateral
% view([90,0]) % right lateral
% view([0,90]) % dorsal
