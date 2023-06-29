function p_ratio = Expansion(eps,GAMMA,gamma)

zero = @(x) abs(eps - GAMMA/(sqrt((2*gamma/(gamma-1))*x^(2/gamma)*(1-x^((gamma-1)/gamma)))));
options = optimoptions("fmincon","Algorithm","sqp","Display","off");
p_ratio = fmincon(zero,0.5,[],[],[],[],0,1,[],options);

end