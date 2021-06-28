function x_next = x_next(x, u, h, params, M, J, beta, g, Q)
    f = @define_dynamics;
    % create RK4 integrator
    k1 = f(x,u, params, M, J, beta, g, Q);
    k2 = f(x+(h/2).*k1,u, params, M, J, beta, g, Q);
    k3 = f(x+(h/2).*k2,u, params, M, J, beta, g, Q);
    k4 = f(x+h.*k3,u, params, M, J, beta, g, Q);
    x_next = x + (h/6).*(k1+2*k2+2*k3+k4);
    
end

function dxdt = define_dynamics(x,u, params, M, J, beta, g, Q)
    
    q = x(1:3);
    q_dot = x(4:6);
    q_ddot = invH(q,params,M,J)*(Q*u - C(q,q_dot,params,M,beta)*q_dot - G(q,params,M,g));

    dxdt = [q_dot; q_ddot];
    
end
