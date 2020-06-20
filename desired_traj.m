function [ref,ref_next] = desired_traj(t)

v_nom = 0.1;

h = 0.01;

hover_h = 2;

% check for height
% margin of error
delta = 0.1; % 10 cm


bd = [0;0;.1*t];
vd = [0;0;.1];
dvd = [0;0;0];

% bd_next = [0;0;.1*(t+h)];
% vd_next = [0;0;.1];
% dvd_next = [0;0;0];

% check for height
    if norm (b-hover_h) > delta 
       
        if b < hover_h
            
        bd_next = [0;0;.1*(t+h)];
        vd_next = [0;0;.1];
        dvd_next = [0;0;0];

        end
        
        if b > hover_h
            
            bd_next = 2*b - [0;0;.1*(t+h)];
            vd_next = [0;0;.1];
            dvd_next = [0;0;0];
        end
    
    else    
     
            bd_next = b ;    
            vd_next = [0; 0; 0];
            dvd_next = [0;0;0];
        
    end
            
    ref = [bd; vd; dvd];
end
