# import socket module
from socket import *
import threading
import sys  # In order to terminate the program


def responseThread(connectionSocket, addr):
    try:
        message = connectionSocket.recv(1024).decode()
        print("sending to: ", addr)
        filename = message.split()[1]
        f = open(filename[1:])
        a = input("waiting")
        outputdata = f.read()
        # Send one HTTP header line into socket
        connectionSocket.send("HTTP/1.1 200 OK\r\n".encode())
        connectionSocket.send("Connection: close\r\n".encode())
        connectionSocket.send("Content-Type: text/html\r\n".encode())
        connectionSocket.send("\r\n".encode())
        # Send the content of the requested file to the client
        for i in range(0, len(outputdata)):
            connectionSocket.send(outputdata[i].encode())

        connectionSocket.send("\r\n".encode())
    except IOError:
        # Send response message for file not found
        connectionSocket.send("HTTP/1.1 404 Not Found".encode())
        connectionSocket.send("\r\n".encode())
    # Close client socket
    connectionSocket.close()


def mainThread():
    serverSocket = socket(AF_INET, SOCK_STREAM)
    # Prepare a sever socket
    serverPort = 12000
    serverSocket.bind(("", serverPort))
    serverSocket.listen(1)
    while True:
        # Establish the connection
        print("Ready to serve...")
        connectionSocket, addr = serverSocket.accept()
        newThread = threading.Thread(
            target=responseThread, args=(connectionSocket, addr)
        )
        newThread.start()
    serverSocket.close()
    sys.exit()  # Terminate the program after sending the corresponding data


if __name__ == "__main__":
    mainThread()
