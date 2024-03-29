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
**P16. Consider a router buffer preceding an outbound link. In this problem, you will use Little’s formula, a famous formula from queuing theory. Let $N$ denote the average number of packets in the buffer plus the packet being transmitted. Let $a$ denote the rate of packets arriving at the link. Let $d$ denote the average total delay (i.e., the queuing delay plus the transmission delay) experienced by a packet. Little’s formula is $N = a \cdot d.$ Suppose that on average, the buffer contains 100 packets, and the average packet queuing delay is 20 msec. The link’s transmission rate is 100 packets/sec. Using Little’s formula, what is the average packet arrival rate, assuming there is no packet loss?**
$$
a = \frac N d = \frac {100+1}{20 \cdot 10^{-3}+ 10^{-2}} \approx 3667 \text{ packets/sec}
$$
**P17.**

* **a) Generalize Equation 1.2 in Section 1.4.3 for heterogeneous processing rates, transmission rates, and propagation delays.**
  $$
  d_\text{end-end} = \sum_{i=1}^N\left(d_\text{proc,i}+d_\text{trans,i} + d_\text{prop,i} \right)
  $$
  where $d_\text{trans,i} = L/R_i$.

* **b) Repeat a), but now also suppose that there is an average queuing delay of $d_\text{queue}$ at each node**
  $$
  d_\text{end-end} = \sum_{i=1}^N\left(d_\text{proc,i}+d_\text{trans,i} + d_\text{prop,i} + d_\text{queue, i} \right)
  $$
  where $d_\text{trans,i} = L/R_i$.

**P18. Perform a Traceroute between source and destination on the same continent at three different hours of the day.**

* **a) Find the average and standard deviation of the round-trip delays at each of the three hours.**

  * 12/14/2023 - 20h00 
    * average - 60 ms
    * standard deviation - 1.63 ms
  * 12/15/2023 - 11h20
    * average - 57 ms
    * standard deviation - 0.82 ms
  * 12/15/2023 - 14h10
    * average - 62.67 ms
    * standard deviation - 4.5 ms

* **b) Find the number of routers in the path at each of the three hours. Did the paths change during any of the hours?**

  9 routers, the same path.

* **c) Try to identify the number of ISP networks that the Traceroute packets pass through from source to destination. Routers with similar names and/ or similar IP addresses should be considered as part of the same ISP. In your experiments, do the largest delays occur at the peering interfaces between adjacent ISPs? **

  2 different ISPs:

  * virtua
  * embratel

  The largest delays occur at the peering interfaces between adjacent ISPs, from the 5th route to the 6th there is a large difference in the delay, which is when it leaves the ISP virtua to get in the embratel.

* **d) Repeat the above for a source and destination on different continents. Compare the intra-continent and inter-continent results**
  * **a)**

    * 12/14/2023 - 20h00 
      * average - 330.67 ms
      * standard deviation - 0.47 ms
    * 12/15/2023 - 11h20
      * average - 329.33 ms
      * standard deviation - 0.47 ms
    * 12/15/2023 - 14h50
      * average - 391 ms
      * standard deviation - 2.83 ms
  * **b)**

    14 routers for paths 1 and 2 and 15 for path 3.

    Paths 1 and 2 are equal and different than 3.

    The path 3 has the additional router 200.244.212.215 between 187.28.32.61 and 200.230.220.178, which are directly connected in paths 1 and 2.
  * **c)**

    5 ISPs:

    * virtua
    * embratel
    * gtt
    * iij
    * 2iij

    The largest delay occurs inside the ISPs, which are embratel and iij.

    From **ebt-plag-63-core02.bsa.embratel.net.br [200.244.212.215]** to **ebt-b16111-intl01.nyk.embratel.net.br [200.230.220.178]**, the delay is 7 times bigger. That probably means that there is an intercontinental link between these routers.

    From **sjc002bb00.iij.net [58.138.81.229]** to **tky001bb00.iij.net [58.138.88.81]**, the delay is 200 ms, doubling it. That probably means that there is an intercontinental link between these routers.
  * **Comparison**

    The inter-continent path has more ISPs and bigger delays.

    I noticed that my IAP has the following routers:

    * 100.65.160.1
    * bd060149.virtua.com.br [189.6.1.73]
    * bd0602a4.virtua.com.br [189.6.2.164]

