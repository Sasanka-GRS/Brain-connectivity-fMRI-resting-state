clc
clear

%% Load T1 NIfTI file
t1_nii = load_nii('path_to_your_t1_image.nii');

%% Load AAL Atlas information (example)
aal_info = load('path_to_aal_atlas_info.mat');  % You need to create this file

%% Define the 54 regions of interest
selected_regions = ['Frontal_Sup_L', 'Frontal_Sup_R', 'Frontal_Sup_Orb_L']; % Add your 54 region names

%% Extract indices corresponding to the selected regions
selected_indices = zeros(1, numel(selected_regions));

for i = 1:numel(selected_regions)
    region_name = selected_regions{i};
    % Find the AAL region number for the current region
    idx = find(strcmp(aal_info.RegionNames, region_name));
    if ~isempty(idx)
        selected_indices(i) = aal_info.RegionNumbers(idx);
    else
        error(['Region "', region_name, '" not found in the AAL atlas information.']);
    end
end

% Perform gray matter segmentation using SPM
spm('defaults', 'fmri');
spm_jobman('initcfg');

matlabbatch{1}.spm.spatial.preproc.channel.vols = {['path_to_your_t1_image.nii,1']};
matlabbatch{1}.spm.spatial.preproc.channel.write = [0 1]; % Save gray matter

spm_jobman('run', matlabbatch);

% Load the segmented gray matter image
gray_matter_mask_nii = load_nii('path_to_your_gray_matter_mask.nii'); % Update with the actual path

% Create a connectivity matrix based on the morphological information
connectivity_matrix = create_morphological_connectivity(gray_matter_mask_nii, roi_labels);

% Visualize or analyze the connectivity matrix as needed
imagesc(connectivity_matrix);
title('Structural Connectivity Matrix');
colorbar;

% Save the connectivity matrix if necessary
save('structural_connectivity_matrix.mat', 'connectivity_matrix');