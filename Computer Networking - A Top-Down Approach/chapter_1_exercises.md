# 1 - Computer Networks and the Internet

## Homework Problems and Questions

### Chapter 1 Review Questions

#### SECTION 1.1

**R1. What is the difference between a host and an end system? List several different types of end systems. Is a Web server an end system?**

Host and end system are synonymous.

Types of end systems:

1. Servers
2. Mobile computers
3. Smartphones 
4. Tablets
5. Workstation
6. Fridge

A web server is indeed a end system.

**R2. The word protocol is often used to describe diplomatic relations. How does Wikipedia describe diplomatic protocol?**

As a rule which describes how to perform an certain activity. But it is also described as a set of international courtesy rules that makes it easier for nations and people to live and work together.

**R3. Why are standards important for protocols?**

Because standards allow people to create systems and products that interoperate.

#### SECTION 1.2

**R4. List four access technologies. Classify each one as home access, enterprise access, or wide-area wireless access.**

DSL - Home Access.

Ethernet - Enterprise and home accesses.

Wifi - Enterprise and home accesses. 

5G - Wide-area Wireless.

**R5. Is HFC transmission rate dedicated or shared among users? Are collisions possible in a downstream HFC channel? Why or why not?**

HFC transmission is shared among users.

No collisions are possible in a downstream HFC, because they are come from the same source.

**R6. List the available residential access technologies in your city. For each type of access, provide the advertised downstream rate, upstream rate, and monthly price.**

- FTTH (Fiber-To-The-Home)
  - Download: 2 Giga - Upload: 1 Giga - Price: R$ 135,50
  - Download: 1 Giga - Upload: 500 Mega - Price: R$ 135,50
  - Download: 500 Mega-  Upload: 250 Mega - Price: R$ 101,50
  - Download: 300 Mega-  Upload: 150 Mega - Price: R$ 98,50
- 4G fixed wireless
  - Download and upload 70 Mega - Price: R$ 90,50

**R7. What is the transmission rate of Ethernet LANs?**

Ethernet LANs have typically transmission rate of 100 Mbps to tens of Gbps access to the Ethernet switch, whereas servers may have 1 Gbps 10 Gbps access.

**R8. What are some of the physical media that Ethernet can run over?**

Twisted-Pair Copper Wire and Fiber Optics 

**R9. HFC, DSL, and FTTH are all used for residential access. For each of these access technologies, provide a range of transmission rates and comment on whether the transmission rate is shared or dedicated.**

* HFC
  * Transmission rate:
    * Downstream bitrates of 40 Mbps and 1.2 Gbps, and upstream rates of 30 Mbps and 100 Mbps, respectively.
  * It is shared.
* DSL
  * Transmission rate:
    * Downstream transmission rates of 24 Mbs and 52 Mbs, and upstream rates of 3.5 Mbps and 16 Mbps
  * It is dedicated.
* FTTH
  * Transmission rate
    * Downstream bitrates above 1.2 Gbps, and upstream rates above 100 Mbps, respectively.
  * Can be shared or dedicated.

**R10. Describe the most popular wireless Internet access technologies today. Compare and contrast them.**

* Wifi (IEEE 802.11)
  * Wireless users transmit/receive packets to/from an access point that is connected into the local network, which in turn is connected to the wired Internet.
  * The user must typically be within a few tens of meters of an access point.
* Wide-Area Wireless Access
  * 3G, LTE 4G and 5G
  * They employ the same wireless infrastructure used for cellular telephony to send/receive packets through a base station that is operated by the cellular network provider.
  * The user need only be within a few tens of kilometers of the base station.

#### SECTION 1.3

**R11. Suppose there is exactly one packet switch between a sending host and a receiving host. The transmission rates between the sending host and the switch and between the switch and the receiving host are R1 and R2, respectively. Assuming that the switch uses store-and-forward packet switching, what is the total end-to-end delay to send a packet of length L? (Ignore queuing, propagation delay, and processing delay.)**

It takes $ \frac L{R_1}$ to get stored in the switch.

It takes $\frac L {R_2}$ to get in the receiving host.

In total it takes $L(\frac 1{R_1} + \frac 1{R_2})

