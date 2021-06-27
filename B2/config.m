% clear all
% This script loads all the parameters needed for simulation

% Initial state
q_initial = [0; 0; 0];
q_dot_initial = [0; 0; 0];

% intial conditions needed for plotting
x_initial = 0;
y_initial = 0;

% physical parameters
Lb0 = 0.5;
R = 0.15;
W = 1.5;

% width in the other dimension
W_y = 0.5;

% masses of wheel and body
Mw = 2*5;
Mb0 = 200;

% Moment of Inertial values
Jb0_phi = Mb0*(W^2 + W_y^2)/12; %Approx as cuboid
Jb0_psi = Mb0*(W_y^2 + Lb0^2)/12;
Jw = Mw*R^2/2;
Jm = Jw + Jb0_psi/2; %body inertial

% parameters of people inside
% Initially for no people
Np = 0;
Mp = 70;
Lp = 1;
Hp = 1;
Wp = 0.4;

g = 9.8; %m/s^2 - gravity

% Friction values
% from paper
b_gb_stiction = 7;
b_gb_coloumb = 4;
b_gb_viscous = 1.4;

% google 'tire friction value'
b_t = 0.05*(Mb0 + Mw)*g;
% b_t = 25;

% sensor and other parameters
% Normal electric scooter parameters - use
% https://electricscooterparts.com/motorwheelgearratio.html
% https://iopscience.iop.org/article/10.1088/1757-899X/421/4/042067/pdf
% These really matter - we just constrain the output torque
% -2 < u < 2
eta = 10;
K_mot = 2;
% I can set these to 1 as they can be considered as scaling factors of the
% input - as we don't have a limit set of the input
K_amp_lw = 1;
K_amp_rw = 1;
K_da = 1;

% these needed for sesor .. not relevant in dynamics
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
beta = [b_gb_stiction; b_gb_coloumb; b_gb_viscous; b_t];

Q = eta*K_mot*K_da*[K_amp_lw, 0; 0, K_amp_rw; -K_amp_lw, -K_amp_rw];


