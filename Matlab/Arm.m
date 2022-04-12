clc;
clear;

%             theta   d         a        alpha     offset
ML1 =  Link([ 0,    42,         0,          0,      0], 'modified');
ML2 =  Link([ 0,    0,          0,         pi/2,   0], 'modified');
ML3 =  Link([ 0,    0,          182.53,     0,      0], 'modified');
ML4 =  Link([ 0,    0,          119.80,     0,      0], 'modified');
ML2.offset=pi/2;
ML4.offset=pi/2;
ML5 =  Link([ 0,    80.5,      0,          pi/2,   0], 'modified');

% 角度限制
theta1min = -pi;    theta1max = pi;
theta2min = -pi/2;  theta2max = pi/2;
theta3min = -pi/2;  theta3max = pi/2;
theta4min = -pi/2;  theta4max = pi/2;
theta5min = -pi;    theta5max = pi;
ML1.qlim = [theta1min, theta1max];
ML2.qlim = [theta2min, theta2max];
ML3.qlim = [theta3min, theta3max];
ML4.qlim = [theta4min, theta4max];
ML5.qlim = [theta5min, theta5max];

robot = SerialLink([ML1 ML2 ML3 ML4 ML5],'name','Arm');



%robot.plot(theta0)

hold on
