function vel = vel(x, params)
%vel Gives velocity from state

tlw = x(1);
trw = x(2);
psi = x(3);

tlw_dot = x(4);
trw_dot = x(5);
psi_dot = x(6);

W = params(2);
R = params(3);


phi = R*(tlw - trw)/W;
v_x = R*(tlw_dot + trw_dot)*sin(phi)/2;
v_y = -R*(tlw_dot + trw_dot)*cos(phi)/2;

vel = [v_x; v_y];
end

