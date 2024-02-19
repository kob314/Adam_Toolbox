function pdf = betapdf2(x,p1,p2,options)

arguments
    x double  {mustBeInRange(x,0,1)}
    p1 double {mustBePositive}
    p2 double {mustBePositive}
    options.param (1,1) string = 'standard' %(meanN,modeN)
end

pdf = nan;

switch options.param
    case 'standard'
        alpha = p1;
        beta  = p2;
    case 'meanN'
        m = p1;
        N = p2;
        alpha = m.*N;
        beta  = (1-m).*N;
    case 'modeN'
        m = p1;
        N = p2;
        if N > 2
        alpha = m*(N-2)+1;
        beta  = N-alpha;

        alpha = max(1,m*(N-2)+1);
        beta  = max(N-alpha,1);

        else
            'N must be greater then two for this parametrization!'
            return
        end
end

% min(alpha(:))
% min(beta(:))
% min(alpha(:)+beta(:))

lpdf = log(x).*(alpha-1)+log(1-x).*(beta-1);
pdf = exp( lpdf + gammaln(alpha+beta) - gammaln(alpha) - gammaln(beta) );