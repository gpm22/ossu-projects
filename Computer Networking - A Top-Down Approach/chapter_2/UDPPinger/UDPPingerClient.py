from socket import *
from datetime import datetime
import random

serverName = "localhost"
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_DGRAM)
clientSocket.settimeout(1)
totalSent = 0
min = float("inf")
max = 0
totalRTT = 0
for i in range(1, 11):
    try:
        print("\nsending: ", i)
        rand = random.randint(0, 10)
        # If rand is less is than 4, we consider the packet lost for the server
        if rand < 4:
            print("ooops, lost it lol!")
            continue
        sendingTime = datetime.now()
        message = f"Ping {i} {str(sendingTime)}"
        clientSocket.sendto(message.encode(), (serverName, serverPort))
        response, serverAddress = clientSocket.recvfrom(2048)
        RTT = (datetime.now() - sendingTime).total_seconds() * 1_000_000

        totalSent = totalSent + 1
        totalRTT = totalRTT + RTT

        if RTT < min:
            min = RTT

        if RTT > max:
            max = RTT
        print("response: ", response.decode())
        print("RTT: ", RTT, " µs")
    except TimeoutError:
        print("Request timed out")

clientSocket.close()

avg = totalRTT / totalSent
lossRate = (10 - totalSent) / 10 * 100

print(
    "Minimum RTT: ", min, " µs - Maximum RTT: ", max, " µs - Average RTT: ", avg, " µs"
)
print("Packet loss rate: ", lossRate, " %")
