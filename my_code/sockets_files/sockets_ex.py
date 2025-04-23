import socket

mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect(('data.pr4e.org',80))

cmd = 'GET http://data.pr4e.org/romeo.txt HTTP/1.0\r\n\r\n'.encode() # The encode method what does is to encode the string into utf-8
mysock.send(cmd)

while True: 

    data = mysock.recv(512) # The recv method is sending the message to retrieve 512 characters.
    if len(data) < 1: break 
    
    print(data.decode()) # decode the UTF-8 that comes from the request, to a unicode string.

mysock.close()