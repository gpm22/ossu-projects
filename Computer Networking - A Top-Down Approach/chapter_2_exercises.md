# 2 - Application Layer

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

  The mechanism is to send `Connection: close` in the header. Both can signal the close of a connection.

* **b) What encryption services are provided by HTTP?**

  None.

* **c) Can a client open three or more simultaneous connections with a given server?**

  Yes, but they shouldn't.

* **d) Either a server or a client may close a transport connection between them if either one detects the connection has been idle for some time. Is it possible that one side starts closing a connection while the other side is transmitting data via this connection? Explain.**

  Yes, it is possible, anyone can close a connection anytime. Both sides must be prepared to resend messages and recover from asynchronous close events.


**P7. Suppose within your Web browser you click on a link to obtain a Web page. The IP address for the associated URL is not cached in your local host, so a DNS lookup is necessary to obtain the IP address. Suppose that $n$ DNS servers are visited before your host receives the IP address from DNS; the successive visits incur an RTT of RTT$_1$, $\dots$, RTT$_n$. Further suppose that the Web page associated with the link contains exactly one object, consisting of a small amount of HTML text. Let RTT$_0$ denote the RTT between the local host and the server containing the object. Assuming zero transmission time of the object, how much time elapses from when the client clicks on the link until the client receives the object?**

The time to get the IP is $\sum_{i=1}^n \text{RTT}_i$, while the time to create the TCP connection is $\text{RTT}_0$, and the time to send the request is also $\text{RTT}_0$, therefore:
$$
2\text{RTT}_0 + \sum_{i=1}^n \text{RTT}_i
$$
**P8. Referring to Problem P7, suppose the HTML file references eight very small objects on the same server. Neglecting transmission times, how much time elapses with**

* **a) Non-persistent HTTP with no parallel TCP connections?**

  $18\text{RTT}_0 + \sum_{i=1}^n \text{RTT}_i$

* **b) Non-persistent HTTP with the browser configured for 6 parallel connections?**

  $6\text{RTT}_0 + \sum_{i=1}^n \text{RTT}_i$

* **c) Persistent HTTP?**

  Without pipelining and no parallel connections: $10\text{RTT}_0+ \sum_{i=1}^n \text{RTT}_i$

  With pipelining and no parallel connections: $3\text{RTT}_0+ \sum_{i=1}^n \text{RTT}_i$

**P9. Consider Figure 2.12, for which there is an institutional network connected to the Internet. Suppose that the average object size is 1,000,000 bits and that the average request rate from the institution’s browsers to the origin servers is 16 requests per second. Also suppose that the amount of time it takes from when the router on the Internet side of the access link forwards an HTTP request until it receives the response is three seconds on average (see Section 2.2.5). Model the total average response time as the sum of the average access delay (that is, the delay from Internet router to institution router) and the average Internet delay. For the average access delay, use $\Delta/(1 - \Delta \beta)$, where $\Delta$ is the average time required to send an object over the access link and $\beta$ is the arrival rate of objects to the access link.**

* **a) Find the total average response time.**

  Object average size $1 \text{Mbit}$.

  Average request $16 /s$

  Access link velocity = $15 \text{ Mbit/s}$

  Internet router average RTT $3s$

  Total Average Response Time:.

  * Average access delay:
    $$
    \frac \Delta {(1 - \Delta \beta)} = \frac {1/15 s}{1-16/15} = -1 s
    $$
    

    * This means that each second the average delay increases by a second.
    * This happens because the request are above what the transport link can bear, so the delay will keep increasing until the packages are dropped from the queue.

  * Total delay is at least 4 s. 

* **b) Now suppose a cache is installed in the institutional LAN. Suppose the miss rate is 0.4. Find the total response time.**

  If the miss rate is 0.4, the traffic intensity to the access link is reduce by 60%. Thus the average access delay for cache miss is
  $$
  \frac \Delta {(1 - \Delta \beta)} = \frac {1/15 s}{1-0.4\cdot16/15} = 0.12 s
  $$
  So the average response time for missed ones is 3.12 s. For cached ones the average response time is $\approx 0$.

  Therefore the average access delay is $3.12 \cdot 0.4 = 1.25 s$.

  

**P10. Consider a short, 10-meter link, over which a sender can transmit at a rate of 150 bits/sec in both directions. Suppose that packets containing data are 100,000 bits long, and packets containing only control (e.g., ACK or handshaking) are 200 bits long. Assume that $N$ parallel connections each get $1/N$ of the link bandwidth. Now consider the HTTP protocol, and suppose that each downloaded object is 100 Kbits long, and that the initial downloaded object contains 10 referenced objects from the same sender. Would parallel downloads via parallel instances of non-persistent HTTP make sense in this case? Now consider persistent HTTP. Do you expect significant gains over the non-persistent case? Justify and explain your answer**

Assuming transmission in the speed of light, the delay transmission of the link is 0,03 $\micro s$, which is negligible.

