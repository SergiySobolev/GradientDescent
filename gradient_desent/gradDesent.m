dataSet = load('e:/math/data/in1.txt'); 
x = dataSet(:,1);
y = dataSet(:,2);



normalization = true;

% Applying mean normalization to our dataset

if (normalization)

    maxX = max(x);
    minX = min(x);
    x = (x - maxX) / (maxX - minX);

end

x = [ones(length(x), 1), x];

figure;

plot(x(:, 2), y, 'rx', 'MarkerSize', 10);

xlabel('Size ( squared meters )');

ylabel('Price');

title('Housing Prices');

parameters = [0; 0];

learningRate = 0.1;

repetition = 1500;

[parameters, costHistory] = gradient(x, y, parameters, learningRate, repetition);


input = 120;

output = parameters(1) + parameters(2) * input;

figure;

plot(min(x(:, 2)):max(x(:, 2)), parameters(1) + parameters(2) * (min(x(:, 2)):max(x(:, 2))));

hold on;

plot(x(:, 2), y, 'rx', 'MarkerSize', 10);

figure;

plot(costHistory, 1:repetition);

hold on;

input = 120;

if (normalization)
    input = (input - maxX) / (maxX - minX);
end

output = parameters(1) + parameters(2) * input;

disp(output);