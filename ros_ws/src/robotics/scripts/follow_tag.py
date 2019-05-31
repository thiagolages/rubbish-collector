#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from ar_track_alvar_msgs.msg import AlvarMarkers
from std_msgs.msg import Bool

twist_msg = Twist()


def ar_tag_callback(data):

		#rospy.loginfo("Recognized an AR Tag !")
	#rospy.loginfo("ar_pose_marker is publishing and being received inside follow_tag node !")
	global twist_msg, cmd_vel_pub

	#status_done = False
	#status_done = rospy.get_param('/robotics/dobot_is_done')
	
	status_done = True # just testing

	if status_done == True and len(data.markers) != 0:
		
		dist = data.markers[0].pose.pose.position.x
		if dist >= 0.30: # not in reach yet
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

			status_done = True
			rospy.set_param('/robotics/turtlebot_is_done', status_done)


		rospy.loginfo("#markers = %s",str(len(data.markers)))
		rospy.loginfo("dist = %s meters",str(dist))
		
		
	else: # dobot is not done
		if status_done == False:
			rospy.loginfo("Dobot is not done yet.")
		if len(data.markers) != 0:
			rospy.loginfo("No markers detected.")

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