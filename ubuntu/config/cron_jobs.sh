# test
*/1 * * * * touch  ~/cron_jobs


# update git repos
*/1 * * * * cd  /home/chillaranand/.01/ && git pull && git push


# project from netcut
@reboot sudo arpon -o -D


# sar
# Collect measurements at 10-minute intervals
# 0,10,20,30,40,50   * * * *   /usr/lib/sa/sa1
# Create daily reports and purge old files
#0                  0 * * *   /usr/lib/sa/sa2 -A


# startup
# @reboot sleep 60 && nohup /usr/bin/byobu &
# @reboot sleep 60 && nohup /usr/bin/google-chrome &
# @reboot sleep 60 && nohup /usr/bin/emacs &
