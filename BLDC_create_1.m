% Clear workspace and create new model
clear all;
close all;
bdclose all;

% Create and open new Simulink model
model_name = 'BLDC_Motor_Model';
new_system(model_name);
open_system(model_name);

% Define motor parameters
Kt = 0.0136;          % Torque constant (N-m/A)
Ke = 0.0136;          % Back EMF constant (V/rad/s)
R = 0.135;            % Phase resistance (Ohm)
L = 0.000169;         % Phase inductance (H)
J = 0.0000135;        % Rotor inertia (kg-m^2)
B = 0.000000916;      % Viscous friction coefficient (N-m-s/rad)

% Create transfer function coefficients
current_num = [1];
current_den = [L R];    % [L R] represents Ls + R
speed_num = [1];
speed_den = [J B];      % [J B] represents Js + B

% Add blocks
% Input voltage
add_block('simulink/Sources/Step', [model_name '/Voltage_Input']);
set_param([model_name '/Voltage_Input'], 'Time', '0', 'After', '12');

% Summing junction
add_block('simulink/Math Operations/Sum', [model_name '/Voltage_Sum']);
set_param([model_name '/Voltage_Sum'], 'Inputs', '+-');

% Current dynamics
add_block('simulink/Continuous/Transfer Fcn', [model_name '/Current_Dynamics']);
set_param([model_name '/Current_Dynamics'], ...
    'Numerator', mat2str(current_num), ...
    'Denominator', mat2str(current_den));

% Torque constant
add_block('simulink/Math Operations/Gain', [model_name '/Torque_Constant']);
set_param([model_name '/Torque_Constant'], 'Gain', num2str(Kt));

% Speed dynamics
add_block('simulink/Continuous/Transfer Fcn', [model_name '/Speed_Dynamics']);
set_param([model_name '/Speed_Dynamics'], ...
    'Numerator', mat2str(speed_num), ...
    'Denominator', mat2str(speed_den));

% Back-EMF constant
add_block('simulink/Math Operations/Gain', [model_name '/Back_EMF_Constant']);
set_param([model_name '/Back_EMF_Constant'], 'Gain', num2str(Ke));

% Add scopes
add_block('simulink/Sinks/Scope', [model_name '/Speed_Scope']);
add_block('simulink/Sinks/Scope', [model_name '/Current_Scope']);

% Connect blocks
add_line(model_name, 'Voltage_Input/1', 'Voltage_Sum/1');
add_line(model_name, 'Voltage_Sum/1', 'Current_Dynamics/1');
add_line(model_name, 'Current_Dynamics/1', 'Torque_Constant/1');
add_line(model_name, 'Torque_Constant/1', 'Speed_Dynamics/1');
add_line(model_name, 'Speed_Dynamics/1', 'Back_EMF_Constant/1');
add_line(model_name, 'Back_EMF_Constant/1', 'Voltage_Sum/2');
add_line(model_name, 'Speed_Dynamics/1', 'Speed_Scope/1');
add_line(model_name, 'Current_Dynamics/1', 'Current_Scope/1');

% Save the model
save_system(model_name);