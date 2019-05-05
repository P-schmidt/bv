% %The function below creates the projection matrix.
function  bestmodel = ransac(data, s, N, T, d)
   iterations = 0;
   bestmodel = [ ];
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
       %voor elk punt.
       for point = data
           pointx = point(1);
           pointy = point(2);
          
           
           
           if dis < d
               close = [close, point];
           end
       end
      
       
       %Check number of elements in close. If bigger then we have a good
       %model en maak dan weer een nieuwe fit gebaseerd op alle data
       %punten.
       if numel(close) > T
           xx = close(1,:);
           yy = close(2,:);
           fit2 = polyfit(xx,yy,1);
           line_fit2 = fit2(1)*xx+fit2(2);
           if numel(close) > numel(bestmodel)
               bestmodel = close;
           end
       end
       
       %Check if model is better than best model
       
       
       
    
       iterations = iterations + 1;
   end
end