import os
import glob, os.path
import subprocess


rootDir = "/home/anand/git/learning/python/test/*/*"
filesDepth3 = glob.glob(rootDir)

fileList = filter(lambda f: os.path.isfile(f), filesDepth3)

for fileName in fileList:
    dirName = fileName[:-4]

    command = "mv " + fileName + " " + dirName
    subprocess.call(command, shell = True)
