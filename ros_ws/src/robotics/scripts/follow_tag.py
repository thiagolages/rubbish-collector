#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from ar_track_alvar_msgs.msg import AlvarMarkers

def follow_tag():

        global twist_msg, isRecognized
        _cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=20)
        rospy.init_node('robotics_follow_tag', anonymous=True)
	rate = rospy.Rate(40) # 10hz
	
	# ar_pose_marker - topic
	# ar_track_alvar/AlvarMarkers -type
	# markers - field

	rospy.Subscriber("ar_pose_marker", AlvarMarkers, ar_tag_callback)

   	while (not rospy.is_shutdown()):
	
		if isRecognized:
			
		    message = "Detected an AR Tag ! Moving.."
		    rospy.loginfo(message)

			#if twist_msg.linear.x >= 0.15:
			#	delta = -0.05
			#else:
			#	delta = 0.05

	            twist_msg.linear.x = 0.15
		else:
			message = "Nothing detected. Standing still.."
			twist_msg.linear.x = 0.0


		rospy.loginfo(message)
		_cmd_vel_pub.publish(twist_msg)
		rate.sleep()


def ar_tag_callback(data):

	global isRecognized
    #rospy.loginfo("Recognized an AR Tag !")
	rospy.loginfo("ar_pose_marker is publishing and being received inside follow_tag node !")
	if len(data.markers) == 1:
		#rospy.loginfo("One tag recognized ! Moving..")
		isRecognized = True
	else:
		isRecognized = False
	

if __name__ == '__main__':
    try:

	isRecognized = False

	twist_msg = Twist()
	twist_msg.linear.x = 0.0
	twist_msg.linear.y = 0.0
	twist_msg.linear.z = 0.0
	twist_msg.angular.x = 0.0
	twist_msg.angular.y = 0.0
	twist_msg.angular.z = 0.0
        follow_tag()
    except rospy.ROSInterruptException:
        pass



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

'''

import rospy
from std_msgs.msg import String

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("chatter", String, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
'''
