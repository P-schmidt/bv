function learn(reducedTrain, reducedTest)
%     imagestruct = [data{:}];
%     positions = vertcat(imagestruct.position);
    binArray = (1:size(reducedTest, 2));
    i = 1;
    for testImage = reducedTest
       [~, sim, ~] = similarity(reducedTrain, testImage, 1);
       if sim <= 150
           binArray(i) = 1;
       else
           binArray(i) = 0;
       end
       i = i+1;
    end
    accuracy = mean(binArray)
end