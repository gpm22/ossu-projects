from socket import *

def printRecv(expectedCode):
    recv = clientSocket.recv(1024).decode()
    print(recv)
    if recv[:3] != expectedCode:
        print(expectedCode, ' reply not received from server.')

def sendCommand(command):
    print("sending: ", command)
    clientSocket.send(command.encode())

# Choose a mail server (e.g. Google mail server) and call it mailserver
mailserver = "gmail-smtp-in.l.google.com"
serverPort = 25
# Create socket called clientSocket and establish a TCP connection with mailserver
print("connecting to: ", mailserver)
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((mailserver,serverPort))
printRecv("220")
# Send HELO command and print server response.
sendCommand('HELO Alice\r\n')
printRecv("250")

# Send MAIL FROM command and print server response.
sendCommand('MAIL FROM:<gabrielpacmil@gmail.com>\r\n')
printRecv("250")

# Send RCPT TO command and print server response.
sendCommand('RCPT TO:<gabrielpacmil2@gmail.com>\r\n')
printRecv("250")

# Send DATA command and print server response.
sendCommand('DATA\r\n')
printRecv("354")

# Send message data.
sendCommand('From: "Gabriel 1" <gabrielpacmil@gmail.com>\r\n')
sendCommand('To: "Gabriel 2" <gabrielpacmil2@gmail.com>\r\n')
sendCommand('Date: 12/24/2011\r\n')
sendCommand('Message-ID: <' + str(hash('123981271212kijh349721372190390kjshxdjkjikhskjdhsakhdkjashdk')) + '@com.gpm22.github>\r\n')
sendCommand('Subject: The World is Beautiful, my friend...\r\n')
sendCommand('\r\n')
sendCommand('Hey, DUDE!')
sendCommand('\r\n')
sendCommand('Once up on a time, a man tried to deliver a hot potato.')
sendCommand('But, he failed :(')
sendCommand('\r\n')
sendCommand('Best regards,\r\nGabriel')

# Message ends with a single period.
sendCommand('\r\n.\r\n')
printRecv("250")

# Send QUIT command and get server response.
sendCommand('QUIT\r\n')
printRecv("221")