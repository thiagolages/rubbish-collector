%% Dobot Control Code

close all;
clear;
clc;

% Turn the dobot on and connect it to the computer via usb cable 
% Open a terminal and call roslaunch dobot_magician_driver dobot_magician.launch
    % The dobot will calibrate and move to a "home" location
    
%% Communication of Dobot with turtlebot Begin

% In the command window of Matlab:

    %call rosinit('http://localhost:11311')
    % If an error message returns, then call rosshutdown
    % Then call rosinit('http://localhost:11311')

% Create a parameter tree object to interact with the parameter server

    ptree = rosparam
    has(ptree,'ROBOT_IP')
    ans = logical
    
    
    set(ptree,'ROBOT_IP','192.168.1.1');
set(ptree, '/myrobot/ROBOT_IP','192.168.1.100');



%% Dobot Action Begin


% Sets up the cartesian position of the end-effector
cartmsg_ = rosmessage(cartsvc_);

% Set home position
cartmsg_.TargetPoints = [0.2, 0, 0, 0];
cartsvc_.call(cartmsg_)

% Move to object
 cartmsg_.TargetPoints = [0.25, 0, -0.13, 0];
cartsvc_.call(cartmsg_)

cartmsg_.TargetPoints = [0.25, 0, 1.13, 0];
cartsvc_.call(cartmsg_)

% Pick up object
suctioncupsvc_ = rossvcclient('/dobot_magician/end_effector/set_suction_cup');
suctioncupmsg_ = rosmessage(suctioncupsvc_);

suctioncupmsg_.IsEndEffectorEnabled = 1;
suctioncupmsg_.EndEffectorState = 1;
suctioncupsvc_.call(suctioncupmsg_);

% Move back to home position with the object
cartmsg_.TargetPoints = [0.2, 0, 0, 0];
cartsvc_.call(cartmsg_)

% Move to intermediate position with object
cartmsg_.TargetPoints = [0.2, 0.2, 0, 0];
cartsvc_.call(cartmsg_)

% Move to drop position with object
cartmsg_.TargetPoints = [0, 0.2, 0, 0];
cartsvc_.call(cartmsg_)

% Drop object
suctioncupmsg_.IsEndEffectorEnabled = 0;
suctioncupmsg_.EndEffectorState = 0;
suctioncupsvc_.call(suctioncupmsg_);


%% Communication of Dobot with turtlebot End





