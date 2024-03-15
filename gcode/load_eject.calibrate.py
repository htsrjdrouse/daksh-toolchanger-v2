import sys,re


def load(coord):
  print("G1 X"+str(coord['x'])+" F"+str(coord['cspeed']))
  print("G1 Y"+str(coord['y']-50)+" F"+str(coord['cspeed']))
  print("G1 Y"+str(coord['y']-1)+" F"+str(coord['aspeed']))
  print("G4 P"+str(coord['bdelay']))
  print("G1 X"+str(coord['x']-20)+" F"+str(coord['aspeed']))
  print("G1 X"+str(coord['x']-20+6)+" F"+str(coord['aspeed']))
  print("G1 X"+str(coord['x']-20)+" F"+str(coord['aspeed']))
  print("G1 X"+str(coord['x']-20+5)+" F"+str(coord['aspeed']))
  print("G1 Y"+str(coord['y']-50)+" F"+str(coord['cspeed']))




def eject(coord):
  print("G1 X"+str(coord['x']-15.5)+" F"+str(coord['cspeed']))
  print("G1 Y"+str(coord['y']-14)+" F"+str(coord['cspeed']))
  print("G1 Y"+str(coord['y'])+" F"+str(coord['dspeed']))
  print("G1 X"+str(coord['x']-15.5+16.5)+" F"+str(coord['aspeed']))
  print("G4 P"+str(coord['edelay']))
  print("G1 X"+str(coord['x']-15.5+16)+" F"+str(coord['aspeed']))
  print("G4 P"+str(coord['odelay']))
  print("G1 Y"+str(coord['y']-2)+" F"+str(coord['dspeed']))
  print("G4 P"+str(coord['odelay']))
  print("G1 Y"+str(coord['y'])+" F"+str(coord['dspeed']))
  print("G4 P"+str(coord['odelay']))
  print("G1 Y"+str(coord['y']-7)+" F"+str(coord['dspeed']))
  print("G1 Y"+str(coord['y']-14)+" F"+str(coord['aspeed']))
  print("G1 Y"+str(coord['y']-24)+" F"+str(coord['cspeed']))



#x = 104, y = 439
if re.match("\d++", sys.argv[1]) and re.match("\d++", sys.argv[2]):
  coord = {"x":float(sys.argv[1]),"cspeed":3000, "y":float(sys.argv[2]),"aspeed":1500, "dspeed":500, "edelay":2000, "odelay":1000, "bdelay":2000}
  print("Load coordinates: ")
  load(coord)
  print("")
  print("Eject coordinates:")
  eject(coord)
else:
  print("python3 load_eject.calibrate.py [xposition] [yposition]")
