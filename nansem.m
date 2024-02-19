function Y = nansem(X,dim_)

arguments
    X double
    dim_ (1,1) int8 = 1
end

Y = nanstd(X)./sqrt(sum(~isnan(X),dim_));