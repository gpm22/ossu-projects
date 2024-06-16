# UDPPingerServer.py
# We will need the following module to generate randomized lost packets
import random
from socket import *
from datetime import datetime

# Create a UDP socket
# Notice the use of SOCK_DGRAM for UDP packets
serverSocket = socket(AF_INET, SOCK_DGRAM)
# Assign IP address and port number to socket
serverSocket.bind(("", 12000))
nextOne = -1
while True:
    # Generate random number in the range of 0 to 10
    rand = random.randint(0, 10)
    # Receive the client packet along with the address it is coming from
    message, address = serverSocket.recvfrom(1024)
    # If rand is less is than 4, we consider the packet lost and do not respond
    if rand < 4:
        continue
    # Capitalize the message from the client
    message = message.decode().split()
    response = ""

    nMessage = int(message[1])

    firstOneNotReceived = nextOne == -1 and nMessage != 1

    if firstOneNotReceived or (nMessage != 1 and nMessage != nextOne):
        response = "Package was lost"

    nextOne = 2 if nMessage == 1 else nMessage + 1

    timeMessage = (
        datetime.now()
        - datetime.strptime(message[2] + " " + message[3], "%Y-%m-%d %H:%M:%S.%f")
    ).total_seconds() * 1_000_000

    # Otherwise, the server responds
    response = response + f"\nPong {nMessage} {timeMessage} µs"
    serverSocket.sendto(response.encode(), address)
