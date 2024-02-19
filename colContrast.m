function colorMap = colContrast(color,nLevels,low,high)

arguments
    color (1,3) double
    nLevels int8
    low  double = .3 %{mustBeInRange(0,1)}
    high double = 1  %{mustBeInRange(0,1)}
end

colorMap = color.*linspace(low,high,nLevels)' + [1 1 1].*(1-linspace(low,high,nLevels))';