In this case, for non-persistent HTTP, parallel would not improve the response time, it will be the same.

As for each object would use 100000 + 600 bits, without parallel connections the needed time would be
$$
\frac {11 \cdot(100000 + 600)}{150}= 7377 s
$$
 With parallel connections the needed time would be
$$
\frac {100000+600}{150}+\frac {100000 + 600}{150/10} = 7377 s
$$
The same time! This happens as the packages are too big to the transmission rate.

Using persistent HTTP would do some small improvement, as it would open only a connection, so less data would be needed to be transported.  So the total time needed would be 7337 s, 
$$
\frac {100000 + 600}{150}+10\cdot \frac {100000+200}{150} = 7351s
$$
Which is just 26 s faster!

**P11. Consider the scenario introduced in the previous problem. Now suppose that the link is shared by Bob with four other users. Bob uses parallel instances of non-persistent HTTP, and the other four users use non-persistent HTTP without parallel downloads.**

* **a) Do Bob’s parallel connections help him get Web pages more quickly? Why or why not?**

  Yes, as he can use more connections and thus get a larger share of the link bandwith.

* **b) If all five users open five parallel instances of non-persistent HTTP, then would Bob’s parallel connections still be beneficial? Why or why not?**

  They all would have the same share of the link bandwidth, so without the parallel instances Bob would be worse.

  Thus, yes, it is still beneficial.

**P12. Write a simple TCP program for a server that accepts lines of input from a client and prints the lines onto the server’s standard output. (You can do this by modifying the `TCPServer.py` program in the text.) Compile and execute your program. On any other machine that contains a Web browser, set the proxy server in the browser to the host that is running your server program; also configure the port number appropriately. Your browser should now send its `GET` request messages to your server, and your server should display the messages on its standard output. Use this platform to determine whether your browser generates conditional `GET` messages for objects that are locally cached.**

I am using a modified version the programs provided in the book:

`TCPServer.py`

```py
from socket import *

serverPort = 12000
serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind(("", serverPort))
serverSocket.listen(1)
print("The server is ready to receive")
while True:
    connectionSocket, addr = serverSocket.accept()
    sentence = connectionSocket.recv(1024).decode()
    print("address of sender: ")
    print(addr)
    print("received sentence: " + sentence)
    capitalizedSentence = sentence.upper()
    print("captalized sentence: " + capitalizedSentence)
    connectionSocket.send(capitalizedSentence.encode())
    connectionSocket.close()
```

`TCPClient.py`

```py
from socket import *
serverIP = 'servername'
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverIP,serverPort))
sentence = input('Input lowercase sentence:')
clientSocket.send(sentence.encode())
modifiedSentence = clientSocket.recv(1024)
print('From Server: ', modifiedSentence.decode())
clientSocket.close()
```

I used chrome and edge.

Example of message from chrome:

```http
GET http://google.com/ HTTP/1.1
Host: google.com
Proxy-Connection: keep-alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
X-Client-Data: CJO2yQEIpLbJAQipncoBCIiKywEIk6HLAQiFoM0BCN3szQEI4vXNAQj0iM4BCKOJzgEIporOAQi6i84BCPCPzgEI4ZPOAQjok84B
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
```

```http
GET http://google.com/ HTTP/1.1
Host: google.com
Proxy-Connection: keep-alive
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
```

Example of messages from Edge:

```http
GET http://www.msftconnecttest.com/connecttest.txt HTTP/1.1
Connection: Close
User-Agent: Microsoft NCSI
Host: www.msftconnecttest.com
```

```http
GET http://ipv6.msftconnecttest.com/connecttest.txt HTTP/1.1
Connection: Close
User-Agent: Microsoft NCSI
Host: ipv6.msftconnecttest.com
```

By these examples, I could not verify if the browsers generate conditional `GET` messages for objects that are locally cached.

**P13. Consider sending over HTTP/2 a Web page that consists of one video clip, and five images. Suppose that the video clip is transported as 2000 frames, and each image has three frames.**

* **a) If all the video frames are sent first without interleaving, how many “frame times” are needed until all five images are sent?**

  It will be all the frames of video and the the image frames, resulting in 2015 frames.

* **b) If frames are interleaved, how many frame times are needed until all five images are sent.**

  It will be 3 frames per object, therefore 18 frames.

**P14. Consider the Web page in problem 13. Now HTTP/2 prioritization is employed. Suppose all the images are given priority over the video clip, and that the first image is given priority over the second image, the second image over the third image, and so on. How many frame times will be needed until the second image is sent?**

First the server will send first image and then the second one, therefore e frames to star sending the second image and 6 frames to send it completely.

**P15. What is the difference between `MAIL FROM:` in SMTP and `From:` in the mail message itself?**

`MAIL FROM:` is used in SMTP communication to indicate the sender email.

`From:` indicates in the email message itself the sender email.

So both have the same info, but used in different contexts.

