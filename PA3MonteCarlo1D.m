    % clear all
    
    %clearvars
    %clearvars -GLOBAL
    %close all
    
    % set(0,'DefaultFigureWindowStyle','docked')
    global C

    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                    % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665; %metres (32.1740 ft) per s²
    nParticles = 1;
    V_o = 0;
    X_o = 0; 
    E = 1; 
    
    nTime = 100;
    %nTraj = 10;
    nSims = 1000;
    V_vec = zeros(1,1);
    T_vec = zeros(1,1);
    X_vec = zeros(1,1);
    D_vec = zeros(1,1); 
    D=0;
    for n = 1: nSims 
        t_i = n;
        t = n + 1;
        
        V_i = V_o + ((C.q_0*E)/(C.m_0))*(t-t_i);
        V_vec(n) = V_i;
        T_vec(n) = t;
        D =D + V_i * t;
        X_vec(n)=D;
        
        
        %V_i = 0;
        x = abs(rand(1, nParticles));
        if x < 0.05
            
%             V_vec(n) = -1*V_vec(n);
            V_i = 0;
        end
         V_o = V_i; 
         D_vec(n) = (X_vec(n)/T_vec(n));
         figure(1); 
        subplot(2,1,1)
        plot(T_vec,V_vec)
        subplot(2,1,2)
        plot(T_vec,X_vec)
        title(['Drift Velocity  ',num2str(D_vec(n)),' m/s'])

        
    end
    
    