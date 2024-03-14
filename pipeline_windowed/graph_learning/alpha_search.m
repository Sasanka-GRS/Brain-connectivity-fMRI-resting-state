clc
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Add dependencies

addpath('.\functions');


%% Set parameters
subject = "386";

logAlphaArray = -3:0.1:3;
logBetaArray = -3:0.1:3;
Alpha = 10.^(logAlphaArray);
Beta = 10.^(logBetaArray);
iter = 20;
N = 54;
alphaIter = 1;
betaIter = 1;

AlpaLength = length(logBetaArray);

W_L = zeros(N,N,AlpaLength,AlpaLength);
W_H = zeros(N,N,AlpaLength,AlpaLength);

%% Window scale

scale = load("..\extract_data\rating.mat").scale;

scaleD = scale(1:2:end);
L = length(scaleD);
Num = 8; % Window Length

scaleW = zeros(L-Num+1,1);

for i = 1:L-Num+1
    window = scaleD(i:i+Num-1);
    average = sum(window,1)/Num;
    scaleW(i) = average;
end

idxLow = [73,80];
idxHigh = [L-Num+2-Num,L-Num+1];

%% Read data

s1 = "..\combination\combined_data\";
s2 = "_data_combined.mat";
sub = s1+subject+s2;

x1 = load(sub).data;
x1 = x1';
XData_L = x1(:,idxLow(1):idxLow(2));
XData_H = x1(:,idxHigh(1):idxHigh(2));

%% Run loops

for alpha = Alpha
    betaIter = 1;
    for beta = Beta
        W_L(:,:,alphaIter,betaIter) = smoothWindowInside(iter,alpha,beta,XData_L);
        W_H(:,:,alphaIter,betaIter) = smoothWindowInside(iter,alpha,beta,XData_H);
        betaIter = betaIter+1;
    end
    alphaIter = alphaIter+1;
end

%% Save

s1 = ".\";
s2 = "_parameterSearchSmoothness.mat";
sub = s1+subject+s2;

save(sub,"W_L","W_H");

%% Set parameters
subject = "386";

logAlphaArray = -3:0.1:3;
logBetaArray = -3:0.1:3;
Alpha = 0:0.01:10;
Beta = 0:0.1:25;
iter = 20;
N = 54;
alphaIter = 1;
betaIter = 1;

AlpaLength = length(logBetaArray);

W_L = zeros(N,N,AlpaLength,AlpaLength);
W_H = zeros(N,N,AlpaLength,AlpaLength);

%% Run loops

for alpha = Alpha
    betaIter = 1;
    for beta = Beta
        W_L(:,:,alphaIter,betaIter) = smoothWindowInside(iter,alpha,beta,XData_L);
        W_H(:,:,alphaIter,betaIter) = smoothWindowInside(iter,alpha,beta,XData_H);
        betaIter = betaIter+1;
    end
    alphaIter = alphaIter+1;
end

%% Save

s1 = ".\";
s2 = "_parameterSearchSmoothnessSmall.mat";
sub = s1+subject+s2;

save(sub,"W_L","W_H");