**P16. How does SMTP mark the end of a message body? How about HTTP? Can HTTP use the same method as SMTP to mark the end of a message body? Explain.**

SMTP marks the end of a message body with ”.” on a line by itself.

HTTP does not mark the end of a message body, instead it indicates in the header the length of the message by using the `Content-length:`.

HTTP cannot use the SMTP's method, as HTTP message could be binary data, whereas the SMTP's message body must be in 7-bit ASCII format.

**P17. Read RFC 5321 for SMTP. What does MTA stand for? Consider the following received spam e-mail (modified from a real spam e-mail). Assuming only the originator of this spam e-mail is malicious and all other hosts are honest, identify the malicious host that has generated this spam e-mail.**

```
From - Fri Nov 07 13:41:30 2008
Return-Path: <tennis5@pp33head.com>
Received: from barmail.cs.umass.edu (barmail.cs.umass.edu [128.119.240.3]) by cs.umass.edu (8.13.1/8.12.6) for <hg@cs.umass.edu>; Fri, 7 Nov 2008 13:27:10 -0500
Received: from asusus-4b96 (localhost [127.0.0.1]) by barmail.cs.umass.edu (Spam Firewall) for <hg@cs.umass.edu>; Fri, 7 Nov 2008 13:27:07 -0500 (EST)
Received: from asusus-4b96 ([58.88.21.177]) by barmail.cs.umass.edu for <hg@cs.umass.edu>; Fri, 07 Nov 2008 13:27:07 -0500 (EST)
Received: from [58.88.21.177] by inbnd55.exchangeddd.com; Sat, 8 Nov 2008 01:27:07 +0700
From: ”Jonny” <tennis5@pp33head.com>
To: <hg@cs.umass.edu>
Subject: How to secure your savings
```

MTA stands for Mail Transfer Agent.

As an honest MTA should report from where it received the message, the malicious host is `asusus-4b96 ([58.88.21.177])`.

**P18. **

* **a) What is a `whois` database?**

  It is a public database that houses the information collected when someone registers a domain name or updates their DNS settings.

* **b) Use various `whois` databases on the Internet to obtain the names of two DNS servers. Indicate which `whois` databases you used.**

  `ns1.google.com` from https://www.whois.com/whois/google.com and https://who.is/whois/google.com

  `a.ns.facebook.com` from https://www.whois.com/whois/facebook.com and https://who.is/whois/facebook.com

* **c) Use `nslookup` on your local host to send DNS queries to three DNS servers: your local DNS server and the two DNS servers you found in part (b). Try querying for Type A, NS, and MX reports. Summarize your findings.**

  Local DNS Server

  * Default server: ` b5d58402.virtua.com.br`
  * Address:  181.213.132.2
  * For `virtua.com.br`
    * Type A
      * Name: virtua.com.br
      * Addresses: 
        * 189.6.48.3
        * 201.6.4.15
        * 201.6.4.61
    * Type NS
      * virtua.com.br   nameserver = dns1.virtua.com.br
      * virtua.com.br   nameserver = dns2.virtua.com.br
      * virtua.com.br   nameserver = dns3.virtua.com.br
    * Type MX
      * virtua.com.br   MX preference = 10, mail exchanger = smtp.virtua.com.br

  `google.com` 

  * Name:    google.com
  * Addresses:
    * 2800:3f0:4004:800::200e
    * 142.251.134.110
  * Type A
    * Name:    google.com
    * Address: 142.251.134.110
  * Type NS
    * google.com      nameserver = ns1.google.com
    * google.com      nameserver = ns2.google.com
    * google.com      nameserver = ns3.google.com
    * google.com      nameserver = ns4.google.com
  * Type MX
    * google.com      MX preference = 10, mail exchanger = smtp.google.com

  `gmail.com`

  * Name:    gmail.com
  * Addresses:
    * 2800:3f0:4004:806::2005
    * 142.251.135.37
  * Type A
    * Name:    gmail.com
    * Address:  142.251.135.37
  * Type NS
    * gmail.com       nameserver = ns1.google.com
    * gmail.com       nameserver = ns2.google.com
    * gmail.com       nameserver = ns3.google.com
    * gmail.com       nameserver = ns4.google.com
  * Type MX
    * gmail.com       MX preference = 5, mail exchanger = gmail-smtp-in.l.google.com
    * gmail.com       MX preference = 10, mail exchanger = alt1.gmail-smtp-in.l.google.com
    * gmail.com       MX preference = 20, mail exchanger = alt2.gmail-smtp-in.l.google.com
    * gmail.com       MX preference = 30, mail exchanger = alt3.gmail-smtp-in.l.google.com
    * gmail.com       MX preference = 40, mail exchanger = alt4.gmail-smtp-in.l.google.com

  `facebook.com` 

  * Name:    facebook.com
  * Addresses:
    * 2a03:2880:f17c:186:face:b00c:0:25de
    * 31.13.91.35
  * Type A
    * Name:    facebook.com
    * Address:  31.13.91.35
  * Type NS
    * facebook.com    nameserver = a.ns.facebook.com
    * facebook.com    nameserver = b.ns.facebook.com
    * facebook.com    nameserver = c.ns.facebook.com
    * facebook.com    nameserver = d.ns.facebook.com
  * Type MX
    * facebook.com    MX preference = 10, mail exchanger = smtpin.vvv.facebook.com

