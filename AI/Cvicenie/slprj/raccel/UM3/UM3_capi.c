#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "UM3_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 17
#endif
#ifndef SS_INT64
#define SS_INT64 18
#endif
#else
#include "builtin_typeid_types.h"
#include "UM3.h"
#include "UM3_capi.h"
#include "UM3_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"UM3/Derivative" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 1 , 0 ,
TARGET_STRING ( "UM3/Derivative2" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 ,
0 } , { 2 , 0 , TARGET_STRING ( "UM3/Integrator" ) , TARGET_STRING ( "" ) , 0
, 0 , 0 , 0 , 0 } , { 3 , 0 , TARGET_STRING ( "UM3/Integrator1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 4 , 0 , TARGET_STRING (
"UM3/Saturation" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 5 , 0 ,
TARGET_STRING ( "UM3/Sum" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , {
6 , 0 , TARGET_STRING ( "UM3/Sum1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 ,
0 } , { 7 , 0 , TARGET_STRING (
"UM3/PID Controller/I Gain/Internal Parameters/Integral Gain" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 8 , 0 , TARGET_STRING (
"UM3/PID Controller/N Gain/Internal Parameters/Filter Coefficient" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL ) ,
0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters
rtBlockParameters [ ] = { { 9 , TARGET_STRING ( "UM3/PID Controller" ) ,
TARGET_STRING ( "N" ) , 0 , 0 , 0 } , { 10 , TARGET_STRING (
"UM3/PID Controller" ) , TARGET_STRING ( "InitialConditionForIntegrator" ) ,
0 , 0 , 0 } , { 11 , TARGET_STRING ( "UM3/PID Controller" ) , TARGET_STRING (
"InitialConditionForFilter" ) , 0 , 0 , 0 } , { 12 , TARGET_STRING (
"UM3/Constant" ) , TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 13 ,
TARGET_STRING ( "UM3/Gain" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , { 14
, TARGET_STRING ( "UM3/Gain1" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } , {
15 , TARGET_STRING ( "UM3/Gain2" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } ,
{ 16 , TARGET_STRING ( "UM3/Integrator" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 17 , TARGET_STRING ( "UM3/Integrator1"
) , TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 18 , TARGET_STRING
( "UM3/Signal Builder/FromWs" ) , TARGET_STRING ( "Time0" ) , 0 , 1 , 0 } , {
19 , TARGET_STRING ( "UM3/Signal Builder/FromWs" ) , TARGET_STRING ( "Data0"
) , 0 , 1 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 } } ; static int_T
rt_LoggedStateIdxList [ ] = { - 1 } ; static const rtwCAPI_Signals
rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ;
static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 , ( NULL ) , (
NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_ModelParameters
rtModelParameters [ ] = { { 20 , TARGET_STRING ( "D" ) , 0 , 0 , 0 } , { 21 ,
TARGET_STRING ( "I" ) , 0 , 0 , 0 } , { 22 , TARGET_STRING ( "P" ) , 0 , 0 ,
0 } , { 23 , TARGET_STRING ( "u" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , 0 , 0 , 0
} } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . ft1voprlut , & rtB . plqfjsbzc3 ,
& rtB . jxv4taar1m , & rtB . mg3dc5r2ur , & rtB . pkwgudtkaf , & rtB .
hvxhqyn32y , & rtB . optengmsdi , & rtB . jvpz3syp00 , & rtB . ct0zstqrkc , &
rtP . PIDController_N , & rtP . PIDController_InitialConditionForIntegrator ,
& rtP . PIDController_InitialConditionForFilter , & rtP . Constant_Value , &
rtP . Gain_Gain , & rtP . Gain1_Gain , & rtP . Gain2_Gain , & rtP .
Integrator_IC , & rtP . Integrator1_IC , & rtP . FromWs_Time0 [ 0 ] , & rtP .
FromWs_Data0 [ 0 ] , & rtP . D , & rtP . I , & rtP . P , & rtP . u , } ;
static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } } ; static
const uint_T rtDimensionArray [ ] = { 1 , 1 , 6 , 1 } ; static const real_T
rtcapiStoredFloats [ ] = { 0.0 } ; static const rtwCAPI_FixPtMap rtFixPtMap [
] = { { ( NULL ) , ( NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0
} , } ; static const rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const
void * ) & rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [
0 ] , ( int8_T ) 0 , ( uint8_T ) 0 } } ; static
rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 9 ,
rtRootInputs , 0 , rtRootOutputs , 0 } , { rtBlockParameters , 11 ,
rtModelParameters , 4 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap
, rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float"
, { 75812088U , 2620852328U , 3631817683U , 913047697U } , ( NULL ) , 0 , (
boolean_T ) 0 , rt_LoggedStateIdxList } ; const
rtwCAPI_ModelMappingStaticInfo * UM3_GetCAPIStaticMap ( void ) { return &
mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void UM3_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void UM3_host_InitializeDataMapInfo ( UM3_host_DataMapInfo_T * dataMap ,
const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath
( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
