classdef CustomMsgConsts
    %CustomMsgConsts This class stores all message types
    %   The message types are constant properties, which in turn resolve
    %   to the strings of the actual types.
    
    %   Copyright 2014-2019 The MathWorks, Inc.
    
    properties (Constant)
        dobot_magician_driver_GetIOAnalogInput = 'dobot_magician_driver/GetIOAnalogInput'
        dobot_magician_driver_GetIOAnalogInputRequest = 'dobot_magician_driver/GetIOAnalogInputRequest'
        dobot_magician_driver_GetIOAnalogInputResponse = 'dobot_magician_driver/GetIOAnalogInputResponse'
        dobot_magician_driver_GetIODigitalInput = 'dobot_magician_driver/GetIODigitalInput'
        dobot_magician_driver_GetIODigitalInputRequest = 'dobot_magician_driver/GetIODigitalInputRequest'
        dobot_magician_driver_GetIODigitalInputResponse = 'dobot_magician_driver/GetIODigitalInputResponse'
        dobot_magician_driver_SetEMotor = 'dobot_magician_driver/SetEMotor'
        dobot_magician_driver_SetEMotorRequest = 'dobot_magician_driver/SetEMotorRequest'
        dobot_magician_driver_SetEMotorResponse = 'dobot_magician_driver/SetEMotorResponse'
        dobot_magician_driver_SetEndEffector = 'dobot_magician_driver/SetEndEffector'
        dobot_magician_driver_SetEndEffectorRequest = 'dobot_magician_driver/SetEndEffectorRequest'
        dobot_magician_driver_SetEndEffectorResponse = 'dobot_magician_driver/SetEndEffectorResponse'
        dobot_magician_driver_SetIODigitalOutput = 'dobot_magician_driver/SetIODigitalOutput'
        dobot_magician_driver_SetIODigitalOutputRequest = 'dobot_magician_driver/SetIODigitalOutputRequest'
        dobot_magician_driver_SetIODigitalOutputResponse = 'dobot_magician_driver/SetIODigitalOutputResponse'
        dobot_magician_driver_SetIOMultiplexing = 'dobot_magician_driver/SetIOMultiplexing'
        dobot_magician_driver_SetIOMultiplexingRequest = 'dobot_magician_driver/SetIOMultiplexingRequest'
        dobot_magician_driver_SetIOMultiplexingResponse = 'dobot_magician_driver/SetIOMultiplexingResponse'
        dobot_magician_driver_SetIOPWMOutput = 'dobot_magician_driver/SetIOPWMOutput'
        dobot_magician_driver_SetIOPWMOutputRequest = 'dobot_magician_driver/SetIOPWMOutputRequest'
        dobot_magician_driver_SetIOPWMOutputResponse = 'dobot_magician_driver/SetIOPWMOutputResponse'
        dobot_magician_driver_SetTargetPoints = 'dobot_magician_driver/SetTargetPoints'
        dobot_magician_driver_SetTargetPointsRequest = 'dobot_magician_driver/SetTargetPointsRequest'
        dobot_magician_driver_SetTargetPointsResponse = 'dobot_magician_driver/SetTargetPointsResponse'
    end
    
    methods (Static, Hidden)
        function messageList = getMessageList
            %getMessageList Generate a cell array with all message types.
            %   The list will be sorted alphabetically.
            
            persistent msgList
            if isempty(msgList)
                msgList = cell(16, 1);
                msgList{1} = 'dobot_magician_driver/GetIOAnalogInputRequest';
                msgList{2} = 'dobot_magician_driver/GetIOAnalogInputResponse';
                msgList{3} = 'dobot_magician_driver/GetIODigitalInputRequest';
                msgList{4} = 'dobot_magician_driver/GetIODigitalInputResponse';
                msgList{5} = 'dobot_magician_driver/SetEMotorRequest';
                msgList{6} = 'dobot_magician_driver/SetEMotorResponse';
                msgList{7} = 'dobot_magician_driver/SetEndEffectorRequest';
                msgList{8} = 'dobot_magician_driver/SetEndEffectorResponse';
                msgList{9} = 'dobot_magician_driver/SetIODigitalOutputRequest';
                msgList{10} = 'dobot_magician_driver/SetIODigitalOutputResponse';
                msgList{11} = 'dobot_magician_driver/SetIOMultiplexingRequest';
                msgList{12} = 'dobot_magician_driver/SetIOMultiplexingResponse';
                msgList{13} = 'dobot_magician_driver/SetIOPWMOutputRequest';
                msgList{14} = 'dobot_magician_driver/SetIOPWMOutputResponse';
                msgList{15} = 'dobot_magician_driver/SetTargetPointsRequest';
                msgList{16} = 'dobot_magician_driver/SetTargetPointsResponse';
            end
            
            messageList = msgList;
        end
        
        function serviceList = getServiceList
            %getServiceList Generate a cell array with all service types.
            %   The list will be sorted alphabetically.
            
            persistent svcList
            if isempty(svcList)
                svcList = cell(8, 1);
                svcList{1} = 'dobot_magician_driver/GetIOAnalogInput';
                svcList{2} = 'dobot_magician_driver/GetIODigitalInput';
                svcList{3} = 'dobot_magician_driver/SetEMotor';
                svcList{4} = 'dobot_magician_driver/SetEndEffector';
                svcList{5} = 'dobot_magician_driver/SetIODigitalOutput';
                svcList{6} = 'dobot_magician_driver/SetIOMultiplexing';
                svcList{7} = 'dobot_magician_driver/SetIOPWMOutput';
                svcList{8} = 'dobot_magician_driver/SetTargetPoints';
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            serviceList = svcList;
        end
        
        function actionList = getActionList
            %getActionList Generate a cell array with all action types.
            %   The list will be sorted alphabetically.
            
            persistent actList
            if isempty(actList)
                actList = cell(0, 1);
            end
            
            % The message list was already sorted, so don't need to sort
            % again.
            actionList = actList;
        end
    end
end