* **d) Use `nslookup` to find a Web server that has multiple IP addresses. Does the Web server of your institution (school or company) have multiple IP addresses?**

  ` facebook.com`, ` google.com`, and `gmail.com` have more than one IP.

  My company and university only have one IP.

* **e) Use the ARIN `whois` database to determine the IP address range used by your university.**

  I could not found.

* **f) Describe how an attacker can use `whois` databases and the `nslookup` tool to perform reconnaissance on an institution before launching an attack.**

  It can uses them to identify specific ids to attack, so it avoids routing.

* **g) Discuss why `whois` databases should be publicly available.**

  To know the id of attackers.

**P19. In this problem, we use the useful `dig` tool available on Unix and Linux hosts to explore the hierarchy of DNS servers. Recall that in Figure 2.19, a DNS server in the DNS hierarchy delegates a DNS query to a DNS server lower in the hierarchy, by sending back to the DNS client the name of that lower-level DNS server. First read the man page for `dig`, and then answer the following questions.**

* **a) Starting with a root DNS server (from one of the root servers [a-m]. root-servers.net), initiate a sequence of queries for the IP address for your department’s Web server by using `dig`. Show the list of the names of DNS servers in the delegation chain in answering your query.**

  Send: `dig +norecurse @b.root-servers.net any unb.br `

  Response:

  ```
  ;; AUTHORITY SECTION:
  br.			172800	IN	NS	a.dns.br.
  br.			172800	IN	NS	b.dns.br.
  br.			172800	IN	NS	c.dns.br.
  br.			172800	IN	NS	d.dns.br.
  br.			172800	IN	NS	e.dns.br.
  br.			172800	IN	NS	f.dns.br.
  ```

  Send: `dig +norecurse @a.dns.br any unb.br `

  Response:

  ```
  ;; AUTHORITY SECTION:
  unb.br.			3600	IN	NS	dns1.unb.br.
  unb.br.			3600	IN	NS	dns2.unb.br.
  unb.br.			3600	IN	NS	dns3.unb.br.
  ```

  Send `dig +norecurse @dns1.unb.br any unb.br`

  Response:

  ```
  ;; ANSWER SECTION:
  unb.br.			86400	IN	A	164.41.102.70
  unb.br.			3600	IN	MX	0 unb-br.mail.protection.outlook.com.
  unb.br.			3600	IN	NS	dns1.unb.br.
  unb.br.			3600	IN	NS	dns2.unb.br.
  unb.br.			3600	IN	NS	dns3.unb.br.
  unb.br.			3600	IN	TXT	"_globalsign-domain-verification=UEe9yXplBmI1wp61hxrLeSL_gklEaj4LCp42LrIJPT"
  unb.br.			3600	IN	TXT	"v=spf1 include:spf.protection.outlook.com a:smtp.unb.br a:listas.unb.br a:listas.desenv.unb.br a:smtp.listas.desenv.unb.br a:smtp.listas.unb.br a:sender1.unb.br a:sender2.unb.br a:sender3.unb.br a:aluno.unb.br -all"
  unb.br.			3600	IN	SOA	dns1.unb.br. hostmaster.unb.br. 2024052201 14400 3600 1209600 3600
  ```