**R12. What advantage does a circuit-switched network have over a packet-switched network? What advantages does TDM have over FDM in a circuit-switched network?**

Circuit-switched does not have variable and unpredictable end-to-end delays there is no risk of congestion or packet loss.

When using TDM, one doesn't need to worry about the frequency transmission, because each circuit gets all the bandwith.

**R13. Suppose users share a 2 Mbps link. Also suppose each user transmits continuously at 1 Mbps when transmitting, but each user transmits only 20 percent of the time.**

1. **When circuit switching is used, how many users can be supported?**
   * 2
2. **For the remainder of this problem, suppose packet switching is used.**
   1. **Why will there be essentially no queuing delay before the link if two or fewer users transmit at the same time?**
      * because it will be impossible to pass the 2 Mbps limit.
   2. **Why will there be a queuing delay if three users transmit at the same time?**
      * because it will to pass the 2 Mbps limit.
3. **Find the probability that a given user is transmitting.**
   * the probability if 0,2.
4. **Suppose now there are three users. Find the probability that at any given time, all three users are transmitting simultaneously. Find the fraction of time during which the queue grows.**
   * The probability all three are transmitting is 0,008.
   * The fraction of time the queue grows is 0.008, as it only happens when all 3 are transmitting.

**R14. Why will two ISPs at the same level of the hierarchy often peer with each other? How does an IXP earn money?**

Two ISP peers in order to avoid paying to a higher ISP.

An IXP earn money by providing the infrastructure, so its income comes from charging on traffic use by the peed ISPs.

**R15. Some content providers have created their own networks. Describe Google’s network. What motivates content providers to create these networks?**

The Google's network is formed by data centers distributed across North America, Europe, Asia, South America, and Australia. Each data center have tens or hundreds of thousands of servers. Some of the smaller data centers are often located within IXPs. These data centers are all interconnected via Google’s private TCP/IP network, which spans the entire globe but is nevertheless separate from the public Internet. The Google private network only carries traffic to/from Google servers.

Content providers create their own networks in order to reduce the expenses with ISPs and to have a greater control of how its services are ultimately delivered to end users.

**R16. Consider sending a packet from a source host to a destination host over a fixed route. List the delay components in the end-to-end delay. Which of these delays are constant and which are variable?**

Nodal processing delay, queuing delay, transmission delay, and propagation delay.

The queuing delay is variable, while the others are constant for a fixed packet size.

**R17. Visit the Transmission Versus Propagation Delay interactive animation at the companion Web site. Among the rates, propagation delay, and packet sizes available, find a combination for which the sender finishes transmitting before the first bit of the packet reaches the receiver. Find another combination for which the first bit of the packet reaches the receiver before the sender finishes transmitting.**

Animation used: https://computerscience.unicam.it/marcantoni/reti/applet/TransmissionVsPropagationDelay/traProp.html

first combination:

* length: 1000 km
* Rate: 512 kps
* Packet size: 100 Bytes

second combination:

* length: 10 km
* Rate: 512 kps
* Packet size: 100 Bytes

**R18. How long does it take a packet of length 1,000 bytes to propagate over a link of distance 2,500 km, propagation speed $2.5 \cdot 10^8$ m/s, and transmission rate 2 Mbps? More generally, how long does it take a packet of length $L$ to propagate over a link of distance $d$, propagation speed $s$, and transmission rate $R$ bps? Does this delay depend on packet length? Does this delay depend on transmission rate?**

General solution is $\frac ds$.

Therefore, for the given values, the result is 10 ms.

This delay does not depend on the packet length $L$ and transmission rate $R$, because it is only about the propagation.

**R19. Suppose Host A wants to send a large file to Host B. The path from Host A to Host B has three links, of rates $R_1 = 500$ kbps, $R_2 = 2$ Mbps, and $R_3 = 1$ Mbps.**

* **a) Assuming no other traffic in the network, what is the throughput for the file transfer?**

  500 kbps

* **b) Suppose the file is 4 million bytes. Dividing the file size by the throughput, roughly how long will it take to transfer the file to Host B?**

  64 s

* **c) Repeat (a) and (b), but now with $R_2$ reduced to 100 kbps.**

  The throughput is 100 kbps and the transfer time is 320 s.

