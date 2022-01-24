### Update: Final Demo Video now available on YouTube:
**Video of successful completion of the task: [link](https://youtu.be/cC__Lanfi90)**

![image](https://user-images.githubusercontent.com/22358397/150845039-f6032b7b-8a14-407a-a055-c8512db18747.png)

# rubbish-collector

University of Technology Sydney, Australia.
Assignment for 41013 Robotics subject, Autumn 2019 session

Group Members:
 - Catherine Azzi (@CAZZI1)
 - Jarrod Hilaire (@jarrodhilaire)
 - Thiago Lages   (@thiagolages)
 
Subject coordinator: Dr. Gavin Paul (@gapaul)

## 1) Project Description: ##
Initial idea is based around a turtle-bot following a straight line (which will act as a kerb, for example) while the attached Dobot with an end effector gripper picks-ups/sorts blocks (which acts as garbage) to envision a garbage collection operation. Computer vision will be used to move the Turtlebot and possibly pick up the blocks as well.


## 2) Robot (Cyton/Dobot) and End-effector you wish to use and the reason ##

We planned on using the Dobot because it has a greater variety of grippers. Since we're planning on grasping some objects that will act as rubbish, we are not limited only to blocks, since with different grippers we might be able to grasp different types of objects with random shapes. Other than that, it's more precise than the Cyton robot and that might be really useful since we'll have a mobile base that might increase uncertainty at some point of the project.


## Installation ##

### 0) Ubuntu 16.04

The following proceures assume you have Ubuntu 16.04 LTS installed on your machine. Download it from the [releases page](http://releases.ubuntu.com/?_ga=2.132536974.1838232222.1557218617-1539747096.1557218617).
 
### 1) ROS Kinetic Kame

We will be using ROS Kinetic Kame. Follow the instructions at the [ROS Kinetic installation instructions page.](http://wiki.ros.org/kinetic/Installation/Ubuntu)

A summary of the commands is showed below:

1)`sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'`
2)`sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116`
3)`sudo apt-get update`
4)`sudo apt-get install ros-kinetic-desktop-full`
5)`sudo rosdep init`
6)`rosdep update`
7)`echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc`
8)`source ~/.bashrc`

### 2) Turtlebot v3

Now it's time to download a few required packages for the turtlebot on your machine (Host PC). For full instructions, go to the [official documentation page](http://emanual.robotis.com/docs/en/platform/turtlebot3/pc_setup/#pc-setup).

`sudo apt-get install -y ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers`

And, finally, the basic packages to control the turtlebot. Assuming your ROS workspace name is `~/catkin_ws/` :

1) `cd ~/catkin_ws/src/`
2) `git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git`
3) `git clone https://github.com/ROBOTIS-GIT/turtlebot3.git`
4) `cd ~/catkin_ws`
5) `catkin_make`

If `catkin_make` command is completed without any errors, the preparation for TurtleBot3 is done.
