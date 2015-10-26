%=============================================================================
% function plot_plf(u)
% - input: u
%       u: piecewise linear function to be plotted
% - output: plot
%=============================================================================
function plot_plf(u)

% extract m
m = length(u);

% compute values along interval
x = linspace(0, 1, m);

% plot
figure;
stairs(x, u);
axis([0 1 min(u)-1 max(u)+1])
