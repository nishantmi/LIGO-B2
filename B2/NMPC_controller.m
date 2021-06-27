function uout = NMPC_controller(currentx,currentr)
% This function is the MPC controller
persistent Controller

if t == 0
    
    u_min = [-2;-2];
    u_max = [2; 2];
    
    n_x = 6;
    n_u = 2;
    
    % Define data for MPC controller
    % Horizon fro MPC     
    N = 15;
    % Cost matrixes
    Q = 10;
    R = 0;
    
    % time step
    T = 0.1;
    
    % Avoid explosion of internally defined variables in YALMIP
    yalmip('clear')
    
    % Setup the optimization problem
    u = sdpvar(repmat(n_u,1,N),repmat(1,1,N));
    x = sdpvar(repmat(n_x,1,N+1),repmat(1,1,N+1));
    sdpvar r
    % Define simple standard MPC controller
    % Current state is known so we replace this
    constraints = [];
    objective = 0;
    for k = 1:N
        objective = objective + (r - vel(x{k}))'*Q*(r - vel(x{k})) + u{k}'*R*u{k};
        constraints = [constraints, x{k+1} == x_next(x{k}, u{k}, T)];
        constraints = [constraints, u_min <= u{k} <= u_max];
    end
    
    % Define an optimizer object which solves the iproblem for a particular
    % initial state and reference
    Controller = optimizer(constraints,objective,[],{x{1},r},u{1}(:));
    
    % And use it here too
    uout = Controller{{currentx,currentr}};
    
else    
    % Almost no overhead
    uout = Controller{{currentx,currentr}};
end
end

