%% Import Script for ODF Data
%
% This script was automatically created by the import wizard. You should
% run the whoole script or parts of it in order to import your data. There
% is no problem in making any changes to this script.
clear all


%% Specify Crystal and Specimen Symmetries
% crystal symmetry
% CS = crystalSymmetry('432', [3.3 3.3 3.3]);
CS = crystalSymmetry('m-3m', [1 1 1], 'X||a',  'Z||c');
% specimen symmetry
% SS = specimenSymmetry('mmm'); % for ODF section of phi2
SS = specimenSymmetry('-1'); % for general PF

%%

% default figure size, possible values are a factor between 0 and 1 or
% 'tiny', 'small', 'normal', 'large', 'huge'
setMTEXpref('figSize','tiny');

%  plotting convention 
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','outofPlane');

% Removes x and y
pfAnnotations = @(varargin) 'do_nothing';
setMTEXpref('pfAnnotations',pfAnnotations);

% default spacing between muliple plots
setMTEXpref('outerPlotSpacing',10);
setMTEXpref('innerPlotSpacing',10);

% default fontsize
setMTEXpref('FontSize',30);
setMTEXpref('textInterpreter','LaTeX');

% Euler angle convention
setMTEXpref('EulerAngleConvention','Bunge')

% path to files
pname = pwd;
% which files to be imported
fname = [pname '\test.txt']; %Change file name here
% fname = [pname '\TEX_PH1.txt']; %Change file name here
% fname = [pname '\RX_GR.txt']; %Change file name here

%% Plot PF

% Import the Data    
odf = loadODF(fname,CS,SS,'density','halfwidth',8*degree,'resolution',10*degree,'interface','VPSC');    

    
%% Rotate Manually
% odf_rot = rotate(odf,rotation('axis',xvector,'angle',10*degree));
% odf_rot = rotate(odf,rotation('axis',yvector,'angle',0*degree))
odf_rot = rotate(odf,rotation('axis',yvector,'angle',0*degree))
odf_rott= rotate(odf_rot,rotation('axis',xvector,'angle',0*degree))

figure(1);
    
% plotPDF(odf_rot,[Miller(0,0,1,CS),Miller(1,1,0,CS),Miller(1,1,1,CS)],'projection','stereo',...
%         'minmax','on','colorrange',[0 6]); %,'colorrange',[0 10] %% Change for intensity 'colorrange',[0 1.5]
% %       annotate([xvector,yvector],'label',{'RD','TD'},'backgroundcolor','w');

% plotPDF(odf_rott,[Miller(0,0,1,CS),Miller(1,1,0,CS),Miller(1,1,1,CS)],'projection','stereo',...
%         'minmax','on','colorrange',[0.8 3]);
% 
plotPDF(odf_rott,[Miller(1,0,0,CS),Miller(1,1,0,CS),Miller(1,1,1,CS)],'projection','earea',...   !earea
        'minmax','on','colorrange',[0 4]); 
%     
% Contour Only:
% 
% plotPDF(odf_rott,[Miller(1,1,1,CS),Miller(1,0,0,CS)],'contour','projection','stereo',...
%         'minmax','on','colorrange',[0.6 7],'antipodal'); 
% 
% colormap hot    
% mtexColorMap red2yellow
% mtexColorbar  



% % %% EXTRACT VPSC TEXTURE:
% export_VPSC(odf_rott,'Al_Rolled.txt');
% % 
 % export_VPSC(odf_rott,'Cu_Rex_Tex_soft.txt','points',50)      %EXPORT BY POINTS (DON'T GIVE EXACT INTENSITY)
% %
% export_VPSC(odf_rott.components{1,1}.center,'Al_Rolled.txt','weights',odf_rott.components{1,1}.weights);

% %  %Check the intensity of exported texture:
%   pname = pwd;
%   fname1 = [pname '\Al_Rolled.txt']; %Change file name here
% % %  % Import the Data    
%   odff = loadODF(fname1,CS,SS,'density','halfwidth',8*degree,'resolution',10*degree,'interface','VPSC');
%   figure;
% % % 
%   plotPDF(odff,[Miller(0,0,1,CS),Miller(1,1,0,CS),Miller(1,1,1,CS)],'projection','stereo',...
%           'minmax','on','colorrange',[0 4]);    

%% IPF:
% figure;
% plotIPDF(odf_rott,[xvector, yvector,zvector],'antipodal','projection','earea',...   !earea
%           'minmax','on','colorrange',[0 3]); 
% 
% colormap (flipud(hot))    
% mtexColorMap yellow2red
% % mtexColorbar
% colorbar('Direction','reverse')

% %% ODF section
% figure(2);
% % plotSection(odf_rott,'phi2','sections',9,'minmax','on','colorrange',[0 5])  % IF " SS = specimenSymmetry('-1'); " IT GIVES FULL SECTION
% plotSection(odf_rott,'phi2','sections',18,'colorrange',[0 1])











