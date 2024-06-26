# Mitochondrial_Fragments
Identify fragments in the mitochondrial network and measure the intensity of the individual mitochondrial fragments. All the requirements and instructions are added in the macro files.

Example_cell.zip contains raw cropped images and MitoGraph-generated files. Extract the files and follow the instructions given below to run the macros.


# Macro_mito_fragment.ijm

This macro is used to identify connected regions (Fragments) in the mitochondrial network.

Before using this macro:
------------------------
1. Use GenFramesMaxProjs.ijm macro to generate a z-stack, 
   where each slice corresponds to the max projection of a z-stack. A file named MaxProjs.tif will be created inside the chosen folder. 
   GenFramesMaxProjs.ijm macro available at 
   https://github.com/vianamp/MitoGraphTools/blob/master/README.md#genframesmaxprojsijm
2. Use CropCells.ijm macro to create single cells z-stacks to be used as input for MitoGraph.
   CropCells.ijm macro available at
   https://github.com/vianamp/MitoGraphTools/blob/master/README.md#cropcellsijm
3. Perform Mitograph and save all the output files in the RootFolder 
   containing the cropped cell images.

How to use this macro:
------------------------
1. Click run to execute the macro.
2. Select the folder containing the MitoGraph output files including "_binary.tif" and cropped single cell image in "tif" format.
3. A csv file called "Results" will be created in each of the Cropped Cell folders.
4. A separate .tif file will be created corresponding to each fragment identified from the MitoGrpah output i.e. "_binary.tif" file.
==========================================================================

# Macro_mito_fragment_GetData.ijm

This macro is used to measure the intensity of Green and Red Fluorescence for each mitochondrial fragment.

Before using this macro:
------------------------
1. Use the macro_mito_fragment.ijm to identify mitochondrial fragments 
  from the MitoGraph generated _binary.tif files. 
  This will create a CSV file called "Results" and individual tif files.
  in each of the Cropped Cell folders corresponding to each individual fragment. 
 
How to use this macro:
------------------------
1. Click run to execute the macro.
2. Select the folder containing single cells stacks, MitoGraph output files, and files created after
   executing macro_mito_fragment.ijm i.e. Results.csv and tif files corresponding to each individual mitochondrial fragment.  
3. Two CSV files named as "MitoFrag_" and "MitoFrag_R_" would be generated
   containing the Green and Red intensity data such as Area, IntDen, RawIntDen, etc. 
   corresponding to each fragment previously identified. 
