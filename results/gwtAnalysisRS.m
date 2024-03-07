clc
clear

%% Add dependencies

addpath('D:\SGWT\sgwt_toolbox-1.02\sgwt_toolbox\')
addpath('D:\SGWT\sgwt_toolbox-1.02\sgwt_toolbox\utils')
addpath('D:\SGWT\sgwt_toolbox-1.02\sgwt_toolbox\demo')
addpath('D:\SGWT\sgwt_toolbox-1.02\sgwt_toolbox\mex')

%% Set parameters

m = 50; % Order of polynomial approximation
Nscales = 4; % Number of scales for wavelets

designtype='abspline3'; % OR 'mexican_hat' OR 'meyer' OR 'simple_tf'

%% Run over all subjects

subjects = ["303","378","386","820","1092","1093","1171","1352","1511","1629"];
methods = ["Sim", "Spar", "Pear", "Smooth"];

for s = 1:length(subjects)
    subject = subjects(s);

    Sim.w_lp = zeros(54,1);
    Sim.w_1 = zeros(54,1);
    Sim.w_2 = zeros(54,1);
    Sim.w_3 = zeros(54,1);
    Sim.w_4 = zeros(54,1);

    Spar.w_lp = zeros(54,1);
    Spar.w_1 = zeros(54,1);
    Spar.w_2 = zeros(54,1);
    Spar.w_3 = zeros(54,1);
    Spar.w_4 = zeros(54,1);

    Pear.w_lp = zeros(54,1);
    Pear.w_1 = zeros(54,1);
    Pear.w_2 = zeros(54,1);
    Pear.w_3 = zeros(54,1);
    Pear.w_4 = zeros(54,1);

    Smooth.w_lp = zeros(54,1);
    Smooth.w_1 = zeros(54,1);
    Smooth.w_2 = zeros(54,1);
    Smooth.w_3 = zeros(54,1);
    Smooth.w_4 = zeros(54,1);

    %% Load data

    s1 = "..\normalize_graphs\normalized_graphs\";
    s2 = "_normalizedGraphs_RS.mat";
    sub = s1 + subject + s2;

    graphOut = load(sub).graphOut;
    SimSub = graphOut.Sim;
    SparSub = graphOut.Spar;
    PearSub = graphOut.Pear;
    SmoothSub = graphOut.Smooth;

    s1 = "..\combination\combined_data\";
    s2 = "_data_combined_RS.mat";
    sub = s1 + subject + s2;

    DataSub = load(sub).data;
    DataSub = DataSub';

    %% Set parameters

    S = size(DataSub);
    N = S(1);
    T = S(2);

    GraphSub = zeros(N,N,4);
    GraphSub(:,:,1) = SimSub;
    GraphSub(:,:,2) = SparSub;
    GraphSub(:,:,3) = PearSub;
    GraphSub(:,:,4) = SmoothSub;

    %% Iterate over time (4 scales)

    w_lp = zeros(N);
    w_1 = zeros(N);
    w_2 = zeros(N);
    w_3 = zeros(N);
    w_4 = zeros(N);

    for m = 1:length(methods)
        method = methods(m);

        W = GraphSub(:,:,m);
        L = diag(sum(W,1)) - W;

        %%%%%%%%%%%%%%%%%%%%%%%%% Design filters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        lmax=sgwt_rough_lmax(L); % Find largest eigenvalue and increase it by 1% to keep it robust

        [g,t] = sgwt_filter_design(lmax,Nscales,'designtype',designtype);

        arange=[0 lmax];

        %%%%%%%%%%%%%%%%%%%%% Chebyshev approximation %%%%%%%%%%%%%%%%%%%%%%%%%

        for k=1:numel(g)
            c{k}=sgwt_cheby_coeff(g{k},m,m+1,arange);
        end

        %%%%%%%%%%%%%%%%%%% Apply forward transform %%%%%%%%%%%%%%%%%%%%%%%%%%%

        wpall = sgwt_cheby_op(DataSub(:,round(T/2)),L,c,arange);
        w_lp = wpall{1};
        w_1 = wpall{2};
        w_2 = wpall{3};
        w_3 = wpall{4};
        w_4 = wpall{5};

        %% Save

        if(m==1)
            Sim.w_lp = w_lp;
            Sim.w_1 = w_1;
            Sim.w_2 = w_2;
            Sim.w_3 = w_3;
            Sim.w_4 = w_4;
        elseif(m==2)
            Spar.w_lp = w_lp;
            Spar.w_1 = w_1;
            Spar.w_2 = w_2;
            Spar.w_3 = w_3;
            Spar.w_4 = w_4;
        elseif(m==3)
            Pear.w_lp = w_lp;
            Pear.w_1 = w_1;
            Pear.w_2 = w_2;
            Pear.w_3 = w_3;
            Pear.w_4 = w_4;
        else
            Smooth.w_lp = w_lp;
            Smooth.w_1 = w_1;
            Smooth.w_2 = w_2;
            Smooth.w_3 = w_3;
            Smooth.w_4 = w_4;
        end
    end

    s1 = ".\gwt\";
    s2 = "_SGWTFiltered_RS.mat";
    sub = s1 + subject + s2;

    save(sub,"Sim","Spar","Pear","Smooth");

end

%% Plotting

%{

% Normal Plot

figure()
subplot(5,1,1)
plot(w_lp,'red',LineWidth=2.0)
title('Lowpass')
subplot(5,1,2)
plot(w_1,'red',LineWidth=2.0)
title('Scale 1')
subplot(5,1,3)
plot(w_2,'red',LineWidth=2.0)
title('Scale 2')
subplot(5,1,4)
plot(w_3,'red',LineWidth=2.0)
title('Scale 3')
subplot(5,1,5)
plot(w_4,'red',LineWidth=2.0)
title('Scale 4')

% 3D and Image

W = [w_lp';w_1';w_2';w_3';w_4'];

figure()
image(abs(W))
colorbar

scales = 0:Nscales;
nodes = 1:N;

figure()
surf(W)
xlabel('nodes')
ylabel('scales')
zlabel('Coeff')
colorbar
%}