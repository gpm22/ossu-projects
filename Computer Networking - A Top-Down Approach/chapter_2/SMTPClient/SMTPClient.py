from socket import *

def printRecv(expectedCode):
    recv = clientSocket.recv(1024).decode()
    print(recv)
    if recv[:3] != expectedCode:
        print(expectedCode, ' reply not received from server.')

def sendCommand(command):
    clientSocket.send(command.encode())

msg = "\r\n I love computer networks!"
endmsg = "\r\n.\r\n"
# Choose a mail server (e.g. Google mail server) and call it mailserver
mailserver = "smtp.gmail.com"
serverPort =  587
# Create socket called clientSocket and establish a TCP connection with mailserver
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((mailserver,serverPort))
printRecv("220")
print(1)
# Send HELO command and print server response.
sendCommand('HELO Alice\r\n')
printRecv("250")
print(2)

# Send STARTTLS command and print server response
sendCommand('STARTTLS\r\n')
printRecv("220")
print(21)

# Send EHLO command and print server response
sendCommand('HELO\r\n')
printRecv("250")
print(22)

# Send MAIL FROM command and print server response.
sendCommand('MAIL FROM gabrielpacmil@gmail.com\r\n')
printRecv("250")
print(3)

# Send RCPT TO command and print server response.
sendCommand('RCPT TO gabrielpacmil2@gmail.com\r\n')
printRecv("250")

# Send DATA command and print server response.
sendCommand('DATA\r\n')
printRecv("354")

# Send message data.
sendCommand('From: "Gabriel 1" <gabrielpacmil@gmail.com>\r\n')
sendCommand('To: "Gabriel 2" <gabrielpacmil2@gmail.com>\r\n')
sendCommand('Date: 12/24/2011\r\n')
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