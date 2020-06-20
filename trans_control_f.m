function [f]=trans_control_f(R,bt,nu,vd,dvd)
m=4.34;                                 % kg
g=9.81;
e3=[0;0;1];
P=38*eye(3);
L=25*eye(3);

% parameter

f = e3'*R'*(m*g*e3+P*bt+L*(R*nu-vd)-m*dvd);
%f=m*g*e3+P*bt+L*(R*nu-vd)-m*dvd;