* **b) Repeat part (a) for several popular Web sites, such as google.com, yahoo.com, or amazon.com.**

  * Google

    * Send: `dig +norecurse @b.root-servers.net any google.com `

    * Response:

      ```
      ;; AUTHORITY SECTION:
      com.			172800	IN	NS	a.gtld-servers.net.
      com.			172800	IN	NS	b.gtld-servers.net.
      com.			172800	IN	NS	c.gtld-servers.net.
      com.			172800	IN	NS	d.gtld-servers.net.
      com.			172800	IN	NS	e.gtld-servers.net.
      com.			172800	IN	NS	f.gtld-servers.net.
      com.			172800	IN	NS	g.gtld-servers.net.
      com.			172800	IN	NS	h.gtld-servers.net.
      com.			172800	IN	NS	i.gtld-servers.net.
      com.			172800	IN	NS	j.gtld-servers.net.
      com.			172800	IN	NS	k.gtld-servers.net.
      com.			172800	IN	NS	l.gtld-servers.net.
      com.			172800	IN	NS	m.gtld-servers.net.
      ```

    * Send: `dig +norecurse @m.gtld-servers.net. any google.com `

    * Response:

      ```
      ;; AUTHORITY SECTION:
      google.com.		172800	IN	NS	ns2.google.com.
      google.com.		172800	IN	NS	ns1.google.com.
      google.com.		172800	IN	NS	ns3.google.com.
      google.com.		172800	IN	NS	ns4.google.com.
      ```

    * Send: `dig +norecurse @ns3.google.com any google.com `

    * Response:

      ```
      ;; ANSWER SECTION:
      google.com.		300	IN	A	142.251.135.78
      google.com.		300	IN	AAAA	2800:3f0:4004:807::200e
      google.com.		3600	IN	TXT	"onetrust-domain-verification=de01ed21f2fa4d8781cbc3ffb89cf4ef"
      google.com.		345600	IN	NS	ns4.google.com.
      google.com.		3600	IN	TXT	"v=spf1 include:_spf.google.com ~all"
      google.com.		3600	IN	TXT	"MS=E4A68B9AB2BB9670BCE15412F62916164C0B20BB"
      google.com.		3600	IN	TXT	"docusign=05958488-4752-4ef2-95eb-aa7ba8a3bd0e"
      google.com.		3600	IN	TXT	"apple-domain-verification=30afIBcvSuDV2PLX"
      google.com.		3600	IN	TXT	"cisco-ci-domain-verification=479146de172eb01ddee38b1a455ab9e8bb51542ddd7f1fa298557dfa7b22d963"
      google.com.		60	IN	SOA	ns1.google.com. dns-admin.google.com. 637585624 900 900 1800 60
      google.com.		300	IN	MX	10 smtp.google.com.
      google.com.		345600	IN	NS	ns2.google.com.
      google.com.		3600	IN	TXT	"globalsign-smime-dv=CDYX+XFHUw2wml6/Gb8+59BsH31KzUr6c1l2BPvqKX8="
      google.com.		345600	IN	NS	ns1.google.com.
      google.com.		3600	IN	TXT	"docusign=1b0a6754-49b1-4db5-8540-d2c12664b289"
      google.com.		3600	IN	TXT	"google-site-verification=wD8N7i1JTNTkezJ49swvWW48f8_9xveREV4oB-0Hf5o"
      google.com.		21600	IN	HTTPS	1 . alpn="h2,h3"
      google.com.		345600	IN	NS	ns3.google.com.
      google.com.		86400	IN	CAA	0 issue "pki.goog"
      google.com.		3600	IN	TXT	"facebook-domain-verification=22rm551cu4k0ab0bxsw536tlds4h95"
      google.com.		3600	IN	TXT	"google-site-verification=TV9-DBe4R80X4v0M4U_bd_J9cpOJM0nikft0jAgjmsQ"
      ```

  * Yahoo

    * Send: `dig +norecurse @a.root-servers.net any yahoo.com `

    * Response:

      ```
      ;; AUTHORITY SECTION:
      com.			172800	IN	NS	l.gtld-servers.net.
      com.			172800	IN	NS	j.gtld-servers.net.
      com.			172800	IN	NS	h.gtld-servers.net.
      com.			172800	IN	NS	d.gtld-servers.net.
      com.			172800	IN	NS	b.gtld-servers.net.
      com.			172800	IN	NS	f.gtld-servers.net.
      com.			172800	IN	NS	k.gtld-servers.net.
      com.			172800	IN	NS	m.gtld-servers.net.
      com.			172800	IN	NS	i.gtld-servers.net.
      com.			172800	IN	NS	g.gtld-servers.net.
      com.			172800	IN	NS	a.gtld-servers.net.
      com.			172800	IN	NS	c.gtld-servers.net.
      com.			172800	IN	NS	e.gtld-servers.net.
      ```

    * Send: `dig +norecurse @k.gtld-servers.net any yahoo.com `

    * Response:

      ```
      ;; AUTHORITY SECTION:
      yahoo.com.		172800	IN	NS	ns1.yahoo.com.
      yahoo.com.		172800	IN	NS	ns5.yahoo.com.
      yahoo.com.		172800	IN	NS	ns2.yahoo.com.
      yahoo.com.		172800	IN	NS	ns3.yahoo.com.
      yahoo.com.		172800	IN	NS	ns4.yahoo.com.
      ```

    * Send: `dig +norecurse @ns4.yahoo.com any yahoo.com `

    * Response:

      ```
      ;; ANSWER SECTION:
      yahoo.com.		1800	IN	SOA	ns1.yahoo.com. hostmaster.yahoo-inc.com. 2024052810 3600 300 1814400 600
      yahoo.com.		1800	IN	A	98.137.11.164
      yahoo.com.		1800	IN	A	74.6.231.20
      yahoo.com.		1800	IN	A	74.6.143.25
      yahoo.com.		1800	IN	A	74.6.143.26
      yahoo.com.		1800	IN	A	74.6.231.21
      yahoo.com.		1800	IN	A	98.137.11.163
      yahoo.com.		1800	IN	AAAA	2001:4998:44:3507::8000
      yahoo.com.		1800	IN	AAAA	2001:4998:124:1507::f000
      yahoo.com.		1800	IN	AAAA	2001:4998:24:120d::1:0
      yahoo.com.		1800	IN	AAAA	2001:4998:124:1507::f001
      yahoo.com.		1800	IN	AAAA	2001:4998:24:120d::1:1
      yahoo.com.		1800	IN	AAAA	2001:4998:44:3507::8001
      yahoo.com.		1800	IN	CAA	0 iodef "mailto:security@yahooinc.com"
      yahoo.com.		1800	IN	CAA	0 issue "digicert.com"
      yahoo.com.		1800	IN	CAA	0 issue "globalsign.com"
      yahoo.com.		1800	IN	MX	1 mta6.am0.yahoodns.net.
      yahoo.com.		1800	IN	MX	1 mta7.am0.yahoodns.net.
      yahoo.com.		1800	IN	MX	1 mta5.am0.yahoodns.net.
      yahoo.com.		1800	IN	TXT	"Zoom=13284637"
      yahoo.com.		1800	IN	TXT	"google-site-verification=w4N2bNopAWw1xYrdXKORILxx-WW3_LIiyX6dIMIidgk"
      yahoo.com.		1800	IN	TXT	"google-site-verification=2b0Glh8l2icXIAgAcjOcFx16Jt26yWDgEyrk5hPD-ZY"
      yahoo.com.		1800	IN	TXT	"google-site-verification=GLp01gkFNopm_JItbLxml4iuVbTgJa3rKu0-eq1RvsE"
      yahoo.com.		1800	IN	TXT	"edb3bff2c0d64622a9b2250438277a59"
      yahoo.com.		1800	IN	TXT	"google-site-verification=Z3-Vh6zqUMgybVH4wQl1GxKSKN7JE13kyCyeZ3TZZ-I"
      yahoo.com.		1800	IN	TXT	"facebook-domain-verification=gysqrcd69g0ej34f4jfn0huivkym1p"
      yahoo.com.		1800	IN	TXT	"google-site-verification=xoBvU6aKxP0gYgNL0iXqF0EccAg6nFrO7XxsHnc3iNQ"
      yahoo.com.		1800	IN	TXT	"v=spf1 redirect=_spf.mail.yahoo.com"
      yahoo.com.		1800	IN	TXT	"google-site-verification=2b8irRvU5a2h4Mb-H_fdqNrqWjS00qmPfPcWqm8BhxI"
      yahoo.com.		1800	IN	TXT	"_globalsign-domain-verification=8DPEanqC-w2Z26VeL5Sn4zBI7cZPCFqrNU5dMKMKeP"
      yahoo.com.		1800	IN	TXT	"_globalsign-domain-verification=+uiRDFpnx6nJGVVEhYUSY24UssVdnBCFzI0V5Stm7bE="
      yahoo.com.		172800	IN	NS	ns3.yahoo.com.
      yahoo.com.		172800	IN	NS	ns2.yahoo.com.
      yahoo.com.		172800	IN	NS	ns1.yahoo.com.
      yahoo.com.		172800	IN	NS	ns4.yahoo.com.
      yahoo.com.		172800	IN	NS	ns5.yahoo.com.
      ```

      

  * Facebook

    * Send: `dig +norecurse @m.root-servers.net any facebook.com `

    * Response:

      ```
      ;; AUTHORITY SECTION:
      com.			172800	IN	NS	e.gtld-servers.net.
      com.			172800	IN	NS	a.gtld-servers.net.
      com.			172800	IN	NS	g.gtld-servers.net.
      com.			172800	IN	NS	b.gtld-servers.net.
      com.			172800	IN	NS	h.gtld-servers.net.
      com.			172800	IN	NS	m.gtld-servers.net.
      com.			172800	IN	NS	j.gtld-servers.net.
      com.			172800	IN	NS	k.gtld-servers.net.
      com.			172800	IN	NS	c.gtld-servers.net.
      com.			172800	IN	NS	f.gtld-servers.net.
      com.			172800	IN	NS	d.gtld-servers.net.
      com.			172800	IN	NS	i.gtld-servers.net.
      com.			172800	IN	NS	l.gtld-servers.net.
      ```

    * Send: `dig +norecurse @c.gtld-servers.net. any facebook.com `

    * Response:

      ```
      ;; AUTHORITY SECTION:
      facebook.com.		172800	IN	NS	a.ns.facebook.com.
      facebook.com.		172800	IN	NS	b.ns.facebook.com.
      facebook.com.		172800	IN	NS	c.ns.facebook.com.
      facebook.com.		172800	IN	NS	d.ns.facebook.com.
      ```

    * Send: `dig +norecurse @d.ns.facebook.com any facebook.com `

    * Response:

      ```
      ;; ANSWER SECTION:
      facebook.com.		86400	IN	HINFO	"RFC 8482" ""
      
      ```


