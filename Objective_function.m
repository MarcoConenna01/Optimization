function f = Objective_function(x,maxT,maxM,p_ratio)

    [~,~,~,~,~,~, Thrust, Mass,~] = Thrust_Mass(x,p_ratio);

    Thrust_norm = Thrust./maxT;
    Mass_norm = Mass./maxM;
    f = Mass_norm-Thrust_norm;
end