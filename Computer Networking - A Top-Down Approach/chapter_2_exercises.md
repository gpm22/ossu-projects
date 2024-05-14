# 1 - Computer Networks and the Internet

## Homework Problems and Questions

### Chapter 2 - Review Questions

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

Because they need the guarantee that the request and the response will be sent complete, that is, the integrity of the content is guaranteed.

**R12. Consider an e-commerce site that wants to keep a purchase record for each of its customers. Describe how this can be done with cookies.**

By keeping this list info in a database table where the key is the user cookie.

**R13. Describe how Web caching can reduce the delay in receiving a requested object. Will Web caching reduce the delay for all objects requested by a user or for only some of the objects? Why?**

Web caching reduces the delay in receiving a requested object by avoiding the necessity of creating/retrieving the object from the original server. As way from the client is larger and possibly slower. Also is possible to need sometime to create the object itself, so caching can avoid the need for it.

Web caching reduce the delay for only some of the objects, as not all objects are cacheable, like something that must be generated in every request.

**R14. Telnet into a Web server and send a multiline request message. Include in the request message the If-modified-since: header line to force a response message with the 304 Not Modified status code.**

Sending

```bash
telnet info.cern.ch 80

GET / HTTP/1.1
Host: info.cern.ch
If-modified-since: Wed, 05 Feb 2014 16:00:31 GMT
```

generated

```http
HTTP/1.1 304 Not Modified
Date: Tue, 09 Jan 2024 15:21:47 GMT
Server: Apache
Connection: close
ETag: "286-4f1aadb3105c0"
```



**R15. List several popular messaging apps. Do they use the same protocols as SMS?**

**R16. Suppose Alice, with a Web-based e-mail account (such as Hotmail or Gmail), sends a message to Bob, who accesses his mail from his mail server using IMAP. Discuss how the message gets from Alice’s host to Bob’s host. Be sure to list the series of application-layer protocols that are used to move the message between the two hosts.**

1. Alice invokes her user agent for e-mail, provides Bob’s e-mail address, composes a message, and instructs the user agent to send the message.
  2.  Alice’s user agent sends the message to her mail server, where it is placed in a message queue.
  3. The client side of SMTP, running on Alice’s mail server, sees the message in the message queue. It opens a TCP connection to an SMTP server, running on Bob’s mail server.
  4. After some initial SMTP handshaking, the SMTP client sends Alice’s message into the TCP connection.
  5. At Bob’s mail server, the server side of SMTP receives the message. Bob’s mail server then places the message in Bob’s mailbox.
  6. Bob invokes his user agent to read the message at his convenience by accessing the email through IMAP.

**R17. Print out the header of an e-mail message you have recently received. How many `Received:` header lines are there? Analyze each of the header lines in the message.**

