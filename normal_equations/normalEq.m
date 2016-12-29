dataSet = load('e:/math/data/in1.txt'); 

[m,n] = size(dataSet);
y = dataSet(:,n);
x = [ones(m, 1), dataSet(:,1)];
transpX = transp(x);
theta = transpX*x\transpX*y;
disp(theta)

input = 120;
output = theta(1) + theta(2) * input;
disp(output);
disp(x);

figure;
plot(min(x(:, 2)):max(x(:, 2)), theta(1) + theta(2) * (min(x(:, 2)):max(x(:, 2))));
hold on;
plot(x(:, 2), y, 'rx', 'MarkerSize', 10); 





