function ac = simpleautocorr(x,p)

ac = zeros(p+1,1);
n = size(x,1);
bottomsum = zeros(n,1);
avg = mean(x);
for i=1:n
    bottomsum(i) = (x(i)-avg).^2;
end

for lag= 0:p
    topsum=zeros(n-lag, 1);
    for i=1:(n-lag)
        topsum(i) = (x(i) - avg)*(x(i+lag)-avg); 
    end
    top = sum(topsum);
    bottom = sum(bottomsum);
    ac(lag+1) = (top/bottom);
end
end
