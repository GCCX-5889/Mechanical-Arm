function angle = invK_R3(position,offset,length)
%return theta of each joint
% position [rho theta phi]
% offset of first joint hight
% length [a b c] each length of connecting rod

y = position(1)*cos(position(2)) - offset;
x = position(1)*sin(position(2));
a = length(1); b=length(2); c=length(3);
p_squared = x.*x+y.*y; psi = atan(y/x); % psi is colatitude of p at coordinate based on first joint
if psi<0
    psi=pi/2-psi;
end
p = sqrt(p_squared);
if p_squared > (a+b+c)^2
    theta1 = 0;
    theta2 = 0;
    theta3 = 0;
elseif p_squared > a^2+(b+c)^2
    alpha = acos((a*a+p_squared-(b+c)^2)/(2*a*p));
    theta1 = psi-alpha;
    theta2 = alpha + acos(((b+c)^2+p_squared-a*a)/(2*(b+c)*p));
    theta3 = 0;
elseif p_squared > (a-c)^2+b*b
    a2=sqrt(b*b+c*c);
    alpha = acos((p_squared+a*a-a2*a2)/(2*a*p));
    theta1 = psi - alpha;
    theta2 = alpha + acos((-a*a+a2*a2+p_squared)/(2*p*a2)) - atan(c/b);
    theta3 = pi/2;
else
    theta1 = 0;
    theta2 = 0;
    theta3 = 0;
end
%adapt to the model
theta1=-theta1;
theta2=-theta2;
theta3=-theta3;
angle = [theta1 theta2 theta3];
end