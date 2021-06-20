% This script loads all the parameters needed for simulation

% Initial state
q_initial = [0; 0; 0];
q_dot_initial = [0; 0; 0];

% intial conditions needed for plotting
x_initial = 0;
y_initial = 0;


% physical parameters
Lb0 = 1;
R = 1;
W = 1;

% masses of wheel and body
Mw = 1;
Mb0 = 1;

% Moment of Inertial values
Jb0_phi = 1;
Jb0_psi = 1;
Jw = 1;
Jm = 1;

% parameters of people inside
Np = 2;
Mp = 80;
Lp = 10;
Hp = 10;
Wp = 5;
Jp = 1;

% Friction values
b_gb_lw = 7;
b_gb_rw = 7;
b_t = 10;

g = 9.8; %m/s^2 - gravity

% sensor and other parameters
eta = 5;
K_mot = 10;
K_amp_lw = 6;
K_amp_rw = 6;
K_da = 1;

K_gyro = 1;
K_enc = 1;

% % % % % % % % % % Do not edit post this % % % % % % % % % %
% Adjusting for people
Mb = Mb0 + Np*Mp;
L = (Np*Mp*Lp + Mb0*Lb0)/Mb;
Jp_psi = Np*Mp*Hp^2/12 + Np*Mp*Lp^2;
Jp_phi = Np*Mp*Wp^2/12;
Jbphi = Jb0_phi + Jp_phi;
Jbpsi = Jb0_psi + Jp_psi;

% wrapping for functions
params = [L; W; R; eta];
M = [Mb; Mw];
J = [Jbphi; Jbpsi; Jm; Jw];
beta = [b_gb_lw; b_gb_rw; b_t];

Q = eta*K_mot*K_da*[K_amp_lw, 0; 0, K_amp_rw; -K_amp_lw, -K_amp_rw];


