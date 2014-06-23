function [I]=get_my_outliers(data, m)

    if nargin > 2;
        error('my_filter:TooManyInputs',...
            'requires 1 inputs, max 2')
    end
    
    switch nargin
        case 1
            m = 1.5;
    end        
    
    v_ = mean(data(:,1));
    w_ = mean(data(:,2));
    sv_ = std(data(:,1));
    sw_ = std(data(:,2));

    I = [];
    high_ = find(data(:,2)>w_+m*sw_);
    low_ = find(data(:,2)<w_-m*sw_);
    I = [I; high_; low_];
    
    high_ = find(data(:,1)>v_+m*sv_);
    low_ = find(data(:,1)<v_-m*sv_);
    I = [I; high_; low_];
    
end
