from socket import *
from datetime import datetime

serverName = "localhost"
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_DGRAM)
clientSocket.settimeout(1)
for i in range(1, 11):
    try:
        print("\nsending: ", i)
        sendingTime = datetime.now()
        message = f"Ping {i} {str(sendingTime)}"
        clientSocket.sendto(message.encode(), (serverName, serverPort))
        response, serverAddress = clientSocket.recvfrom(2048)
        RTT = (datetime.now() - sendingTime).total_seconds() * 1_000_000
        print("response: ", response.decode())
        print("RTT: ", RTT, " µs")
    except TimeoutError:
        print("Request timed out")

clientSocket.close()
