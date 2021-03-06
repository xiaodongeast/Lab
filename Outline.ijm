// change all the current selections into the bands
// xiaodong @ Gannon Lab
// warning: I did not take care of the boundary.........
w=getWidth();
h=getHeight();
currentImg=getTitle();

count=roiManager("count");

newImage("showResult_N.tif", "8-bit black", w, h,1);
newImage("showResult_B.tif", "8-bit black", w, h,1);

selectWindow("showResult_N.tif");
for (ii=0;ii<count;ii++)
{roiManager("select",ii);
run("Fill");
}


selectWindow(currentImg);
for (ii=0;ii<count;ii++)
{roiManager("select",ii);
run("Enlarge...", "enlarge=2 pixel"); // change this the distance to the nucleus.
run("Make Band...", "band=0.5");; // change band size to the desired number
roiManager("Update");
write(ii);
}


selectWindow("showResult_B.tif");
for (ii=0;ii<count;ii++)
{roiManager("select",ii);
run("Fill");
}

run("Merge Channels...", "c1=showResult_N.tif c2=showResult_B.tif create ignore");

write("done!!!");