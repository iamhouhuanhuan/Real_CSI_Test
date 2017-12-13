#2017.12.11
import tkinter as tk
from tkinter import ttk as ttk
from PIL import ImageTk, Image#图片插件
import tkinter.messagebox as tk_messagebox
import RealtimePlotter.phaseplot as csi_window #csi_window.csi_window_state
# from RealtimePlotter.phaseplot import *

param_get=False

param_list=[]

def CSI_GUI():
    #1.布局：
    #初始化主窗口
    main_window=tk.Tk()
    main_window.geometry("600x700")
    main_window.title("CSI_View")
    main_window.resizable(width=False, height=False) # 设置窗口是否可以变化长/宽，False不可变，True可变，默认为True
    #设置主窗口背景
    background_label = tk.Label(main_window,height=695,width=595,bg="lightblue")#主背景色，同时设定左、上侧边框
    background_label.place(x=5, y=5)
    background_labe4 = tk.Label(main_window,height=695,width=1,bg="white")#设定右边框
    background_labe4.place(x=595, y=5)

    image = Image.open(r'backgroundimage/fff.PNG')#设定三幅背景图
    background_image = ImageTk.PhotoImage(image)
    background_label = tk.Label(main_window, image=background_image,height=95,width=230,bg="lightblue")
    background_label.place(x=5, y=600)
    background_labe2 = tk.Label(main_window, image=background_image,height=95,width=230,bg="lightblue")
    background_labe2.place(x=235, y=600)
    background_labe3 = tk.Label(main_window, image=background_image,height=95,width=125,bg="lightblue")
    background_labe3.place(x=465, y=600)

    background_labe5 = tk.Label(main_window,height=5,width=590,bg="white")#设定底边框
    background_labe5.place(x=5, y=695)

    #2.添加控件
    frame1=tk.Frame(height=50, width=400,bg="lightblue")
    frame1.place(x=100,y=5)#调整frame的位置,控件的位置均是相对于其父窗口

    frame2=tk.Frame(height=50, width=400,bg="lightblue")
    #label不可设定height,width,否则该label会覆盖其父框架，其他控件也是一样:后面又可以了。。。。。
    tk.Label(frame2,text="CSI实验设置：",fg="blue",bg="lightgray",font=("Times",12,"bold")).place(x=0,y=15)#label文本，背景色（bg），前景色（fg),字体
    frame2.place(x=100,y=50)
    global Trial_Send_radio_var
    Trial_Send_radio_var = tk.IntVar()  # 设定成整型可变量
    Trial_Send_radio_var.set(1)  # 默认为1
    frame3=tk.Frame(height=50, width=400,bg="lightblue")
    tk.Label(frame3,text="发送天线数：",bg="lightgray",font=("Times",12)).place(x=20,y=15)
    Trial_Send_rb1 = tk.Radiobutton(frame3, text='1', variable=Trial_Send_radio_var, value=1).place(x=120,y=16)
    Trial_Send_rb2 = tk.Radiobutton(frame3, text='2', variable=Trial_Send_radio_var, value=2).place(x=180,y=16)
    Trial_Send_rb3 = tk.Radiobutton(frame3, text='3', variable=Trial_Send_radio_var, value=3).place(x=240,y=16)
    frame3.place(x=100,y=100)
    global Trial_Receive_radio_var
    Trial_Receive_radio_var = tk.IntVar()  # 设定成整型可变量
    Trial_Receive_radio_var.set(3)  # 默认为3
    frame4=tk.Frame(height=50, width=400,bg="lightblue")
    tk.Label(frame4,text="接收天线数：",bg="lightgray",font=("Times",12)).place(x=20,y=15)
    Trial_Receive_rb1 = tk.Radiobutton(frame4, text='1', variable=Trial_Receive_radio_var, value=1).place(x=120,y=16)
    Trial_Receive_rb2 = tk.Radiobutton(frame4, text='2', variable=Trial_Receive_radio_var, value=2).place(x=180,y=16)
    Trial_Receive_rb3 = tk.Radiobutton(frame4, text='3', variable=Trial_Receive_radio_var, value=3).place(x=240,y=16)
    frame4.place(x=100,y=150)

    frame5=tk.Frame(height=50, width=400,bg="lightblue")

    frame5.place(x=100,y=200)

    frame6=tk.Frame(height=50, width=400,bg="lightblue")
    tk.Label(frame6,text="CSI实时显示设置：",fg="blue",bg="lightgray",font=("Times",12,"bold")).place(x=0,y=15)
    frame6.place(x=100,y=250)

    frame7=tk.Frame(height=50, width=400,bg="lightblue")
    tk.Label(frame7,text="天线对选择：",bg="lightgray",font=("Times",12)).place(x=20,y=15)
    frame7.place(x=100,y=300)

    frame8=tk.Frame(height=50, width=400,bg="lightblue")
    tk.Label(frame8,text="发送天线：",bg="lightgray",font=("Times",12)).place(x=30,y=19)
    global com_send_value
    com_send_value=tk.IntVar()
    comboxlist_send=ttk.Combobox(frame8,textvariable=com_send_value,width=8)
    comboxlist_send["values"]=(1,2,3)
    comboxlist_send.current(0)
    comboxlist_send.place(x=115,y=22)
    tk.Label(frame8,text="接收天线：",bg="lightgray",font=("Times",12)).place(x=210,y=19)
    global com_receive_value
    com_receive_value =tk.IntVar()  # 窗体自带的文本，新建一个值
    comboxlist_receive = ttk.Combobox(frame8,textvariable=com_receive_value,width=8)
    # set_comvalue=Trial_Receive_radio_var.get()
    # if set_comvalue==1:
    #     comboxlist["values"] = (1)
    # else:
    #     if set_comvalue==2:
    #         comboxlist["values"] = (1,2)
    #     else:
    comboxlist_receive["values"] = (1,2,3)#暂时无法实现动态加载，暂时设定为固定值
    comboxlist_receive.current(2)  # 默认选择第一个
    comboxlist_receive.place(x=295,y=22)
    frame8.place(x=100,y=350)

    frame9=tk.Frame(height=50, width=400,bg="lightblue")
    tk.Label(frame9,text="子载波选择：",bg="lightgray",font=("Times",12)).place(x=20,y=15)
    frame9.place(x=100,y=400)

    global subcarrier_radio_var
    subcarrier_radio_var = tk.IntVar()  # 设定成整型可变量
    subcarrier_radio_var.set(1)  # 默认为1
    frame10=tk.Frame(height=50, width=400,bg="lightblue")
    subcarrier_1_rb1 = tk.Radiobutton(frame10, text='1个子载波',font=("Times",12),variable=subcarrier_radio_var, value=1).place(x=30,y=12)
    tk.Label(frame10,text="==>第",bg="lightgray",font=("Times",12)).place(x=134,y=15)
    global com_subcarrier_value
    com_subcarrier_value=tk.IntVar()
    comboxlist_subcarrier=ttk.Combobox(frame10,textvariable=com_subcarrier_value,width=6)
    comboxlist_subcarrier["values"]=(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30)
    comboxlist_subcarrier.current(0)
    comboxlist_subcarrier.place(x=180,y=18)
    tk.Label(frame10,text="个子载波（1~30）",bg="lightgray",font=("Times",12)).place(x=238,y=15)
    frame10.place(x=100,y=450)

    frame11=tk.Frame(height=50, width=400,bg="lightblue")
    subcarrier__30_rb2 = tk.Radiobutton(frame11, text='30个子载波',font=("Times",12),variable=subcarrier_radio_var, value=2).place(x=30,y=12)
    frame11.place(x=100,y=500)

    #保留两个框架
    # frame12=tk.Frame(height=50, width=400,bg="blue")
    # frame12.place(x=100,y=550)
    #
    # frame13=tk.Frame(height=50, width=400,bg="black")
    # frame13.place(x=100,y=600)
    start=tk.Button(main_window,text="开始",bg="green",font=("Times",12),height=2,width=6,command=collect_data).place(x=400,y=520)
    tk.mainloop()

def collect_data():
    global param_list
    global param_get
    if ~csi_window.csi_windaw_state:
        if param_get:
            tk_messagebox.showwarning("tip!", "Don't press the button repeatly")
        else:
        #实验设置
            param_list.append(Trial_Send_radio_var.get())
            param_list.append(Trial_Receive_radio_var.get())
            #天线对选择
            param_list.append(com_send_value.get())
            param_list.append(com_receive_value.get())
            #子载波选择
            param_list.append(subcarrier_radio_var.get())
            param_list.append(com_subcarrier_value.get())
            param_get=True
    else:
        tk_messagebox.showwarning("tip!", "Please close the CSI Window firstly")

if __name__ == '__main__':
    CSI_GUI()




