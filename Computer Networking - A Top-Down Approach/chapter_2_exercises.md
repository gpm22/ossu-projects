# 1 - Computer Networks and the Internet

## Homework Problems and Questions

### Chapter 2 Review Questions

#### SECTION 2.1

**R1. List five nonproprietary Internet applications and the application-layer protocols that they use.**

1. Web: HTTP.
2. Remote login: Telnet.
3. Network News: NNTP.
4. E-mail: SMTP, IMAP, POP3.
5. File Transfer: FTP.
6. BitTorrent File Sharing: BitTorrent Protocol.

**R2. What is the difference between network architecture and application architecture?**

From the application developer’s perspective, the network architecture is fixed and provides a specific set of services to applications. The application architecture, on the other hand, is designed by the application developer and dictates how the application is structured over the various end systems.

The network architecture is divided in 5 layers:

1. Application
2. Transport
3. Network
4. Link
5. Physical

There is two predominant architectural paradigms in modern network application:

1. **Client-Server**
2. **Peer-to-Peer (P2P)**

**R3. For a communication session between a pair of processes, which process is the client and which is the server?**

The client is the one that starts the communication and the server is the one that waits for the communication to happen.

**R4. For a P2P file-sharing application, do you agree with the statement, “There is no notion of client and server sides of a communication session”? Why or why not?**

I agree, because every host is a client and a server at the same time. There is no host that only make request and no host that only give responses. All host communicate between them, one time being a client and other time being a server.

**R5. What information is used by a process running on one host to identify a process running on another host?**

The destination **IP address** plus the **port number** of the process.

**R6. Suppose you wanted to do a transaction from a remote client to a server as fast as possible. Would you use UDP or TCP? Why?**

UDP, because it is faster, as it does not care about creating a connection or making the data reliable.

**R7. Referring to Figure 2.4, we see that none of the applications listed in Figure 2.4 requires both no data loss and timing. Can you conceive of an application that requires no data loss and that is also highly time-sensitive?**

A bot that processes info about stock/forex markets and uses this info to make transactions.

**R8. List the four broad classes of services that a transport protocol can provide. For each of the service classes, indicate if either UDP or TCP (or both) provides such a service.**

1. **reliable data transfer**
   * TCP
2. **throughput**
3. **timing**
4. **security**
   * TCP when using TLS

**R9. Recall that TCP can be enhanced with TLS to provide process-to-process security services, including encryption. Does TLS operate at the transport layer or the application layer? If the application developer wants TCP to be enhanced with TLS, what does the developer have to do?**

TLS operate at the application layer, it has its own Socket API.

If an application wants to use the services of TLS, it needs to **include TLS code** in both the client and server sides of the application.

#### SECTIONS 2.2–2.5

## Problems

## Socket Programming Assignments

## Wireshark Lab: HTTP

## Wireshark Lab: DNS

