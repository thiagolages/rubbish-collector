#!/usr/bin/env python

from beginner_tutorials.srv import *
import rospy

def handle_add_two_ints(req):
    print "Returning [%s + %s = %s]"%(req.a, req.b, (req.a + req.b))
    return AddTwoIntsResponse(req.a + req.b)

def dobot_control_server():
    
    rospy.wait_for_service('/dobot_magician/PTP/set_cartesian_pos')

  try:
    mp3invserv = rospy.ServiceProxy('mp3_inventory_interaction', MP3InventoryService)
    albums = mp3invserv("album_list", "")

    print "Service call failed: %s"%e




    s = rospy.Service('add_two_ints', AddTwoInts, handle_add_two_ints)
    print "Ready to add two ints."
    rospy.spin()

if __name__ == "__main__":
    dobot_control_server()