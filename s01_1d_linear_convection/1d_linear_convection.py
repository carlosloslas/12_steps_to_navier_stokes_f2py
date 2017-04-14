#!~/anaconda3/bin/python3.5
"""Main script of the linear convection step of 12 steps to N-S
    ---
    C.Losada de la Lastra 2017
"""
import numpy as np
import matplotlib.pyplot as plt
#
# compile the fortran module
from os.path import dirname, realpath
import sys
sys.path.append('../')
from f2py_utils import compile_f2py
compile_f2py(
        fModule='linearConvection.f90',pyModule='linearConvection'
        ,logFile='linConv_f2py.log',buildDir=dirname(realpath(__file__))
        )
#
#print(dirname(realpath(__file__)))