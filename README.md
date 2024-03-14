# fMRI signal processing using Graph Learning

This project is centered around utilizing Graph Signal Processing (GSP) tools for brain functional connectivity for whole-brain analysis. The data for the study is not openly available, but the codes and implementation pipeline are provided to run with user-input data. The code was used as a part of the paper titled - 'Comparing Task-Based and Resting-State Brain Networks: A Graph Learning Approach for Naturalistic Stimuli fMRI'.

## Data formatting

The project works over fMRI data. The pipeline assumes the data being used is pre-processed with required steps like co-registration, realignment, etc.. The pipeline further processes the data and learns graphs in a windowed ([directory](/pipeline_windowed/)) as well as non-windowed ([directory](/pipeline_non_windowed/)) manner. The format requirements for using the pipeline are as follows

### Subject Data

Contains the region-wise grouped time-series of all voxels that remain after applying an appropriate mask over the raw fMRI data. The data should be packed in a struct file, stored in a MATLAB data file. Assuming there are N1 and N2 voxels in region_1 and region_2 respectively with T time-stamps, the data structure inside the MATLAB data file should follow

|_ subject_data.mat
  |_ region_1
    |_ all voxels (N1xT matrix)
  |_ region_2
    |_ all voxels (N2xT matrix)

### Node locations

Contains the locations of the centers of the considered regions of interest. It is a MATLAB struct file with Nx3 matrix of all region centers' (x,y,z) locations. The data structure inside the MATLAB data file should follow 

|_ nodeLayout.mat
  |_ labels
    |_ all regions (Nx3 matrix)

Store it as [nodeLayout.mat](/pipeline_windowed/extract_data/nodeLayout.mat).

### Node labels

Contains the names of all the considered regions of interest. It is a MATLAB struct file with Nx1 matrix of strings of the names of all the regions and an Nx1 matrix of strings of the AAL region numbers of all the regions. The data structure inside the MATLAB data file should follow 

|_ nodeLabels.mat
  |_ names
    |_ names of all regions (Nx1 matrix)
  |_ numbers
    |_ AAL region numbers of all regions (Nx1 matrix) 

Store it as [nodeLabels.mat](/pipeline_windowed/extract_data/nodeLabels.mat).

## Pre-requisite packages

The project uses SPM12 for extracting the data into the pipeline processible format and the cvx optimization toolbox for solving optimization problems. 

### SPM12

Please follow the installation guidelines [here](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/).

### cvx

Please follow the installation guidelines [here](https://cvxr.com/cvx/).

## Process flow

Create a folder named 'data' in the parent directory ([here](/pipeline_windowed/) or []) and place the data (subject_data.mat) in it. If the data is in the correct format, and with the right dependency installations, the pipeline should run without errors. The data is first extracted in the [extract_data](/pipeline_windowed/extract_data/) folder, then normalized in [normalize_data](/pipeline_windowed/normalize_data/), then high-pass filtered in [hpf](/pipeline_windowed/hpf/), then clustered in [clustering](/pipeline_windowed/clustering/), and finally combined to regions in [combination](/pipeline_windowed/clustering/). The data at each stage in the pipeline is stored in the respective folders. Finally, the [graph learning module](/pipeline_windowed/graph_learning/) performs graph learning over the region-level time-series. Similar processing is done for the non-windowed graph learning also.

## Running the pipeline

To run the pipeline, make sure the data is in the right format and right location, and also make sure the dependencies are installed right and are working. Finally, in the [run.m](/pipeline_windowed/run.m) file, make appropriate choices on each of the steps and run the pipeline by running the run.m file.

#### NOTE: This pipeline is designed to run on Windows. To run the same for Ubuntu, replace all the '\' with '/' in all the files throughout the pipeline.

## Results

The results use the graphs generated in the graph learning module, that are saved in the [graph_data](/pipeline_windowed/graph_learning/graph_data/) folder. Some of them require an emotion scale that is given by the participants. The results include

1. Edge weight vs time ([plotTimeSeriesWeights.m](/pipeline/results/plotTimeSeriesWeights.m))
2. Comparison of similarity of graphs across methods ([compareInstant_303.m](/pipeline/results/compareInstant_303.m))
3. Graph based clustering ([graphClustering.m](/pipeline/results/graphClustering.m))
4. Plotting and visualizing the obtained graphs ([graphPlot.ipynb](/pipeline/results/graphPlot.ipynb)) (This uses the nilearn brain library for plotting)
5. Frequency of edges ([nodeEdgeFrequency.m](/pipeline/results/nodeEdgeFrequency.m))
6. Time series vs Scale ([timeSeriesVsScale.m](/pipeline/results/timeSeriesVsScale.m))
7. Edge weight vs Scale ([weightVsScale.m](/pipeline/results/weightVsScale.m))

## Legend

[legend.xlsx](/legend.xlsx) file contains the regions considered, and their labels. It is just for reference and will not be used in running the analysis/pipeline.