**R20. Suppose end system A wants to send a large file to end system B. At a very high level, describe how end system A creates packets from the file. When one of these packets arrives to a router, what information in the packet does the router use to determine the link onto which the packet is forwarded? Why is packet switching in the Internet analogous to driving from one city to another and asking directions along the way?**

End system A creates packets from the file by dividing its bits in chunks and for each chunk it adds a header with info about the file and addresses.

The router uses the destination address in the packet header to determine the next link.

The packet switching in the Internet analogous to driving from one city to another and asking directions along the way, because the links are the roads and the routers is the places where you would ask for directions.

**R21. Visit the Queuing and Loss interactive animation at the companion Web site. What is the maximum emission rate and the minimum transmission rate? With those rates, what is the traffic intensity? Run the interactive animation with these rates and determine how long it takes for packet loss to occur. Then repeat the experiment a second time and determine again how long it takes for packet loss to occur. Are the values different? Why or why not?**

The maximum emission rate is 500 packets/second the minimum transmission rate is 350 packets/second.

The traffic intensity is $500/350 \approx 1.43$

In the first experiment it took 8.7 $\micro$s for packet loss to occur.

In the second experiment it took 9.8 $\micro$s for packet loss to occur.

The values are different, as the processing time is not constant.

**R22. List five tasks that a layer can perform. Is it possible that one (or more) of these tasks could be performed by two (or more) layers?**

1. error control
2. flow control
3. segmentation and reassembly
4. multiplexing
5. connection setup

Yes, they can be performed by two or more layers, like error control that is usually done by multiple layers.

**R23. What are the five layers in the Internet protocol stack? What are the principal responsibilities of each of these layers?**

1. **Application** - To allow packet exchanging between end systems.
2. **Transport** - To transport application-layer messages between application endpoints.
3. **Network** - To movie network-layer packets (datagrams) from one host to another.
4. **Link** - To route a datagram through a series of routers between the source and destination.
5. **Physical** -  To move the individual bits within the frame from one node to the next.

**R24. What is an application-layer message? A transport-layer segment? A network-layer datagram? A link-layer frame?**

* A application-layer message is a **packet of information** at the application layer.
* A transport-layer segment is a **packet of information** at the transport layer, which is a application-layer message encapsulated with a transport-layer header.
* A network-layer datagram is a **packet of information** at the network layer, which is a transport-layer segment encapsulated with a network-layer header.
* A link-layer frame is a **packet of information** at the link layer, which is a network-layer datagram encapsulated with a link-layer header.

**R25. Which layers in the Internet protocol stack does a router process? Which layers does a link-layer switch process? Which layers does a host process?**

A router process the physical, link, and network layers.

A link-layer switch process the physical and link layers.

A host process all five layers.

**R26. What is self-replicating malware?**

It is a malware that after infecting one host seeks, from that first host, to entry into other hosts over the Internet, and from the newly infected hosts, it seeks entry into yet more hosts.

**R27. Describe how a botnet can be created and how it can be used for a DDoS attack.**

A botnet can be created by using self-replication malwares to infect a lot of computers.

To use this botnet to do a DDoS, first a computer ignites the attack by sending the command to the botnet, so each computer will stark sending multiple requests to the attacked host.

**R28. Suppose Alice and Bob are sending packets to each other over a computer network. Suppose Trudy positions herself in the network so that she can capture all the packets sent by Alice and send whatever she wants to Bob; she can also capture all the packets sent by Bob and send whatever she wants to Alice. List some of the malicious things Trudy can do from this position.**

Trudy can capture Alice and Bob sensitive information and send malwares to them, as they were legit messages from Alice or Bob.

### Problems

**P1. Design and describe an application-level protocol to be used between an automatic teller machine and a bank’s centralized computer. Your protocol should allow a user’s card and password to be verified, the account balance (which is maintained at the centralized computer) to be queried, and an account withdrawal to be made (that is, money disbursed to the user). Your protocol entities should be able to handle the all-too-common case in which there is not enough money in the account to cover the withdrawal. Specify your protocol by listing the messages exchanged and the action taken by the automatic teller machine or the bank’s centralized computer on transmission and receipt of messages. Sketch the operation of your protocol for the case of a simple withdrawal with no errors, using a diagram similar to that in Figure 1.2. Explicitly state the assumptions made by your protocol about the underlying end-to-end transport service**

