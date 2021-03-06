/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x12940baa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/XergioAleX/Documents/Xilinx Projects/Verilog Oscar/RegisterFile_Comportamental/Register_File.v";
static int ng1[] = {1, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};



static void Always_16_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    int t30;
    char *t31;
    char *t32;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 4288);
    *((int *)t2) = 1;
    t3 = (t0 + 4000);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(17, ng0);

LAB5:    xsi_set_current_line(18, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:
LAB12:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);

LAB28:    t2 = ((char*)((ng2)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t30 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng3)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t30 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng4)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t30 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng5)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t30 == 1)
        goto LAB35;

LAB36:
LAB37:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);

LAB42:    t2 = ((char*)((ng2)));
    t30 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t30 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng3)));
    t30 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t30 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng4)));
    t30 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t30 == 1)
        goto LAB47;

LAB48:    t2 = ((char*)((ng5)));
    t30 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t30 == 1)
        goto LAB49;

LAB50:
LAB51:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(18, ng0);

LAB13:    xsi_set_current_line(19, ng0);
    t28 = (t0 + 1368U);
    t29 = *((char **)t28);

LAB14:    t28 = ((char*)((ng2)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 2, t28, 32);
    if (t30 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng3)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 2, t2, 32);
    if (t30 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng4)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 2, t2, 32);
    if (t30 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng5)));
    t30 = xsi_vlog_unsigned_case_compare(t29, 2, t2, 32);
    if (t30 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB12;

LAB15:    xsi_set_current_line(20, ng0);

LAB24:    xsi_set_current_line(20, ng0);
    t31 = (t0 + 1208U);
    t32 = *((char **)t31);
    t31 = (t0 + 2568);
    xsi_vlogvar_assign_value(t31, t32, 0, 0, 4);
    goto LAB23;

LAB17:    xsi_set_current_line(21, ng0);

LAB25:    xsi_set_current_line(21, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 4);
    goto LAB23;

LAB19:    xsi_set_current_line(22, ng0);

LAB26:    xsi_set_current_line(22, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 4);
    goto LAB23;

LAB21:    xsi_set_current_line(23, ng0);

LAB27:    xsi_set_current_line(23, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 4);
    goto LAB23;

LAB29:    xsi_set_current_line(27, ng0);

LAB38:    xsi_set_current_line(27, ng0);
    t4 = (t0 + 2568);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 4);
    goto LAB37;

LAB31:    xsi_set_current_line(28, ng0);

LAB39:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 2728);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 4);
    goto LAB37;

LAB33:    xsi_set_current_line(29, ng0);

LAB40:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 2888);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 4);
    goto LAB37;

LAB35:    xsi_set_current_line(30, ng0);

LAB41:    xsi_set_current_line(30, ng0);
    t4 = (t0 + 3048);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 2248);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 4);
    goto LAB37;

LAB43:    xsi_set_current_line(33, ng0);

LAB52:    xsi_set_current_line(33, ng0);
    t5 = (t0 + 2568);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t21 = (t0 + 2408);
    xsi_vlogvar_assign_value(t21, t8, 0, 0, 4);
    goto LAB51;

LAB45:    xsi_set_current_line(34, ng0);

LAB53:    xsi_set_current_line(34, ng0);
    t5 = (t0 + 2728);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t21 = (t0 + 2408);
    xsi_vlogvar_assign_value(t21, t8, 0, 0, 4);
    goto LAB51;

LAB47:    xsi_set_current_line(35, ng0);

LAB54:    xsi_set_current_line(35, ng0);
    t5 = (t0 + 2888);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t21 = (t0 + 2408);
    xsi_vlogvar_assign_value(t21, t8, 0, 0, 4);
    goto LAB51;

LAB49:    xsi_set_current_line(36, ng0);

LAB55:    xsi_set_current_line(36, ng0);
    t5 = (t0 + 3048);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t21 = (t0 + 2408);
    xsi_vlogvar_assign_value(t21, t8, 0, 0, 4);
    goto LAB51;

}


extern void work_m_00000000000620457662_0065856647_init()
{
	static char *pe[] = {(void *)Always_16_0};
	xsi_register_didat("work_m_00000000000620457662_0065856647", "isim/Register_File_isim_beh.exe.sim/work/m_00000000000620457662_0065856647.didat");
	xsi_register_executes(pe);
}
