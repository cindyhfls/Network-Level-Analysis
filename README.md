# NetworkLevelAnalysis_v1.0

# Introduction
This is a forked directory for the Network Level Analysis (NLA) Toolbox (Beta version). NLA is an extensible MATLAB-based software package for the analysis of behavioral associations with brain connectivity data. NLA utilizes a statistical approach known variously as 'pathway analysis','over representation analysis' or 'enrichment analysis', which was first used to describe behavioral or clinical associations in genome-wide association studies.

The team switched to developing a GUI version (currently in preparation).

I added a few functions for evaluation the network model and visualization examples which I found helpful while I using the toolbox functions for visualization.

# Limitation: 
All visualization is done in the fsLR 32k mesh of the MNI standard brain. For transition across spaces please try this toolbox: https://github.com/netneurolab/neuromaps.

## Specific example applications
**Example 1** 
This concerns the plot of alternative brain system/networks sorting order for existing set of node/region of interests (ROIs) definitions. It calculates and displays the average silhouette index at the bottom to show the cluster quality of the existing system/networks definition provided by the user.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example1.png)

**Example 2**
Taken a given surface parcel assignment in the cortex in the fsLR 32k space. Plot the color assignment with colorbar, the color can indicate parcel homogeneity, variability, correlation strength with behavioral measurement, etc.

![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example2.png)

**Example 3**
Plot the network assignment spatially on the brain. Using a file that stores the colormap and network assignment in the NLA toolbox.
![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example3.png)

**Example 4**
Making a parcel file (the assignment of each cortical vertex) from a cifti file with just the cortical vertices. This is needed for Example 2 and 3.
(https://github.com/cindyhfls/Network-Level-![image]Analysis/blob/main/NLA%20visualizationfunctions/Example4.png)

**Example 5**
Plot continuous values on the cortex, e.g. Principal gradient (Margulies et al. 2016 PNAS), cortical thickness, Myelin, local connectivity gradient (Gordon et al. 2016 Cerebral Cortex) etc.
![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example5.png)

**Example 6**
Same as Example 3 but load the network assignment from any user-load .txt/.mat file (e.g. output of community detection)
![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example6.png)

**Example 7**
Plot a subsection of edges on the brain.
![image](https://github.com/cindyhfls/Network-Level-Analysis/blob/main/NLA%20visualizationfunctions/Example7.png)
