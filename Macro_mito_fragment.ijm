// ==========================================================================
// Abdul Haseeb Khan - khan.ncu@outlook.com - 03.10.2023
// ==========================================================================
//
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

_RootFolder = getDirectory("Choose a Directory");
_List = getFileList(_RootFolder);
roiManager("Reset");
for (a = 0; a < _List.length; a++)  {
{
item = 0;
num_frag = 0;

while (item < _List.length)  {
if (endsWith(_List[item],"cropCells/")) {num_frag++;}
item++;
}
cropcells = 0;
item = 0;

print(_RootFolder+_List[item]);
print(num_frag);
Analysis_Folder = File.getName(_RootFolder);

for(cropcells=0; cropcells<num_frag; cropcells++){ 
//while (item < _List.length)  {
//if ( endsWith(_List[item],"binary.tif") ) {
//substring(_List[item], 0, 1)
//indexOf(1, _List[item])
openBinaryfile = Analysis_Folder+"_R_binary.tif";

open(_RootFolder+cropcells+"_"+openBinaryfile);

run("Find Connected Regions", "allow_diagonal display_image_for_each display_results regions_for_values_over=100 minimum_number_of_points=1 stop_after=-1");
j = nResults;

File.makeDirectory(_RootFolder+cropcells+"_cropCells");

saveAs("Results", _RootFolder+cropcells+"_cropCells/Results.csv");
run("Close");


for (i = 0; i < j; i++) {
saveAs("Tiff", _RootFolder+cropcells+"_cropCells/MitoFrag_"+j-i-1+".tif");
close();
}
}
close();
close();
close();
close("*");

