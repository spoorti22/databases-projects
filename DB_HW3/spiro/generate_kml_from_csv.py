'''
From the points that we got from spiro_pointgen.js,
we store the points in a CSV file and then run this script to generate the KML file
'''

from simplekml import Kml, Style
import csv

inputfile = csv.reader(open('spirograph_points.csv','r'))
kml = Kml()


sharedstyle = Style()
sharedstyle.labelstyle.color = '7dff0000'#Blue
for row in inputfile:
	pnt=kml.newpoint(name="Point", coords=[(row[0],row[1])])
	pnt.style = sharedstyle 

kml.save('spiro.kml')