function G = G(q, params, M, g)
%Returns G(q)
% q contains the current state
% params are the parmeters params = [L, W, R, eta]
% M is the mass vector M = [Mb, Mw,]
% g is acceleration due to gravity

tlw = q(1);
trw = q(2);
psi = q(3);

L = params(1);
W = params(2);
R = params(3);
eta = params(4);

Mb = M(1);
Mw = M(2);

G = [0; 0; -g*L*Mb*sin(psi)];

end

