import subprocess


def run_shell_command(command, shell=False, env=None):
    if isinstance(command, str):
        command = command.split()
    p = subprocess.Popen(
        command, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
        shell=shell, env=env)
    p.wait()
    out, err = p.communicate()
    # fixme: err also has stdout
    # if err:
    # e_logger.error("Can't run {} shell command - {}".format(command, err))
    return out.decode('utf-8')


for i in range(1000000):
    print(i)
    run_shell_command('adb start-server')
