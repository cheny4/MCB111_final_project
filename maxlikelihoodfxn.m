function out = maxlikelihoodfxn(m,maxcolonies,matrix)
%given a rate m (mutation events per culture), calculates the probability
%that you get the empirical results you put in matrix.
totalcultures = sum(matrix,'all');

initialprobability(1) = exp(-m);
for r = 2:maxcolonies
    runsum = 0;
    for i = 0:r-1
        runsum = runsum + (matrix(i+1)/totalcultures) / ((r-1) - i + 1);
    end
    initialprobability(r) = (m/(r-1)) * runsum;
end

runprod = 1;
for s = 1:maxcolonies
    runprod = runprod * (initialprobability(s)^matrix(s));
end

out = runprod;
end