# Mitochondrial_Fragments
Identify fragments in the mitochondrial network and measure the intensity of the individual mitochondrial fragments

Macro_mito_fragment:

// This macro is used to identify connected regions (Fragments) in the mitochondrial network.
//
// BEFORE USING THIS MACRO:
// ------------------------
// 1. Use GenFramesMaxProjs.ijm macro to generate a z-stack, 
//    where each slice corresponds to the max projection of a z-stack. A file named MaxProjs.tif will be created inside the chosen folder. 
//    GenFramesMaxProjs.ijm macro available at 
//    https://github.com/vianamp/MitoGraphTools/blob/master/README.md#genframesmaxprojsijm
// 2. Use CropCells.ijm macro to create single cells z-stacks to be used as imput for MitoGraph.
//    CropCells.ijm macro available at
//    https://github.com/vianamp/MitoGraphTools/blob/master/README.md#cropcellsijm
// 3. Perform Mitograph and save all the output files in the RootFolder 
//    containing the cropped cell images.
//
// USING THIS MACRO:
// ------------------------
// 1. Click run to execute the macro.
// 2. Select the folder containing the MitoGraph output files including "_binary.tif" and cropped single cell image in "tif" format.
// 3. A csv file called "Results" will be created in each of the Cropped Cell folder.
// 4. A separate .tif file will be created corresponding to each fragment identified from the MitoGrpah output i.e. "_binary.tif" file.
// ==========================================================================


Macro_mito_fragment:
