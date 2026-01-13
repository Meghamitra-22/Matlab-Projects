% Reversible Reaction in a Batch Reactor
% Reaction: A <-> B with rates k1 and k_1

function main()
    % 1. Define initial conditions: CA0 = 1, CB0 = 0
    C0 = [1; 0]; 
    
    % 2. Define time span for simulation (0 to 50 minutes)
    tspan = [0 50]; 
    
    % 3. Solve the ODEs using ode45
    [t, C] = ode45(@batchreactor3, tspan, C0);
    
    % 4. Plot the results
    figure;
    plot(t, C(:,1), 'g-', 'LineWidth', 2); hold on; % Concentration of A
    plot(t, C(:,2), 'm--', 'LineWidth', 2);        % Concentration of B
    
    % 5. Add labels and title
    legend('C_A', 'C_B');
    xlabel('Time (min)');
    ylabel('Conc (mol/l)');
    title('Reversible rxn in Batch reactor');
    grid on;
end

% --- ODE Function ---
function dCdt = batchreactor3(t, C)
    % Rate constants
    k1 = 0.1;
    k_1 = 0.05;
    
    % State variables
    CA = C(1);
    CB = C(2);
    
    % Mass balance equations (ODEs)
    dCA = -k1*CA + k_1*CB;
    dCB =  k1*CA - k_1*CB;
    
    % Return as a column vector
    dCdt = [dCA; dCB];
end