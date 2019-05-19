<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex5" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4">
        </signal>
        <signal name="XLXN_5">
        </signal>
        <signal name="XLXN_6">
        </signal>
        <blockdef name="Sumador_Medio">
            <timestamp>2011-11-28T2:18:52</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="Sumador_Medio" name="XLXI_1">
            <blockpin signalname="XLXN_4" name="Cin" />
            <blockpin signalname="XLXN_5" name="A" />
            <blockpin signalname="XLXN_6" name="B" />
            <blockpin signalname="XLXN_1" name="Cout" />
            <blockpin name="S" />
        </block>
        <block symbolname="Sumador_Medio" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="Cin" />
            <blockpin name="A" />
            <blockpin name="B" />
            <blockpin signalname="XLXN_2" name="Cout" />
            <blockpin name="S" />
        </block>
        <block symbolname="Sumador_Medio" name="XLXI_3">
            <blockpin signalname="XLXN_2" name="Cin" />
            <blockpin name="A" />
            <blockpin name="B" />
            <blockpin signalname="XLXN_3" name="Cout" />
            <blockpin name="S" />
        </block>
        <block symbolname="Sumador_Medio" name="XLXI_4">
            <blockpin signalname="XLXN_3" name="Cin" />
            <blockpin name="A" />
            <blockpin name="B" />
            <blockpin name="Cout" />
            <blockpin name="S" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1360" y="944" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1920" y="1248" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2576" y="1536" name="XLXI_4" orien="R0">
        </instance>
        <instance x="624" y="640" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1184" y1="480" y2="480" x1="1008" />
            <wire x2="1184" y1="480" y2="784" x1="1184" />
            <wire x2="1360" y1="784" y2="784" x1="1184" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1824" y1="784" y2="784" x1="1744" />
            <wire x2="1824" y1="784" y2="1088" x1="1824" />
            <wire x2="1920" y1="1088" y2="1088" x1="1824" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="2432" y1="1088" y2="1088" x1="2304" />
            <wire x2="2432" y1="1088" y2="1376" x1="2432" />
            <wire x2="2576" y1="1376" y2="1376" x1="2432" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="624" y1="480" y2="480" x1="592" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="624" y1="544" y2="544" x1="592" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="624" y1="608" y2="608" x1="592" />
        </branch>
    </sheet>
</drawing>