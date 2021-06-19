function H = H(q, params, M, J)
%Returns H(q) 
%   q contains the current state
% params are the parmeters params = [L, W, R, eta]
% M is the mass vector M = [Mb, Mw,]
% J is the intertia vector J = [Jbphi, Jbpsi, Jm]

tlw = q(1);
trw = q(2);
psi = q(3);

L = params(1);
W = params(2);
R = params(3);
eta = params(4);

Mb = M(1);
Mw = M(2);

Jbphi = J(1);
Jbpsi = J(2);
Jm = J(3);

ha = 1/(4*W^2);
hb = L*R*Mb*cos(psi)/(2);
hc = L^2*R^2*Mb*cos(2*psi)/(2*W^2);

h0 = (4*Mw*W^2 + 4*Jbphi + (2*L^2 + W^2)*Mb)*R^2 + 4*W^2*(Jm*eta^2 +Jw);
h1 = (Mb*(W^2 - 2*L^2) - 4*Jbphi)*R^2;
h2 = -4*W^2*eta^2*Jm;
h3 = 4*W^2*(Mb*L^2 + Jbpsi + 2*eta^2*Jm);

H = ha*[h0, h1, h2; h1, h0, h2; h2, h2, h3] + [-h, hc, hb; hc, -hc, hb; hb, hb 0];
end

