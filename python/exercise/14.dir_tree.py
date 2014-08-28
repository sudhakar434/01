#! /usr/bin/python

import  subprocess
import os

rootDir = 'test/'

for dirName, subdirList, fileList in os.walk(rootDir):
#    print dirName, subdirList, fileList

#    os.system('pwd')
#    print dirName

    for fname in fileList:

        if '.pdf' in fname:
            #print('\t %s' % fname )

            print fname
            abs_path = os.path.abspath((fname)) 
            print abs_path
            base_path = os.path.basename((fname))
            print base_path
            dir_name = abs_path.replace(base_path, '',)
            print dir_name
            #subprocess.call('pwd')
           # command = "cp " + fname + " " + dir_name
            #print command
            #subprocess.call(command)
            #os.system(command)
#            os.path.dirname(os.path.realpath(__file__))
            
  #  os.system('cd ..')
