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
static const char *ng0 = "D:/Universidad/Semestre 6/Arquitectura de Computadores/Xilinx Projects/Procesador_Segmentado/Procesador_Segmentado.v";
static unsigned int ng1[] = {0U, 0U};



static void Cont_432_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(432, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1208U);
    t6 = *((char **)t4);
    xsi_vlogtype_concat(t3, 32, 32, 3U, t6, 4, t5, 26, t2, 2);
    t4 = (t0 + 2928);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t3, 8);
    xsi_driver_vfirst_trans(t4, 0, 31);
    t11 = (t0 + 2848);
    *((int *)t11) = 1;

LAB1:    return;
}


extern void work_m_00000000003480182715_3341724088_init()
{
	static char *pe[] = {(void *)Cont_432_0};
	xsi_register_didat("work_m_00000000003480182715_3341724088", "isim/Procesador_Segmentado_isim_beh.exe.sim/work/m_00000000003480182715_3341724088.didat");
	xsi_register_executes(pe);
}
