% Example 1: plot Fc matrix with silhouette index
addpath(genpath(pwd));

% load data
load('/data/wheelock/data1/datasets/WashU120/Parcels_LR_avgcorr_120.mat','corrmat'); % 333x333 average FC data
zmatWashU120 = corrmat;

% load parcel and reorder data according to parcel
load('IM_Gordon_13nets_333Parcels.mat');
zmat_gordon_WashU120 = zmatWashU120(IM.order,IM.order);

KardanIM = load('IM_11_BCP94.mat');
KardanIM = KardanIM.IM;
zmat_Kardan_WashU120 = zmatWashU120(KardanIM.order,KardanIM.order);

%% average BCP Gordon IM

figure('position',[100 100 800 400]);
subplot(1,2,1);

% state the None network
noneidx = find((string(IM.Nets)=="None")|(string(IM.Nets)=="USp"));
keepnets = IM.key(:,2)~=noneidx;
M = ones(max(IM.key(:,2)));M(noneidx,:) = 0; M(:,noneidx) = 0;M = M-diag(diag(M)); % states which clusters will be compared

% visualize FC
Easy_Matrix_Plot(zmat_gordon_WashU120(keepnets,keepnets), IM.key(keepnets,2),IM.cMap,[-0.3,0.3],0)
title('WashU 120 (Gordon Networks)'); % 10 min rs
D = calc_correlationdist(zmat_gordon_WashU120); % calculating correlation distance pairwise by ignoring the diagonals
s = silhouette_mod(IM.key(keepnets,2),D(keepnets,keepnets),M);
Qs = modularity_signed(zmat_gordon_WashU120(keepnets,keepnets),IM.key(keepnets,2));
text(0.3,-0.05,sprintf('avg SI = %2.3f',mean(s)),'Units','normalized','FontWeight','Bold');
text(0.3,-0.11,sprintf('Qsigned = %2.3f',Qs),'Units','normalized','FontWeight','Bold');

subplot(1,2,2);

% state the None network
noneidx = find((string(KardanIM.Nets)=="None")|(string(KardanIM.Nets)=="USp"));
keepnets = KardanIM.key(:,2)~=noneidx;
M = ones(max(KardanIM.key(:,2)));M(noneidx,:) = 0; M(:,noneidx) = 0;M = M-diag(diag(M));

% visualize FC
Easy_Matrix_Plot(zmat_Kardan_WashU120(keepnets,keepnets),KardanIM.key(keepnets,2),KardanIM.cMap,[-0.3,0.3],0)
title('WashU 120 (Kardan Networks)');
D = calc_correlationdist(zmat_Kardan_WashU120);
s = silhouette_mod(KardanIM.key(keepnets,2),D(keepnets,keepnets),M);
Qs = modularity_signed(zmat_Kardan_WashU120(keepnets,keepnets),KardanIM.key(keepnets,2));
text(0.3,-0.05,sprintf('avg SI = %2.3f',mean(s)),'Units','normalized','FontWeight','Bold');
text(0.3,-0.11,sprintf('Qsigned = %2.3f',Qs),'Units','normalized','FontWeight','Bold');

print('Example1.png','-dpng')