import numpy as np
import matplotlib.pyplot as plt

def ydot(t,y):
    return t*y+t**3

def eulerstep(y,t,h):
    