from time import sleep
import matlab.engine
import matplotlib.pyplot as plt
import numpy as np
from  RealtimePlotter.CSI_GUI  import* #import param_list
is_open=False

def handleClose(event):
    global is_open  # 设定为全局变量
    #print("houge")
    is_open = False

def start_30_fun(eng):
    # eng = matlab.engine.start_matlab()
    # print("matlab is ok")
    # eng.path(eng.path(),r'/home/houhuan/Pycharm/Workplace/CSI_process/matlab_function')
    csi_trace, cur = eng.read_file_realtime(r'/linux-80211n-csitool-supplementary/CSI_Data/666.dat',0,nargout=2);
    fig = plt.figure()
    ax1 = fig.add_subplot(1,1,1)

    fig.canvas.mpl_connect('close_event',handleClose)
    global is_open
    is_open=True

    show_i=0
    while True:
        if is_open==False:
            break
        else:
            csi_trace, cur = eng.read_file_realtime(r'/linux-80211n-csitool-supplementary/CSI_Data/666.dat', cur,nargout=2);
            while '' in csi_trace:
                csi_trace.remove('')
            len = np.size(csi_trace)
            print(len)
            #for i in range(1,len) :
            if len>=1:
                csi_entry = csi_trace[len-1]
                csi = np.array(eng.get_scaled_csi(csi_entry))
                # print(csi)
                temp_show_cache=[]
                a = np.random.randint(0, 10, 30)
                a, j, k = np.shape(csi)
                if (j == 3 and k == 30):
                    csi = csi[0][:][:]
                    csi_1 = csi[:][0][:]
                    csi_1 = csi_1.squeeze().T
                    plt.plot(abs(csi_1), 'r-')
                    plt.pause(0.05)
                    show_i = show_i + 1
            if show_i >= 100:#
                plt.clf()
                show_i=0


