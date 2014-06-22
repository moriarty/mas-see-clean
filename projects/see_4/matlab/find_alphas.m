%
% Find Alphas. SEE Assignment
% Requires scripts: load_my_crap.m, compute_velocity.m, compute_alpha.m
%


fwd_v = zeros(3,2);
fwd_w = zeros(3,2);

[fwd_v(1,:), fwd_w(1,:), fwd1_start, fwd1_end, fwd1_vs] = ...
    load_my_crap('fwd1_FULL.mat');
[fwd_v(2,:), fwd_w(2,:), fwd2_start, fwd2_end, fwd2_vs] = ...
    load_my_crap('fwd2_FULL.mat');
[fwd_v(3,:), fwd_w(3,:), fwd15_start, fwd15_end, fwd15_vs] = ...
    load_my_crap('fwd15_FULL.mat');

left_v = zeros(2,2);
left_w = zeros(2,2);

[left_v(1,:), left_w(1,:), left1_start, left1_end, left1_vs] = ...
    load_my_crap('left1_FULL.mat');
[left_v(2,:), left_w(2,:), left2_start, left2_end, left2_vs] = ...
    load_my_crap('left2_FULL.mat');

right_v = zeros(2,2);
right_w = zeros(2,2);

[right_v(1,:), right_w(1,:), right1_start, right1_end, right1_vs] = ...
    load_my_crap('right1_FULL.mat');
[right_v(2,:), right_w(2,:), right2_start, right2_end, right2_vs] = ...
    load_my_crap('right2_FULL.mat');

[alpha_1, alpha_2] = compute_alpha(fwd_v(:,1),fwd_w(:,1),fwd_v(:,2));

[alpha_3, alpha_4] = compute_alpha([left_v(:,1); right_v(:,1)], ...
                    [left_w(:,1); right_w(:,1)], ...
                    [left_w(:,2); right_w(:,2)]);
alpha_5 = 1.0;
alpha_6 = 1.0;

p = zeros(length(fwd1_start), 7);
for i=1:length(fwd1_start)
    p(i,1) = motion_model_velocity(fwd1_end(i,:),fwd1_vs(i,:), ...
        fwd1_start(i,:), alpha_1, alpha_2, alpha_3, alpha_4);
end

for i=1:length(fwd2_start)
    p(i,2) = motion_model_velocity(fwd2_end(i,:),fwd2_vs(i,:), ...
        fwd2_start(i,:), alpha_1, alpha_2, alpha_3, alpha_4);
end

for i=1:length(fwd15_start)
    p(i,3) = motion_model_velocity(fwd15_end(i,:),fwd15_vs(i,:), ...
        fwd15_start(i,:), alpha_1, alpha_2, alpha_3, alpha_4);
end

for i=1:length(left1_start)
    p(i,4) = motion_model_velocity(left1_end(i,:),left1_vs(i,:), ...
        left1_start(i,:), alpha_1, alpha_2, alpha_3, alpha_4);
end


for i=1:length(left2_start)
    p(i,5) = motion_model_velocity(left2_end(i,:),left2_vs(i,:), ...
        left2_start(i,:), alpha_1, alpha_2, alpha_3, alpha_4);
end


for i=1:length(right1_start)
    p(i,6) = motion_model_velocity(right1_end(i,:),right1_vs(i,:), ...
        right1_start(i,:), alpha_1, alpha_2, alpha_3, alpha_4);
end

for i=1:length(right2_start)
    p(i,7) = motion_model_velocity(right2_end(i,:),right2_vs(i,:), ...
        right2_start(i,:), alpha_1, alpha_2, alpha_3, alpha_4);
end




