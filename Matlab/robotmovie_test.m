Arm;
line_3
theta0=[0,-pi/2,-pi/2,-pi/2,0];
steps = 200;

thetaNow = theta0;

servoSpeed = 0.08;
k=1;
rbtlength = [robot.a(3),robot.a(4) robot.d(5)];
    position=[l_rho(k) pi/2-l_theta l_phi];
    arm234Target = invK_R3(position, robot.d(1), rbtlength);
    thetaTarget = [l_phi,arm234Target,0]; 
set(gca, 'nextplot','replacechildren');
set(gcf,'Position',[0 0 600 600])
for j=1:steps
if k==length(l_rho(:))
    break;
elseif all(thetaNow==thetaTarget)
    k=k+1;
    position=[l_rho(k) pi/2-l_theta l_phi];
    arm234Target = invK_R3(position, robot.d(1), rbtlength);
    if(arm234Target==[0 0 0])
        break;
    end
    thetaTarget = [l_phi,arm234Target,0]; 
end

for i=1:5
    thetaNow(i)=progr(thetaNow(i),thetaTarget(i),servoSpeed);
end
robot.plot(thetaNow);

view(10,15)
axis([-50 500 -50 500 -100 400])
drawnow
F(j)=getframe;
end
hold off


 avi1=VideoWriter('robot.avi');
 avi1.FrameRate=6;
 open(avi1);
 writeVideo(avi1,F);
 close(avi1)