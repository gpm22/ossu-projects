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