function [prob] = prob_normal_distribution(a,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    prob = (1/sqrt(2*pi*b))*exp(-0.5*((a^2)/(b)));

end

