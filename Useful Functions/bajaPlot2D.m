function [fh, fit_line] = bajaPlot2D(xData, yData, xDataName, yDataName, names, style)

fh = figure;
plot(xData, yData, style);

 % storing points in array for output
   compGraph = [xData, yData];
    
 % marking data points with at least one value of 0
   outliers = ~sum(compGraph' == 0)';
    
 % erasing these 0 points because they mess up regression
   compGraphClean = compGraph(outliers(:), :);
    
 % splitting up clean data
   xDataClean = compGraphClean(:, 1);
   yDataClean = compGraphClean(:, 2);
    
   hold on
  % generating and plotting linear regression to clean data
   fit_line = fitlm(xDataClean, yDataClean)
   plot(fit_line);
    
  % naming
   xlabel(xDataName);
   ylabel(yDataName);

dcm = datacursormode(fh);
datacursormode on
set(dcm, 'updatefcn', {@bajaCallback2D,xDataName, yDataName, names})
