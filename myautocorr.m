function ac = myautocorr(x,p)

ac = zeros(p+1,1);
n = size(x,1);

for lag= 0:p
    mplus = mean(x(1:n-lag));
    mminus = mean(x(1+lag:end));
    topsum=zeros(n-lag, 1);
    bottomsum1 = zeros(n-lag,1);
    bottomsum2 = zeros(n-lag,1);
    for i=1:(n-lag)
        topsum(i) = (x(i) - mminus)*(x(i+lag)-mplus); 
        bottomsum1(i) = (x(i+lag) - mminus).^2;
    end
    for i=lag+1:n
        bottomsum2(i) = (x(i)-mplus).^2;
    end
    
    top = sum(topsum);
    bottom = sum(bottomsum1) * sum(bottomsum2);
    ac(lag+1) = (top/sqrt(bottom));
end
end
