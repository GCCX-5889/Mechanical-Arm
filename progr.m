function after = progr(now, target, speed)
%
if(abs(target-now)<speed)
    after = target;
else
    after = now+speed*(target-now)/abs(target-now);
end
end