```
Received: from PH0PR16MB4899.namprd16.prod.outlook.com (2603:10b6:510:116::5)
 by MN6PR16MB5305.namprd16.prod.outlook.com with HTTPS; Thu, 18 Apr 2024
 16:29:22 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ul.com;
Received: from BLAPR16MB3875.namprd16.prod.outlook.com (2603:10b6:208:27c::13)
 by PH0PR16MB4899.namprd16.prod.outlook.com (2603:10b6:510:116::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 16:29:19 +0000
Received: from BLAPR16MB3875.namprd16.prod.outlook.com
 ([fe80::421c:8611:afcd:6d2b]) by BLAPR16MB3875.namprd16.prod.outlook.com
 ([fe80::421c:8611:afcd:6d2b%5]) with mapi id 15.20.7452.049; Thu, 18 Apr 2024
 16:29:19 +0000
Content-Type: application/ms-tnef; name="winmail.dat"
Content-Transfer-Encoding: binary
From: secret0@secret.com
To: secret1@secret.com
CC: secret2@secret.com
Subject: Secret
Thread-Topic: Secret
Thread-Index: AQHaka2QyQS5tn6eEUuXmGDjr3BHQA==
Date: Thu, 18 Apr 2024 16:29:19 +0000
Message-ID:
 <BLAPR16MB387583235FD166A6EAF9933C8B0E2@BLAPR16MB3875.namprd16.prod.outlook.com>
References:
 <DM5PR16MB1849CD4AE20EEE045BBF6DD29D4E9@DM5PR16MB1849.namprd16.prod.outlook.com>
 <DM5PR16MB18495279467B251B5EE0CC669D5C9@DM5PR16MB1849.namprd16.prod.outlook.com>
 <BN8PR16MB30107A0CAE10646B588FBC6E8B2A9@BN8PR16MB3010.namprd16.prod.outlook.com>
 <BN8PR16MB3010F786FC8CF49935A4B43A8B389@BN8PR16MB3010.namprd16.prod.outlook.com>
 <BN8PR16MB3010DDEE765D98BC265B2C0B8B069@BN8PR16MB3010.namprd16.prod.outlook.com>
 <BN8PR16MB30103138E12DF59409024ED18B149@BN8PR16MB3010.namprd16.prod.outlook.com>
 <BN8PR16MB30109BDF558E0CD7408AF8138BE19@BN8PR16MB3010.namprd16.prod.outlook.com>
 <DM6PR16MB30208206957DEC440D1C03928BFD9@DM6PR16MB3020.namprd16.prod.outlook.com>
 <DM6PR16MB30208D57CA537EBEF07F5A778BCF9@DM6PR16MB3020.namprd16.prod.outlook.com>
 <DM6PR16MB3020DB5D2D9451469BEFDC3A8BD99@DM6PR16MB3020.namprd16.prod.outlook.com>
 <BN8PR16MB30101934A0F274F4067FF5A48BAB9@BN8PR16MB3010.namprd16.prod.outlook.com>
 <BN8PR16MB30102BE4EFCB6AB1FADA94B18BB59@BN8PR16MB3010.namprd16.prod.outlook.com>
 <BN8PR16MB30108CA3137258FE70208E6B8B879@BN8PR16MB3010.namprd16.prod.outlook.com>
 <BN8PR16MB3010874C37935F98870BBC528B919@BN8PR16MB3010.namprd16.prod.outlook.com>
 <BN8PR16MB301082CF46A8C655F88DB3158B639@BN8PR16MB3010.namprd16.prod.outlook.com>
 <CH3PR16MB5249A1E72F09CA2D6AD9FB33FE6D9@CH3PR16MB5249.namprd16.prod.outlook.com>
 <DM6PR16MB309778A111FBAC8C5C4CF84F977F9@DM6PR16MB3097.namprd16.prod.outlook.com>
 <BN8PR16MB3010A4CC04754382AE21A5A18B499@BN8PR16MB3010.namprd16.prod.outlook.com>
 <DM6PR16MB3020A2F387B0DC8350373E678B5BA@DM6PR16MB3020.namprd16.prod.outlook.com>
 <DM6PR16MB3097E4E87C4FBF72D5C8797E9725A@DM6PR16MB3097.namprd16.prod.outlook.com>
 <DM8PR16MB45499E46554B58738C53DD138B37A@DM8PR16MB4549.namprd16.prod.outlook.com>
 <BLAPR16MB38751246AB875322EAE0ACD18B01A@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38752A3144355E484A76764D8B13A@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38753FDCBC391EB8C03D97D18B1DA@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38752B7294B937189C3EBB8D8BEEA@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38752BA42A89124B60F4AD838BF8A@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB387552D338536BF13DDF31458BCAA@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38756076F9F476E570EF1BDF8BD4A@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB387552895D05BCE55C6266638BA6A@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB3875C95B2C5284C15B0F88268BB0A@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38754B804F7C214E6A93AC3D8B82A@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38758810143D7803A57AECFB8B8CA@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB3875CFFBB783B1CF2102C9EC8B7A2@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38753564A3D5CDD546FDE5128B442@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38759F8DE1194A3DEE01DC298B562@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB387576B4C8D6E9C08411983A8B202@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38750D339C637145AFF56C898B322@BLAPR16MB3875.namprd16.prod.outlook.com>
 <BLAPR16MB38755280CF9B43E6454B9B2A8B3C2@BLAPR16MB3875.namprd16.prod.outlook.com>
In-Reply-To:
 <BLAPR16MB38755280CF9B43E6454B9B2A8B3C2@BLAPR16MB3875.namprd16.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: 1
X-MS-TNEF-Correlator:
 <BLAPR16MB387583235FD166A6EAF9933C8B0E2@BLAPR16MB3875.namprd16.prod.outlook.com>
msip_labels:
MIME-Version: 1.0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-AuthSource: BLAPR16MB3875.namprd16.prod.outlook.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-Network-Message-Id:
 57ad5d29-1f29-4d07-0d67-08dc5fc4b28a
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
 BLAPR16MB3875:EE_|PH0PR16MB4899:EE_|MN6PR16MB5305:EE_
Return-Path: secret0@secret.com
X-MS-Exchange-Organization-ExpirationStartTime: 18 Apr 2024 16:29:20.0527
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Office365-Filtering-Correlation-Id: 57ad5d29-1f29-4d07-0d67-08dc5fc4b28a
X-MS-Exchange-AtpMessageProperties: SA
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR16MB3875.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(41050700001);DIR:INT;
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-Exchange-Organization-Recipient-P2-Type: Cc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 16:29:19.3236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70115954-0ccd-45f0-87bd-03b2a3587569
X-MS-Exchange-CrossTenant-AuthSource: BLAPR16MB3875.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ad5d29-1f29-4d07-0d67-08dc5fc4b28a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wjSibAuEufTbYjsF7yI4E2eN32cxo3JR5GXL0Ir0y09HatCBN0MgUc7T172VSQDi+04LQ5zTTibEw7saJ3GKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4899
X-MS-Exchange-Transport-EndToEndLatency: 00:00:03.6460729
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7472.035
X-Microsoft-Antispam-Mailbox-Delivery:
	ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(425001)(930097)(140003);
X-Microsoft-Antispam-Message-Info:
	9iAshsPsNrRkdTLcsOGvF0Zw8Xek7kbpG+uug6PY+vqSuWnyDoSIErVahQNCz9ualREmXQIkMcmTpezsxU3u/+wv/iPqe2iibe/VloXSG40cYZfogNRNN8OSYvgRyuRx/Te1mKmIDkYHRZEgCexBDXhsz15l+KRSR3ZvxAQa/FqOocaYGx2qncsj/mD3CsuiwEaIUCVK59MTsMTuGD5Rks4Dt7zUTab9BeqvPFEUr0V1d7YG+i3pG6rsDtT6xonY6Sq8N3zqraVuCODYr5aNq1/AxpGFAEQidhg4Vsf8RkZ+c15r+I35qWHfnmXZYMegtYemeEPvESYzO8rC5zqyFo7/87ASHNU5B2h7OyWFJmqednZCVa36XZmtfNYH+OHhIfMElOp0JBU3KdYXFdBGNJvB/posEYpkgX7XKBiJzHbpV63OzZXiXISBP0GCjvubtqL+cJmEW3Er1PW+xliAbqxHeQm6FUYetjmOZ3Srv/C3kI/zjz7eGsTRfcHjNtAtLv48jACdZ+Fb1T9+yYMZqWdh0stK0uYR81MPLqxMg7Fzd2vJMmrVE6frVBoW4ZQuxhM8VeQEcQiI0qt6UaiD8WvtAnszH4OmQFhlvdLCnc9QEYcSAiv7c9mYgcUfP8GU8O0Dk3VqBoTHCgLoFBRingy9pHnl+eXT9bDpdL65C9w455XgcwphkMjB4iOA+ssWXlvh4HKpRdVG2MC7WoIkRLw8j8Pw9b7UKVZOjq5zvloBEvDG42zOlx/6GRiKXSW7Js2sp4XFqrlvS542bGGsLH/xOQPpM4Z2cbt8kRWA5TQIp7LEtJJq/fhMhXk9M8JZXZeoTT6E/Aij1Os6Pz8SSQ==
```

