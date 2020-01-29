#!/usr/bin/env python

import rospy, os
from geometry_msgs.msg import Twist
from ar_track_alvar_msgs.msg import AlvarMarkers
from std_msgs.msg import Bool

twist_msg = Twist()
stop_distance = 0.20
measurement_error = 0.1

counter = 0

def ar_tag_callback(data):

		#rospy.loginfo("Recognized an AR Tag !")
	#rospy.loginfo("ar_pose_marker is publishing and being received inside follow_tag node !")
	global twist_msg, cmd_vel_pub, counter

<<<<<<< Updated upstream
	status_done = False # make it false at first for security
	status_done = rospy.get_param('/robotics/dobot_is_done')
	
	#status_done = True
	#rospy	.set_param('/robotics/turtlebot_is_done', status_done)
=======
		status_done = False
	status_done_pub = rospy.getparam('/robotics/turtlebot_is_done')

	r = rospy.Rate(10)
		
>>>>>>> Stashed changes

	if status_done == True and len(data.markers) == 1:
		rospy.loginfo("UHEUASHEUAHS1Q1111111111")
		dist = data.markers[0].pose.pose.position.x
		if dist >= stop_distance + measurement_error: # not in reach yet
		#rospy.loginfo(message)
			rospy.loginfo("I'm "+str(dist)+"m away from goal. Driving..")
			twist_msg.linear.x = 0.10
			twist_msg.linear.y = 0.0
			twist_msg.linear.z = 0.0
			twist_msg.angular.x = 0.0
			twist_msg.angular.y = 0.0
			twist_msg.angular.z = 0.0
			cmd_vel_pub.publish(twist_msg)

			status_done = False
			rospy.set_param('/robotics/turtlebot_is_done', status_done)

		else: # too close
			rospy.loginfo("Reached destination, stopping..")
			stop_motors()

			counter = rospy.get_param('/robotics/counter')
			print("counter before if = ",counter)

			if (counter == 0):
				print("COUNTER = 0")
				status_done = True
				rospy.set_param('/robotics/turtlebot_is_done', status_done)
			#else:
			#	status_done = False
			#	rospy	.set_param('/robotics/turtlebot_is_done', status_done)
			
			counter = counter + 1			
			print("counter after if and before set = ",counter)
			rospy.set_param('/robotics/counter', counter)
			counter = rospy.get_param('/robotics/counter')
			print("counter after if and after set = ",counter)


		rospy.loginfo("#markers = %s",str(len(data.markers)))
		rospy.loginfo("dist = %s meters",str(dist))
		
		
	else:
		rospy.loginfo("UHEUASHEUAHS2222222222") 
		if status_done == False:
			rospy.loginfo("Dobot is not done yet.")
		if len(data.markers) == 0:
			rospy.loginfo("No markers detected.")
			#status_done = True
			#rospy	.set_param('/robotics/turtlebot_is_done', status_done)
		if len(data.markers) > 1:
			rospy.loginfo("More than one marker detected.")
			#status_done = True
			#rospy	.set_param('/robotics/turtlebot_is_done', status_done)

 		

		rospy.loginfo(" Stopping.")	
		stop_motors()

def follow_tag():

	# ar_pose_marker - topic
	# ar_track_alvar/AlvarMarkers -type
	# markers - field

	rospy.Subscriber("ar_pose_marker", AlvarMarkers, ar_tag_callback)

	rospy.spin()

def stop_motors():

	global cmd_vel_pub, twist_msg

	twist_msg.linear.x = 0.0
	twist_msg.linear.y = 0.0
	twist_msg.linear.z = 0.0
	twist_msg.angular.x = 0.0
	twist_msg.angular.y = 0.0
	twist_msg.angular.z = 0.0
	cmd_vel_pub.publish(twist_msg)


if __name__ == '__main__':

	rospy.init_node('follow_tag')

	rospy.on_shutdown(stop_motors)
	r = rospy.Rate(10)
	cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)

	rospy.set_param('/robotics/dobot_is_done', 0)
	rospy.set_param('/robotics/counter', 0)

	try:
		stop_motors() # make sure it begins stopped
		follow_tag()


	except rospy.ROSInterruptException:
		stop_motors()



'''

[ar_track_alvar_msgs/AlvarMarkers]:
std_msgs/Header header
	uint32 seq
	time stamp
	string frame_id
ar_track_alvar_msgs/AlvarMarker[] markers
	std_msgs/Header header
		uint32 seq
		time stamp
		string frame_id
	uint32 id
	uint32 confidence
	geometry_msgs/PoseStamped pose
		std_msgs/Header header
			uint32 seq
			time stamp
			string frame_id
		geometry_msgs/Pose pose
			geometry_msgs/Point position
				float64 x
				float64 y
				float64 z
			geometry_msgs/Quaternion orientation
				float64 x
				float64 y
				float64 z
				float64 w
'''
