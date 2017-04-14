#!~/anaconda3/bin/python3.5
# -*- coding: utf-8 -*-
"""f2py_utils.py
    script with useful fucntions to f2py fortran modules
    ---
    C.Losada de la Lastra 2017
"""
import sys
import subprocess
from os.path import dirname, realpath

#
def compile_f2py(
        fModule=None,pyModule=None,fCompiler=None,logFile=None,buildDir=None
        ):
    #
    if fModule != None and pyModule != None:
        pass
    else:
        raise NameError
    sys.stdout.write('--- Compiling with f2py ---\n')
    sys.stdout.write('Fortran target module ' + fModule+'\n')
    sys.stdout.write('Python output module  ' + pyModule+'\n')
    sys.stdout.write('Log file ' + str(logFile)+'\n')
    #
    f2py_command = 'f2py -c -m '+pyModule+' '\
    +fModule+' --build-dir '+buildDir
    process = subprocess.run(
            f2py_command, shell=True, stdout=subprocess.PIPE
            )
    print(f2py_command)
    if logFile != None:
        with open(logFile,'w') as f:
            for line in process.stdout.decode().split('\n'):
                f.write(line)
                f.write('\n')
    else:
        pass
    return None