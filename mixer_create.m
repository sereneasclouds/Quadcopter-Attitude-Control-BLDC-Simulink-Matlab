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