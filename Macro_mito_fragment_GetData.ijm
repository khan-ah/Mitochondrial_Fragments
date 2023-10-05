// ==========================================================================
// Abdul Haseeb Khan - khan.ncu@outlook.com - 03.10.2023
// ==========================================================================
//
// This macro is used to to measure the intensity of Green and Red 
// Florescene for each mitochondrial fragment.
//
// BEFORE USING THIS MACRO:
// ------------------------
// 1. Use the macro_mito_fragment.ijm to identify mitochondrial fragments 
//  from the MitoGraph generated _binary.tif files. 
//  This will create a csv file called "Results" and individual tif files.
//  in each of the Cropped Cell folder corresponding to each individual fragment. 
// 
// USING THIS MACRO:
// ------------------------
// 1. Click run to execute the macro.
// 2. Select the folder containing single cells stacks, 
//  MitoGraph output files, and files created after executing 
//  macro_mito_fragment.ijm i.e. Results.csv and tif files 
//  corresponding to each individual mitochondrial fragment.  
// 3. Two csv files named as "MitoFrag_" and "MitoFrag_R_" would be generated
//  containg the Green and Red intensity data such as Area, IntDen, RawIntDen etc. 
//  corresponding to each fragment previously identified. 
// ==========================================================================

run("Set Measurements...", "area mean modal min integrated median kurtosis display redirect=None decimal=3");

_RootFolder = getDirectory("Choose a Directory");
_List = getFileList(_RootFolder);
print("\\Clear"); //empties the Log 
item = 0;
num_cell = 0;

while (item < _List.length)  {
if ( endsWith(_List[item],"cropCells/") ) {num_cell++;}
item++;
}
print(num_cell);

for (i = 0; i < num_cell; i++) {

_RootFolder1 = _RootFolder+i+"_cropCells/";
_List = getFileList(_RootFolder1);

All_num_frag = 0;
G_num_frag = 0;
R_num_frag = 0;
BF_num_frag = 0;
M_num_frag = 0;

item1 = 0;
while (item1 < _List.length)  {
if ( endsWith(_List[item1],"tif") ) {All_num_frag++;}
if ( endsWith(_List[item1],"G.tif") ) {G_num_frag++;}
if ( endsWith(_List[item1],"R.tif") ) {R_num_frag++;}
if ( endsWith(_List[item1],"BF.tif") ) {BF_num_frag++;}
if ( endsWith(_List[item1],"M.tif") ) {M_num_frag++;}

item1++;
}
num_frag = All_num_frag - G_num_frag - R_num_frag-BF_num_frag-M_num_frag;
print(num_frag);

for (j = 0; j < num_frag; j++) {

setBatchMode(true);	//makes everything run faster
Analysis_Folder = File.getName(_RootFolder);

openGFPfile = _RootFolder+i+"_cropCells/"+i+"_"+Analysis_Folder+"_G.tif";
openRFPfile = _RootFolder+i+"_"+Analysis_Folder+"_R.tif";
open(openGFPfile);
open(openRFPfile);

open(_RootFolder+i+"_cropCells/MitoFrag_"+j+".tif");
setOption("BlackBackground", false);
run("Convert to Mask", "method=Default background=Default calculate");
slice = nSlices;

for (k = 0; k < slice; k++) {

selectWindow("MitoFrag_"+j+".tif");

setSlice(k+1);
run("Create Selection");
roiManager("Add");
selectWindow(i+"_"+Analysis_Folder+"_R.tif");
roiManager("Select", k);
//run("Clear", "slice");
//run("Select All");

run("Measure");
}

saveAs("Results", _RootFolder+i+"_cropCells/MitoFrag_R_"+j+".csv");
close("Results");
selectWindow(i+"_"+Analysis_Folder+"_R.tif");
close();

close("ROI Manager");

for (m = 0; m < slice; m++) {

selectWindow("MitoFrag_"+j+".tif");

setSlice(m+1);
//run("Select None");
run("Create Selection");
roiManager("Add");
open(openGFPfile);
setSlice(m+1);

makeRectangle(0, 0, 150, 150);
run("Copy");
makeRectangle(1, 0, 150, 150);
run("Paste");

roiManager("Select", m);
//run("Clear", "slice");
//run("Select All");

run("Measure");
}

saveAs("Results", _RootFolder+i+"_cropCells/MitoFrag_"+j+".csv");
close("Results");

close("ROI Manager");
selectWindow("MitoFrag_"+j+".tif");
close();

setBatchMode(false);	//makes everything run faster

}
}
close("*");
print("done");