# NCAA-Colors
Excel and MATLAB files to analyse the team colors of the NCAA

## Excel File
This file has data for all NCAA Division 1 teams. The information was compiled secondhand from a variety of aggregation sites listed in the first sheet of the Excel file. Where gaps existed in the data, I went to the University Brand websites to find the missing information.

Colors are presented using the 8 bit RBG color scheme defined from 0-255. Each teams primary/secondary and accent colors are included as both RGB values and with colored boxes generated using VBA.

Towards the right on the second sheet are input fields. You can put in colors for a real or made up team. For example, input data for your highschool. Then you can sort the `Min` column to find the most similar college teams. The similarity metric used is presented in the whitepaper here, https://www.compuphase.com/cmetric.htm

![Similar to Iowa](/Iowa.png)

The colorref sheet presents counts of colors grouped together. This uses a naive approach of fixed boundaries. This approach works well for computer vision, but human eyes do not work in the same manner. Some colors which may be similar to a human eye may seem different to a computer and vice-versa.

![Naive color grouping](/colorref.png)


## MATLAB File

The primary color data should be imported from the Excel document and labeled as variable `aPrimary`. The secondary color data should be imported from the Excel document and labeled as `aSecondary`.

With this data, run the file. The document was primarily for development and testing, so the code contains redundancies and minimal comments. 

Figure 1 shows all of the primary and secondary colors and clustered colors using the human vision algorithm. Figure 2 shows the same data but with clustered data from the computer vision algorithm. Figure 3 shows how many data points belong to each clustered point. Figure 4 shows a pie chart of how common each color is. Figure 5 shows why equidistant color points will not work well for binning. Figure 6 shows the colors without any overlay.

![Figure 1](/fig1.png)

![Figure 4](/fig4.png)

Lines 5-7
```
%A = aPrimary;
%A = aSecondary;
A = [aPrimary ; aSecondary];
```
If you want to see data specifically for just primary or just secondary color change which lines are commented, such that only the desired data is uncommented.

Line 9
```
clusterP = 27;
```
This is the clustering for the data. 27 will be the number of clustered data points. Change this value smaller or larger to change the number of points. 27 was chosen for example since this is a 3x3 grid. Smaller and larger values will also work well and present interesting data.
