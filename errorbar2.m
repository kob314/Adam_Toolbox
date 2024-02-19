function eh = errorbar2(X,Y,YS,color,alpha,options)

arguments
    X double
    Y double
    YS double
    color (:,3) double = [.5 .5 .5]
    alpha double = .3
    options.LineWidth (1,1) double = 3
    options.LineStyle (1,1) string = '-'
    options.AddLine (1,1) int8 = 1
end

X = X(:)';
Y = Y(:)';
YS = YS(:)';

if ~isempty(Y)
    no_nan = ~isnan(X+Y);

    if sum(no_nan) > 1
        eh(2) = fill([X(no_nan) fliplr(X(no_nan))],[Y(no_nan)-YS(no_nan) fliplr(Y(no_nan)+YS(no_nan))],color,'FaceAlpha',alpha,'EdgeColor','none');
        hold on
        if options.AddLine
            eh(1) = plot(X(no_nan),Y(no_nan),'Color',color,'LineWidth',options.LineWidth,'LineStyle',options.LineStyle,'Marker','none');
        end
    end
end




% % %% old
% arguments
%     X double
%     Y double
%     YS double 
%     color (1,3) double = [.5 .5 .5] %{mustBeInRange(0,1)}
%     alpha (1,1) double = .3 %{mustBeInRange(0,1)}
% end
% 
% X = X(:)';
% Y = Y(:)';
% YS = YS(:)';
% 
% no_nan = ~isnan(X+Y);
% 
% eh = fill([X(no_nan) fliplr(X(no_nan))],[Y(no_nan)-YS(no_nan) fliplr(Y(no_nan)+YS(no_nan))],color,'FaceAlpha',alpha,'EdgeColor','none');
