function [tau]=attitude_control_tau(Om,Omd,dOmd,Q)

J=diag([0.0820,0.0845,0.1377]);         % kgm^2

e1=[1;0;0;];e2=[0;1;0];e3=[0;0;1];



La=3.5*eye(3);
p=0.75;
ki =0.04;%0.098;%3
kp = 4.5;%>1% parameter
L=La;
a1 = 1.2;
a2 = 1.1;
a3 = 1;

om=Om-Q'*Omd;

s = a1*cross(Q'*e1,e1)+a2*cross(Q'*e2,e2)+a3*cross(Q'*e3,e3);
H = eye(3,3)-((2*(1-(1/p)))/(s'*s))*(s*s');
w = a1*cross(e1,cross(om,Q'*e1))+a2*cross(e2,cross(om,Q'*e2))+a3*cross(e3,cross(om,Q'*e3));
z = s/((s'*s)^(1-(1/p)));
Psi = om+ki*z;




%dOmd=dOm+(ki/((s'*s)^(1-(1/p))))*H*w;

%tau=skew(Q'*Omd)*J*Om+J*(Q'*dOmd-skew(om)*Q'*Omd)-((L*om)/(om'*L*om)^(1-(1/p)));

tau =J*(Q'*dOmd-(ki*H/(s'*s)^(1-(1/p)))*w)...
     +skew(Q'*Omd)*J*(Q'*Omd-ki*z)+ki*J*(cross(z,(Q'*Omd)))...
     +cross(ki*J*(w+Q'*Omd),z)-kp*s...
     -(L*Psi/(Psi'*L*Psi)^(1-(1/p)));

