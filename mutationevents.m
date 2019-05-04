function out = mutationevents(matrix)


numcultures = sum(matrix,'all');

%finds maxcolonies, the highest number of mutants that a culture had
holder = 1;
lengleng = length(matrix);
for k = 1:lengleng
    if matrix(k) ~= 0
        holder = k;
    end
end
maxcolonies = holder;

%makes initial guess
if matrix(1) ~= 0
    mguess = -log( matrix(1) / numcultures );
elseif matrix(1) == 0
    mguess = -log( 1 / numcultures );
end

% %initialprobability(1) = exp(-mguess);
% %for r = 2:maxcolonies
%   %  initrunsum = 0;
%  %   for i = 0:r-1
%  %       initrunsum = initrunsum + matrix(i+1) / ((r-1) - i + 1);
%     end
%     initialprobability(r) = (mguess/(r-1)) * initrunsum;
% end

mtable1 = mguess-10:1:mguess+10;
for s = 1:21
    firstmaxtable(s) = maxlikelihoodfxn(mtable1(s),maxcolonies,matrix);
    if mtable1(s) < 0
        firstmaxtable(s) = 0;
    end
end
firstprobrefinement = max(firstmaxtable,[],'all');
firstindex = find(firstmaxtable == firstprobrefinement);
firstmrefine = mtable1(firstindex);

mtable2 = firstmrefine-1:0.1:firstmrefine+1;
for s = 1:21
    secondmaxtable(s) = maxlikelihoodfxn(mtable2(s),maxcolonies,matrix);
    if mtable2(s) < 0
        secondmaxtable(s) = 0;
    end
end
secondprobrefinement = max(secondmaxtable,[],'all');
secondindex = find(secondmaxtable == secondprobrefinement);
secondmrefine = mtable2(secondindex);

mtable3 = secondmrefine-0.1:0.01:secondmrefine+0.1;
for s = 1:21
    thirdmaxtable(s) = maxlikelihoodfxn(mtable3(s),maxcolonies,matrix);
    if mtable3(s) < 0
        thirdmaxtable(s) = 0;
    end
end
thirdprobrefinement = max(thirdmaxtable,[],'all');
thirdindex = find(thirdmaxtable == thirdprobrefinement);
thirdmrefine = mtable3(thirdindex);

mtable4 = thirdmrefine-0.01:0.001:thirdmrefine+0.01;
for s = 1:21
    fourthmaxtable(s) = maxlikelihoodfxn(mtable4(s),maxcolonies,matrix);
    if mtable4(s) < 0
        fourthmaxtable(s) = 0;
    end
end
fourthprobrefinement = max(fourthmaxtable,[],'all');
fourthindex = find(fourthmaxtable == fourthprobrefinement);
fourthmrefine = mtable4(fourthindex);

mtable5 = fourthmrefine-0.001:0.0001:fourthmrefine+0.001;
for s = 1:21
    fifthmaxtable(s) = maxlikelihoodfxn(mtable5(s),maxcolonies,matrix);
    if mtable5(s) < 0
        fifthmaxtable(s) = 0;
    end
end
fifthprobrefinement = max(fifthmaxtable,[],'all');
fifthindex = find(fifthmaxtable == fifthprobrefinement);
fifthmrefine = mtable5(fifthindex);

out = fifthmrefine;
end
