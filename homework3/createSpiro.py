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
file=os.path.join(dir,"Spiro.kml")
with open(file,"w+") as spirofile:
    spirofile.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
    spirofile.write("<kml xmlns=\"http://earth.google.com/kml/2.0\">\n")
    spirofile.write("<Document>\n")
    spirofile.write("<Style id=\"z1\">\n")
    spirofile.write("<IconStyle><Icon><href>http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png</href></Icon></IconStyle>\n")
    spirofile.write("</Style>\n")
    while t <=n*math.pi:        
        x_t = ((R+r)*math.cos((r/R)*t) - a*math.cos((1+r/R)*t))*0.0003+TT_x
        y_t = ((R+r)*math.sin((r/R)*t) - a*math.sin((1+r/R)*t))*0.0003+TT_y
        t+=0.01
        spirofile.write("<Placemark><name>datapoint</name>\n")
        spirofile.write("<styleUrl>#z1</styleUrl><Point><coordinates>"+str(y_t)+","+str(x_t)+"</coordinates></Point>\n")
        spirofile.write("</Placemark>\n")
        
        
    spirofile.write("</Document></kml>")

        
        