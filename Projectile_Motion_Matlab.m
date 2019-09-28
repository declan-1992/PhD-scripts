%Projectile motion
%By Declan Scullion
m= input('Mass (kg): ');   %request user input for particle mass
A= input('Area (m^2): ');  %request user input for particle cross-sectional area
v0= input('Initial velocity(m/s): ');    %user input for initial velocity 
a= input('Angle of projection(in degrees): ');    %angle of projection
h= input('Time step (in seconds): ');     %time step to solve equations using Euler's method
rho=1.275; %air density
D=0.5;    %drag coefficient
a=a*pi/180;   %degrees to radians
g=9.81;    %gravitational constant 
y1=0;      %initial Y position
x1=0;      %initial X position
v0X=v0*cos(a);    %resolve velocity along X-direction
v0Y=v0*sin(a);    %resolve velocity along Y-direction
xmax=2*(v0^2*sin(2*a)/g);    %maximum possible range
ymax=2*(v0^2*sin(a)^2/(2*g));    %maximum possible height
figure('color','white');
aX=0;
aY=0;
td=8;    %length of time for simulation
for t=0:h:td+h

    x1=x1+v0X*h+(1/2)*aX*h^2; %calculate change in position along X-direction using Eurler's method
    y1=y1+v0Y*h+(1/2)*aY*h^2; %calculate change in position along Y-direction using Eurler's method
 
    plot(x1,y1,'bo')   %plot positions
    
    hold all
    xlim([0 4]);
    ylim([0 4]);
    title('Projectile Motion');
    xlabel('Distance in meters');
    ylabel('Height in meters');
    getframe;
    
    dragX=-0.5*D*rho*A*v0X^2;   %calculate drag force along X
    dragY=-0.5*D*rho*A*v0Y^2-m*g;    %calculate drag force along Y
    aX=dragX/m;    %calculate acceleration along X
    aY=dragY/m;    %calculate acceleration along X
    
    v0X=v0X+aX*h; %recalculate velocity along X-direction
    v0Y=v0Y+aY*h; %recalculate velocity along Y-direction
    if y1<0    %If particle falls below the line y=0, i.e. goes underground, then for loop stops
        break
    end    
end
