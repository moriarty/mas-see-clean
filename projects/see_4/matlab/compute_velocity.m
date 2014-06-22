function [v,w] = compute_velocity(start_pose, end_pose)
    data_ = [start_pose(1), start_pose(2); ...
        end_pose(1), end_pose(2)];
    travelled_distance_ = pdist(data_);
    dt_ = end_pose(4) - start_pose(4);
    v = travelled_distance_ / dt_;
    w = (end_pose(3) - start_pose(3))/ dt_;
end