* Data

  * Data Intra-continent - to 200.242.40.134 (Brazil)

    * 12/14/2023 - 20h00 

      ```
      Tracing route to angelim.sinetram.com.br [200.242.40.134]
      over a maximum of 30 hops:
      
        1     8 ms     8 ms     8 ms  LOCAL
        2    21 ms    18 ms    19 ms  100.65.160.1
        3    19 ms    17 ms    17 ms  bd060149.virtua.com.br [189.6.1.73]
        4    19 ms    17 ms    29 ms  bd0602a4.virtua.com.br [189.6.2.164]
        5    22 ms    18 ms    19 ms  201.39.112.25
        6     *        *        *     Request timed out.
        7    59 ms    60 ms    59 ms  ebt-plag-92-agg02.mnshz.embratel.net.br [200.244.66.226]
        8    59 ms    59 ms    62 ms  ebt-plag-20-agg02.mns.embratel.net.br [200.244.66.171]
        9    59 ms    62 ms    57 ms  ebt-t5-0-0-iacc02.mns.embratel.net.br [200.230.212.210]
       10    60 ms    59 ms    60 ms  sinetram-t5-1-0-154096-iacc02.mns.embratel.net.br [201.90.154.174]
       11    62 ms    58 ms    60 ms  angelim.sinetram.com.br [200.242.40.134]
      
      Trace complete.
      ```

    * 12/15/2023 - 11h20 

      ```
      Tracing route to angelim.sinetram.com.br [200.242.40.134]
      over a maximum of 30 hops:
      
        1     8 ms     8 ms     7 ms  LOCAL
        2    19 ms    18 ms    19 ms  100.65.160.1
        3    26 ms    23 ms    44 ms  bd060149.virtua.com.br [189.6.1.73]
        4    59 ms    25 ms    74 ms  bd0602a4.virtua.com.br [189.6.2.164]
        5    56 ms    63 ms    19 ms  201.39.112.25
        6     *        *        *     Request timed out.
        7    59 ms    57 ms    64 ms  ebt-plag-92-agg02.mnshz.embratel.net.br [200.244.66.226]
        8    59 ms    58 ms    58 ms  ebt-plag-20-agg02.mns.embratel.net.br [200.244.66.171]
        9    58 ms    65 ms    59 ms  ebt-t5-0-0-iacc02.mns.embratel.net.br [200.230.212.210]
       10    59 ms    57 ms    60 ms  sinetram-t5-1-0-154096-iacc02.mns.embratel.net.br [201.90.154.174]
       11    57 ms    56 ms    58 ms  angelim.sinetram.com.br [200.242.40.134]
      
      Trace complete.
      ```

    * 12/15/2023 - 14h10

      ```
      Tracing route to angelim.sinetram.com.br [200.242.40.134]
      over a maximum of 30 hops:
      
        1     8 ms     8 ms     7 ms  LOCAL
        2    19 ms    18 ms    20 ms  100.65.160.1
        3    20 ms    17 ms    16 ms  bd060149.virtua.com.br [189.6.1.73]
        4    19 ms    18 ms    19 ms  bd0602a4.virtua.com.br [189.6.2.164]
        5    19 ms    17 ms    19 ms  201.39.112.25
        6     *        *        *     Request timed out.
        7    62 ms    59 ms    58 ms  ebt-plag-92-agg02.mnshz.embratel.net.br [200.244.66.226]
        8    59 ms    61 ms    60 ms  ebt-plag-20-agg02.mns.embratel.net.br [200.244.66.171]
        9    59 ms    59 ms    61 ms  ebt-t5-0-0-iacc02.mns.embratel.net.br [200.230.212.210]
       10    60 ms    65 ms    56 ms  sinetram-t5-1-0-154096-iacc02.mns.embratel.net.br [201.90.154.174]
       11    69 ms    59 ms    60 ms  angelim.sinetram.com.br [200.242.40.134]
      
      Trace complete.
      ```

      

  * Data inter-continent - to 150.31.249.103 (Japan)

    * 12/14/2023 - 20h00 

      ```
      Tracing route to 103.249.31.150.bn.2iij.net [150.31.249.103]
      over a maximum of 30 hops:
      
        1     8 ms     6 ms     5 ms  LOCAL
        2    22 ms    18 ms    21 ms  100.65.160.1
        3    17 ms    17 ms    19 ms  bd060149.virtua.com.br [189.6.1.73]
        4    19 ms    19 ms    17 ms  bd0602a4.virtua.com.br [189.6.2.164]
        5     *        *       20 ms  187.28.32.61
        6     *        *        *     Request timed out.
        7   155 ms   150 ms   151 ms  ebt-b16111-intl01.nyk.embratel.net.br [200.230.220.178]
        8   166 ms   146 ms   145 ms  ae11.cr1-nyc2.ip4.gtt.net [209.120.132.221]
        9   157 ms   158 ms   162 ms  ae36.cr5-was1.ip4.gtt.net [89.149.181.50]
       10   157 ms   159 ms   158 ms  202.232.1.113
       11   207 ms   210 ms   207 ms  sjc002bb00.iij.net [58.138.81.229]
       12   327 ms   328 ms   341 ms  tky001bb00.iij.net [58.138.88.81]
       13   323 ms   323 ms   322 ms  tky001lip30.iij.net [210.138.115.210]
       14   330 ms   330 ms   330 ms  tokyo10-ntteast0.flets.2iij.net [160.13.162.2]
       15   331 ms   330 ms   329 ms  tokyo10-n414.flets.2iij.net [210.148.147.146]
       16   331 ms   331 ms   330 ms  103.249.31.150.bn.2iij.net [150.31.249.103]
      
      Trace complete.
      ```

    * 12/15/2023 - 11h20 

      ```
      Tracing route to 103.249.31.150.bn.2iij.net [150.31.249.103]
      over a maximum of 30 hops:
      
        1    11 ms    14 ms     1 ms  LOCAL
        2    20 ms    20 ms    18 ms  100.65.160.1
        3    18 ms    18 ms    17 ms  bd060149.virtua.com.br [189.6.1.73]
        4    18 ms    22 ms    18 ms  bd0602a4.virtua.com.br [189.6.2.164]
        5    14 ms    19 ms    18 ms  187.28.32.61
        6     *        *        *     Request timed out.
        7   153 ms   151 ms   151 ms  ebt-b16111-intl01.nyk.embratel.net.br [200.230.220.178]
        8   152 ms   150 ms   155 ms  ae11.cr1-nyc2.ip4.gtt.net [209.120.132.221]
        9   156 ms   154 ms   163 ms  ae36.cr5-was1.ip4.gtt.net [89.149.181.50]
       10   152 ms   155 ms   156 ms  202.232.1.113
       11   207 ms   212 ms   207 ms  sjc002bb00.iij.net [58.138.81.229]
       12   328 ms   328 ms   328 ms  tky001bb00.iij.net [58.138.88.81]
       13   318 ms   319 ms   318 ms  tky001lip30.iij.net [210.138.115.210]
       14   331 ms   330 ms   331 ms  tokyo10-ntteast0.flets.2iij.net [160.13.162.2]
       15   331 ms   330 ms   333 ms  tokyo10-n414.flets.2iij.net [210.148.147.146]
       16   330 ms   329 ms   329 ms  103.249.31.150.bn.2iij.net [150.31.249.103]
      
      Trace complete.
      ```

    * 12/15/2023 - 14h50

      ```
      Tracing route to 103.249.31.150.bn.2iij.net [150.31.249.103]
      over a maximum of 50 hops:
      
        1     8 ms     8 ms     7 ms  LOCAL
        2    17 ms    21 ms    19 ms  100.65.160.1
        3    20 ms    18 ms    16 ms  bd060149.virtua.com.br [189.6.1.73]
        4    19 ms    20 ms    20 ms  bd0602a4.virtua.com.br [189.6.2.164]
        5    23 ms    18 ms    18 ms  187.28.32.61
        6    19 ms    18 ms    18 ms  ebt-plag-63-core02.bsa.embratel.net.br [200.244.212.215]
        7   153 ms   151 ms   151 ms  ebt-b16111-intl01.nyk.embratel.net.br [200.230.220.178]
        8   144 ms   177 ms   145 ms  ae11.cr1-nyc2.ip4.gtt.net [209.120.132.221]
        9   156 ms   157 ms   156 ms  ae36.cr5-was1.ip4.gtt.net [89.149.181.50]
       10   158 ms   158 ms   156 ms  202.232.1.113
       11   208 ms   206 ms   210 ms  sjc002bb00.iij.net [58.138.81.229]
       12   395 ms   392 ms   403 ms  tky001bb00.iij.net [58.138.88.81]
       13   380 ms   378 ms   377 ms  tky001lip30.iij.net [210.138.115.210]
       14   385 ms   387 ms   382 ms  tokyo10-ntteast0.flets.2iij.net [160.13.162.2]
       15   392 ms   392 ms   395 ms  tokyo10-n414.flets.2iij.net [210.148.147.146]
       16   389 ms   389 ms   395 ms  103.249.31.150.bn.2iij.net [150.31.249.103]
      
      Trace complete.
      
      ```

