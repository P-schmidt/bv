%% Generate random data for test (van wikipedia, dus voor test)
data = 150*(2*rand(2,100)-1);
data = data.*rand(2,100);
ransac(data,2,100,10,20)