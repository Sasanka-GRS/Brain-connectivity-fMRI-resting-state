clc
clear

% Package required - SPM12

%% Declare subjects
subjects = ["1092"];

S = length(subjects);

%% Extract masks

dirName = '.\resampled_masks';
files = dir(fullfile(dirName,'1092*.nii') ); 
files = {files.name}';

masks = cell(numel(files),1);

for i=1:numel(files)
    fname = fullfile(dirName,files{i}); 
    mask_nifti = spm_vol(fname);
    masks{i} = spm_read_vols(mask_nifti);
end

%% Iterate over all subjects
for s = 1:S
    
    messageHere = ['Choose the data for the subject ', num2str(subjects(s))];
    disp(messageHere)

    %% Load data and masks (Make sure to pick the data corresponding to subject number as displayed in command window)
    imgs=spm_select(Inf, 'image', 'get timeseries data');
    V=spm_vol(imgs);
    [Y,XYZ]=spm_read_vols(V);
    sz = size(Y);
    Y1 = reshape(Y,[],sz(4));
    
    masks_mat = load(".\MNI_allMasks.mat");
    fNames = fieldnames(masks_mat);
    R = length(fNames);

    %% Set variables
    subject = subjects(s);
    extractedData = masks_mat;

    for r = 1:R
        % Choose region
        message = ['Extracting for ', fNames{r}];
        disp(message)
        mask = masks{r};
        
        % Apply mask
        masked_data = Y .* mask;
        
        N = nnz(mask);
        masked = zeros(sz(4),N);

        for i=1:sz(4)
            % Extract non-zero indices
            layer = masked_data(:,:,:,i);
            masked(i,:) = squeeze(layer(mask ~= 0));
        end

        extractedData.(fNames{r}) = masked;
    end
    
    %{
    %% Loop through the masks and extract data
    for r = 1:R
        % Choose region
        message = ['Extracting for ', fNames{r}];
        disp(message)
        mask = masks.(fNames{r});

        L = size(mask);
        L = L(1);

        % Set xyz location of voxels
        concatenate = [];

        prog = 0;
        fprintf(1,'Progress: %3d%%\n',prog);

        for i=1:L
            % Find the index with the XYZ coordinates
            prog = ( 100*(i/L) ); % Print Progress

            min = norm(mask(i,:) - XYZ(:,1), 2);
            coord = 1;
            
            for j=2:sz(1)*sz(2)*sz(3)
                value = norm(mask(i,:) - XYZ(:,j), 2);
                if(value<min)
                    min = value;
                    coord = j;
                end
            end

            %coord = find(ismember(XYZ',mask(i,:),'rows'));

            % Get time series

            series1 = Y1(coord,:);

            % Concatenate
            concatenate = [concatenate;series1];

            fprintf(1,'\b\b\b\b%3.0f%%',prog);
        end
        
        fprintf('\n');
        concatenate = concatenate';
        extractedData.(fNames{r}) = concatenate;

    end
    %}

    name = subject+"Data.mat";

    %% Save the data for each subject
    save(name,"extractedData");

end