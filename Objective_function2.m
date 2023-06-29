function f = Objective_function2(x,maxT,maxM)

    [~,~,~,~,~,~, Thrust, Mass,~] = Thrust_Mass2(x);

    Thrust_norm = Thrust./maxT;
    Mass_norm = Mass./maxM;
    f = Mass_norm-Thrust_norm;
end