There are 3 `Received:` header lines.

**R18. What is the HOL blocking issue in HTTP/1.1? How does HTTP/2 attempt to solve it?**

The HOL (Head of Line) blocking happens when a bigger object blocks the smaller objects to be sent.

To solve it, HTTP/2 uses frame interleaving, which consists in breaking each message into small frames, and interleaving the request and response messages on the same TCP connection.

**R19. Is it possible for an organization’s Web server and mail server to have exactly the same alias for a hostname (for example, foo.com)? What would be the type for the RR that contains the hostname of the mail server?**

Yes, it is possible. The RR type for the email server is `MX`.

**R20. Look over your received e-mails, and examine the header of a message sent from a user with a .edu e-mail address. Is it possible to determine from the header the IP address of the host from which the message was sent? Do the same for a message sent from a Gmail account.**

Using gmail was possible to see ips for both .edu and other kind of emails.

#### SECTION 2.5

**R21. In BitTorrent, suppose Alice provides chunks to Bob throughout a 30-second interval. Will Bob necessarily return the favor and provide chunks to Alice in this same interval? Why or why not?**

Not necessarily, as Alice must be in the top 4 neighbors of Bob for Bob to send out chunks to her. 

Even with Alice providing chunks to Bob throughout a 30-second interval, this might not occur.