**P19. Metcalfe’s law states the value of a computer network is proportional to the square of the number of connected users of the system. Let $n$ denote the number of users in a computer network. Assuming each user sends one message to each of the other users, how many messages will be sent? Does your answer support Metcalfe’s law?**

Each user will send $n-1$ messages, therefore, $n(n-1) = n^2 -n$ messages will be sent.

This supports Metcalfe's law.

**P20. Suppose that there are $M$ client-server pairs. Denote $R_s$, $R_c$, and $R$ for the rates of the server links, client links, and network link. Assume all other links have abundant capacity and that there is no other traffic in the network besides the traffic generated by the $M$ client-server pairs. Derive a general expression for throughput in terms of $R_s$, $R_c$, $R$, and $M$.**

The throughput will be
$$
\min \left\{R_s, R_c, \frac RM \right\}
$$
**P21. Suppose that there are $M$ paths between the server and the client. No two paths share any link. Path $k (k = 1, \dots, M)$ consists of $N$ links with transmission rates $R^k_1, R^k_2, \dots, R^k_ N$. If the server can only use one path to send data to the client, what is the maximum throughput that the server can achieve? If the server can use all $M$ paths to send data, what is the maximum throughput that the server can achieve?**

In the case of using only one path, the maximum throughput will be largest between the minimum transmission rate of each path:
$$
\max \left\{
	\min\left\{R^1_1, R_2^1, \dots, R^1_N \right\},
	\min\left\{R^2_1, R_2^2, \dots, R^2_N \right\},
	\dots,
	\min\left\{R^M_1, R_2^M \dots, R^M_N \right\},
\right\}
$$


