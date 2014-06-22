function [ prob ] = motion_model_velocity(final_pose, velocity_vector, start_pose, ...
    a_1, a_2, a_3, a_4, a_5, a_6)
    
    if nargin > 9;
        error('motion_model_velocity:TooManyInputs',...
            'requires 3 inputs, max 9')
    end

    default_alpha = 1.0;
    
    switch nargin
        case 3
            a_1 = default_alpha;
            a_2 = default_alpha;
            a_3 = default_alpha;
            a_4 = default_alpha;
            a_5 = default_alpha;
            a_6 = default_alpha;
        case 4
            a_2 = default_alpha;
            a_3 = default_alpha;
            a_4 = default_alpha;
            a_5 = default_alpha;
            a_6 = default_alpha;
        case 5
            a_3 = default_alpha;
            a_4 = default_alpha;
            a_5 = default_alpha;
            a_6 = default_alpha;
        case 6
            a_4 = default_alpha;
            a_5 = default_alpha;
            a_6 = default_alpha;
        case 7
            a_5 = default_alpha;
            a_6 = default_alpha;
        case 8
            a_6 = default_alpha;
    end
    
    
    x_ = final_pose(1);
    y_ = final_pose(2);
    th_ = final_pose(3);
    t_ = final_pose(4);
    
    v = velocity_vector(1);
    w = velocity_vector(2);
    
    x = start_pose(1);
    y = start_pose(2);
    th = start_pose(3);
    t = start_pose(4);

    num = ((x-x_)*cos(th)+(y-y_)*sin(th));
    den = ((y-y_)*cos(th)-(x-x_)*sin(th));
    
    mu = 0.5*num/den;
    
    x_a = (x+x_)*0.5 + mu*(y-y_);
    y_a = (y+y_)*0.5 + mu*(x_-x);
    r_a = sqrt((x-x_a)^2+(y-y_a)^2);
    d_th = atan2(y_ - y_a, x_ - x_a) - atan2(y-y_a, x-x_a);
    d_t = t_ - t;
    
    v_hat = (d_th/d_t)*r_a;
    w_hat = (d_th/d_t);
    g_hat = ((th_ - th)/d_t) - w_hat;
    
    Pv = prob_normal_distribution(v-v_hat, a_1*abs(v)+a_2*abs(w));
    Pw = prob_normal_distribution(w-w_hat, a_3*abs(v)+a_4*abs(w));
    Pg = prob_normal_distribution(g_hat, a_5*abs(v) + a_6*abs(w));
    
    
    p = Pv*Pw*Pg;
    if p > 1
        disp('!!!!!!!! prob above 1')
        disp('.......')
        disp('Pv\tPv\tPg')
        disp([Pv, Pw, Pg])
    end
    
    prob = p;
end

