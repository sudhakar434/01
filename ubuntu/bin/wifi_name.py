#! /usr/bin/python3


import subprocess


command = 'nmcli dev wifi'
out = subprocess.check_output(command.split())
output = out.decode('utf-8').split('\n')[1:]

for line in output:
    if '*' in line:
        wifi = line.split('Infra')[0].split('*')[1].strip()
        print(wifi)
