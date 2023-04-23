import os
import math
import pathlib
TT_x=34.02051025073418
TT_y=-118.28567446220507
n=6
R=6
r=1
a=8
t=0
n=16
dir=os.getcwd()
file=os.path.join(dir,"Spiro.txt")
with open(file,"w+") as spirofile:
    spirofile.write("[\n")
    while t <=n*math.pi:        
        x_t = ((R+r)*math.cos((r/R)*t) - a*math.cos((1+r/R)*t))*0.0003+TT_x
        y_t = ((R+r)*math.sin((r/R)*t) - a*math.sin((1+r/R)*t))*0.0003+TT_y
        t+=0.1
        spirofile.write("{\n")
        spirofile.write("\"loc\":["+str(y_t)+","+str(x_t)+"]\n")
        spirofile.write("},\n")
        
        
    spirofile.write("]")

        
        