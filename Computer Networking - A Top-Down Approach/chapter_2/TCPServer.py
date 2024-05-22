from socket import *

serverPort = 12000
serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(("", serverPort))
serverSocket.listen(1)
print("The server is ready to receive")
while True:
    connectionSocket, addr = serverSocket.accept()
    sentence = connectionSocket.recv(1024).decode()
    print("address of sender: ")
    print(addr)
    print("received sentence: " + sentence)
    capitalizedSentence = sentence.upper()
    print("captalized sentence: " + capitalizedSentence)
    connectionSocket.send(capitalizedSentence.encode())
    connectionSocket.close()
