import os

class cd:
    """Context manager for changing the current working directory"""
    def __init__(self, newPath):
        self.newPath = newPath

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)


import subprocess
import os

current = os.getcwd()
print "MAIN", current
current += "test/"

with cd("test/"):
    print "TEST:", os.getcwd()

    for dirName, subDir, fileList in os.walk(os.getcwd()):

         for name in fileList:
             absPath = (os.path.join(dirName, name))

             command = "mv " + absPath + " " + absPath[:-4] 

             subprocess.call(command, shell=True)
             print command
             print subDir
             print dirName, "\n"
