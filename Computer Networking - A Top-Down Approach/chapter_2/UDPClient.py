from socket import *
serverName = ''
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_DGRAM)
#clientSocket.bind(('', 5432))
message = input('Input lowercase sentence:')
clientSocket.sendto(message.encode(),(serverName, serverPort))
modifiedMessage, serverAddress = clientSocket.recvfrom(2048)
print(serverAddress)
print(modifiedMessage.decode())
clientSocket.close()