In the case of using all paths together, the maximum throughput will be the total sum of the minimum transmission rate of each path:
$$
\sum_{k=1}^M \min\left\{R^k_1, R_2^k \dots, R^k_N \right\},
$$
**P22. Suppose that each link between the server and the client has a packet loss probability $p$, and the packet loss probabilities for these links are independent. What is the probability that a packet (sent by the server) is successfully received by the receiver? If a packet is lost in the path from the server to the client, then the server will re-transmit the packet. On average, how many times will the server re-transmit the packet in order for the client to successfully receive the packet?**

Let $n$ be the number of links in the path between client and server, the probability that a packet (sent by the server) is successfully received by the receiver is $(1-p)^n$.

As this is described as a geometric distribution, the expectation is $\frac 1p$. Therefore, the average number of re-transmissions needed is $\frac 1p - 1$.

**P23. Assume that we know the bottleneck link along the path from the server to the client is the first link with rate $R_s$ bits/sec. Suppose we send a pair of packets back to back from the server to the client, and there is no other traffic on this path. Assume each packet of size $L$ bits, and both links have the same propagation delay $d_\text{prop}$.**

* **a) What is the packet inter-arrival time at the destination? That is, how much time elapses from when the last bit of the first packet arrives until the last bit of the second packet arrives?**

  As the bottleneck is the first link, the second packet will only be queued in the first link, therefore the inter-arrival time is $1/R_s$.

