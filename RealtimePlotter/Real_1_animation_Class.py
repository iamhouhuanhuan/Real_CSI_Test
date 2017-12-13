
from RealtimePlotter.realtime_plot import RealtimePlotter
import numpy as np
import matlab.engine
import cmath
import time
from  RealtimePlotter.CSI_GUI  import* #import param_list
pin = 0  # 更新读取数据的指针
amti = 0  # 幅值
angle = 0  # 相位
class _SinePlotter(RealtimePlotter):

    def __init__(self,eng):
        RealtimePlotter.__init__(self, [(-1,+1), (-1,+1)],
                #phaselims=((-1,+1), (-1,+1)),
                window_name='CSIwave demo',
                styles = ['r-', 'b-'],
                ylabels=['Amplitude', 'phase'],
                yticks=[(0, 35, +70), (-3, 0, +3)],
                interval_msec=66)#调整读取时间间隔，结合print(len)，最好是每次读取时刚好只读到一个数据。
                                 #经测试，66，可以保证“1”的数量最多，同时不包含0：暂时保证了数据实时有效性到最大化
        self.eng=eng
    def getValues(self):
        s,c = self._getRow()
        end = time.clock()
        return  s,c, s, c

    def _getRow(self):
        global pin  #加上修饰符号:global->使函数层定义到局部变量变为全局变量，即与已经定义的全局变量是同一个对象
        global amti
        global angle
        #global eng
        csi_trace, cur = self.eng.read_file_realtime('/linux-80211n-csitool-supplementary/CSI_Data/666.dat', pin, nargout=2)
        while '' in csi_trace:
            csi_trace.remove('')
        pin = cur
        len = np.size(csi_trace)

        print(len)#每次读取到的数据个数：0，1，2，3，4（较少），5（少）不等，
        if (len >= 1):
            csi_entry = csi_trace[len-1]
            csi = np.array(self.eng.get_scaled_csi(csi_entry))#python下标从0开始。##########%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 调用了matlab engine
            a, j, k = np.shape(csi)
            if (j == 3 and k == 30):
                csi = csi[0][:][:]
                csi_1 = csi[:][0][:]
                csi_1 = csi_1.squeeze().T

                amti = abs(csi_1[0])#获取 第1个子载波的幅值

                csi_1_angle=[]
                #csi_1_angle=cmath.phase(csi_1)#only length-1 arrays can be converted to Python scalars
                for phase_i in range(0,30):
                     csi_1_angle.append(cmath.phase(csi_1[phase_i]))
        #初始线性变化
                Temp = []
                recycle = 0
                Temp.append(csi_1_angle[0])
                for t_i in range(1,30):
                    if csi_1_angle[t_i] - csi_1_angle[t_i-1] > np.pi:
                        recycle = recycle + 1
                    Temp_i=csi_1_angle[t_i] - recycle * 2 * np.pi
                    Temp.append(Temp_i)

                csi_1_angle= Temp
        #更正相位
                k_index = [-28, -26, -24, -22, -20, -18, -16, -14, -12, -10, -8, -6, -4, -2, -1, 1, 3, 5, 7, 9, 11, 13,
                           15, 17, 19, 21, 23, 25, 27, 28]
                a = (csi_1_angle[29] -csi_1_angle[0])/56
                b = np.mean(csi_1_angle)
                angle =csi_1_angle[0] - a *k_index[0] - b
        return amti, angle