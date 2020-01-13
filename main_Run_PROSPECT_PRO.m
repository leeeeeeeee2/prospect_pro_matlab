% ********************************************************************************
% main routine to generate leaf optical properties using PROSPECT-PRO
% ********************************************************************************
% _______________________________________________________________________
% for any question or request, please contact: 
%
% Jean-Baptiste FERET
% UMR-TETIS, INRAE Montpellier
% Maison de la Télédétection
% 500 rue Jean-Fracois Breton
% 34093 Montpellier cedex 5
% E-mail: jb.feret@teledetection.fr
% _______________________________________________________________________
% ********************************************************************************
% Main script running with PROSPECT-PRO (7 January 2020, PROSPECT v7.0)
% ********************************************************************************

% load optical constants
data    = dataSpec_PRO;
lambda  = data(:,1);    nr      = data(:,2);
Kab     = data(:,3);    Kcar    = data(:,4);
Kant    = data(:,5);    Kbrown  = data(:,6);
Kw      = data(:,7);    Km      = data(:,8);
Kprot   = data(:,9);    KCBC    = data(:,10);

% load biochemistry and structure variables
% N      = 1.2		% structure coefficient
% Cab    = 30.		% chlorophyll content (µg.cm-2) 
% Car    = 10.		% carotenoid content (µg.cm-2)
% Anth   = 1.		% Anthocyanin content (µg.cm-2)
% Cbrown = 0.0		% brown pigment content (arbitrary units)
% Cw     = 0.015	% EWT (cm)
% Cm     = 0.009	% LMA (g.cm-2)
% Prot   = 0.001	% Protein content (g.cm-2)
% CBC    = 0.009	% Carbon-based constituents (g.cm-2)
load('leaf_parameter.txt');
N     = leaf_parameter(1); Cab   = leaf_parameter(2);
Car   = leaf_parameter(3); Ant   = leaf_parameter(4); 
Brown = leaf_parameter(5);
Cw    = leaf_parameter(6); Cm    = leaf_parameter(7);
Prot  = leaf_parameter(8); CBC   = leaf_parameter(9);

LRT     = prospect_PRO(lambda,N,Cab,Car,Ant,Brown,Cw,Cm,Prot,CBC,...
                        nr,Kab,Kcar,Kant,Kbrown,Kw,Km,Kprot,KCBC);
dlmwrite('leaf_spectrum.txt',LRT,'delimiter','\t')