**P20. Suppose you can access the caches in the local DNS servers of your department. Can you propose a way to roughly determine the Web servers (outside your department) that are most popular among the users in your department? Explain.**

You can verify the cache at every 30 minutes or other frequency and keep a count of the URLs, so the most common ones will the most popular.

**P21. Suppose that your department has a local DNS server for all computers in the department. You are an ordinary user (i.e., not a network/system administrator). Can you determine if an external Web site was likely accessed from a computer in your department a couple of seconds ago? Explain**

Yes, you can, by querying for that website with dig and verifying the query time, if it is 0msec is cached, otherwise is not.

**P22. Consider distributing a file of $F = 20 \text{Gbits}$ to $N$ peers. The server has an upload rate of $u_s = 30 \text{Mbps}$, and each peer has a download rate of $d_i = 2 \text{Mbps}$ and an upload rate of $u$. For $N = 10, 100, \text{ and } 1,000$ and $u = 300 Kbps, 700 Kbps, \text{ and } 2 \text{Mbps}$, prepare a chart giving the minimum distribution time for each of the combinations of $N$ and $u$ for both client-server distribution and P2P distribution**

We use the following formula:
$$
D_\text{P2P} = \max \left\{ \frac F {u_s}, \frac F {d_\min}, \frac {NF}{u_s + \sum_{i=1}^N u_i} \right\}
$$
Witch results in:
$$
D_\text{P2P} = \max \left\{ 683, 10240, \frac {20 \cdot 1024 N}{30 \ + uN} \right\}
$$
The values will be

