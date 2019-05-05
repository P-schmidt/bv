% %The function below creates the projection matrix.
function  bestmodel = ransac(data, s, N, T, d)
   iterations = 0;
   
   %Plot data is van wikipedia, dus alleen voor te testen.
   figure;plot(data(1,:),data(2,:),'o');hold on;
   
   
   bestfit = [ ];
   parameter1 = 0;
   parameter2 = 0;
   while iterations < N
       close =[ ];
       
       %Random sample
       random_number = randi([1 size(data, 2)],1, s);
       sample = data(:,random_number);
       x = sample(1,:);
       y = sample(2,:);
       
       %Calculate least square model fit
       fit = polyfit(x,y,1);
       line_fit = fit(1)*x+fit(2);
       
       %distance to model, nog niet zeker hoe dat moet naar de line_fit
       %voor elk punt, maar nu komt er wel wat uit, alleen is de distance
       %voor alle punten heel groot, dus moest ik ook een grote d meegeven
       %in de argumenten. Hoort eigenlijk kleiner te zijn.
       for point = data
           
           %Find two points on line:
           y1 = polyval(line_fit,-2);
           y2 = polyval(line_fit,15);
           point1 = [-2; y1];
           point2 = [15; y2];

           %Calculate distance to line.
           dis = norm((point-point1)-dot((point-point1),(point2-point1))/dot((point2-point1),(point2-point1))*(point2-point1));
           
           %If distance point to line is smaller than d, append to close.
           if dis < d
               close = [close, point];
           end
       end
       
       %Check number of elements in close. If bigger then we have a good
       %model and create a new model fit with all the data points in close.
       if numel(close) > T
           xx = close(1,:);
           yy = close(2,:);
           fit2 = polyfit(xx,yy,1);
           line_fit2 = fit2(1)*xx+fit2(2);
           
           %Check if current model is better than best model and save the parameters.
           if numel(close) > numel(bestfit)
               bestfit = close;
               parameter1 = fit2(1);
               parameter2 = fit2(2);
           end
       end    
       iterations = iterations + 1;
   end
   bestmodel = [parameter1, parameter2];

 %% Plot the best fitting line (is een stukje code van wiki, dus alleen om te testen voor nu)
 xAxis = -size(data, 2)/2:size(data, 2)/2; 
 yAxis = parameter1*xAxis + parameter2;
 plot(xAxis,yAxis,'r-','LineWidth',2);
end