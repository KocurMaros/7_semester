#ifndef RTW_HEADER_UM3_h_
#define RTW_HEADER_UM3_h_
#ifndef UM3_COMMON_INCLUDES_
#define UM3_COMMON_INCLUDES_
#include <stdlib.h>
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "UM3_types.h"
#include "mwmathutil.h"
#include "rt_nonfinite.h"
#include <stddef.h>
#include "rtGetInf.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME UM3
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (9) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (4)   
#elif NCSTATES != 4
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T mg3dc5r2ur ; real_T optengmsdi ; real_T ct0zstqrkc ;
real_T pkwgudtkaf ; real_T ft1voprlut ; real_T plqfjsbzc3 ; real_T jxv4taar1m
; real_T jvpz3syp00 ; real_T hvxhqyn32y ; } B ; typedef struct { real_T
gyrukydv4j ; real_T d14qqhch23 ; real_T huju3ddvwg ; real_T lrgek0mon2 ;
real_T mszxjk42kc ; real_T d5okg3ybip ; real_T mmvjjnnyd4 ; real_T a1ocb4hu0o
; struct { void * AQHandles ; } iprdj0502t ; struct { void * TimePtr ; void *
DataPtr ; void * RSimInfoPtr ; } hovrfbmab0 ; struct { void * AQHandles ; }
bp30wjgkv2 ; struct { void * AQHandles ; } ddhhap0xr4 ; struct { void *
AQHandles ; } befkrwokjo ; struct { void * AQHandles ; } ardt00juob ; struct
{ int_T PrevIndex ; } liz5lfpfjs ; } DW ; typedef struct { real_T h0f4j1q5in
; real_T fy0c4gclul ; real_T gxzzgbuesd ; real_T c5ifb254qh ; } X ; typedef
struct { real_T h0f4j1q5in ; real_T fy0c4gclul ; real_T gxzzgbuesd ; real_T
c5ifb254qh ; } XDot ; typedef struct { boolean_T h0f4j1q5in ; boolean_T
fy0c4gclul ; boolean_T gxzzgbuesd ; boolean_T c5ifb254qh ; } XDis ; typedef
struct { rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T D
; real_T I ; real_T P ; real_T u ; real_T
PIDController_InitialConditionForFilter ; real_T
PIDController_InitialConditionForIntegrator ; real_T PIDController_N ; real_T
Integrator1_IC ; real_T FromWs_Time0 [ 6 ] ; real_T FromWs_Data0 [ 6 ] ;
real_T Gain1_Gain ; real_T Gain_Gain ; real_T Integrator_IC ; real_T
Gain2_Gain ; real_T Constant_Value ; } ; extern const char_T *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern mxArray * mr_UM3_GetDWork ( ) ; extern void
mr_UM3_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_UM3_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * UM3_GetCAPIStaticMap ( void ) ; extern
SimStruct * const rtS ; extern const int_T gblNumToFiles ; extern const int_T
gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern rtInportTUtable
* gblInportTUtables ; extern const char * gblInportFileName ; extern const
int_T gblNumRootInportBlks ; extern const int_T gblNumModelInputs ; extern
const int_T gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ;
extern const int_T gblInportComplex [ ] ; extern const int_T
gblInportInterpoFlag [ ] ; extern const int_T gblInportContinuous [ ] ;
extern const int_T gblParameterTuningTid ; extern DataMapInfo *
rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ;
void MdlOutputs ( int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T
tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
