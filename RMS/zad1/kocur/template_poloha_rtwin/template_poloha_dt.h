/*
 * template_poloha_dt.h
 *
 * Real-Time Workshop code generation for Simulink model "template_poloha.mdl".
 *
 * Model Version              : 1.46
 * Real-Time Workshop version : 7.0  (R2007b)  02-Aug-2007
 * C source code generated on : Sun Jan 01 02:45:50 2006
 */

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&template_poloha_B.Clock), 0, 0, 12 }
  ,

  { (char_T *)(&template_poloha_DWork.UnitDelay_DSTATE), 0, 0, 1 },

  { (char_T *)(&template_poloha_DWork.ToWorkspace_PWORK.LoggedData), 11, 0, 1 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  3U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&template_poloha_P.Mm1_Value), 0, 0, 23 },

  { (char_T *)(&template_poloha_P.EncoderInput_Channels), 6, 0, 7 },

  { (char_T *)(&template_poloha_P.Constant_Value), 3, 0, 2 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  3U,
  rtPTransitions
};

/* [EOF] template_poloha_dt.h */
