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

**R10. What is meant by a handshaking protocol?**

It is a protocol to initiate something, like a connection.

**R11. Why do HTTP, SMTP, and IMAP run on top of TCP rather than on UDP?**

**R12. Consider an e-commerce site that wants to keep a purchase record for each of its customers. Describe how this can be done with cookies.**

By keeping this list info in a database table where the key is the user cookie.

**R13. Describe how Web caching can reduce the delay in receiving a requested object. Will Web caching reduce the delay for all objects requested by a user or for only some of the objects? Why?**

Web caching reduces the delay in receiving a requested object by avoiding the necessity of creating/retrieving the object from the original server. As way from the client is larger and possibly slower. Also is possible to need sometime to create the object itself, so caching can avoid the need for it.

Web caching reduce the delay for only some of the objects, as not all objects are cacheable, like something that must be generated in every request.

**R14. Telnet into a Web server and send a multiline request message. Include in the request message the If-modified-since: header line to force a response message with the 304 Not Modified status code.**

```bash
telnet gaia.cs.umass.edu 80

GET /kurose_ross/interactive/index.php HTTP/1.1
Host: gaia.cs.umass.edu
If-modified-since: Wed, 9 Jan 2024 02:23:24
```



**R15. List several popular messaging apps. Do they use the same protocols as SMS?**

**R16. Suppose Alice, with a Web-based e-mail account (such as Hotmail or Gmail), sends a message to Bob, who accesses his mail from his mail server using IMAP. Discuss how the message gets from Alice’s host to Bob’s host. Be sure to list the series of application-layer protocols that are used to move the message between the two hosts.**

**R17. Print out the header of an e-mail message you have recently received. How many Received: header lines are there? Analyze each of the header lines in the message.**

**R18. What is the HOL blocking issue in HTTP/1.1? How does HTTP/2 attempt to solve it?**

**R19. Is it possible for an organization’s Web server and mail server to have exactly the same alias for a hostname (for example, foo.com)? What would be the type for the RR that contains the hostname of the mail server?**

**R20. Look over your received e-mails, and examine the header of a message sent from a user with a .edu e-mail address. Is it possible to determine from the header the IP address of the host from which the message was sent? Do the same for a message sent from a Gmail account.**

## Problems

## Socket Programming Assignments

## Wireshark Lab: HTTP

## Wireshark Lab: DNS

