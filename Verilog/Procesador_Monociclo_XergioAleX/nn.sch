<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex5" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <blockdef name="MUX_ALU">
            <timestamp>2011-12-7T21:22:47</timestamp>
            <rect width="368" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="432" y="-172" height="24" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
        </blockdef>
        <block symbolname="MUX_ALU" name="XLXI_1">
            <blockpin name="alu_src_b" />
            <blockpin name="crt(31:0)" />
            <blockpin name="inmediate_ext(31:0)" />
            <blockpin name="alu_input(31:0)" />
        </block>
        <block symbolname="MUX_ALU" name="XLXI_2">
            <blockpin name="alu_src_b" />
            <blockpin name="crt(31:0)" />
            <blockpin name="inmediate_ext(31:0)" />
            <blockpin name="alu_input(31:0)" />
        </block>
        <block symbolname="MUX_ALU" name="XLXI_3">
            <blockpin name="alu_src_b" />
            <blockpin name="crt(31:0)" />
            <blockpin name="inmediate_ext(31:0)" />
            <blockpin name="alu_input(31:0)" />
        </block>
        <block symbolname="MUX_ALU" name="XLXI_4">
            <blockpin name="alu_src_b" />
            <blockpin name="crt(31:0)" />
            <blockpin name="inmediate_ext(31:0)" />
            <blockpin name="alu_input(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="512" y="752" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1808" y="1376" name="XLXI_3" orien="R0">
        </instance>
        <instance x="960" y="1984" name="XLXI_4" orien="R0">
        </instance>
        <instance x="752" y="1472" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1024" y1="576" y2="576" x1="1008" />
            <wire x2="1024" y1="576" y2="624" x1="1024" />
            <wire x2="1024" y1="624" y2="624" x1="1008" />
        </branch>
    </sheet>
</drawing>