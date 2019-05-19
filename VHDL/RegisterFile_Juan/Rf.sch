<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex5" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1(3:0)" />
        <signal name="XLXN_2(3:0)" />
        <signal name="XLXN_5(3:0)" />
        <signal name="XLXN_6(3:0)" />
        <signal name="XLXN_7(1:0)" />
        <signal name="XLXN_8(3:0)" />
        <signal name="XLXN_10(3:0)" />
        <signal name="XLXN_12(1:0)" />
        <port polarity="Input" name="XLXN_12(1:0)" />
        <blockdef name="Multiplexor">
            <timestamp>2011-11-28T20:58:30</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="Registers">
            <timestamp>2011-11-28T20:56:29</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="Multiplexor" name="XLXI_1">
            <blockpin signalname="XLXN_1(3:0)" name="Q0(3:0)" />
            <blockpin signalname="XLXN_2(3:0)" name="Q1(3:0)" />
            <blockpin signalname="XLXN_8(3:0)" name="Q2(3:0)" />
            <blockpin signalname="XLXN_10(3:0)" name="Q3(3:0)" />
            <blockpin name="R_Mux(1:0)" />
            <blockpin name="Cr(3:0)" />
        </block>
        <block symbolname="Multiplexor" name="XLXI_2">
            <blockpin name="Q0(3:0)" />
            <blockpin name="Q1(3:0)" />
            <blockpin name="Q2(3:0)" />
            <blockpin name="Q3(3:0)" />
            <blockpin signalname="XLXN_12(1:0)" name="R_Mux(1:0)" />
            <blockpin name="Cr(3:0)" />
        </block>
        <block symbolname="Registers" name="XLXI_3">
            <blockpin name="Out_Dec_R" />
            <blockpin name="Clk" />
            <blockpin name="Dw_Reg(3:0)" />
            <blockpin signalname="XLXN_1(3:0)" name="Q(3:0)" />
        </block>
        <block symbolname="Registers" name="XLXI_4">
            <blockpin name="Out_Dec_R" />
            <blockpin name="Clk" />
            <blockpin name="Dw_Reg(3:0)" />
            <blockpin signalname="XLXN_2(3:0)" name="Q(3:0)" />
        </block>
        <block symbolname="Registers" name="XLXI_5">
            <blockpin name="Out_Dec_R" />
            <blockpin name="Clk" />
            <blockpin name="Dw_Reg(3:0)" />
            <blockpin signalname="XLXN_8(3:0)" name="Q(3:0)" />
        </block>
        <block symbolname="Registers" name="XLXI_6">
            <blockpin name="Out_Dec_R" />
            <blockpin name="Clk" />
            <blockpin name="Dw_Reg(3:0)" />
            <blockpin signalname="XLXN_10(3:0)" name="Q(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1536" y="1952" name="XLXI_2" orien="R0">
        </instance>
        <instance x="304" y="544" name="XLXI_3" orien="R0">
        </instance>
        <instance x="352" y="1056" name="XLXI_4" orien="R0">
        </instance>
        <instance x="336" y="1568" name="XLXI_5" orien="R0">
        </instance>
        <instance x="368" y="2080" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_1(3:0)">
            <wire x2="704" y1="384" y2="384" x1="688" />
            <wire x2="704" y1="384" y2="528" x1="704" />
            <wire x2="1360" y1="528" y2="528" x1="704" />
        </branch>
        <branch name="XLXN_2(3:0)">
            <wire x2="752" y1="896" y2="896" x1="736" />
            <wire x2="1360" y1="592" y2="592" x1="752" />
            <wire x2="752" y1="592" y2="896" x1="752" />
        </branch>
        <instance x="1360" y="816" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_8(3:0)">
            <wire x2="1040" y1="1408" y2="1408" x1="720" />
            <wire x2="1040" y1="656" y2="1408" x1="1040" />
            <wire x2="1360" y1="656" y2="656" x1="1040" />
        </branch>
        <branch name="XLXN_10(3:0)">
            <wire x2="1056" y1="1920" y2="1920" x1="752" />
            <wire x2="1056" y1="720" y2="1920" x1="1056" />
            <wire x2="1360" y1="720" y2="720" x1="1056" />
        </branch>
        <branch name="XLXN_12(1:0)">
            <wire x2="1536" y1="1920" y2="1920" x1="1504" />
        </branch>
        <iomarker fontsize="28" x="1504" y="1920" name="XLXN_12(1:0)" orien="R180" />
    </sheet>
</drawing>