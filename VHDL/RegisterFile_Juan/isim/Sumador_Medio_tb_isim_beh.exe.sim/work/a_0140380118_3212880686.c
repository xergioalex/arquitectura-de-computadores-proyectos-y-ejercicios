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

/* This file is designed for use with ISim build 0xcb73ee62 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/JUAN CORRALES/UTP/SEMESTRE 1102/ARQUITECTURA DE COMPUTADORES/RegisterFile/Sumador_Completo.vhd";
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_0140380118_3212880686_p_0(char *t0)
{
    char t1[16];
    char t2[16];
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(47, ng0);

LAB3:    t3 = (t0 + 592U);
    t4 = *((char **)t3);
    t3 = (t0 + 3752U);
    t5 = (t0 + 684U);
    t6 = *((char **)t5);
    t5 = (t0 + 3768U);
    t7 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t2, t4, t3, t6, t5);
    t8 = (t0 + 776U);
    t9 = *((char **)t8);
    t8 = (t0 + 3784U);
    t10 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t1, t7, t2, t9, t8);
    t11 = (t0 + 2012);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t15 = *((char **)t14);
    memcpy(t15, t10, 4U);
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 1960);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0140380118_3212880686_p_1(char *t0)
{
    char t1[16];
    char t2[16];
    char t8[16];
    char t11[16];
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(48, ng0);

LAB3:    t3 = (t0 + 684U);
    t4 = *((char **)t3);
    t3 = (t0 + 3768U);
    t5 = (t0 + 776U);
    t6 = *((char **)t5);
    t5 = (t0 + 3784U);
    t7 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t2, t4, t3, t6, t5);
    t9 = (t0 + 592U);
    t10 = *((char **)t9);
    t9 = (t0 + 3752U);
    t12 = (t0 + 684U);
    t13 = *((char **)t12);
    t12 = (t0 + 3768U);
    t14 = (t0 + 776U);
    t15 = *((char **)t14);
    t14 = (t0 + 3784U);
    t16 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t11, t13, t12, t15, t14);
    t17 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t8, t10, t9, t16, t11);
    t18 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t1, t7, t2, t17, t8);
    t19 = (t0 + 2048);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 40U);
    t23 = *((char **)t22);
    memcpy(t23, t18, 4U);
    xsi_driver_first_trans_fast_port(t19);

LAB2:    t24 = (t0 + 1968);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0140380118_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0140380118_3212880686_p_0,(void *)work_a_0140380118_3212880686_p_1};
	xsi_register_didat("work_a_0140380118_3212880686", "isim/Sumador_Medio_tb_isim_beh.exe.sim/work/a_0140380118_3212880686.didat");
	xsi_register_executes(pe);
}
