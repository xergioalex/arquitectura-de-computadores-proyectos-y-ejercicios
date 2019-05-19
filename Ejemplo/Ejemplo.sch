<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex5" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="negq" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_8" />
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
        <block symbolname="nand2" name="XLXI_7">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin name="I1" />
            <blockpin signalname="negq" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_8">
            <blockpin signalname="negq" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_9">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_10">
            <blockpin name="I0" />
            <blockpin signalname="XLXN_8" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1264" y="800" name="XLXI_7" orien="R0" />
        <instance x="1248" y="640" name="XLXI_8" orien="R0" />
        <branch name="negq">
            <wire x2="1248" y1="576" y2="576" x1="1184" />
            <wire x2="1184" y1="576" y2="640" x1="1184" />
            <wire x2="1584" y1="640" y2="640" x1="1184" />
            <wire x2="1584" y1="640" y2="704" x1="1584" />
            <wire x2="1680" y1="704" y2="704" x1="1584" />
            <wire x2="1584" y1="704" y2="704" x1="1520" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1248" y1="512" y2="512" x1="1088" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1264" y1="736" y2="736" x1="1104" />
        </branch>
        <instance x="832" y="608" name="XLXI_9" orien="R0" />
        <instance x="848" y="832" name="XLXI_10" orien="R0" />
        <branch name="XLXN_8">
            <wire x2="720" y1="640" y2="640" x1="704" />
            <wire x2="736" y1="640" y2="640" x1="720" />
            <wire x2="832" y1="640" y2="640" x1="736" />
            <wire x2="832" y1="640" y2="704" x1="832" />
            <wire x2="848" y1="704" y2="704" x1="832" />
            <wire x2="832" y1="544" y2="640" x1="832" />
        </branch>
    </sheet>
</drawing>