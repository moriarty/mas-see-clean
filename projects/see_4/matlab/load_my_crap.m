function [p_v, p_w, start_poses, end_poses, vs] = load_my_crap(file_str)
    from_file = load(file_str);
    % put data in x,y,theta,timestamp form
    SNames = fieldnames(from_file);
    data_FULL = from_file.(SNames{1});
    starts = data_FULL(1:2:end, [2 3 5]);
    starts_ts = data_FULL(1:2:end, 1) * 10^-9;

    ends = data_FULL(2:2:end, [2 3 5]);
    ends_ts = data_FULL(2:2:end, 1) * 10^-9;

    start_poses = [starts starts_ts];
    end_poses = [ends ends_ts];

    vs = zeros(length(start_poses), 2);

    for i=1:length(start_poses)
        [vs(i,1), vs(i,2)] = compute_velocity(start_poses(i,:), end_poses(i,:));
    end
    p_v = mle(vs(:,1),'dist','normal');
    p_w = mle(vs(:,2),'dist','normal');
end
% data = zeros(10, 3);
% for i=1:10
%     [data(i,1), data(i,2), data(i,3)] = motion_model_velocity(end_poses(i,:),vs(i,:),start_poses(i,:));
% end