This protocol will run over the HTTP protocol.

Messages:

1. verify user's card
   1. ATM send a message of type VERIFY CARD with user's card data to the Central.
   2. Central send back a message with status OK if the card exists and status NO if don't, or an error message.
2. verify user's password
   1. ATM send a message of type AUTHENTICATE with user's card number and user's password.
   2. Central send back a message with an authentication token if the password matches and status NO if don't, or an error message.
3. get account balance
   1. ATM send a message of type GET BALANCE with user's card number and the authentication token.
   2. Central send back a message containing the account balance or an error message.
4. Withdraw
   1. ATM send a message of type WITHDRAW with user's card number, the value to be withdrawn, and the authentication token.
   2. Central send back a message with status OK if it's possible to do and status NO if don't, or an error message.

Example:

```
ATM                     CENTRAL
 |                         |
 |   verify user's card    |
 |     CARD_NUMBER: 101    |
 | ----------------------> |
 | <---------------------- |
 |        STATUS:OK        |
 |                         |
 | verify user's password  |
 |    CARD_NUMBER: 101,    | 
 |     PASSWORD: PASS      |
 | ----------------------> |
 | <---------------------- |
 |        TOKEN:123        |
 |                         |
 |   get account balance   |
 |    CARD_NUMBER: 101,    | 
 |        TOKEN:123        |
 | ----------------------> |
 | <---------------------- |
 |         168.00          |
 |                         |
 |         Withdraw        |
 |    CARD_NUMBER: 101,    | 
 |      VALUE: 151.00,     | 
 |        TOKEN:123        |
 | ----------------------> |
 | <---------------------- |
 |        STATUS:OK        |
```

**P2. Equation 1.1 gives a formula for the end-to-end delay of sending one packet of length $L$ over $N$ links of transmission rate $R$. Generalize this formula for sending $P$ such packets back-to-back over the $N$ links.**

The first packet has delay of $N \frac LR$.

The second packet has delay of $(N+1) \frac LR$.

The third packet has delay of $(N+2) \frac LR$.

...

The $P$th packet has delay of $(N+P-1) \frac LR$.

Therefore the total delay is $(N+P-1) \frac LR$.

**P3. Consider an application that transmits data at a steady rate (for example, the sender generates an $N$-bit unit of data every $k$ time units, where $k$ is small and fixed). Also, when such an application starts, it will continue running for a relatively long period of time. Answer the following questions, briefly justifying your answer: **

* **a) Would a packet-switched network or a circuit-switched network be more appropriate for this application? Why?**

  A circuit-switched network is more appropriated, as the application will be sending data frequently for a long period of time.

* **b) Suppose that a packet-switched network is used and the only traffic in this network comes from such applications as described above. Furthermore, assume that the sum of the application data rates is less than the capacities of each and every link. Is some form of congestion control needed? Why?**

  No, as it will never create a queue.

**P4. Consider the circuit-switched network in Figure 1.13. Recall that there are four circuits on each link. Label the four switches A, B, C, and D, going in the clockwise direction.**

* **a) What is the maximum number of simultaneous connections that can be in progress at any one time in this network?**

  Assuming that not machine can be in connection with more than one machine, will be 8, as there is 16 possible enters.

* **b) Suppose that all connections are between switches A and C. What is the maximum number of simultaneous connections that can be in progress?**

  4, as there is 4 links

* **c) Suppose we want to make four connections between switches A and C, and another four connections between switches B and D. Can we route these calls through the four links to accommodate all eight connections?**

  Yes.

  Each switch pair would use 2 links from each switch route.

**P5. Review the car-caravan analogy in Section 1.4. Assume a propagation speed of 100 km/hour.**

* **a) Suppose the caravan travels 175 km, beginning in front of one tollbooth, passing through a second tollbooth, and finishing just after a third tollbooth. What is the end-to-end delay?**

  Assuming the transmission rate of being 12 seconds per car, the 10 cars need 120 s to be in the road again.

  So it is $2 \cdot \frac {120}{60} + 175/100 \cdot 60) = 109 \text{ min}$ or 1 hour and 49 min.