* **b) Now assume that the second link is the bottleneck link (i.e., $R_c < R_s$). Is it possible that the second packet queues at the input queue of the second link? Explain. Now suppose that the server sends the second packet $T$ seconds after sending the first packet. How large must $T$ be to ensure no queuing before the second link? Explain.**

  It is possible that the second packet queues at the input queue of the second link, as when its first bit arrives there, the first packet will not have finished being sent if $L/R_c \leq L/R_s$.

  To ensure no querying $T$ must be
  $$
  T = L \left(\frac 1 {R_c} - \frac 1 {R_s} \right)
  $$
  

  **P24. Suppose you would like to urgently deliver 50 terabytes data from Boston to Los Angeles. You have available a 100 Mbps dedicated link for data transfer. Would you prefer to transmit the data via this link or instead use FedEx overnight delivery? Explain.**

  The time to transfer it over the link is
  $$
  \frac {50 \cdot 8 \cdot 10^{12}}{100 \cdot 10^6} = 4 \cdot 10^6 \text{ s} 
  $$
  Which is 6 weeks, 4 days, 7 hours, 6 minutes and 40 s.

  Therefore FedEx overnight is faster.

  **P25. Suppose two hosts, $A$ and $B$, are separated by 20,000 kilometers and are connected by a direct link of $R = 5$ Mbps. Suppose the propagation speed over the link is $2.5 \cdot 10^8$ meters/sec.**

  * **a) Calculate the bandwidth-delay product, $R \cdot d_\text{prop}$.**
    $$
    R \cdot d_\text{prop} = 5 \cdot 10^6 \cdot \frac {20 \cdot 10^6}{2.5 \cdot 10^8} = 4 \cdot 10^5 \text{ bits}
    $$
    
  * **b) Consider sending a file of 800,000 bits from Host $A$ to Host $B$. Suppose the file is sent continuously as one large message. What is the maximum number of bits that will be in the link at any given time?**
  
    400,000 bits.
  
  * **c) Provide an interpretation of the bandwidth-delay product.**
  
    It is the maximum number of bits that cab be in the link at any given time
  
  * **d) What is the width (in meters) of a bit in the link? Is it longer than a football field?**
  
    50 meters, which is smaller than a football field.
  
  * **e) Derive a general expression for the width of a bit in terms of the propagation speed $s$, the transmission rate $R$, and the length of the link $m$.**
    $$
    \frac m {R \cdot d_\text{prop}} =  \frac m {R \cdot (m/s)} = \frac sR \text{ m/bit}
    $$

**P26. Referring to problem P25, suppose we can modify $R$. For what value of $R$ is the width of a bit as long as the length of the link?**
$$
\frac sR = m \to R= \frac sm
$$
which results in 12.5 bps

