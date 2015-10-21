function plot_plf(u)

close all;

% extract m
m = length(u);

% compute values along interval
x = linspace(0, 1, m);

% plot
figure;
stairs(x, u);
axis([0 1 min(u)-1 max(u)+1])