* **b) Repeat a), now assuming that there are eight cars in the caravan instead of ten.**

  Assuming the transmission rate of being 12 seconds per car, the 8 cars need 96 s to be in the road again.

  So it is $2 \cdot \frac {96}{60} + 175/100 \cdot 60) = 108.2 \text{ min}$ or 1 hour, 48 min and 12 s.

**P6 This elementary problem begins to explore propagation delay and transmission delay, two central concepts in data networking. Consider two hosts, $A$ and $B$, connected by a single link of rate $R$ bps. Suppose that the two hosts are separated by $m$ meters, and suppose the propagation speed along the link is $s$ meters/sec. Host $A$ is to send a packet of size $L$ bits to Host $B$.**

* **a) Express the propagation delay, $d_\text{prop}$, in terms of $m$ and $s$.**
  $$
  d_\text{prop} = \frac ms
  $$

* **b) Determine the transmission time of the packet, $d_\text{trans}$, in terms of $L$ and $R$.**
  $$
  d_\text{trans} = \frac LR
  $$
  

* **c) Ignoring processing and queuing delays, obtain an expression for the end-to-end delay.**
  $$
  d_\text{end-to-end} = \frac ms + \frac LR
  $$
  

* **d) Suppose Host $A$ begins to transmit the packet at time $t = 0$. At time $t = d_\text{trans}$, where is the last bit of the packet?**

  It will be in the link.

* **e) Suppose $d_\text{prop}$ is greater than $d_\text{trans}$. At time $t = d_\text{trans}$, where is the first bit of the packet?**

  It will be in the link.

* **f) Suppose $d_\text{prop}$ is less than $d_\text{trans}$. At time $t = d_\text{trans}$, where is the first bit of the packet?**

  It will be in the host $B$.

* **g) Suppose $s = 2.5 \cdot 10^8$ , $L = 1500$ bytes, and $R = 10$ Mbps. Find the distance $m$ so that $d_\text{prop}$ equals $d_\text{trans}$.**
  $$
  d_\text{prop} & = & d_\text{trans} \\
  \frac ms & = & \frac LR \\
  m & = & s\frac LR \\
  m & = & 3000 \text{ km}
  $$

**P7. In this problem, we consider sending real-time voice from Host $A$ to Host $B$ over a packet-switched network (VoIP). Host $A$ converts analog voice to a digital 64 kbps bit stream on the fly. Host $A$ then groups the bits into 56-byte packets. There is one link between Hosts $A$ and $B$; its transmission rate is 10 Mbps and its propagation delay is 10 msec. As soon as Host $A$ gathers a packet, it sends it to Host $B$. As soon as Host $B$ receives an entire packet, it converts the packet’s bits to an analog signal. How much time elapses from the time a bit is created (from the original analog signal at Host $A$) until the bit is decoded (as part of the analog signal at Host $B$)?**

Time to create a packet: $(56 \cdot 8)/(64 \cdot 10^3) = 7$ msec

Transmission delay: $(56 \cdot 8)/(10 \cdot 10^6) = 44.8 \ \micro$sec

Propagation delay: 10 msec

Total = 17.0448 msec

**P8. Suppose users share a 10 Mbps link. Also suppose each user requires 200 kbps when transmitting, but each user transmits only 10 percent of the time.**

* **a) When circuit switching is used, how many users can be supported?**
  $$
  \frac {10 \cdot 10^6}{200 \cdot 10^3} = 50
  $$
  50 users.

* **b) For the remainder of this problem, suppose packet switching is used. Find the probability that a given user is transmitting.**

  As a user only transmits 10 % of their time, the probability is 0.1

* **c) Suppose there are 120 users. Find the probability that at any given time, exactly $n$ users are transmitting simultaneously. (Hint: Use the binomial distribution.)**

  Binomial distribution mass function: 
  $$
  \binom nk p^k \left(1-p \right)^{n-k}
  $$
  as $p = 0.1$, $n=120$, and $k=n$ we got
  $$
  \binom {120}n 0.1^n \left(0.9 \right)^{120-k} = \frac {120!}{n!(120-n)!}0.1^n \left(0.9 \right)^{120-n}
  $$
  

