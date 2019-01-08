# Serial connection

## Cable

* http://www.cowsarenotpurple.co.uk/bbccomputer/serialcable.html
* http://www.sprow.co.uk/bbc/extraserial.htm#Crossover

## BBC Setup

## Desktop setup

* eight data bits, no parity, one stop bit (8N1)
* no hardware flow control

/etc/minicom/.minirc.bbcmicro

Minicom commands

^A E - echo locally
^A L - Capture to file

http://danceswithferrets.org/geekblog/?p=469

# RS423 port

"5-pin DIN "domino" socket (SK4)"

RTS   Data in
    0v
CTS   Data out

* http://chrisacorns.computinghistory.org.uk/docs/Jafa/JafaRS423IFCartridgeUG.pdf
* http://bbc.nvg.org/doc/A%20Hardware%20Guide%20for%20the%20BBC%20Microcomputer/bbc_hw_03.htm

# PC 9-pin D-type

1 - DCD
2 - RD
3 - TD
4 - DTR
5 - GND
6 - DSR
7 - RTS
8 - CTS
9

* http://www.cowsarenotpurple.co.uk/bbccomputer/serialcable.html

## Version 1

BBC          PC
===============
Data out --- 2
Data in  --- 3
0v       --- 5
CTS      --- 7
RTS      --- 8

          |- 1
          |- 4
          |- 6

* http://danceswithferrets.org/geekblog/wp-content/uploads/2014/09/serial_cable_wiring.png
* http://www.sprow.co.uk/bbc/extraserial.htm

## Version 2

* http://www.brahms.demon.co.uk/software/downloads/serial-cable.txt

## Version 3

* http://www.cowsarenotpurple.co.uk/bbccomputer/serialcable.html

Data out --- 2
Data in  --- 3
CTS      --- 4
0v       --- 5
RTS      --- 6
          |- 1

          |- 7
          |- 8

## Version 4

http://www.zprod.org/PG/machines/bbcMicroInterface.htm