**R22. Consider a new peer Alice that joins BitTorrent without possessing any chunks. Without any chunks, she cannot become a top-four uploader for any of the other peers, since she has nothing to upload. How then will Alice get her first chunk?**

She will get her first chunk when selected to be the optimistically unchoked neighbor of someone.

**R23. What is an overlay network? Does it include routers? What are the edges in the overlay network?**

It is a computer network which is logically layered on top of another network.

In the case of P2P networks, it consists of the nodes participating in the file sharing system and the logical links between them.

The edges are the logical links between nodes.

A logical link is a semi-permanent TCP connection between two nodes.

It does not include routers.

#### SECTION 2.6

**R24. CDNs typically adopt one of two different server placement philosophies. Name and briefly describe them.**

* **Enter Deep** is about deploying server clusters in access ISPs all over the world.
* **Bring Home** is about building large clusters at a smaller number (for example, tens) of sites, placing them in Internet Exchange Points (IXPs).

**R25. Besides network-related considerations such as delay, loss, and bandwidth performance, there are other important factors that go into designing a CDN server selection strategy. What are they?**

* Geographic location, so the cluster is close to the client.
* Real-time measurements of delay and loss performance between CDN's clusters and clients.
* Load-balancing.
* Limited availability of rarely accessed content.
* Alleviate hot-spots that may arise due to popular video content.
* ISP costs.

#### SECTION 2.7

**R26. In Section 2.7, the UDP server described needed only one socket, whereas the TCP server needed two sockets. Why? If the TCP server were to support $n$ simultaneous connections, each from a different client host, how many sockets would the TCP server need?**

Because UDP is connectionless, so it only needs a socket to receive stuff.

The TCP server would need $n+1$ sockets.

**R27. For the client-server application over TCP described in Section 2.7, why must the server program be executed before the client program? For the client-server application over UDP, why may the client program be executed before the server program?**

Because in TCP weed to the handshake, so the server must be ready for it.

Because the UDP is connectionless, so it is possible to start the server socket while the messing is traveling through the network.

## Problems

**P1. True or false?**

* **a) A user requests a Web page that consists of some text and three images. For this page, the client will send one request message and receive four response messages.**

  False.

* **b) Two distinct Web pages (for example, www.mit.edu/research.html and www.mit.edu/students.html) can be sent over the same persistent connection.**

  True.

* **c) With nonpersistent connections between browser and origin server, it is possible for a single TCP segment to carry two distinct HTTP request messages.**

  False.

* **d) The `Date:` header in the HTTP response message indicates when the object in the response was last modified.**

  False.

* **e) HTTP response messages never have an empty message body.**

  False

**P2. SMS, iMessage, WeChat, and WhatsApp are all smartphone real-time messaging systems. After doing some research on the Internet, for each of these systems write one paragraph about the protocols they use. Then write a paragraph explaining how they differ.**

