import os
import glob, os.path
import subprocess


rootDir = "/home/anand/git/learning/python/test/*/*/*"
filesDepth3 = glob.glob(rootDir)

fileList = filter(lambda f: os.path.isfile(f), filesDepth3)

for fileName in fileList:
    dirName = os.path.dirname(fileName)
    os.chdir(dirName)
    command = "pdftk " + fileName + " burst"
    print command
    subprocess.call(command, shell=True)