**P27. Consider problem P25 but now with a link of $R = 500$ Mbps.**

* **a) Calculate the bandwidth-delay product, $R \cdot d_\text{prop}$.**
  $$
  R \cdot d_\text{prop} = 500 \cdot 10^6 \cdot \frac {20 \cdot 10^6}{2.5 \cdot 10^8} = 4 \cdot 10^7 \text{ bits}
  $$
  
* **b) Consider sending a file of 800,000 bits from Host $A$ to Host $B$. Suppose the file is sent continuously as one big message. What is the maximum number of bits that will be in the link at any given time?**

  800,000

* **c) What is the width (in meters) of a bit in the link?**
  $$
  \frac sR = \frac {2.5 \cdot 10^8}{5 \cdot 10^8} = 0.5 \text{ m/bit}
  $$
  50 cm.

**P28. Refer again to problem P25.**

* **a) How long does it take to send the file, assuming it is sent continuously?**
  $$
  \frac LR + \frac ms = \frac {8 \cdot 10^5}{5 \cdot 10^6} + \frac {20 \cdot 10^6}{2.5 \cdot 10^8} = 0.24
  $$
  240 msec

* **b) Suppose now the file is broken up into 20 packets with each packet containing 40,000 bits. Suppose that each packet is acknowledged by the receiver and the transmission time of an acknowledgment packet is negligible. Finally, assume that the sender cannot send a packet until the preceding one is acknowledged. How long does it take to send the file?**
  $$
  20 \cdot \left(\frac {L}{20R}+ 2\frac ms \right)= \frac LR + 40 \frac ms = 3.36
  $$

  3. 36s

* **c) Compare the results from (a) and (b).**

  Sending direct is away faster, because the propagation delay only affects it once.

**P29. Suppose there is a 10 Mbps microwave link between a geostationary satellite and its base station on Earth. Every minute the satellite takes a digital photo and sends it to the base station. Assume a propagation speed of $2.4 \cdot 10^8$ meters/sec.**

* **a) What is the propagation delay of the link?**

  The geostationary orbit is 36,000 km above the earth, therefore
  $$
  d_\text{prop} = \frac {35.785 \cdot 10^6}{2.4 \cdot 10^8} = 150 \text{ msec}
  $$
  

* **b) What is the bandwidth-delay product, $R \cdot d_\text{prop}$?**
  $$
  R \cdot d_\text{prop} = 1.5 \text{ Mbit}
  $$
  

* **c) Let $x$ denote the size of the photo. What is the minimum value of $x$ for the microwave link to be continuously transmitting?**

  To be continuously transmitting, the microwave will have to keep sending a file for at least a minute, therefore the transmission delay must be a minute:
  $$
  d_\text{trans} = \frac LR  \\
  L = d_\text{trans}R
  $$
  which results in $6 \cdot 10^8$ bits or 75 MB.

**P30. Consider the airline travel analogy in our discussion of layering in Section 1.5, and the addition of headers to protocol data units as they flow down the protocol stack. Is there an equivalent notion of header information that is added to passengers and baggage as they move down the airline protocol stack?**

Yes. The baggage receives a "header" as a tag info to go in the right airplane and also in a way to allow the passengert o get it back.

The passanger's ticket also receive more info as the passanger passes through the gate, get into the airplane and etc.

**P31. In modern packet-switched networks, including the Internet, the source host segments long, application-layer messages (for example, an image or a music file) into smaller packets and sends the packets into the network. The receiver then reassembles the packets back into the original message. We refer to this process as message segmentation. Figure 1.27 illustrates the end-to-end transport of a message with and without message segmentation. Consider a message that is $10^6$ bits long that is to be sent from source to destination in Figure 1.27. Suppose each link in the figure is 5 Mbps. Ignore propagation, queuing, and processing delays.**

