clc 
clear


X=load('x.dat');   % load in data points along X
Y=load('y.dat');   % load in data points along Y
VBM=load('eig_27.dat');   % load in Z values


xlat=0.298735278;    % value of lattice constant along Kx in reciprocal space...can be obtained from VASP output
ylat=2*0.181098765;  % value of lattice constant along Ky in reciprocal space...can be obtained from VASP output
R1=xlat; 
R2=ylat;



view([0,270]);


[xi2,yi2]=meshgrid(-1.3:0.01:1.3,-1.3:0.01:1.3);   %create a mesh of points

Z1=griddata(X,Y,VBM,xi2,yi2);   %interpolate data between gridpoints (X,Y) and (xi2,yi2)

surf(xi2,yi2,Z1)   %create figure
hold on

%%%generate a hexagon to overlay with the graph...the hexagon is the same shape and size of the first Brillouin zone%%%

R=0.21;
numEdges = 6; 
xVertex = R * cos((0:6)*pi/3);   
yVertex = R * sin((0:6)*pi/3);
xVertex = [xVertex , xVertex(1)];
yVertex = [yVertex , yVertex(1)];

%%%Plotting Commands%%%

view([0,270]);
xlabel('$\it{k}_{x} (\textrm{1/\AA})$','Interpreter','latex','FontSize',24,'FontName','Helvetica');
ylabel('$\it{k}_{y} (\textrm{1/\AA})$','Interpreter','latex','fontSize',24,'FontName','Helvetica');
zlabel('Energy (eV)')
 
xlim([-xlat xlat])
ylim([-ylat ylat])

xt = get(gca, 'XTick');
set(gca,'FontSize', 20)
set(gca,'FontName','Helvetica')


axis vis3d
shading interp;
colormap(hot);
c=colorbar;
c.Label.String = 'Energy (eV)';
c.Label.FontSize = 24;
c.Label.FontName = 'Helvetica';
caxis([1.3 2.4])
title('WS2 0% CBM')


hold off