* **d) Find the probability that there are 51 or more users transmitting simultaneously.**
  $$
  \sum_{n=51}^{120} \frac {120!}{n!(120-n)!}0.1^n \left(0.9 \right)^{120-n} \approx 2.06 \cdot 10^{-20}
  $$
  

**P9. Consider the discussion in Section 1.3 of packet switching versus circuit switching in which an example is provided with a 1 Mbps link. Users are generating data at a rate of 100 kbps when busy, but are busy generating data only with probability $p = 0.1$. Suppose that the 1 Mbps link is replaced by a 1 Gbps link.**

* **a) What is $N$, the maximum number of users that can be supported simultaneously under circuit switching?**
  $$
  \frac {10^9}{100 \cdot 10^3} = 10^4
  $$
  10.000 users.

* **b) Now consider packet switching and a user population of $M$ users. Give a formula (in terms of $p$, $M$, $N$) for the probability that more than $N$ users are sending data.**

  It is the binomial distribution:
  $$
  \sum_{i=N}^{M} \frac {M!}{i!(M-i)!}p^i \left(1-p\right)^{M-i}
  $$

**P10. Consider a packet of length $L$ that begins at end system $A$ and travels over three links to a destination end system. These three links are connected by two packet switches. Let $d_i$, $s_i$, and $R_i$ denote the length, propagation speed, and the transmission rate of link $i$, for $i = 1, 2, 3$. The packet switch delays each packet by $d_\text{proc}$. Assuming no queuing delays, in terms of $d_i$ , $s_i$ , $R_i$, $(i = 1, 2, 3)$, and $L$, what is the total end-to-end delay for the packet? Suppose now the packet is 1,500 bytes, the propagation speed on all three links is $2.5 \cdot 10^8$ m/s, the transmission rates of all three links are 2.5 Mbps, the packet switch processing delay is 3 msec, the length of the first link is 5,000 km, the length of the second link is 4,000 km, and the length of the last link is 1,000 km. For these values, what is the end-to-end delay?**

The delay of link $i$ is $D_i = \frac {d_i}{s_i} + \frac L {R_i}$.

Therefore the total delay is:
$$
d_\text{end-to-end} & = & \sum_{i=1}^3D_i +2d_\text{proc} \\
& = & \sum_{i=1}^3 \left( \frac {d_i}{s_i} + \frac L {R_i} \right) +2d_\text{proc}\\
& = & \sum_{i=1}^3 \frac {d_i}{s_i} + L \sum_{i=1}^3 \frac 1 {R_i} +2d_\text{proc}\\
$$
For the data $L = 1500$ bytes,  $s_i = 2.5 \cdot 10^8$ m/s, $R_i = 2.5$ Mbps, the packet switch processing delay is 3 msec, the $d_1 = 5000$ km, $d_2 = 4000$ km, and $d_3 = 1000$ km.
$$
\frac {(5000 + 4000 + 1000)\cdot10^3}{2.5 \cdot 10^8} + (1500 \cdot 8) \frac 3 {2.5 \cdot 10^6} + 2 \cdot 3 \cdot10^{-3} = 60.4 \text{ msec}
$$


**P11. In the above problem, suppose $R1 = R2 = R3 = R$ and $d_\text{proc} = 0$. Further suppose that the packet switch does not store-and-forward packets but instead immediately transmits each bit it receives before waiting for the entire packet to arrive. What is the end-to-end delay?**

