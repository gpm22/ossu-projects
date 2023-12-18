# Wireshark Lab: Getting Started v8.0

* The basic tool for observing the messages exchanged between executing protocol entities is called a **packet sniffer**.
  * As the name suggests, a packet sniffer captures (“sniffs”) messages being sent/received from/by your computer.
  * It will also typically store and/or display the contents of the various protocol fields in these captured messages.
* A packet sniffer itself is **passive**.
  * It observes messages being sent and received by applications and protocols running on your computer, but never sends packets itself.
  * Similarly, received packets are never explicitly addressed to the packet sniffer.
  * Instead, a packet sniffer receives a copy of packets that are sent/received from/by application and protocols executing on your machine.
* The packet sniffer consists of two parts:
  1. **The packet capture library**
     * It receives a copy of every **link-layer frame** that is sent from or received by your computer over a given interface (link layer, such as Ethernet or WiFi).
     * Capturing all link-layer frames thus gives you all messages sent/received across the monitored link from/by all protocols and applications executing in your computer.
  2. **The packet analyzer**.
     * It displays the contents of all fields within a protocol message.
     * In order to do so, the packet analyzer must “understand” the structure of all messages exchanged by protocols. 

## What to hand in

1. **List 3 different protocols that appear in the protocol column in the unfiltered packet-listing window in step 7 above.**

   1. TCP
   2. TLSv1.2
   3. ARP

2. **How long did it take from when the HTTP GET message was sent until the HTTP OK reply was received?**

   182.544 msec

3. **What is the Internet address of the gaia.cs.umass.edu (also known as www-net.cs.umass.edu)?**

   128.119.245.12

4. **Print the two HTTP messages (GET and OK) referred to in question 2 above. To do so, select Print from the Wireshark File command menu, and select the “Selected Packet Only” and “Print as displayed” radial buttons, and then click OK.**

   Available on [wireshark_lab-getting_started-q4.pcapng](https://github.com/gpm22/ossu-projects/blob/main/Computer%20Networking%20-%20A%20Top-Down%20Approach/wireshark_lab-getting_started-q4.pcapng)