| $u/N$    | 10      | 100     | 1,000   |
| -------- | ------- | ------- | ------- |
| 300 Kbps | 10240 s | 34538 s | 63412 s |
| 700 Kbps | 10240 s | 20822 s | 28700 s |
| 2 MBps   | 10240 s | 10240 s | 10240 s |

**P23. Consider distributing a file of $F$ bits to $N$ peers using a client-server architecture. Assume a fluid model where the server can simultaneously transmit to multiple peers, transmitting to each peer at different rates, as long as the combined rate does not exceed $u_s$.**

* **a) Suppose that $u_s/N \leq d_\min$. Specify a distribution scheme that has a distribution time of $NF/u_s$.**

  In this case the upload rate to each peer is less than the minimum download rate of the peers. So each pear will receive the file at $u_s/N$, resulting in the distribution time
  $$
  \frac F {u_s/N} = \frac {NF} {u_s}
  $$
  
* **b) Suppose that $u_s/N \geq d_\min$. Specify a distribution scheme that has a distribution time of $F/d_\min$.**

  Now the minimum download rate of the peers is below the rate each peer is receiving the file, therefore the distribution time is simple $F/d_\min$.
* **c) Conclude that the minimum distribution time is in general given by $\max \left\{NF/u_s, F/d_\min\right\}$.**

  If $u_s/N \leq d_\min$ than $NF/u_s \geq F/d_\min$ and when If $u_s/N \geq d_\min$ than $NF/u_s \leq F/d_\min$.

  Therefore the general distribution time is given by 
  $$
  \max \left\{\frac {NF} {u_s},\frac F {d_\min} \right\}
  $$

**P24. Consider distributing a file of $F$ bits to $N$ peers using a P2P architecture. Assume a fluid model. For simplicity assume that $d_\min$ is very large, so that peer download bandwidth is never a bottleneck.**

* **a) Suppose that $u_s \leq (u_s + u_1 + \dots + u_N)/N$. Specify a distribution scheme that has a distribution time of $F/u_s$.**

  $u_s \leq (u_s + u_1 + \dots + u_N)/N$ means that the server is updating the file at a rate below the average upload rate of the server and the peers, which means that the peers is waiting to share new stuff to be sent by the server. In that case the bottleneck is the server itself, therefore the distribution time is
  $$
  \frac F {u_s}
  $$
  
* **b) Suppose that us $u_s \geq (u_s + u_1 + \dots + u_N)/N$. Specify a distribution scheme that has a distribution time of $NF/(u_s + u_1 + \dots + u_N)$.**

  $u_s \geq (u_s + u_1 + \dots + u_N)/N$ means that the server is sending more than what the peers can resend, thus the average upload rate of the server and the peers is the bottleneck. Therefore the distribution time is 
  $$
  \frac {F} {\left(u_s + u_1 + \dots + u_N\right)/N} = \frac {FN} {u_s + u_1 + \dots + u_N}
  $$
  
* **c) Conclude that the minimum distribution time is in general given by $\max \left\{ F/u_s, NF/(u_s + u_1 + \dots + u_N)\right\}$.**

  When $u_s \leq (u_s + u_1 + \dots + u_N)/N$, we have $F/u_s \geq NF/(u_s + u_1 + \dots + u_N)$.

  Also when $u_s \geq (u_s + u_1 + \dots + u_N)/N$, we have $F/u_s \leq NF/(u_s + u_1 + \dots + u_N)$.

  Therefore the general distribution time is 
  $$
  \max\left\{\frac F {u_s}, \frac {NF}{u_s + u_1 + \dots + u_N}\right\}
  $$

