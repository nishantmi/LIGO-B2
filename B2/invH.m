function invH = invH(q, params, M, J)
%Returns inv(H(q))
%   q contains the current state
% params are the parmeters params = [L, W, R, eta]
% M is the mass vector M = [Mb, Mw,]
% J is the intertia vector J = [Jbphi, Jbpsi, Jm, Jw]

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
Jw = J(4);

ha = 1/(4*W^2);
hb = L*R*Mb*cos(psi)/(2);
hc = L^2*R^2*Mb*cos(2*psi)/(2*W^2);

h0 = (4*Mw*W^2 + 4*Jbphi + (2*L^2 + W^2)*Mb)*R^2 + 4*W^2*(Jm*eta^2 +Jw);
h1 = (Mb*(W^2 - 2*L^2) - 4*Jbphi)*R^2;
h2 = -4*W^2*eta^2*Jm;
h3 = 4*W^2*(Mb*L^2 + Jbpsi + 2*eta^2*Jm);

% used symbolic calcualtion to obtain
invH = [-(h2^2*ha^2 + 2*h2*ha*hb - h0*h3*ha^2 + h3*hc*ha + hb^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc), (h2^2*ha^2 + 2*h2*ha*hb - h1*h3*ha^2 - h3*hc*ha + hb^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc), (2*hb*hc - h0*ha*hb + h1*ha*hb + 2*h2*ha*hc - h0*h2*ha^2 + h1*h2*ha^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc); (h2^2*ha^2 + 2*h2*ha*hb - h1*h3*ha^2 - h3*hc*ha + hb^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc), -(h3*ha^2 + hb^2 + h2^2*ha^2 + 2*h2*ha*hb - h0*h3*ha^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc), (ha*hb + hb*hc + h2*ha^2 - h0*ha*hb + h1*ha*hb + h2*ha*hc - h0*h2*ha^2 + h1*h2*ha^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc); (2*hb*hc - h0*ha*hb + h1*ha*hb + 2*h2*ha*hc - h0*h2*ha^2 + h1*h2*ha^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc), (ha*hb + hb*hc + h2*ha^2 - h0*ha*hb + h1*ha*hb + h2*ha*hc - h0*h2*ha^2 + h1*h2*ha^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc), -(- h0^2*ha^2 + h0*ha^2 + h0*ha*hc + h1^2*ha^2 + 2*h1*ha*hc - ha*hc + hc^2)/(h3*h0^2*ha^3 - 2*h0*h2^2*ha^3 - 4*h0*h2*ha^2*hb - h3*h0*ha^3 - h3*h0*ha^2*hc - 2*h0*ha*hb^2 - h3*h1^2*ha^3 + 2*h1*h2^2*ha^3 + 4*h1*h2*ha^2*hb - 2*h3*h1*ha^2*hc + 2*h1*ha*hb^2 + h2^2*ha^3 + 3*h2^2*ha^2*hc + 2*h2*ha^2*hb + 6*h2*ha*hb*hc + h3*ha^2*hc + ha*hb^2 - h3*ha*hc^2 + 3*hb^2*hc)];
end

