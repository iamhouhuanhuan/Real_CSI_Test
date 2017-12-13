
'''
Real-time plot demo using sine waves.

Copyright (C) 2015 Simon D. Levy

'''

import matlab.engine

import RealtimePlotter.Temp_30_Pause as Tm_30

import RealtimePlotter.Real_1_animation_Class as R1
#from RealtimePlotter.Real_1_animation_Class import * # #import _SinePlotter

import RealtimePlotter.CSI_GUI  as CGUI #CGUI.param_get/CGUI.param_list/CGUI.CSI_GU
#from RealtimePlotter.CSI_GUI import *

import threading
import time


csi_windaw_state=False

if __name__ == '__main__':

    global csi_windaw_state
    #初始化matlab
    eng = matlab.engine.start_matlab()
    print("Matlab_OK")
    eng.path(eng.path(), r'/home/houhuan/Pycharm/Workplace/CSI_process/matlab_function')#为Matlab添加新的工作路径

    #csi_trace, pin = eng.read_file_realtime(r'/linux-80211n-csitool-supplementary/CSI_Data/666.dat', 0, nargout=2);##########%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 调用了matlab engine
    GUI= threading.Thread(target=CGUI.CSI_GUI)
    #GUI.setDaemon(True) #主线程退出，该线程退出
    GUI.start()
    while GUI.is_alive():
        print("test")
        if CGUI.param_get:
            #CGUI.param_list[0]
            #读取参数，调用相应的画图功能函数
            if CGUI.param_list[4]==1:
                #调用1个子载波实时画图
                plotter =R1._SinePlotter(eng)
                csi_windaw_state = True
                plotter.start()#一个线程，即主线程调用画图函数，根据初始化过程，定时（interval_msec=66）的更新图画数据（getValues)
                if  ~plotter.is_open:
                    csi_windaw_state=False
            else:
                #调用30个子载波画图
                csi_windaw_state = True
                Tm_30.start_30_fun(eng)
                if ~Tm_30.is_open:
                    csi_windaw_state = False
            param_get = False  #关闭窗口之后才允许再次传参数


    print("houge")
