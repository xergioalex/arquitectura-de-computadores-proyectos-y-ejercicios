<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex5" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <port polarity="Output" name="XLXN_8" />
        <port polarity="Output" name="XLXN_9" />
        <port polarity="Input" name="XLXN_24" />
        <port polarity="Input" name="XLXN_25" />
        <port polarity="Input" name="XLXN_26" />
        <blockdef name="nand2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
        </blockdef>
        <blockdef name="PTD">
            <timestamp>2011-12-9T18:15:40</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="nand2" name="XLXI_1">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="XLXN_20" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_2">
            <blockpin signalname="XLXN_21" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_9">
            <blockpin signalname="XLXN_22" name="I0" />
            <blockpin signalname="XLXN_24" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_10">
            <blockpin signalname="XLXN_25" name="I0" />
            <blockpin signalname="XLXN_22" name="I1" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="PTD" name="XLXI_12">
            <blockpin signalname="XLXN_26" name="clk" />
            <blockpin signalname="XLXN_22" name="enable" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1552" y="992" name="XLXI_1" orien="R0" />
        <instance x="1552" y="1264" name="XLXI_2" orien="R0" />
        <branch name="XLXN_8">
            <wire x2="1552" y1="928" y2="928" x1="1472" />
            <wire x2="1472" y1="928" y2="1088" x1="1472" />
            <wire x2="1824" y1="1088" y2="1088" x1="1472" />
            <wire x2="1824" y1="1088" y2="1168" x1="1824" />
            <wire x2="1904" y1="1168" y2="1168" x1="1824" />
            <wire x2="1824" y1="1168" y2="1168" x1="1808" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1488" y1="960" y2="1136" x1="1488" />
            <wire x2="1552" y1="1136" y2="1136" x1="1488" />
            <wire x2="1824" y1="960" y2="960" x1="1488" />
            <wire x2="1824" y1="896" y2="896" x1="1808" />
            <wire x2="1824" y1="896" y2="960" x1="1824" />
            <wire x2="1920" y1="896" y2="896" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1904" y="1168" name="XLXN_8" orien="R0" />
        <iomarker fontsize="28" x="1920" y="896" name="XLXN_9" orien="R0" />
        <branch name="XLXN_20">
            <wire x2="1552" y1="864" y2="864" x1="1520" />
        </branch>
        <instance x="1264" y="960" name="XLXI_9" orien="R0" />
        <branch name="XLXN_21">
            <wire x2="1552" y1="1200" y2="1200" x1="1520" />
        </branch>
        <instance x="1264" y="1296" name="XLXI_10" orien="R0" />
        <instance x="672" y="1056" name="XLXI_12" orien="R0">
        </instance>
        <branch name="XLXN_22">
            <wire x2="1184" y1="1024" y2="1024" x1="1056" />
            <wire x2="1184" y1="1024" y2="1168" x1="1184" />
            <wire x2="1264" y1="1168" y2="1168" x1="1184" />
            <wire x2="1184" y1="896" y2="1024" x1="1184" />
            <wire x2="1264" y1="896" y2="896" x1="1184" />
        </branch>
        <branch name="XLXN_24">
            <wire x2="1264" y1="832" y2="832" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="1232" y="832" name="XLXN_24" orien="R180" />
        <branch name="XLXN_25">
            <wire x2="1264" y1="1232" y2="1232" x1="1232" />
        </branch>
        <iomarker fontsize="28" x="1232" y="1232" name="XLXN_25" orien="R180" />
        <branch name="XLXN_26">
            <wire x2="672" y1="1024" y2="1024" x1="640" />
        </branch>
        <iomarker fontsize="28" x="640" y="1024" name="XLXN_26" orien="R180" />
    </sheet>
</drawing>