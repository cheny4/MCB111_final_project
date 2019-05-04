function mutants = culturesim(mu)

k = round(1/mu);
matrix = zeros(13107200,1);
matrix(1:100,1) = ones(100,1);

for j = 1:17
    currpos = 1;
    for i = 1:13107200
        if matrix(i,j) == 1
            matrix(currpos,j+1) = 1;
            num = randi(k);
            if num == 1
                matrix(currpos+1,j+1) = 2;
            else
                matrix(currpos+1,j+1) = 1;
            end
            currpos = currpos + 2;
        elseif matrix(i,j) == 2
            matrix(currpos,j+1) = 2;
            matrix(currpos+1,j+1) = 2;
            currpos = currpos + 2;
        end
    end
end

matrixstar = matrix(:,18) - 1;
mutants = sum(matrixstar,'all');
end