As the packet switch doesn't store the packet, it's like the packet it is processed only once by the links, therefore:
$$
d_\text{end-to-end} = \sum_{i=1}^3 \frac {d_i}{s_i} + \frac LR
$$
For the data $L = 1500$ bytes,  $s_i = 2.5 \cdot 10^8$ m/s, $R = 2.5$ Mbps, the $d_1 = 5000$ km, $d_2 = 4000$ km, and $d_3 = 1000$ km.
$$
\frac {(5000 + 4000 + 1000)\cdot10^3}{2.5 \cdot 10^8} + \frac {1500 \cdot 8} {2.5 \cdot 10^6} = 44.8 \text{ msec}
$$
**P12. A packet switch receives a packet and determines the outbound link to which the packet should be forwarded. When the packet arrives, one other packet is halfway done being transmitted on this outbound link and four other packets are waiting to be transmitted. Packets are transmitted in order of arrival. Suppose all packets are 1,500 bytes and the link rate is 2.5 Mbps. What is the queuing delay for the packet? More generally, what is the queuing delay when all packets have length $L$, the transmission rate is $R$, $x$ bits of the currently-being-transmitted packet have been transmitted, and $n$ packets are already in the queue?**
$$
\frac {4.5 \cdot 1500 \cdot 8}{2.5 \cdot 10^6} = 21.6 \text{ msec}
$$
In general
$$
d_\text{queue}= \frac {n\cdot L + (L-x)} R = \frac {(n+1)L -x} R 
$$
**P13.**

* **a) Suppose $N$ packets arrive simultaneously to a link at which no packets are currently being transmitted or queued. Each packet is of length $L$ and the link has transmission rate $R$. What is the average queuing delay for the $N$ packets?**

  Delay for the first packet is 0

  Delay for the second packet is $L/R$

  Delay for the third packet is $2L/R$

  Thus the delay for the $N$th packet is $(N-1)L/R$

  Therefore the average delay will be 
  $$
  \overline d_\text{queue} & = & \left(0 + \frac LR + 2 \frac LR + 3 \frac LR + \cdots + (N-1) \frac LR \right)/N \\
  & = & \frac {\sum_{i=0}^{N-1}i \frac LR} N \\
  & = & \frac LR \frac {\sum_{i=0}^{N-1}i} N \\
  & = & \frac LR \frac {N(N-1)} 2 \frac 1N \\
  & = & \frac LR \frac {N-1} 2 \\
  $$
  

* **b) Now suppose that $N$ such packets arrive to the link every $LN/R$ seconds. What is the average queuing delay of a packet?**

  As this frequency is above the delay of the $N$th packet, the average will be $\frac LR \frac {N-1} 2$.

**P14. Consider the queuing delay in a router buffer. Let $I$ denote traffic intensity; that is, $I = La/R$. Suppose that the queuing delay takes the form $IL/R (1 - I)$ for $I < 1$**

* **a) Provide a formula for the total delay, that is, the queuing delay plus the transmission delay.**
  $$
  d_\text{total} & = & d_\text{queue} + d_\text{trans} \\
  & = & \frac {IL}{R(1 - I)} + \frac LR
  $$
  

* **b) Plot the total delay as a function of $L/R$.**

  First we create the function in $L/R$:
  $$
  d_\text{total} & = & \frac {IL}{R(1 - I)} + \frac LR \\
  & = & \frac {(La/R)L}{R(1 - (La/R))} + \frac LR \\
  & = & \frac {L^2a}{R^2(1 - (La/R))} + \frac LR
  $$
  Substituting $x = L/R$:
  $$
  d_\text{total}(x) = \frac {x^2a}{1 - ax} + x = \frac x {1-ax}
  $$
  Assuming $a=1$:
  $$
  d_\text{total}(x) = \frac {x}{1 - x}
  $$
  Plotting from $0 \leq x \leq 1$:

  ![Graph total delay x $L/R$](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Computer%20Networking%20-%20A%20Top-Down%20Approach/p14_b.png)

**P15. Let $a$ denote the rate of packets arriving at a link in packets/sec, and let $\mu$ denote the link’s transmission rate in packets/sec. Based on the formula for the total delay (i.e., the queuing delay plus the transmission delay) derived in the previous problem, derive a formula for the total delay in terms of $a$ and $µ$.**

The link’s transmission rate is the rate of packages leaving the link, thus:
$$
\mu = \frac RL
$$
where $N$ is the number of packets leaving the link in average. So
$$
\frac LR = \frac 1 \mu
$$
Therefore
$$
d_\text{total} & = & \frac {L/R}{1 - a(L/R)} \\
& = & \frac {1/\mu}{1-a/\mu} \\
& = & \frac 1 {\mu - a}
$$
**P16.**
