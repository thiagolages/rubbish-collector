
classdef MoveDobot < handle
    
    properties
    end
   
    % Implements the functions of the Dobot Class
    methods (Static)
        
        %% Dobot Class Constructor
        
        function self = MoveDobot()
        end
        
        %% Inverse Kinematics
        
        function [q] = ikcon(robot, x, y, z)
            
            a2 = 0.136;
            a3 = 0.1685;
            
            length = sqrt((x^2)+(y^2));
            diameter = sqrt((length^2) + (z^2));
            t1 = atan(z/length);
            t2 = acos((((a2)^2)+(diameter^2)-((a3)^2))/(2*(a2)*(diameter)));
            alpha = t1 + t2;
            beta = acos((((a2)^2)+((a3)^2)-(diameter^2))/(2*(a2)*(a3)));
            
            q1 = atan(-x/y);
            q2 = (pi/2) - alpha;
            q3real = pi - beta - alpha;
            q3 = (pi/2) - q2 + q3real;
            q4 = pi/2 - (q3real);
            q5 = 0;

            q = [q1,q2,q3,q4,q5];

        end
        
        %% Move Robot
        
        function MoveRobot(robot, q)
            
            robotCurrentPose = robot.model.getpos()';
            steps = 100;
            s = lspb(0,1,steps);
            qMatrix = nan(steps,robot.model.n);
            
            for i = 1:steps
                qMatrix(i,:) = (1-s(i))*robotCurrentPose + s(i)*q';
            end
            
            for armMoveIndex = 1:size(qMatrix,1)
                animate(robot.model,qMatrix(armMoveIndex,:));
                drawnow();
            end
        end
    end
end
