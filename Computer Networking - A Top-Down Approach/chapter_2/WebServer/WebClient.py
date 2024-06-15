from socket import *

serverName = "localhost"
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName, serverPort))
sentence = f"GET /HelloWorld.html HTTP/1.1\r\nHost: {serverName}:{serverPort}\r\n"
clientSocket.send(sentence.encode())
while True:
    modifiedSentence = clientSocket.recv(1024).decode()
    print("From Server: ", modifiedSentence)
    if modifiedSentence == "":
        break
clientSocket.close()
