ASIC Design Laboratory
Cooperative Design Lab (CDL)
USB Full-Speed Bulk-Transfer Endpoint AHB-Lite SoC Module
Design Manual (4-Person Team)
Fall 2019
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
The purpose of this multi-week cooperative lab is to help you gain experience working with a team of designers to
implement and validate a larger scale design. The previous labs have all be focused on smaller self-contained designs
to allow you to develop your system and hardware design skills, along with developing your ability to use an HDL
to describe hardware systems. In this lab you will be directly responsible for designing and implementing a fairly
sized portion of an overall design, with your team members implementing the other portions, and then working
working you teammates to integrate your work into the overall design. Additionally, you will need to design the
validation setup for the work one of your teammates implemented, and one of them will do so for the portion you
designed. This setup is more similar to what you would experience in industry, where someone other than you will
be responsible for validating your work according the standards and requirements that were set for your design,
rather than based on knowing how it is implemented.
This design is going to be larger in design effort than your prior lab work and will have more opportunity for error
propagation. Therefore it is paramount that you follow efficient debugging approaches based on clearly establishing
cause-effect relationships through your design working backward from the chronologically first high-level problematic behavior. Other lazy or speculative debugging methods will most certainly result in vast amounts of wasted
time, effort, and frustration and can easily increase debugging times by easily a factor of 10x.
In this lab, you (with your team) will perform the following tasks:
• Plan out the implementation of a larger design composed of multiple functional modules, that each are composed of multiple sub-modules, based on a provided starter architecture.
• Submit your implementation planning as a group via Blackboard submission
• Demonstrate and discuss your design planning with your TA.
• Implement the major modules of the design architecture as a hierarchy of smaller function-focused modules.
• Develop test benches to validate the major modules (the test bench you develop can not be for the major
module you are responsible for).
• Directly validate the major modules of the design prior to integrating them to form the overall design.
• Integrate the major modules to form the overall required design.
• Synthesize the overall design (or at least its major modules) using Design Compiler®
• Validate the Synthesized/Mapped version of the overall design (or at least its major modules)
• Prove via demonstration to course staff that your design (or at least the major modules) works as required.
• Perform area and timing analysis of the major modules and overall design.
• Document any needed revisions to your design’s architectural approach, your validation methodology, and the
area and timing analysis of your design via a final report.
• Submit your final report as a group via Blackboard submission.
Page 1 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
1 Lab Work Overview
1.1 Design Overview
For the Cooperative Design Lab you will be designing, implementing, and verifying a System-on-Chip peripheral
module that would add USB Full-Speed Bulk-Transfer End-point support to an AHB-Lite based SoC. USB in general
is a standard for governing a shared bus for connecting multiple peripheral devices (USB Endpoints) such as input
devices (keyboards, mice, joysticks, etc.), external storage devices, and printers to a common primary device (USB
host) such as computer. Each of these peripheral devices will generally be an SoC of it’s own, with it’s own (usually
light-weight) CPU/microcontroller, on-board volatile memory, potentially some non-volatile/permanent memory,
and other peripheral modules for managing various other IO connections used within the device. Some devices
might also have power-optimized compute accelerators if high-precision or sophisticated controls are needed, such
as in printers or high resolution scanning equipment. An example of one such SoC system is shown in Figure 1
for a contextual reference. The AHB-Lite and USB Full-Speed Bulk-Transfer related specifications are discussed in
dedicated sections, followed by sections discussing the required Cooperative Design Lab architecture, required core
components, and required team workload allocations.
Figure 1: Example of CDL USB Full-Speed Bulk-Transfer End-point peripheral usage in an end-point device SoC
Page 2 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
1.2 Expectations Regarding the Design Planning Stage
During the design planning stage you are required to:
• Create separate operational timing/waveform diagrams for each major task/operation between major modules
in the provided starting architecture.
• Create separate functional block or hierarchical RTL diagrams to describe the internal structure of each of the
major modules shown in the design’s overall architecture
• Create separate RTL diagrams for each block indicated in a major module’s diagram.
• Create separate operational timing/waveform diagrams for each major task/operation within a major module,
capturing the requirements of how the major module’s sub-modules must interact.
• Submit your prepared diagrams as a group via a Blackboard Submission.
• Demonstrate and discuss your diagrams with your TA during your CDL Implementation week lab session.
You must have these diagrams submitted as either PDF file(s) or image files using common standards (JPEG,
PNG, or BMP) in order to earn points for them.
NOTE: As in prior labs, All diagrams, must be done as a digital drawing. Hand drawn diagrams (even if they are
scanned) will receive a grade of zero points.
To guide you in your design work, you are provided with a starting architecture for the overall design and a list of
required functional blocks that will be needed within each major module. Your task is to design how these pieces
will interact with each other to execute the overall functionality needed. You are not and will not being specifically
instructed on how to design these blocks, only their intended behavior/function. You are only told the expected
architecture for the design, which is comprised of the inputs to each block, the outputs from each block and what
function the block is to perform. It is up to you to come up with a working solution for your blocks and then
integrate the building blocks to form the full design. You are allowed to create additional signals to link between
major modules in the architecture, but must otherwise maintain the same structure for the top-level of the design.
1.3 Expectations Regarding the Implementation Stage
During the Implementation stage, you are expected to:
• Implement each module’s functional sub-modules
• Verify the functionality of each module’s functional sub-modules via a unit-testing style approach.
• Integrate the sub-modules to form their respective major module(s).
Page 3 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
1.4 Expectations Regarding the Verification Stage
The verification stage is where you are expected to do full major module and full design verification and validation.
To ensure correct verification of the AHB-Lite interface operation, you will be provided with and required to use an
AHB-Lite bus model that has been updated to expect correct HREADY and Burst Transfer related behavior. This
will be provided via a library that contains complied and verified modules for implementing the model. As this
module is contained in a library they must not be included in the various makefile variables, otherwise the makefile
will error out trying to find local copies of the files. You will have to use the simulation rules from the makefile
in order for library it is contained in to be linked against when starting the simulation. At the start of this stage,
you will be given a document that describes proper interfacing and usage of the provided bus model and the various
verification and demonstration requirements that will be used to determine your CDL Technical Accomplishment
Score.
1.5 Grading Policy
As stated in the syllabus, there are three aspects to the CDL grading: (1) technical accomplishment, (2) Documentation, (3) Demonstration. The technical accomplishment portion is based on successful completion of the required
design process and the proof of correct functionality of your design’s implementation, and is worth 60% of the CDL
total score and 15% of your course grade. The documentation aspect is based on the completeness of your design
planning and final report, and is worth 20% of the CDL total score and 5% of your course grade. The Demonstration
aspect is based solely on the effectiveness, correctness, and organization of your validation demonstration to course
staff, and is worth 20% of the CDL total score and 5% of your course grade.
The workload distribution requirements are discussed in the design architecture section.
Page 4 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
2 Advanced High-performance Bus Lite Protocol
You should already be somewhat familiar with AHB-Lite from Lab 9. However, this lab will require supporting more
of the full protocol and thus this section will both recover the portions of the protocol covered in the Lab 9 manual
and also discuss the additional portions of the protocol that your design will be supporting during this Cooperative
Design Lab.
The Advanced High-performance Bus Lite (AHB-Lite) protocol[1] is one of many that form the Advanced Microprocessor Bus Architecture (AMBA) Bus System design by ARM.
Like most SoC buses, AHB-Lite has three main aspects or parts:
1. The ’master’ interface device which is in charge of initiating any/all requests on the bus
2. At least one ’slave’ interface device which responds to requests that are directed to it through the bus
3. The bus ’fabric’ which handles how all of these devices are physically connected and how control and data
signals for requests are routed between the two devices involved in an bus transaction.
2.1 AHB-Lite Signals
The following are the various signals (by name) that are used within the AHB-Lite protocol and their respective
roles:
HCLK This is the bus (and commonly system) clock signal.
HRESETn This is the bus (and usually system) active-low reset signal.
HADDR This is used for providing the address (within the slave only) that the transaction involves.
HPROT This signal is used for selecting between protection levels for the transfers.
HMASTERLOCK This signal indicates that the transfer is ’locked’ by the master and thus must be treated as an
atomic operation.
HSELx This is ’slave’ selection signal where the ’x’ is replaced by a number for the slave it is connected to and
each ’slave’ device is given its own dedicated one.
HTRANS This indicates the type of the current transfer (value encoding provided in Table 1).
HSIZE This indicates the size of the transfer. Typically is Byte, half-word, or full-word size and scales with the
data bus size, with the number of bytes equal to 2HSIZE
.
HWRITE This indicates whether a transaction is a read (logic low value) or write (logic high value).
HWDATA This is used for transferring the data written to the ’slave’ device.
HRDATA This is used for transferring the data read from the ’slave’ device and can be up to 32-bits wide.
HREADY This is an active-high ready feedback signal from the ’slave’ device which is pulled low by the ’slave’ if
it needs to stall/pause the transaction.
HRESP This is an active-high error feedback signal from the ’slave’ device, and must be asserted when there is a
transaction error (such as trying to write to read-only addresses).
HBURST This indicates the nature of the current burst transfer (value encoding provided in Table 2).
Page 5 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
Table 1: The value encoding scheme for the ’HTRANS’ signal
Value Label Description
0 IDLE The bus in an idle phase.
1 BUSY There is currently a master triggered delay cycle within a variable length burst.
2 NONSEQ This is either an individual transfer or a the first beat of a burst.
3 SEQ This is one of the beats in a burst.
Table 2: The value encoding scheme for the ’HBURST’ signal
Value Label Description
0 SINGLE This is a single transfer.
1 INCR This is an incrementing burst of variable length.
2 WRAP4 This is a 4-beat wrap-around burst.
3 INCR4 This is a 4-beat incrementing burst.
4 WRAP8 This is a 8-beat wrap-around burst.
5 INCR8 This is a 8-beat incrementing burst.
6 WRAP16 This is a 16-beat wrap-around burst.
7 INCR16 This is a 16-beat incrementing burst.
In this lab you are going to be focusing on implementing a ’slave’ device for the AHB-Lite protocol and so the
following sections are going to focus on bus transfers as seen by the ’slave’ devices after the bus ’fabric’ has already
handled the routing of signals and data to or from the ’master’ and ’slave’ devices.
2.2 Operation of a Basic Write transfer
Figure 2: Example operation and timing of AHB-Lite Writes from the perspective of a ’slave’
Write transfers are only allowed to finish and release the bus once the ’slave’ maintains the ’hready’ signal (via its
’hreadyout’) at a logic-high value during the second stage, to indicate that the write was either completed or at least
internally buffered depending on the design. If the ’hready’ signal is at a logic low value then the bus (and involved
master) must stall for as long as ’hready’ stays at a logic low value. This requirement is true for both the address
phase and the data phase of transfers and can result in indefinite stall or ’freezing’ of the bus if ’hready’ is misused.
Additionally, subsequent transfers can be overlapped or spaced out by the master.
Page 6 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
2.3 Operation of a Basic Read transfer
Figure 3: Example operation and timing of AHB-Lite Reads from the perspective of a ’slave’
Similar to write transfers, read transfers are only allowed to finish and release the bus once the ’slave’ maintains the
’hready’ signal (via its ’hreadyout’ at a logic-high value during the second stage, to indicate that the data requested
has been available on the ’hrdata’ bus. If the ’hready’ signal is at a logic low value then the bus (and involved
master) must stall for as long as ’hready’ stays at a logic low value. This requirement is true for both the address
phase and the data phase of transfers and can result in indefinite stall or ’freezing’ of the bus if ’hready’ is misused.
Additionally, subsequent transfers can be overlapped or spaced out by the master.
2.4 Transfer Error during Basic Read or Write
Figure 4: Example of erroneous read and write transfers.
In order for the master to be able to see the ’hresp’ value (during an error) in time, the slave should pull ’hready’ low
to extend the address phase to be at least two cycles long. Once the master sees the error response it will generally
choose to nullify the transfer by overriding it with an IDLE transfer value before the bus pipeline advances.
Page 7 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
2.5 Burst Transfer Styles
Figure 5: Example of a 4-beat incrementing write burst transfer
NOTE: There is no control or timing difference between read and write bursts, only which data bus is active.
Figure 6: Example of a 4-beat wrap-around write burst transfer
Page 8 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
3 Universal Serial Bus Protocol 1.1 (Full-Speed)
You are likely already familiar with the USB protocol[2] by name and general purpose (to connect nearly every
possible peripheral to a computer). USB is an asynchronous serial communication protocol with a fairly sized but
flexible base standard of available transfer modes. There is also a whole suite of protocols that have been built on
top the the base protocol to standardize everything from USB connected mass-storage devices to various human
interfacing devices, like keyboards and mice. For this design we are going focus only on the core basics of USB
packets and one of the core styles of transfers called Bulk Transfers in order to keep things tractable.
There are also a wide range of free online resources that describe and explain the various aspects of this ubiquitous
communication standard. One that is well structured and recommended for you checkout if you want to learn
more about USB but not directly dive into the full official standard yet is https://www.beyondlogic.org/
usbnutshell/usb4.shtml.
Before going forward it is important to establish a little design context and a couple key terms that will be heavily
used later. USB as a protocol is designed entirely around the usage model of a single host (similar to a master
in an SoC context) that is nearly always a computer/processor and a plethora of peripheral devices referred to as
’endpoints’. Your design is going to be one such endpoint. However, one thing you should notice later on is that
a given peripheral (designated by it’s address) can have multiple ’endpoints’, this is allow some flexibility for how
peripherals are communicated with and to enable the existence of USB hub designs. Your design will only have one
internal ’endpoint’ which will be the default endpoint number of ’0’. Also, since we are not requiring you implement
the start-up sequence where addresses are assigned by the ’host’, your design should either simply use the ’default
address’ of ’0’ or a value that you preload into your design as if it had been assigned during a USB start-up sequence.
3.1 USB Line Encoding and Data Synchronization
USB encodes data bits within packets using a Non-Return-to-Zero Inverted (NRZI) encoding scheme to encode
data as changes or non-changes in the wire voltage. More specifically the NRZI convention used by USB encodes
’0’ as toggling the current wire value and ’1’ as maintaining it as show in Figure 7. This allows for easier data
reception/sampling synchronization by being able to have a clear point when a data bit starts or ends. In order
to support clean sending and reception of large packets like those in USB, any data sampling timing needs to be
re-synchronized to each edge in the D+/D- lines of a USB receiver design.
Figure 7: An example of USB-style NRZI encoding/decoding of data
In order to bound the maximum number of bits between edges in the data lines, USB also employs ’bit-stuffing’
where a ’0’ is inserted between valid data bits after six continuous ’1’ bits have been sent the the data line encoder,
in order to force a data line edge at that point. Conversely, on the receiving end these stuffed bits must be filtered so
that they don’t disturb the data values sent in the packets. Therefore, after every six bit periods of no data transitions
on the data lines, the decoders must assume the next bit period is going to be a stuffed ’0’ and thus prevent the
receiver from considering that ’0’ as a valid data bit.
Furthermore, USB packets are transmitted least-significant-bit first.
Page 9 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
3.2 USB Packet Types used in Bulk Transfers
All packets have a basic structure of:
1. A ’sync’ byte, which after line encoding is string of transitions that enable easier initial data synchronization
at the receiver (illustrated in Figure 8).
2. A ’pid’ byte that encodes the type of packet it is. The first 4 bits (listed in Table 3) are sent in left-to-right
order followed by their complemented value in left-to-right order.
3. An optional data field
4. An ’EOP’ or end-of-packet sequence where both D+ and D- are both driven low for 2 bit periods and the
brought back to the idle bus value for at least one more bit period.
Figure 8: An illustration of the line encoded form of a USB packet’s ’sync’ field
Table 3: Listing of relevant USB packet id values and meanings
Value Label Description
4’b0001 OUT ’OUT’ Token packet id.
4’b1001 IN ’IN’ Token packet id.
4’b0011 DATA0 One of two available data packet ids.
4’b1011 DATA1 The other available data packet id.
4’b0010 ACK An Acknowledgement Handshake. (Success)
4’b1010 NAK A Negative Acknowledgement Handshake. (Usually means try again later)
4’b1110 STALL Device is halted due to an error.
Out of the packet types you’ll be needing to handle in order support Bulk Data Transfers, only the Token and Data
packets will use the optional data field. In both of these packet types, a Cyclic Redundancy Check (CRC) ’signature’
is included at the end of their respective data field layouts in order to allow the checking of the packet’s data integrity
at it’s destination.
The token packets will have a data field consisting of:
1. A 7-bit address for the intended device
2. a 4-bit endpoint number to reference which sub-part or endpoint of the device it targeting
3. a 5-bit CRC (polynomial: x
5 + x
2 + 1, residual: ’01100’) of the first two sections of the data field
The data packets will have a data field consisting of:
1. Up to 64 bytes of data
2. A 16-bit CRC (polynomial: x
16 + x
15 + x
2 + 1, residual: ’1000000000001101’) of the previous data bytes
Page 10 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
3.3 USB CRC
The wikipedia page for the calculation of CRCs (https://en.wikipedia.org/wiki/Computation_
of_cyclic_redundancy_checks) has very useful animations that illustrate how simple modified shift registers can be used to calculate them for serial streams of data. USB also uses both the ’Preset to -1’ and the ’Post-invert’
options for CRC calculations. Furthermore, there are numerous online checkers available for checking the CRC calculations for various standards/protocols. However, be careful to pay attention to the endianness expected for the
input stream in these checkers and whether they are factoring in the two calculation options required by USB. The
following site (http://www.ghsi.de/pages/subpages/Online%20CRC%20Calculation/) is good
place to get started with verifying your core CRC calculation, but it does not account for the ’preset to -1’ and the
’post-invert’ options.
CRC checker and generators are equivalent hardware designs with the only difference being how they are used
overall. A generator simply is fed the data stream for which to compute the checksum (CRC field in packet). A
checker is fed the same data stream followed by it’s accompanying checksum and then the result is checked against
the expected residual value to detect the presences of value errors in the packet.
3.4 Bulk Transfer Sequence
Figure 9: A overall flow-diagram illustrating the sequence of packet exchanges for both Endpoint-to-Host (INToken) and Host-to-Endpoint (OUT-Token) bulk-data transfers
USB transfers are always initiated by the Host (Master) device, which is typically a computer of some design. The
notion of ’IN’ or ’OUT’ is from the perspective of the Host device, so ’IN’ tokens are used to start reads/retrievals
from an endpoint and ’OUT’ tokens are used to send data to an endpoint. The ’STALL’ handshake is only used when
the endpoint is halted due to some serious error, and should not be used by your design. The ’NAK’ handshake is
sent as a response when either the endpoint either cannot currently receive the data (in the case of an ’OUT’ transfer)
or does not have any data to send to the Host (in the case of an ’IN’ transfer). The ’ACK’ handshake is sent as
success response for any transfer.
Page 11 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
4 Design Architecture
A full SoC peripheral module contains both the SoC bus related interface module and the functional modules needed
to implemented and execute the peripherals communication standard. In this over all design the SoC bus interface
is a more fully capable AHB-Lite bus, and the peripheral’s communication standard is a focused subset of USB
1.1 (Full-Speed). In order to keep the workload tractable for your team and the time schedule, the USB standard
support is focused solely on supporting the basics of Bulk Transfer under the USB 1.1 standard. No USB startup/bus
enumeration or other aspects of the standard need to be directly handled in this design.
NOTE: There are significant differences between the design requirements for 4-person and 3-person teams. Therefore, teams should only depend on the content of design manuals for their respective team size.
4.1 USB Full-Speed Bulk-Transfer Endpoint AHB-Lite SoC Module Design Architecture
The starting architecture your team must follow (other than potential internal signal additions) is depicted in Figure 10.
Figure 10: Architecture for USB Full-Speed Bulk-Transfer Endpoint AHB-Lite SoC Module
NOTE: Clock and Reset signals are assumed to be sent to the appropriate blocks and are not shown
Similar to during Lab 9, the security (’HPROT’) and atomicity (’HMASTERLOCK’) signals are absent from this
design because they are not needed or relevant given the functionality of the design.
Unlike in Lab 9, both HREADY feedback (via ’HREADYOUT’) and burst transfer control (via ’HBURST’) are
present on this design. However, even though HREADY feedback is present the slave really only has a valid need for
delaying/extending the bus transfers under error conditions as, there should not be any transfers that required longer
than one address cycle or one data cycle to properly respond. All status checking or valid data supply/retrieval is
expected to be enforced by software running on the SoC core and via polling-style data status checks.
Page 12 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
4.1.1 List of the Functional Units/Blocks and Purpose
USB RX This module handles all work needed to receive and validity check any of the basic packet types sent from
the host to an endpoint during Bulk Transfers.
USB TX This module handles all work needed to correctly send any of the basic packet types sent from an endpoint
to the host during Bulk Transfers.
Data Buffer This module handles all work needed to correctly buffer the data that should be sent out during the
next endpoint-to-host data transfer or was received during the most recent host-to-endpoint data transfer.
Protocol Controller This module handles all work needed to ensure the proper packet sequence is executed for
Bulk Transfers as well as perform any error/status checking regarding the data buffer during transfers.
AHB-Lite-Slave This module handles all AHB-Lite-Slave Interface specific functionality.
4.1.2 List of the Top-Level Ports and Purpose
Clk This is the system clock port. It should be connected to a 100 MHz clock.
N_Rst This is the active-low asynchronous system reset signal
HADDR This is used for providing the address (within the slave only) that the transaction involves.
HSEL This is the ’slave’ selection signal.
HTRANS This indicates the type of the current transfer.
HSIZE This indicates the size of the transfer.
HWRITE This indicates whether a transaction is a read (logic low value) or write (logic high value).
HWDATA This is used for transferring the data written to the ’slave’ device.
HRDATA This is used for transferring the data read from the ’slave’ device and can be up to 32-bits wide.
HREADY This is an active-high ready feedback signal from the ’slave’ device which is pulled low by the ’slave’ if
it needs to stall/pause the transaction.
HRESP This is an active-high error feedback signal from the ’slave’ device, and must be asserted when there is a
transaction error (such as trying to write to read-only addresses).
HBURST This indicates the nature of the current burst transfer.
Dplus In This is the receiving (RX) module’s D+wire connection
Dminus In This is the receiving (RX) module’s D−wire connection
Dplus In This is the transmitter (TX) module’s D+wire connection
Dminus In This is the transmitter (TX) module’s D−wire connection
D Mode This is an active high-signal that determines if the D+/D−wire pair should be in output/drive mode or
receiving/passive mode.
Page 13 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
4.2 Required AHB-Lite-Slave Address Mapping
Table 4: Table of the required AHB-Lite-Slave address-to-value mapping
Address
Value
Size
(Bytes)
Access
Mode Description
0x00 -
0x3F 4 R/W
Data Buffer (Buffer has capacity of 64B or 16 4-B words):
Writes to any address in this range push a new value into the Data Buffer.
Reads to any address in this range pop a value from the Data Buffer.
0x40 2 R
Status Register:
Value of ’1’ for bit-0 → Data is available in the buffer from the Host
Value of ’1’ for bit-8 → Host to Endpoint Bulk Data Transfer is in progress
Value of ’1’ for bit-9 → Endpoint to Host Bulk Data Transfer is in progress
0x42 2 R
Error Register:
Value of ’1’ for bit-0 → Error happened during a Host to Endpoint Transfer
Value of ’1’ for bit-8 → Error happened during an Endpoint to Host
Transfer
0x44 1 R Buffer Occupancy: Current data buffer occupancy in bytes.
0x48 1 R/W
Endpoint-to-Host Transfer Size Register:
This is set to the amount of data the Endpoint is supposed to try to send to
the Host when the next Endpoint-to-Host Transfer is initiated. Setting this
must also reserve the data buffer for a Endpoint-to-Host Transfer.
This register must be cleared up termination of the Bulk-Data Transfer
sequence it was originally set for.
In order to allow AHB-Lite burst support the FIFO based data buffer was allocated a 64B address range to allow a
the FIFO to be populated via a single 16-word burst, since bursts require the address to increment for each ’beat’
of the burst. As a result, any write within the data buffer address range must only result in pushing a new value
(with the amount of bytes based on the HSIZE) into the data buffer. And any read within the data buffer address
range must only pop the amount of data requested (determined by HSIZE) from the data buffer. All values are to be
handled according to ’Little Endian’ notation.
4.3 Valid Design Usage
4.3.1 Host-to-Endpoint Transfers
The valid flow of operations for using this design while expecting a Host-to-Endpoint Transfer is as follows:
1. The SoC core would periodically check the status register to see if a Host-to-Endpoint has started or if Data
has been received from one.
2. Once data has been received from the Host, the SoC core will check the buffer occupancy register to find out
how much data was received.
3. The SoC core will then retrieve the data via either formal read burst(s) or via a sequence of non-burst reads.
4. Once all of the data has been retrieved from the buffer, the data-available flag in the status register must be
cleared by the design.
Page 14 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
4.3.2 Endpoint-to-Host Transfers
The valid flow of operations for using this design while expecting an Endpoint-to-Host Transfer is as follows:
1. The SoC core will set the ’Endpoint-to-Host Transfer Size’ register to the size of the data payload that should
be sent to the HOST.
2. The SoC core will populate the data buffer with the data to send via either formal write burst(s) or a sequence
of non-burst writes.
3. Once the data buffer currently holds as much data as set for the data payload size, then the the protocol
controller will allow a Endpoint-to-Host transfer to happen the next time it sees an ’IN’ Token packet.
4. Once Endpoint-to-Host transfer concludes, the buffer must no longer be considered reserved and the ’Endpointto-Host Transfer Size’ must be cleared.
4.3.3 Buffer-based Transfer Delays or Rejections
Once the data buffer has been reserved by the setting of the ’Endpoint-to-Host Transfer Size’ register, all ’OUT’
Token request must be responded to with a ’NAK’ since there is no where to store data from the Host and the design
must also respond with a ’NAK’ to any ’IN’ Tokens until all of the data needed for sending is in the data buffer.
If the data buffer is still holding data from a prior Host-to-Endpoint transfer when a new one is requested, the design
must respond with a ’NAK’.
Page 15 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
5 Specifications for the Blocks You Must Design and Implement
5.1 USB Full-Speed Bulk-Transfer Endpoint AHB-Lite SoC Module
5.1.1 Block Description
This is the full design module that connects the dedicated AHB-Lite-Slave interface, the USB specific modules, and
the data buffer together to form the full peripheral.
Since there will not be an electronic grading script for this design, the exact names used for the filename and ports
does not matter as long as they are logical and descriptive of their intended function.
The target clock rate for this design must be 100 MHz.
5.2 AHB-Lite-Slave Interface
This block handles all AHB-Lite specific work and must be composed of at least the following component modules:
Address Decoder This block should handle the decoding of raw addresses into value specific selection and write
control signals.
RDATA Register The value for the HRDATA bus must be registered, this is to prevent critical path lengthening and
bus synchronization issues for the AHB-Lite interconnect.
Value Registers Every accessible value that is not fully available via port on the module must be held in a dedicated
register. These may be distinctly named or handled via an array of value registers.
5.3 USB RX
This block handles all work related to the reception of packets from the USB Host and must be composed of at least
the following component modules:
Control FSM This component must be an FSM that controls the sequence of operations within the USB RX module.
Shift Register This should just be a wrapper or direct usage of your prior flexible serial-to-parallel shift register
design.
Timer This component must control the sampling and packet field specific timing and is similar in role as the timer
module from the UART lab design.
Decoder This component must handle the decoding of the data bits, as well as any idle and EOP conditions, that
are sent to the RX module via the D+/D- signals.
5-bit CRC Checker This component checks if the CRC field of an arriving Token packet is valid for that packet.
16-bit CRC Checker This component checks if the CRC field of an arriving Data packet is valid for that packet.
Bit-Stuff Detector This component determines if a currently arriving bit should be considered a ’stuffed bit’ that
should be ignored value wise.
Page 16 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
5.4 USB TX
This block handles all work related to the sending of packets to the USB Host and must be composed of at least the
following component modules:
Control FSM This component must be an FSM that controls the sequence of operations within the USB TX module.
Shift Register This should just be a wrapper or direct usage of your prior flexible parallel-to-serial shift register
design.
Timer This component must control the data bit sending and packet field specific timing.
Encoder This component must handle the encoding of the data bits, as well as any idle and EOP conditions, that
are sent from the TX module via the D+/D- signals.
16-bit CRC Generator This component generates the value for the CRC field of a Data packet that is being sent
from the USB TX module.
Bit-Stuffer This component determines if a bit must be ’stuffed’ into the outgoing bit-stream and pauses any data
shifting for one bit period in order to allow the bit ’stuffing’ to happen.
5.5 Protocol Controller
This block handles the enforcement of proper transfer sequences and any related high-level error handling. This
block must be a Moore-style FSM.
5.6 Data Buffer
This block handles the buffering of the data packet payloads in FIFO queue fashion. It must be naturally empty
before any buffering of data from the Host is allowed, and must be cleared/flushed if there is any error the during
the reception of a data packet from the Host. It should never be possible to have the FIFO’s read and write pointers
wrap around in the design and so the logic can be designed with this in mind.
Page 17 of 19
ASIC Design Laboratory Design Manual (4-Person Team) Fall 2019
5.7 Required Workload Distribution
All design and full module verification work must be distributed in the following manner:
• Team Member 1:
– Design and implementation of the USB RX major module and its components other than the 5-bit and
16-bit CRC checker components.
– Design and implementation of the Verification Test bench for the Protocol Controller and Data Buffer
modules.
• Team Member 2:
– Design and implementation of the USB TX major module and its components except for the 16-bit CRC
generator component.
– Design and implementation of the Verification Test bench for the AHB-Lite Slave module.
• Team Member 3:
– Design and implementation of the AHB-Lite Slave major module and its components.
– Design and implementation of the 5-bit and 16-bit CRC generator/checker component modules.
– Design and implementation of the Verification Test bench for the USB RX module.
• Team Member 4:
– Design and implementation of the Protocol Controller and Data Buffer major modules and their components.
– Design and implementation of the Verification Test bench for the USB TX module.
6 Closing Remarks
• While there will not be any TA sign-offs for your design planning work, it is in your best interest to ask for
feedback from the course staff as you finalize your designs before you start implementing them.
Page 18 of 19
Bibliography
[1] ARM. AMBA 3 AHB-Lite Protocol Specification v1.0. 2006.
[2] Compaq Intel Microsoft NEC. Specification, Universal Serial Bus, 1998.
19
