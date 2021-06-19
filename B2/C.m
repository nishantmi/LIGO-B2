function C = C(q, q_dot, params, M, beta)
%Returns C(q, \dot q) 
% q contains the current state
% q_dot contains the current state rate
% params are the parmeters params = [L, W, R, eta]
% M is the mass vector M = [Mb, Mw,]
% beta contains friction info beta = [b_gblw, b_gbrw, b_t]

tlw = q(1);
trw = q(2);
psi = q(3);

tlw_dot = q_dot(1);
trw_dot = q_dot(2);
psi_dot = q_dot(3);

L = params(1);
W = params(2);
R = params(3);
eta = params(4);

Mb = M(1);
Mw = M(2);

b_gblw = beta(1);
b_gbrw = beta(2);
b_t = beta(3);

ca = L^2*R^2*Mb*sin(2*psi)*psi_dot/W^2;
cb = -W^2*sec(psi)/(4*L*R);
if psi_dot ~= 0
    cc = (tlw_dot - trw_dot)/(2*psi_dot);
else
    cc = 0;
end

C = ca*[1, -1, cb; -1, 1, cb; -cc, cc, 0] + [(b_gblw + b_t), 0, (-b_gblw); 0, (b_gbrw + b_t), (-b_gbrw); (-b_gblw), (-b_gbrw), (b_gblw + b_gbrw)];

end

