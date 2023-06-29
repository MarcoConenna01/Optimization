function p_ratio = P_ratio_calculator(eps,Ln,Dt)

    Parameters
    gamma = 1.12;
    p_ratio = zeros(length(Dt),length(Ln),length(eps));

    for i = 1:length(eps)
        p_ratio(:,:,i) = Expansion(eps(i),GAMMA,gamma);
    end


end