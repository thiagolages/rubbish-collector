
classdef Dobot < handle

    properties
        model;
        
        % Sets the dimensions of the workspace
        workspace = [-0.5 0.5 -0.5 0.5 0 0.5];
        scale = 0.5;
        
        % Imports the ply file data
        faceData;
        vertexData;
        data;
        
        % Sets the point cloud data
        reach_v;
        reach_h;
        pointCloud;
    end
    
    methods 
        
        %% Dobot Class Constructor
        
        function self = Dobot(name, base_location)
            DobotRobot(self, name, base_location);
            PlotAndColourRobot(self);
        end
        
        %% Create Dobot Robot
        
        function DobotRobot(self, name, base_location)
 
        L(1) = Link('d',0.103, 'a',0,      'alpha',-pi/2, 'offset',0,     'qlim',deg2rad([-135,135]));
        L(2) = Link('d',0,     'a',0.136,  'alpha',0,     'offset',-pi/2, 'qlim',deg2rad([-5, 85]));
        L(3) = Link('d',0,     'a',0.1685, 'alpha',0,     'offset',0,     'qlim',deg2rad([-10,95]));
        L(4) = Link('d',0,     'a',0.0525, 'alpha',-pi/2, 'offset',0,     'qlim',deg2rad([-90,90]));
        L(5) = Link('d',0,     'a',0,      'alpha',0,     'offset',0,     'qlim',deg2rad([-180,180]));

        % Builds the Dobot links, name and points to the base position translation.   
        self.model = SerialLink(L, 'name', name);
        self.model.base = se3(se2(base_location));
        hold on;
        
        % Opens a menu to move the robot manually
%         self.model.teach();

        end
        
        %% Plot and Colour Dobot Robot

        function PlotAndColourRobot(self)
            
            for linkIndex = 0:self.model.n
                [ faceData, vertexData, plyData{linkIndex+1} ] = ...
                plyread(['Dobot Ply Files/Link',num2str(linkIndex),'.ply'],'tri');
                self.model.faces{linkIndex+1} = faceData;
                self.model.points{linkIndex+1} = vertexData;
                pause(0.01);
            end          
            
            % Displays the dobot robot
            self.model.plot3d(zeros(1,self.model.n),'wrist', 'arrow','workspace' ...
                ,self.workspace, 'delay', 0);
            axis([self.workspace(1) self.workspace(2) self.workspace(3) self.workspace(4) ...
                self.workspace(5) self.workspace(6)]);
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.model.delay = 0;
            
            % Try to correctly colour the dobot arm (if colours are in ply file data)
            for linkIndex = 0:self.model.n
                handles = findobj('Tag', self.model.name);
                h = get(handles,'UserData');
                try
                    h.link(linkIndex+1).Children.FaceVertexCData = [self.data{linkIndex+1}.vertex.red ...
                        , data{linkIndex+1}.vertex.green ...
                        , data{linkIndex+1}.vertex.blue]/255;
                    h.link(linkIndex+1).Children.FaceColor = 'interp';
                catch ME_1
                    disp(ME_1);
                    continue;
                end
            end
        end
    end
end