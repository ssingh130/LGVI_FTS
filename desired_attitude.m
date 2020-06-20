% Generating desired attitude trajectory, Rd
function Rd=desired_attitude(bt,vt,dvd)
m=4.34;                                 % kg
g=9.81;
e1=[1;0;0;];e3=[0;0;1];

P=38*eye(3);
L=25*eye(3);


r3d=(m*g*e3+P*bt+L*vt-m*dvd)/norm(m*g*e3+P*bt+L*vt-m*dvd);

% A=2;
%  
% B=(r3d(1)-r3d(2))*(1+(r3d(3)/(r3d(1)+r3d(2))));
% 
% if A ~= B
%     mu=A;
% else
%     mu=B+1;
% end

% B=(r3d(1)-r3d(2))*(((r3d(3)/((r3d(1)+r3d(2))))-1));
% 
% if abs(B)>3
%     mu=B;
% else
%     mu=B+5;
% end
 mu=4;
sd=cross(ones(3,1),r3d)+mu*e1;



r2d=cross(r3d,sd)/norm(cross(r3d,sd));

Rd=[cross(r2d,r3d) r2d r3d];