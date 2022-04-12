l_rho = linspace(200,500);
l_theta=pi/3;
l_phi=0;

x=l_rho*sin(l_theta)*cos(l_phi);
y=l_rho*sin(l_theta)*sin(l_phi);
z=l_rho*cos(l_theta);

plot3(x,y,z);
clear x y z

