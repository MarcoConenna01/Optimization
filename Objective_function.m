function f = Objective_function(x,maxT,maxM)
    eps = x(1);
    Ln = x(2);
    [~,~,~,~,~, Thrust, Mass] = Thrust_Mass([eps,Ln]);

    Thrust_norm = Thrust./maxT;
    Mass_norm = Mass./maxM;
    f = Mass_norm-Thrust_norm;
end