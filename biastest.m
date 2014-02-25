function [t_b, t_ub] = biastest()
X = [1:100];                 
testStatistic = (1/100)*sum((X-mean(X)).^2)

for i = 1:10
  x = randsample(100,10,true);    % A sample
  b = (1/10)*sum((x-mean(x)).^2); % un-biased estimate
  bu = (1/9)*sum((x-mean(x)).^2); % biased estimate
  B(i) = b;
  Bu(i) = bu;
end
t_b = (mean(B) - testStatistic)/(std(B)/sqrt(10));
t_ub = (mean(Bu) - testStatistic)/(std(Bu)/sqrt(10));
end