* **a) Consider sending the message from source to destination without message segmentation. How long does it take to move the message from the source host to the first packet switch? Keeping in mind that each switch uses store-and-forward packet switching, what is the total time to move the message from source host to destination host?**

  It takes 200 msec to move it to the first packet-switch.

  The total time to move the message from source host to destination host is 600 msec.

* **b) Now suppose that the message is segmented into 100 packets, with each packet being 10,000 bits long. How long does it take to move the first packet from source host to the first switch? When the first packet is being sent from the first switch to the second switch, the second packet is being sent from the source host to the first switch. At what time will the second packet be fully received at the first switch?**

  It takes 2 msec to move the first packet to the first packet-switch.

  The second packet be fully received at the first switch at 4 msec.

* **c) How long does it take to move the file from source host to destination host when message segmentation is used? Compare this result with your answer in part (a) and comment.**

  The first packet takes 6 msec.

  The second 8 msec.

  The $n$th takes $6 + (n-1)2$, therefore it is 204 msec, which is significant less (almost a third from the full one).

* **d) In addition to reducing delay, what are reasons to use message segmentation?**

  1. To deal better with packet loss.
  2. To allow pause of the transmission to continue it later.
  3. To not lost all the message if an error occurrs.
  4. Huge packets would get into the network creating insane queueing delays.

* **e) Discuss the drawbacks of message segmentation.**

  1. Segmenting and recreating can be hard, as it packet must have a sequence id.
  2. As the header size is usually the same for all packets regardless their sizes, message segmentation will increase the total amount of bytes sent.

**P32. Experiment with the Message Segmentation interactive animation at the book’s Web site. Do the delays in the interactive animation correspond to the delays in the previous problem? How do link propagation delays affect the overall end-to-end delay for packet switching (with message segmentation) and for message switching?**

They will correspond if you consider the file as 16 kbits long and the links as 4 kbps.

The propagation delay affects both equally.

**P33. Consider sending a large file of $F$ bits from Host $A$ to Host $B$. There are three links (and two switches) between $A$ and $B$, and the links are uncongested (that is, no queuing delays). Host $A$ segments the file into segments of $S$ bits each and adds 80 bits of header to each segment, forming packets of $L = 80 + S$ bits. Each link has a transmission rate of $R$ bps. Find the value of $S$ that minimizes the delay of moving the file from Host $A$ to Host $B$. Disregard propagation delay.**

First packet takes $3\frac LR$ from $A$ to $B$.

Second packet takes $3\frac LR + \frac LR$ from $A$ to $B$.

$m$th packet takes $3\frac LR + (m-1)\frac LR$ from $A$ to $B$.

$m$ is $F/S$ and $L = 80 +S$, therefore the total delay is
$$
d_\text{total} & = & (m+2) \frac LR \\
& = & \left(\frac FS + 2 \right) \frac {(80 + S)}{R} \\
& = & \frac {(F + 2S)(80 + S)}{SR} \\
& = & \frac {80F+S(F+160)+2S^2}{SR} \\
& = & \frac {80F}{SR} + \frac {F+160}R + \frac {2S}R
$$
To get the minimal value we take the derivative of $d_\text{total}$ in relation to $S$ and equals it to zero:
$$
\frac {dd_\text{total}}{dS} = -\frac {80F}{S^2R} + \frac 2R
$$
So we get
$$
\frac {80F}{S^2R}=\frac2R \\
\frac {80F}{S^2}=2 \\
S = \sqrt{40F}
$$
**P34. Skype offers a service that allows you to make a phone call from a PC to an ordinary phone. This means that the voice call must pass through both the Internet and through a telephone network. Discuss how this might be done**

Both Internet and telephone nertworks are connected together at gateways. So, when a skype user calls a telephone, a circuit is established between the used gateway and the called telephone. The skype user's voice is sent in packets to the gateway, where the voice is reconstructed and sent over the circuit to the telephone. On the other hand, the telephone user's voice is packaged at the gateway and sent in packetes to the skype user.
