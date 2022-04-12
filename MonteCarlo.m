% 使用蒙特卡洛法对机器人工作空间进行仿真分析
f = figure;

hold on

N = 10000;   % 随机次数

theta1=theta1min+(theta1max-theta1min)*rand(N,1); %关节1限制
theta2=theta2min+(theta2max-theta2min)*rand(N,1); %关节2限制
theta3=theta3min+(theta3max-theta3min)*rand(N,1); %关节3限制
theta4=theta4min+(theta4max-theta4min)*rand(N,1); %关节4限制
theta5=theta5min+(theta5max-theta5min)*rand(N,1); %关节5限制


for n=1:N
q = zeros(1,5);
q(1) = 0;
q(2) = theta2(n);
q(3) = theta3(n);
q(4) = theta4(n);
q(5) = theta5(n);
endpoint = robot.fkine(q);
plot3(endpoint.t(1),endpoint.t(2),endpoint.t(3),'b.','MarkerSize',0.5);
end
