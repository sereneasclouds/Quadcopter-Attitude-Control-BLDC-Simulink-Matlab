% Clear workspace and close everything
clear all;
close all;
bdclose all;

% Create new Simulink model
model_name = 'Quadcopter_BLDC';
new_system(model_name);
open_system(model_name);

% Create BLDC Motor Subsystem
subsys_name = [model_name '/BLDC_Motor'];
add_block('simulink/Ports & Subsystems/Subsystem', subsys_name);

% Add blocks inside the subsystem
% Input port
add_block('simulink/Ports & Subsystems/In1', [subsys_name '/PWM_Input']);
set_param([subsys_name '/PWM_Input'], 'Position', [100 100 130 120]);

% ESC Logic
add_block('simulink/User-Defined Functions/MATLAB Function', [subsys_name '/ESC_Logic']);
set_param([subsys_name '/ESC_Logic'], 'Position', [200 100 300 120]);

% BLDC Dynamics
add_block('simulink/User-Defined Functions/MATLAB Function', [subsys_name '/BLDC_Dynamics']);
set_param([subsys_name '/BLDC_Dynamics'], 'Position', [350 100 450 120]);

% Output ports
add_block('simulink/Ports & Subsystems/Out1', [subsys_name '/Speed_Output']);
set_param([subsys_name '/Speed_Output'], 'Position', [500 100 530 120]);

add_block('simulink/Ports & Subsystems/Out1', [subsys_name '/Thrust_Output']);
set_param([subsys_name '/Thrust_Output'], 'Position', [500 170 530 190]);

% Connect blocks within BLDC subsystem
% First, connect PWM to ESC
add_line(subsys_name, 'PWM_Input/1', 'ESC_Logic/1');

% Then ESC to BLDC
add_line(subsys_name, 'ESC_Logic/1', 'BLDC_Dynamics/1');


% Add test components to the main system
model_name = 'Quadcopter_BLDC';
open_system(model_name);

% Add PWM input signal (Step input to simulate throttle command)
add_block('simulink/Sources/Step', [model_name '/PWM_Step']);
set_param([model_name '/PWM_Step'], ...
    'Time', '1', ...                    % Step at t=1s
    'Before', '1000', ...               % Min PWM
    'After', '2000', ...                % Max PWM
    'Position', [100 100 130 130]);

% Add scopes to monitor outputs
add_block('simulink/Sinks/Scope', [model_name '/Speed_Scope']);
set_param([model_name '/Speed_Scope'], ...
    'Position', [500 50 530 80]);

add_block('simulink/Sinks/Scope', [model_name '/Thrust_Scope']);
set_param([model_name '/Thrust_Scope'], ...
    'Position', [500 150 530 180]);

% Connect blocks
add_line(model_name, 'PWM_Step/1', 'BLDC_Motor/1');
add_line(model_name, 'BLDC_Motor/1', 'Speed_Scope/1');
add_line(model_name, 'BLDC_Motor/2', 'Thrust_Scope/1');

% Set simulation parameters
set_param(model_name, 'StopTime', '5');  % 5 seconds simulation
set_param(model_name, 'Solver', 'ode45');


%% Now create Mixer Subsystem
mixer_name = [model_name '/Mixer'];
add_block('simulink/Ports & Subsystems/Subsystem', mixer_name);

% Add input ports to mixer
add_block('simulink/Ports & Subsystems/In1', [mixer_name '/Throttle']);
set_param([mixer_name '/Throttle'], 'Position', [100 100 130 120]);

add_block('simulink/Ports & Subsystems/In1', [mixer_name '/Roll']);
set_param([mixer_name '/Roll'], 'Position', [100 150 130 170]);

add_block('simulink/Ports & Subsystems/In1', [mixer_name '/Pitch']);
set_param([mixer_name '/Pitch'], 'Position', [100 200 130 220]);

add_block('simulink/Ports & Subsystems/In1', [mixer_name '/Yaw']);
set_param([mixer_name '/Yaw'], 'Position', [100 250 130 270]);

% Add MATLAB Function block for mixing logic
add_block('simulink/User-Defined Functions/MATLAB Function', [mixer_name '/Mix_Logic']);
set_param([mixer_name '/Mix_Logic'], 'Position', [200 160 300 210]);

% Add output ports for each motor
add_block('simulink/Ports & Subsystems/Out1', [mixer_name '/M1_PWM']);  % Front Right
set_param([mixer_name '/M1_PWM'], 'Position', [350 100 380 120]);

add_block('simulink/Ports & Subsystems/Out1', [mixer_name '/M2_PWM']);  % Front Left
set_param([mixer_name '/M2_PWM'], 'Position', [350 150 380 170]);

add_block('simulink/Ports & Subsystems/Out1', [mixer_name '/M3_PWM']);  % Rear Left
set_param([mixer_name '/M3_PWM'], 'Position', [350 200 380 220]);

add_block('simulink/Ports & Subsystems/Out1', [mixer_name '/M4_PWM']);  % Rear Right
set_param([mixer_name '/M4_PWM'], 'Position', [350 250 380 270]);

% Connect mixer internal lines
add_line(mixer_name, 'Throttle/1', 'Mix_Logic/1');
add_line(mixer_name, 'Roll/1', 'Mix_Logic/2');
add_line(mixer_name, 'Pitch/1', 'Mix_Logic/3');
add_line(mixer_name, 'Yaw/1', 'Mix_Logic/4');

% Connect mixing logic outputs
for i = 1:4
    add_line(mixer_name, ['Mix_Logic/' num2str(i)], ['M' num2str(i) '_PWM/1']);
end

% Save the system
save_system(model_name);

% Save the system
save_system(model_name);