**P25. Consider an overlay network with $N$ active peers, with each pair of peers having an active TCP connection. Additionally, suppose that the TCP connections pass through a total of $M$ routers. How many nodes and edges are there in the corresponding overlay network?**

The total number of nodes is the number of active peers, $N$.

The total number of connections is $N(N-1)/2$, which is also the total number of edges.

**P26. Suppose Bob joins a BitTorrent torrent, but he does not want to upload any data to any other peers (so called free-riding).**

* **a) Bob claims that he can receive a complete copy of the file that is shared by the swarm. Is Bob’s claim possible? Why or why not?**

  It is possible, because he will be select from time to time to be optimistically unchoked.

* **b) Bob further claims that he can further make his “free-riding” more efficient by using a collection of multiple computers (with distinct IP addresses) in the computer lab in his department. How can he do that?**

  He can have a network of computers that receives the chunks and join them into a single file.

  He will increases his possibilities to be optimistically unchoked, as initially he has the probability of being selected of 
  $$
  1-\left(1-\frac 1{N-5}\right)^N = 1-\left(\frac {N-6}{N-5}\right)^N
  $$
  but adding $M$ computers increases the probability to be
  $$
  1-\left(1-\frac {M+1}{N-5}\right)^N =1 - \left(\frac {N-M-6}{N-5}\right)^N
  $$

**P27. Consider a DASH system for which there are $N$ video versions (at $N$ different rates and qualities) and $N$ audio versions (at $N$ different rates and qualities). Suppose we want to allow the player to choose at any time any of the $N$ video versions and any of the $N$ audio versions.**

* **a) If we create files so that the audio is mixed in with the video, so server sends only one media stream at given time, how many files will the server need to store (each a different URL)?**

  $N^2$, really bad move.

* **b) If the server instead sends the audio and video streams separately and has the client synchronize the streams, how many files will the server need to store?**

  $2N$, a better move.

**P28. Install and compile the Python programs `TCPClient` and `UDPClient` on one host and `TCPServer` and `UDPServer` on another host.**

* **a) Suppose you run `TCPClient` before you run `TCPServer`. What happens? Why?**

  It throws an error, as a connection could not be created. This happens as there is nothing listen in the tried port.
* **b) Suppose you run `UDPClient` before you run `UDPServer`. What happens? Why?**

  It runs, as UDP does not create a connection. So if the server is off, the client receives the string from user, sends it, and keeps waiting for a response. If the server is on, it will respond to the client.
* **c) What happens if you use different port numbers for the client and server sides?**

  If they have different values, the message will be sent to a port that is closed, otherwise it will work.

**P29. Suppose that in `UDPClient.py`, after we create the socket, we add the line:**

**`clientSocket.bind((’’, 5432))`**

**Will it become necessary to change `UDPServer.py`? What are the port numbers for the sockets in `UDPClient` and `UDPServer`? What were they before making this change?**

It is not necessary to change the server, as it knows the client port by reading the datagram.
Now the ports are 12000 for the server and 5432 to the client, before was 12000 for the server and 64805 for the client.
In reality, the client port changed every time before using the bind command.

**P30. Can you configure your browser to open multiple simultaneous connections to a Web site? What are the advantages and disadvantages of having a large number of simultaneous TCP connections?**

Yes, in reality is the default for Firefox, which the value in my machine is 900 , but can be changed from 1-65535.
The advantages is that with a good enough Internet, the pages will be loaded faster, but if the connection is slow, a lot of timeouts can happen, which will worsen the user experience. Also you will be getting more bandwidth than other users, which will slowdown their downloads.

**P31. We have seen that Internet TCP sockets treat the data being sent as a byte stream but UDP sockets recognize message boundaries. What are one advantage and one disadvantage of byte-oriented API versus having the API explicitly recognize and preserve application-defined message boundaries?**

The advantage is that a byte-stream can send easily more data indefinitely.
The disadvantage is that when sending different messages over a byte-stream, the messages must contain something to indicate their endings, but on the other hand, messages with boundaries already do that.

**P32. What is the Apache Web server? How much does it cost? What functionality does it currently have? You may want to look at Wikipedia to answer this question.**

It is a web serve that you can use to provide your APIs and websites.
It is free and open-source.
It is can be used from authentication schemes to supporting server-side programming languages, like python and PHP.

## Socket Programming Assignments

### Assignment 1: Web Server

#### `WebServer.py`

```py
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
```



#### `WebClient.py`

```py
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

```

#### `HelloWorld.html`

```html
<h1>HELLO WORLD!!!!</h1>
```



### Assignment 2: UDP Pinger

#### `UDPPingerServer.py`

```py
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
```



#### `UDPPingerClient.py`

```py
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
```



### Assignment 3: Mail Client

### Assignment 4: Web Proxy

## Wireshark Lab: HTTP

## Wireshark Lab: DNS