SMS uses the SMPP (Short Message Peer-to-Peer) protocol so mobile devices can exchange short text messages over cellular networks. The SMPP uses the client-server model, where a bind command is sent before message exchanging, which can be synchronous or asynchronous.

iMessage is an instant messaging service developed by Apple Inc. You can use it to send text messages, images, videos, and documents, which all are end-to-end encrypted. The iMessage protocol is based on the Apple Push Notification service (APNs)—a proprietary, binary protocol. It first sets up a Keep-Alive connection with the Apple servers, where every connection has its own unique code to be use as an id for the route. The connection is encrypted with TLS using a client-side certificate, that is requested by the device on the activation of iMessage.

WeChat  is a Chinese instant messaging, social media, and mobile payment app developed by Tencent. It uses the WeChat Protocol, which is asynchronous and uses TLS but not end-to-end encryption.

WhatsApp  is an instant messaging (IM) and voice-over-IP (VoIP) service owned by technology conglomerate Meta. It uses a customized version of the open standard Extensible Messaging and Presence Protocol (XMPP). It has end-to-end encryption and P2P payment.

WhatsApp, WeChat, and IMessage are different from SMS, as they use the internet while the later uses the cellular network. Also these internet apps also support sending other media types, while SMS only text.

**P3. Consider an HTTP client that wants to retrieve a Web document at a given URL. The IP address of the HTTP server is initially unknown. What transport and application-layer protocols besides HTTP are needed in this scenario?**

The App protocol is DNS, the transport protocols are TCP for HTTP and UDP for DNS.

**P4. Consider the following string of ASCII characters that were captured by Wireshark when the browser sent an HTTP `GET` message (i.e., this is the actual content of an HTTP `GET` message). The characters  are carriage return and line-feed characters (that is, the italized character string in the text below represents the single carriage-return character that was contained at that point in the HTTP header). Answer the following questions, indicating where in the HTTP `GET` message below you find the answer.**

* **a) What is the URL of the document requested by the browser?**

  gaia.cs.umass.edu/cs453/index.html, found after `GET` and `Host`.

* **b) What version of HTTP is the browser running?**

  1.1, found before `Host`.

* **c) Does the browser request a non-persistent or a persistent connection?**

  Persistent, after `Connection`.

* **d) What is the IP address of the host on which the browser is running?**

  Not shown.

* **e) What type of browser initiates this message? Why is the browser type needed in an HTTP request message?**

  Mozilla/5.0. So the server can send different versions of the same object to different browsers types, using the same URL.

**P5. The text below shows the reply sent from the server in response to the HTTP `GET` message in the question above. Answer the following questions, indicating where in the message below you find the answer.**

* **a) Was the server able to successfully find the document or not? What time was the document reply provided?**

  It was able, as 200 indicates that.

  It was provided at 12:39:45GMT on Mar 7th of 2008, as indicated in the `Date:` field.

* **b) When was the document last modified?**

  At 18:27:46 on Dec 10th 2005, as indicated in the `Last-Modified:` field.

* **c) How many bytes are there in the document being returned?**

  3874, as indicated in the `Content-Length:` field.

* **d) What are the first 5 bytes of the document being returned? Did the server agree to a persistent connection?**

  The first 5 bytes are `3c 21 64 6f 63`, which means `<!doc`. It is shown after the double `<cr><lf>`.

  Yes, the server agreed with a persistent connection, as shown in the field `Connection:`.

**P6. Obtain the HTTP/1.1 specification (RFC 2616). Answer the following questions:**

* **a) Explain the mechanism used for signaling between the client and server to indicate that a persistent connection is being closed. Can the client, the server, or both signal the close of a connection?**

  

* **b) What encryption services are provided by HTTP?**

* **c) Can a client open three or more simultaneous connections with a given server?**

* **d) Either a server or a client may close a transport connection between them if either one detects the connection has been idle for some time. Is it possible that one side starts closing a connection while the other side is transmitting data via this connection? Explain.**

## Socket Programming Assignments

## Wireshark Lab: HTTP

## Wireshark Lab: DNS

