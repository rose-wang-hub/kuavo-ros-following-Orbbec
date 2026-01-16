#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
from sensor_msgs.msg import PointCloud2, PointField
from livox_ros_driver2.msg import CustomMsg
import struct

class LivoxToPointCloud:
    def __init__(self):
        self.pub = rospy.Publisher('/livox/cloud', PointCloud2, queue_size=10)
        self.sub = rospy.Subscriber('/livox/lidar', CustomMsg, self.callback, queue_size=10)

    def callback(self, msg):
        # Convert CustomMsg to PointCloud2
        cloud = PointCloud2()
        cloud.header = msg.header
        cloud.height = 1
        cloud.width = len(msg.points)
        cloud.fields = [
            PointField(name='x', offset=0, datatype=PointField.FLOAT32, count=1),
            PointField(name='y', offset=4, datatype=PointField.FLOAT32, count=1),
            PointField(name='z', offset=8, datatype=PointField.FLOAT32, count=1),
            PointField(name='intensity', offset=12, datatype=PointField.FLOAT32, count=1),
        ]
        cloud.is_bigendian = False
        cloud.point_step = 16
        cloud.row_step = cloud.point_step * cloud.width
        cloud.is_dense = True

        # Pack points
        data = []
        for point in msg.points:
            data.append(struct.pack('ffff', point.x, point.y, point.z, point.reflectivity))
        cloud.data = b''.join(data)

        self.pub.publish(cloud)
        rospy.loginfo('Converted %d points to PointCloud2', len(msg.points))

if __name__ == '__main__':
    rospy.init_node('livox_to_pointcloud')
    converter = LivoxToPointCloud()
    rospy.loginfo('Livox CustomMsg to PointCloud2 converter started')
    rospy.spin()