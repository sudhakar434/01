import socket

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("avilpage.com",80))
print(s.getsockname()[0])
s.close()
