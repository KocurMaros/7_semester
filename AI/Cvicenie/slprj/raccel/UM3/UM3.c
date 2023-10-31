#include "UM3.h"
#include "rtwtypes.h"
#include "mwmathutil.h"
#include "UM3_private.h"
#include "rt_logging_mmi.h"
#include "UM3_capi.h"
#include "UM3_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; void
raccelForceExtModeShutdown ( boolean_T extModeStartPktReceived ) { if ( !
extModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 2 , & stopRequested ) ; }
rtExtModeShutdown ( 2 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
#include "slsa_sim_engine.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 1 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 1 ; int_T gbl_raccel_NumST = 3 ; const char_T
* gbl_raccel_Version = "10.7 (R2023a) 19-Nov-2022" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const int_T gblNumRootInportBlks = 0 ; const int_T
gblNumModelInputs = 0 ; extern const char * gblInportFileName ; extern
rtInportTUtable * gblInportTUtables ; const int_T gblInportDataTypeIdx [ ] =
{ - 1 } ; const int_T gblInportDims [ ] = { - 1 } ; const int_T
gblInportComplex [ ] = { - 1 } ; const int_T gblInportInterpoFlag [ ] = { - 1
} ; const int_T gblInportContinuous [ ] = { - 1 } ; int_T enableFcnCallFlag [
] = { 1 , 1 , 1 } ; const char * raccelLoadInputsAndAperiodicHitTimes (
SimStruct * S , const char * inportFileName , int * matFileFormat ) { return
rt_RAccelReadInportsMatFile ( S , inportFileName , matFileFormat ) ; }
#include "simstruc.h"
#include "fixedpoint.h"
#include "slsa_sim_engine.h"
#include "simtarget/slSimTgtSLExecSimBridge.h"
B rtB ; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS =
& model_S ; void MdlInitialize ( void ) { rtX . h0f4j1q5in = rtP .
Integrator1_IC ; rtX . fy0c4gclul = rtP .
PIDController_InitialConditionForIntegrator ; rtX . gxzzgbuesd = rtP .
PIDController_InitialConditionForFilter ; rtDW . gyrukydv4j = ( rtInf ) ;
rtDW . huju3ddvwg = ( rtInf ) ; rtDW . mszxjk42kc = ( rtInf ) ; rtDW .
mmvjjnnyd4 = ( rtInf ) ; rtX . c5ifb254qh = rtP . Integrator_IC ; } void
MdlStart ( void ) { { bool externalInputIsInDatasetFormat = false ; void *
pISigstreamManager = rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} { { { bool isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU
srcInfo ; sdiLabelU loggedName = sdiGetLabelFromChars ( "Integrator1" ) ;
sdiLabelU origSigName = sdiGetLabelFromChars ( "" ) ; sdiLabelU propName =
sdiGetLabelFromChars ( "Integrator1" ) ; sdiLabelU blockPath =
sdiGetLabelFromChars ( "UM3/To Workspace" ) ; sdiLabelU blockSID =
sdiGetLabelFromChars ( "" ) ; sdiLabelU subPath = sdiGetLabelFromChars ( "" )
; sdiDims sigDims ; sdiLabelU sigName = sdiGetLabelFromChars ( "Integrator1"
) ; sdiAsyncRepoDataTypeHandle hDT = sdiAsyncRepoGetBuiltInDataTypeHandle (
DATA_TYPE_DOUBLE ) ; { sdiComplexity sigComplexity = REAL ;
sdiSampleTimeContinuity stCont = SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray
[ 1 ] = { 1 } ; sigDims . nDims = 1 ; sigDims . dimensions = sigDimsArray ;
srcInfo . numBlockPathElems = 1 ; srcInfo . fullBlockPath = ( sdiFullBlkPathU
) & blockPath ; srcInfo . SID = ( sdiSignalIDU ) & blockSID ; srcInfo .
subPath = subPath ; srcInfo . portIndex = 0 + 1 ; srcInfo . signalName =
sigName ; srcInfo . sigSourceUUID = 0 ; rtDW . iprdj0502t . AQHandles =
sdiStartAsyncioQueueCreation ( hDT , & srcInfo , rt_dataMapInfo . mmi .
InstanceMap . fullPath , "99aad097-a209-44cc-bb5a-a8a80fb90ea5" ,
sigComplexity , & sigDims , DIMENSIONS_MODE_FIXED , stCont , "" ) ;
sdiCompleteAsyncioQueueCreation ( rtDW . iprdj0502t . AQHandles , hDT , &
srcInfo ) ; if ( rtDW . iprdj0502t . AQHandles ) {
sdiSetSignalSampleTimeString ( rtDW . iprdj0502t . AQHandles , "0.001" ,
0.001 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW . iprdj0502t .
AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . iprdj0502t . AQHandles ,
ssGetTaskTime ( rtS , 1 ) ) ; sdiAsyncRepoSetSignalExportSettings ( rtDW .
iprdj0502t . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName ( rtDW .
iprdj0502t . AQHandles , loggedName , origSigName , propName ) ;
sdiAsyncRepoSetBlockPathDomain ( rtDW . iprdj0502t . AQHandles ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { { sdiLabelU varName = sdiGetLabelFromChars (
"simout" ) ; sdiRegisterWksVariable ( rtDW . iprdj0502t . AQHandles , varName
, "timeseries" ) ; sdiFreeLabel ( varName ) ; } } } } } { { { bool
isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU srcInfo ;
sdiLabelU loggedName = sdiGetLabelFromChars ( "Saturation" ) ; sdiLabelU
origSigName = sdiGetLabelFromChars ( "" ) ; sdiLabelU propName =
sdiGetLabelFromChars ( "Saturation" ) ; sdiLabelU blockPath =
sdiGetLabelFromChars ( "UM3/To Workspace1" ) ; sdiLabelU blockSID =
sdiGetLabelFromChars ( "" ) ; sdiLabelU subPath = sdiGetLabelFromChars ( "" )
; sdiDims sigDims ; sdiLabelU sigName = sdiGetLabelFromChars ( "Saturation" )
; sdiAsyncRepoDataTypeHandle hDT = sdiAsyncRepoGetBuiltInDataTypeHandle (
DATA_TYPE_DOUBLE ) ; { sdiComplexity sigComplexity = REAL ;
sdiSampleTimeContinuity stCont = SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray
[ 1 ] = { 1 } ; sigDims . nDims = 1 ; sigDims . dimensions = sigDimsArray ;
srcInfo . numBlockPathElems = 1 ; srcInfo . fullBlockPath = ( sdiFullBlkPathU
) & blockPath ; srcInfo . SID = ( sdiSignalIDU ) & blockSID ; srcInfo .
subPath = subPath ; srcInfo . portIndex = 0 + 1 ; srcInfo . signalName =
sigName ; srcInfo . sigSourceUUID = 0 ; rtDW . bp30wjgkv2 . AQHandles =
sdiStartAsyncioQueueCreation ( hDT , & srcInfo , rt_dataMapInfo . mmi .
InstanceMap . fullPath , "e5e0e7b5-a4ec-44d7-afd4-e887644f511a" ,
sigComplexity , & sigDims , DIMENSIONS_MODE_FIXED , stCont , "" ) ;
sdiCompleteAsyncioQueueCreation ( rtDW . bp30wjgkv2 . AQHandles , hDT , &
srcInfo ) ; if ( rtDW . bp30wjgkv2 . AQHandles ) {
sdiSetSignalSampleTimeString ( rtDW . bp30wjgkv2 . AQHandles , "0.001" ,
0.001 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW . bp30wjgkv2 .
AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . bp30wjgkv2 . AQHandles ,
ssGetTaskTime ( rtS , 1 ) ) ; sdiAsyncRepoSetSignalExportSettings ( rtDW .
bp30wjgkv2 . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName ( rtDW .
bp30wjgkv2 . AQHandles , loggedName , origSigName , propName ) ;
sdiAsyncRepoSetBlockPathDomain ( rtDW . bp30wjgkv2 . AQHandles ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { { sdiLabelU varName = sdiGetLabelFromChars (
"u" ) ; sdiRegisterWksVariable ( rtDW . bp30wjgkv2 . AQHandles , varName ,
"array" ) ; sdiFreeLabel ( varName ) ; } } } } } { { { bool
isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU srcInfo ;
sdiLabelU loggedName = sdiGetLabelFromChars ( "Sum1" ) ; sdiLabelU
origSigName = sdiGetLabelFromChars ( "" ) ; sdiLabelU propName =
sdiGetLabelFromChars ( "Sum1" ) ; sdiLabelU blockPath = sdiGetLabelFromChars
( "UM3/To Workspace2" ) ; sdiLabelU blockSID = sdiGetLabelFromChars ( "" ) ;
sdiLabelU subPath = sdiGetLabelFromChars ( "" ) ; sdiDims sigDims ; sdiLabelU
sigName = sdiGetLabelFromChars ( "Sum1" ) ; sdiAsyncRepoDataTypeHandle hDT =
sdiAsyncRepoGetBuiltInDataTypeHandle ( DATA_TYPE_DOUBLE ) ; { sdiComplexity
sigComplexity = REAL ; sdiSampleTimeContinuity stCont =
SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray [ 1 ] = { 1 } ; sigDims . nDims =
1 ; sigDims . dimensions = sigDimsArray ; srcInfo . numBlockPathElems = 1 ;
srcInfo . fullBlockPath = ( sdiFullBlkPathU ) & blockPath ; srcInfo . SID = (
sdiSignalIDU ) & blockSID ; srcInfo . subPath = subPath ; srcInfo . portIndex
= 0 + 1 ; srcInfo . signalName = sigName ; srcInfo . sigSourceUUID = 0 ; rtDW
. ddhhap0xr4 . AQHandles = sdiStartAsyncioQueueCreation ( hDT , & srcInfo ,
rt_dataMapInfo . mmi . InstanceMap . fullPath ,
"4e15a23e-4b13-4722-ab90-2ccd21d2d4d7" , sigComplexity , & sigDims ,
DIMENSIONS_MODE_FIXED , stCont , "" ) ; sdiCompleteAsyncioQueueCreation (
rtDW . ddhhap0xr4 . AQHandles , hDT , & srcInfo ) ; if ( rtDW . ddhhap0xr4 .
AQHandles ) { sdiSetSignalSampleTimeString ( rtDW . ddhhap0xr4 . AQHandles ,
"0.001" , 0.001 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW .
ddhhap0xr4 . AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . ddhhap0xr4 .
AQHandles , ssGetTaskTime ( rtS , 1 ) ) ; sdiAsyncRepoSetSignalExportSettings
( rtDW . ddhhap0xr4 . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName (
rtDW . ddhhap0xr4 . AQHandles , loggedName , origSigName , propName ) ;
sdiAsyncRepoSetBlockPathDomain ( rtDW . ddhhap0xr4 . AQHandles ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { { sdiLabelU varName = sdiGetLabelFromChars (
"e" ) ; sdiRegisterWksVariable ( rtDW . ddhhap0xr4 . AQHandles , varName ,
"array" ) ; sdiFreeLabel ( varName ) ; } } } } } { { { bool
isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU srcInfo ;
sdiLabelU loggedName = sdiGetLabelFromChars ( "Derivative" ) ; sdiLabelU
origSigName = sdiGetLabelFromChars ( "" ) ; sdiLabelU propName =
sdiGetLabelFromChars ( "Derivative" ) ; sdiLabelU blockPath =
sdiGetLabelFromChars ( "UM3/To Workspace3" ) ; sdiLabelU blockSID =
sdiGetLabelFromChars ( "" ) ; sdiLabelU subPath = sdiGetLabelFromChars ( "" )
; sdiDims sigDims ; sdiLabelU sigName = sdiGetLabelFromChars ( "Derivative" )
; sdiAsyncRepoDataTypeHandle hDT = sdiAsyncRepoGetBuiltInDataTypeHandle (
DATA_TYPE_DOUBLE ) ; { sdiComplexity sigComplexity = REAL ;
sdiSampleTimeContinuity stCont = SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray
[ 1 ] = { 1 } ; sigDims . nDims = 1 ; sigDims . dimensions = sigDimsArray ;
srcInfo . numBlockPathElems = 1 ; srcInfo . fullBlockPath = ( sdiFullBlkPathU
) & blockPath ; srcInfo . SID = ( sdiSignalIDU ) & blockSID ; srcInfo .
subPath = subPath ; srcInfo . portIndex = 0 + 1 ; srcInfo . signalName =
sigName ; srcInfo . sigSourceUUID = 0 ; rtDW . befkrwokjo . AQHandles =
sdiStartAsyncioQueueCreation ( hDT , & srcInfo , rt_dataMapInfo . mmi .
InstanceMap . fullPath , "7021037d-2894-484e-bec4-617778567618" ,
sigComplexity , & sigDims , DIMENSIONS_MODE_FIXED , stCont , "" ) ;
sdiCompleteAsyncioQueueCreation ( rtDW . befkrwokjo . AQHandles , hDT , &
srcInfo ) ; if ( rtDW . befkrwokjo . AQHandles ) {
sdiSetSignalSampleTimeString ( rtDW . befkrwokjo . AQHandles , "0.001" ,
0.001 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW . befkrwokjo .
AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . befkrwokjo . AQHandles ,
ssGetTaskTime ( rtS , 1 ) ) ; sdiAsyncRepoSetSignalExportSettings ( rtDW .
befkrwokjo . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName ( rtDW .
befkrwokjo . AQHandles , loggedName , origSigName , propName ) ;
sdiAsyncRepoSetBlockPathDomain ( rtDW . befkrwokjo . AQHandles ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { { sdiLabelU varName = sdiGetLabelFromChars (
"ed" ) ; sdiRegisterWksVariable ( rtDW . befkrwokjo . AQHandles , varName ,
"array" ) ; sdiFreeLabel ( varName ) ; } } } } } { { { bool
isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU srcInfo ;
sdiLabelU loggedName = sdiGetLabelFromChars ( "Derivative2" ) ; sdiLabelU
origSigName = sdiGetLabelFromChars ( "" ) ; sdiLabelU propName =
sdiGetLabelFromChars ( "Derivative2" ) ; sdiLabelU blockPath =
sdiGetLabelFromChars ( "UM3/To Workspace5" ) ; sdiLabelU blockSID =
sdiGetLabelFromChars ( "" ) ; sdiLabelU subPath = sdiGetLabelFromChars ( "" )
; sdiDims sigDims ; sdiLabelU sigName = sdiGetLabelFromChars ( "Derivative2"
) ; sdiAsyncRepoDataTypeHandle hDT = sdiAsyncRepoGetBuiltInDataTypeHandle (
DATA_TYPE_DOUBLE ) ; { sdiComplexity sigComplexity = REAL ;
sdiSampleTimeContinuity stCont = SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray
[ 1 ] = { 1 } ; sigDims . nDims = 1 ; sigDims . dimensions = sigDimsArray ;
srcInfo . numBlockPathElems = 1 ; srcInfo . fullBlockPath = ( sdiFullBlkPathU
) & blockPath ; srcInfo . SID = ( sdiSignalIDU ) & blockSID ; srcInfo .
subPath = subPath ; srcInfo . portIndex = 0 + 1 ; srcInfo . signalName =
sigName ; srcInfo . sigSourceUUID = 0 ; rtDW . ardt00juob . AQHandles =
sdiStartAsyncioQueueCreation ( hDT , & srcInfo , rt_dataMapInfo . mmi .
InstanceMap . fullPath , "b7638ab8-e3d3-4a19-b6f3-59af79088eba" ,
sigComplexity , & sigDims , DIMENSIONS_MODE_FIXED , stCont , "" ) ;
sdiCompleteAsyncioQueueCreation ( rtDW . ardt00juob . AQHandles , hDT , &
srcInfo ) ; if ( rtDW . ardt00juob . AQHandles ) {
sdiSetSignalSampleTimeString ( rtDW . ardt00juob . AQHandles , "0.001" ,
0.001 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW . ardt00juob .
AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . ardt00juob . AQHandles ,
ssGetTaskTime ( rtS , 1 ) ) ; sdiAsyncRepoSetSignalExportSettings ( rtDW .
ardt00juob . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName ( rtDW .
ardt00juob . AQHandles , loggedName , origSigName , propName ) ;
sdiAsyncRepoSetBlockPathDomain ( rtDW . ardt00juob . AQHandles ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { { sdiLabelU varName = sdiGetLabelFromChars (
"edd" ) ; sdiRegisterWksVariable ( rtDW . ardt00juob . AQHandles , varName ,
"array" ) ; sdiFreeLabel ( varName ) ; } } } } } { FWksInfo * fromwksInfo ;
if ( ( fromwksInfo = ( FWksInfo * ) calloc ( 1 , sizeof ( FWksInfo ) ) ) == (
NULL ) ) { ssSetErrorStatus ( rtS ,
"from workspace STRING(Name) memory allocation error" ) ; } else {
fromwksInfo -> origWorkspaceVarName = "tuvar" ; fromwksInfo -> origDataTypeId
= 0 ; fromwksInfo -> origIsComplex = 0 ; fromwksInfo -> origWidth = 1 ;
fromwksInfo -> origElSize = sizeof ( real_T ) ; fromwksInfo -> data = ( void
* ) rtP . FromWs_Data0 ; fromwksInfo -> nDataPoints = 6 ; fromwksInfo -> time
= ( double * ) rtP . FromWs_Time0 ; rtDW . hovrfbmab0 . TimePtr = fromwksInfo
-> time ; rtDW . hovrfbmab0 . DataPtr = fromwksInfo -> data ; rtDW .
hovrfbmab0 . RSimInfoPtr = fromwksInfo ; } rtDW . liz5lfpfjs . PrevIndex = 0
; } MdlInitialize ( ) ; } void MdlOutputs ( int_T tid ) { real_T ovyjbz34c0 ;
real_T u0 ; real_T u1 ; real_T u2 ; real_T * lastU ; rtB . mg3dc5r2ur = rtX .
h0f4j1q5in ; if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { { if ( rtDW . iprdj0502t
. AQHandles && ssGetLogOutput ( rtS ) ) { sdiWriteSignal ( rtDW . iprdj0502t
. AQHandles , ssGetTaskTime ( rtS , 1 ) , ( char * ) & rtB . mg3dc5r2ur + 0 )
; } } } { real_T * pDataValues = ( real_T * ) rtDW . hovrfbmab0 . DataPtr ;
real_T * pTimeValues = ( real_T * ) rtDW . hovrfbmab0 . TimePtr ; int_T
currTimeIndex = rtDW . liz5lfpfjs . PrevIndex ; real_T t = ssGetTaskTime (
rtS , 0 ) ; int numPoints , lastPoint ; FWksInfo * fromwksInfo = ( FWksInfo *
) rtDW . hovrfbmab0 . RSimInfoPtr ; numPoints = fromwksInfo -> nDataPoints ;
lastPoint = numPoints - 1 ; if ( t <= pTimeValues [ 0 ] ) { currTimeIndex = 0
; } else if ( t >= pTimeValues [ lastPoint ] ) { currTimeIndex = lastPoint -
1 ; } else { if ( t < pTimeValues [ currTimeIndex ] ) { while ( t <
pTimeValues [ currTimeIndex ] ) { currTimeIndex -- ; } } else { while ( t >=
pTimeValues [ currTimeIndex + 1 ] ) { currTimeIndex ++ ; } } } rtDW .
liz5lfpfjs . PrevIndex = currTimeIndex ; { real_T t1 = pTimeValues [
currTimeIndex ] ; real_T t2 = pTimeValues [ currTimeIndex + 1 ] ; if ( t1 ==
t2 ) { if ( t < t1 ) { ovyjbz34c0 = pDataValues [ currTimeIndex ] ; } else {
ovyjbz34c0 = pDataValues [ currTimeIndex + 1 ] ; } } else { real_T f1 = ( t2
- t ) / ( t2 - t1 ) ; real_T f2 = 1.0 - f1 ; real_T d1 ; real_T d2 ; int_T
TimeIndex = currTimeIndex ; d1 = pDataValues [ TimeIndex ] ; d2 = pDataValues
[ TimeIndex + 1 ] ; ovyjbz34c0 = ( real_T ) rtInterpolate ( d1 , d2 , f1 , f2
) ; pDataValues += numPoints ; } } } rtB . optengmsdi = ovyjbz34c0 - rtB .
mg3dc5r2ur ; rtB . ct0zstqrkc = ( rtP . D * rtB . optengmsdi - rtX .
gxzzgbuesd ) * rtP . PIDController_N ; u0 = ( ( rtP . P * rtB . optengmsdi +
rtX . fy0c4gclul ) + rtB . ct0zstqrkc ) * rtP . Gain1_Gain ; u1 = - 2.0 * rtP
. u ; u2 = 2.0 * rtP . u ; if ( u0 > u2 ) { rtB . pkwgudtkaf = u2 ; } else if
( u0 < u1 ) { rtB . pkwgudtkaf = u1 ; } else { rtB . pkwgudtkaf = u0 ; } if (
ssIsSampleHit ( rtS , 1 , 0 ) ) { { if ( rtDW . bp30wjgkv2 . AQHandles &&
ssGetLogOutput ( rtS ) ) { sdiWriteSignal ( rtDW . bp30wjgkv2 . AQHandles ,
ssGetTaskTime ( rtS , 1 ) , ( char * ) & rtB . pkwgudtkaf + 0 ) ; } } { if (
rtDW . ddhhap0xr4 . AQHandles && ssGetLogOutput ( rtS ) ) { sdiWriteSignal (
rtDW . ddhhap0xr4 . AQHandles , ssGetTaskTime ( rtS , 1 ) , ( char * ) & rtB
. optengmsdi + 0 ) ; } } } if ( ( rtDW . gyrukydv4j >= ssGetT ( rtS ) ) && (
rtDW . huju3ddvwg >= ssGetT ( rtS ) ) ) { rtB . ft1voprlut = 0.0 ; } else {
u0 = rtDW . gyrukydv4j ; lastU = & rtDW . d14qqhch23 ; if ( rtDW . gyrukydv4j
< rtDW . huju3ddvwg ) { if ( rtDW . huju3ddvwg < ssGetT ( rtS ) ) { u0 = rtDW
. huju3ddvwg ; lastU = & rtDW . lrgek0mon2 ; } } else if ( rtDW . gyrukydv4j
>= ssGetT ( rtS ) ) { u0 = rtDW . huju3ddvwg ; lastU = & rtDW . lrgek0mon2 ;
} rtB . ft1voprlut = ( rtB . optengmsdi - * lastU ) / ( ssGetT ( rtS ) - u0 )
; } if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { { if ( rtDW . befkrwokjo .
AQHandles && ssGetLogOutput ( rtS ) ) { sdiWriteSignal ( rtDW . befkrwokjo .
AQHandles , ssGetTaskTime ( rtS , 1 ) , ( char * ) & rtB . ft1voprlut + 0 ) ;
} } } if ( ( rtDW . mszxjk42kc >= ssGetT ( rtS ) ) && ( rtDW . mmvjjnnyd4 >=
ssGetT ( rtS ) ) ) { rtB . plqfjsbzc3 = 0.0 ; } else { u0 = rtDW . mszxjk42kc
; lastU = & rtDW . d5okg3ybip ; if ( rtDW . mszxjk42kc < rtDW . mmvjjnnyd4 )
{ if ( rtDW . mmvjjnnyd4 < ssGetT ( rtS ) ) { u0 = rtDW . mmvjjnnyd4 ; lastU
= & rtDW . a1ocb4hu0o ; } } else if ( rtDW . mszxjk42kc >= ssGetT ( rtS ) ) {
u0 = rtDW . mmvjjnnyd4 ; lastU = & rtDW . a1ocb4hu0o ; } rtB . plqfjsbzc3 = (
rtB . ft1voprlut - * lastU ) / ( ssGetT ( rtS ) - u0 ) ; } if ( ssIsSampleHit
( rtS , 1 , 0 ) ) { { if ( rtDW . ardt00juob . AQHandles && ssGetLogOutput (
rtS ) ) { sdiWriteSignal ( rtDW . ardt00juob . AQHandles , ssGetTaskTime (
rtS , 1 ) , ( char * ) & rtB . plqfjsbzc3 + 0 ) ; } } } rtB . jxv4taar1m =
rtX . c5ifb254qh ; rtB . jvpz3syp00 = rtP . I * rtB . optengmsdi ; rtB .
hvxhqyn32y = ( ( rtB . pkwgudtkaf - rtP . Gain_Gain * rtB . mg3dc5r2ur ) -
rtP . Gain2_Gain * rtB . jxv4taar1m ) - muDoubleScalarPower ( rtB .
mg3dc5r2ur , rtP . Constant_Value ) ; UNUSED_PARAMETER ( tid ) ; } void
MdlOutputsTID2 ( int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void MdlUpdate (
int_T tid ) { real_T * lastU ; if ( rtDW . gyrukydv4j == ( rtInf ) ) { rtDW .
gyrukydv4j = ssGetT ( rtS ) ; lastU = & rtDW . d14qqhch23 ; } else if ( rtDW
. huju3ddvwg == ( rtInf ) ) { rtDW . huju3ddvwg = ssGetT ( rtS ) ; lastU = &
rtDW . lrgek0mon2 ; } else if ( rtDW . gyrukydv4j < rtDW . huju3ddvwg ) {
rtDW . gyrukydv4j = ssGetT ( rtS ) ; lastU = & rtDW . d14qqhch23 ; } else {
rtDW . huju3ddvwg = ssGetT ( rtS ) ; lastU = & rtDW . lrgek0mon2 ; } * lastU
= rtB . optengmsdi ; if ( rtDW . mszxjk42kc == ( rtInf ) ) { rtDW .
mszxjk42kc = ssGetT ( rtS ) ; lastU = & rtDW . d5okg3ybip ; } else if ( rtDW
. mmvjjnnyd4 == ( rtInf ) ) { rtDW . mmvjjnnyd4 = ssGetT ( rtS ) ; lastU = &
rtDW . a1ocb4hu0o ; } else if ( rtDW . mszxjk42kc < rtDW . mmvjjnnyd4 ) {
rtDW . mszxjk42kc = ssGetT ( rtS ) ; lastU = & rtDW . d5okg3ybip ; } else {
rtDW . mmvjjnnyd4 = ssGetT ( rtS ) ; lastU = & rtDW . a1ocb4hu0o ; } * lastU
= rtB . ft1voprlut ; UNUSED_PARAMETER ( tid ) ; } void MdlUpdateTID2 ( int_T
tid ) { UNUSED_PARAMETER ( tid ) ; } void MdlDerivatives ( void ) { XDot *
_rtXdot ; _rtXdot = ( ( XDot * ) ssGetdX ( rtS ) ) ; _rtXdot -> h0f4j1q5in =
rtB . jxv4taar1m ; _rtXdot -> fy0c4gclul = rtB . jvpz3syp00 ; _rtXdot ->
gxzzgbuesd = rtB . ct0zstqrkc ; _rtXdot -> c5ifb254qh = rtB . hvxhqyn32y ; }
void MdlProjection ( void ) { } void MdlTerminate ( void ) { rt_FREE ( rtDW .
hovrfbmab0 . RSimInfoPtr ) ; { if ( rtDW . iprdj0502t . AQHandles ) {
sdiTerminateStreaming ( & rtDW . iprdj0502t . AQHandles ) ; } } { if ( rtDW .
bp30wjgkv2 . AQHandles ) { sdiTerminateStreaming ( & rtDW . bp30wjgkv2 .
AQHandles ) ; } } { if ( rtDW . ddhhap0xr4 . AQHandles ) {
sdiTerminateStreaming ( & rtDW . ddhhap0xr4 . AQHandles ) ; } } { if ( rtDW .
befkrwokjo . AQHandles ) { sdiTerminateStreaming ( & rtDW . befkrwokjo .
AQHandles ) ; } } { if ( rtDW . ardt00juob . AQHandles ) {
sdiTerminateStreaming ( & rtDW . ardt00juob . AQHandles ) ; } } } static void
mr_UM3_cacheDataAsMxArray ( mxArray * destArray , mwIndex i , int j , const
void * srcData , size_t numBytes ) ; static void mr_UM3_cacheDataAsMxArray (
mxArray * destArray , mwIndex i , int j , const void * srcData , size_t
numBytes ) { mxArray * newArray = mxCreateUninitNumericMatrix ( ( size_t ) 1
, numBytes , mxUINT8_CLASS , mxREAL ) ; memcpy ( ( uint8_T * ) mxGetData (
newArray ) , ( const uint8_T * ) srcData , numBytes ) ; mxSetFieldByNumber (
destArray , i , j , newArray ) ; } static void mr_UM3_restoreDataFromMxArray
( void * destData , const mxArray * srcArray , mwIndex i , int j , size_t
numBytes ) ; static void mr_UM3_restoreDataFromMxArray ( void * destData ,
const mxArray * srcArray , mwIndex i , int j , size_t numBytes ) { memcpy ( (
uint8_T * ) destData , ( const uint8_T * ) mxGetData ( mxGetFieldByNumber (
srcArray , i , j ) ) , numBytes ) ; } static void
mr_UM3_cacheBitFieldToMxArray ( mxArray * destArray , mwIndex i , int j ,
uint_T bitVal ) ; static void mr_UM3_cacheBitFieldToMxArray ( mxArray *
destArray , mwIndex i , int j , uint_T bitVal ) { mxSetFieldByNumber (
destArray , i , j , mxCreateDoubleScalar ( ( real_T ) bitVal ) ) ; } static
uint_T mr_UM3_extractBitFieldFromMxArray ( const mxArray * srcArray , mwIndex
i , int j , uint_T numBits ) ; static uint_T
mr_UM3_extractBitFieldFromMxArray ( const mxArray * srcArray , mwIndex i ,
int j , uint_T numBits ) { const uint_T varVal = ( uint_T ) mxGetScalar (
mxGetFieldByNumber ( srcArray , i , j ) ) ; return varVal & ( ( 1u << numBits
) - 1u ) ; } static void mr_UM3_cacheDataToMxArrayWithOffset ( mxArray *
destArray , mwIndex i , int j , mwIndex offset , const void * srcData ,
size_t numBytes ) ; static void mr_UM3_cacheDataToMxArrayWithOffset ( mxArray
* destArray , mwIndex i , int j , mwIndex offset , const void * srcData ,
size_t numBytes ) { uint8_T * varData = ( uint8_T * ) mxGetData (
mxGetFieldByNumber ( destArray , i , j ) ) ; memcpy ( ( uint8_T * ) & varData
[ offset * numBytes ] , ( const uint8_T * ) srcData , numBytes ) ; } static
void mr_UM3_restoreDataFromMxArrayWithOffset ( void * destData , const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t numBytes ) ;
static void mr_UM3_restoreDataFromMxArrayWithOffset ( void * destData , const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t numBytes ) {
const uint8_T * varData = ( const uint8_T * ) mxGetData ( mxGetFieldByNumber
( srcArray , i , j ) ) ; memcpy ( ( uint8_T * ) destData , ( const uint8_T *
) & varData [ offset * numBytes ] , numBytes ) ; } static void
mr_UM3_cacheBitFieldToCellArrayWithOffset ( mxArray * destArray , mwIndex i ,
int j , mwIndex offset , uint_T fieldVal ) ; static void
mr_UM3_cacheBitFieldToCellArrayWithOffset ( mxArray * destArray , mwIndex i ,
int j , mwIndex offset , uint_T fieldVal ) { mxSetCell ( mxGetFieldByNumber (
destArray , i , j ) , offset , mxCreateDoubleScalar ( ( real_T ) fieldVal ) )
; } static uint_T mr_UM3_extractBitFieldFromCellArrayWithOffset ( const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) ;
static uint_T mr_UM3_extractBitFieldFromCellArrayWithOffset ( const mxArray *
srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) { const
uint_T fieldVal = ( uint_T ) mxGetScalar ( mxGetCell ( mxGetFieldByNumber (
srcArray , i , j ) , offset ) ) ; return fieldVal & ( ( 1u << numBits ) - 1u
) ; } mxArray * mr_UM3_GetDWork ( ) { static const char_T * ssDWFieldNames [
3 ] = { "rtB" , "rtDW" , "NULL_PrevZCX" , } ; mxArray * ssDW =
mxCreateStructMatrix ( 1 , 1 , 3 , ssDWFieldNames ) ;
mr_UM3_cacheDataAsMxArray ( ssDW , 0 , 0 , ( const void * ) & ( rtB ) ,
sizeof ( rtB ) ) ; { static const char_T * rtdwDataFieldNames [ 9 ] = {
"rtDW.gyrukydv4j" , "rtDW.d14qqhch23" , "rtDW.huju3ddvwg" , "rtDW.lrgek0mon2"
, "rtDW.mszxjk42kc" , "rtDW.d5okg3ybip" , "rtDW.mmvjjnnyd4" ,
"rtDW.a1ocb4hu0o" , "rtDW.liz5lfpfjs" , } ; mxArray * rtdwData =
mxCreateStructMatrix ( 1 , 1 , 9 , rtdwDataFieldNames ) ;
mr_UM3_cacheDataAsMxArray ( rtdwData , 0 , 0 , ( const void * ) & ( rtDW .
gyrukydv4j ) , sizeof ( rtDW . gyrukydv4j ) ) ; mr_UM3_cacheDataAsMxArray (
rtdwData , 0 , 1 , ( const void * ) & ( rtDW . d14qqhch23 ) , sizeof ( rtDW .
d14qqhch23 ) ) ; mr_UM3_cacheDataAsMxArray ( rtdwData , 0 , 2 , ( const void
* ) & ( rtDW . huju3ddvwg ) , sizeof ( rtDW . huju3ddvwg ) ) ;
mr_UM3_cacheDataAsMxArray ( rtdwData , 0 , 3 , ( const void * ) & ( rtDW .
lrgek0mon2 ) , sizeof ( rtDW . lrgek0mon2 ) ) ; mr_UM3_cacheDataAsMxArray (
rtdwData , 0 , 4 , ( const void * ) & ( rtDW . mszxjk42kc ) , sizeof ( rtDW .
mszxjk42kc ) ) ; mr_UM3_cacheDataAsMxArray ( rtdwData , 0 , 5 , ( const void
* ) & ( rtDW . d5okg3ybip ) , sizeof ( rtDW . d5okg3ybip ) ) ;
mr_UM3_cacheDataAsMxArray ( rtdwData , 0 , 6 , ( const void * ) & ( rtDW .
mmvjjnnyd4 ) , sizeof ( rtDW . mmvjjnnyd4 ) ) ; mr_UM3_cacheDataAsMxArray (
rtdwData , 0 , 7 , ( const void * ) & ( rtDW . a1ocb4hu0o ) , sizeof ( rtDW .
a1ocb4hu0o ) ) ; mr_UM3_cacheDataAsMxArray ( rtdwData , 0 , 8 , ( const void
* ) & ( rtDW . liz5lfpfjs ) , sizeof ( rtDW . liz5lfpfjs ) ) ;
mxSetFieldByNumber ( ssDW , 0 , 1 , rtdwData ) ; } return ssDW ; } void
mr_UM3_SetDWork ( const mxArray * ssDW ) { ( void ) ssDW ;
mr_UM3_restoreDataFromMxArray ( ( void * ) & ( rtB ) , ssDW , 0 , 0 , sizeof
( rtB ) ) ; { const mxArray * rtdwData = mxGetFieldByNumber ( ssDW , 0 , 1 )
; mr_UM3_restoreDataFromMxArray ( ( void * ) & ( rtDW . gyrukydv4j ) ,
rtdwData , 0 , 0 , sizeof ( rtDW . gyrukydv4j ) ) ;
mr_UM3_restoreDataFromMxArray ( ( void * ) & ( rtDW . d14qqhch23 ) , rtdwData
, 0 , 1 , sizeof ( rtDW . d14qqhch23 ) ) ; mr_UM3_restoreDataFromMxArray ( (
void * ) & ( rtDW . huju3ddvwg ) , rtdwData , 0 , 2 , sizeof ( rtDW .
huju3ddvwg ) ) ; mr_UM3_restoreDataFromMxArray ( ( void * ) & ( rtDW .
lrgek0mon2 ) , rtdwData , 0 , 3 , sizeof ( rtDW . lrgek0mon2 ) ) ;
mr_UM3_restoreDataFromMxArray ( ( void * ) & ( rtDW . mszxjk42kc ) , rtdwData
, 0 , 4 , sizeof ( rtDW . mszxjk42kc ) ) ; mr_UM3_restoreDataFromMxArray ( (
void * ) & ( rtDW . d5okg3ybip ) , rtdwData , 0 , 5 , sizeof ( rtDW .
d5okg3ybip ) ) ; mr_UM3_restoreDataFromMxArray ( ( void * ) & ( rtDW .
mmvjjnnyd4 ) , rtdwData , 0 , 6 , sizeof ( rtDW . mmvjjnnyd4 ) ) ;
mr_UM3_restoreDataFromMxArray ( ( void * ) & ( rtDW . a1ocb4hu0o ) , rtdwData
, 0 , 7 , sizeof ( rtDW . a1ocb4hu0o ) ) ; mr_UM3_restoreDataFromMxArray ( (
void * ) & ( rtDW . liz5lfpfjs ) , rtdwData , 0 , 8 , sizeof ( rtDW .
liz5lfpfjs ) ) ; } } mxArray * mr_UM3_GetSimStateDisallowedBlocks ( ) {
return ( NULL ) ; } void MdlInitializeSizes ( void ) { ssSetNumContStates (
rtS , 4 ) ; ssSetNumPeriodicContStates ( rtS , 0 ) ; ssSetNumY ( rtS , 0 ) ;
ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ;
ssSetNumSampleTimes ( rtS , 2 ) ; ssSetNumBlocks ( rtS , 26 ) ;
ssSetNumBlockIO ( rtS , 9 ) ; ssSetNumBlockParams ( rtS , 25 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.0 ) ;
ssSetSampleTime ( rtS , 1 , 0.001 ) ; ssSetOffsetTime ( rtS , 0 , 0.0 ) ;
ssSetOffsetTime ( rtS , 1 , 0.0 ) ; } void raccel_set_checksum ( ) {
ssSetChecksumVal ( rtS , 0 , 75812088U ) ; ssSetChecksumVal ( rtS , 1 ,
2620852328U ) ; ssSetChecksumVal ( rtS , 2 , 3631817683U ) ; ssSetChecksumVal
( rtS , 3 , 913047697U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) {
static struct _ssMdlInfo mdlInfo ; static struct _ssBlkInfo2 blkInfo2 ;
static struct _ssBlkInfoSLSize blkInfoSLSize ; ( void ) memset ( ( char_T * )
rtS , 0 , sizeof ( SimStruct ) ) ; ( void ) memset ( ( char_T * ) & mdlInfo ,
0 , sizeof ( struct _ssMdlInfo ) ) ; ( void ) memset ( ( char_T * ) &
blkInfo2 , 0 , sizeof ( struct _ssBlkInfo2 ) ) ; ( void ) memset ( ( char_T *
) & blkInfoSLSize , 0 , sizeof ( struct _ssBlkInfoSLSize ) ) ;
ssSetBlkInfo2Ptr ( rtS , & blkInfo2 ) ; ssSetBlkInfoSLSizePtr ( rtS , &
blkInfoSLSize ) ; ssSetMdlInfoPtr ( rtS , & mdlInfo ) ; ssSetExecutionInfo (
rtS , executionInfo ) ; slsaAllocOPModelData ( rtS ) ; { static time_T
mdlPeriod [ NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ;
static time_T mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [
NSAMPLE_TIMES ] ; static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static
boolean_T mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T
mdlPerTaskSampleHits [ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T
mdlTimeOfNextSampleHit [ NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i <
NSAMPLE_TIMES ; i ++ ) { mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ;
mdlTaskTimes [ i ] = 0.0 ; mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } }
ssSetSampleTimePtr ( rtS , & mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , &
mdlOffset [ 0 ] ) ; ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ;
ssSetTPtr ( rtS , & mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , &
mdlSampleHits [ 0 ] ) ; ssSetTNextWasAdjustedPtr ( rtS , &
mdlTNextWasAdjustedPtr [ 0 ] ) ; ssSetPerTaskSampleHitsPtr ( rtS , &
mdlPerTaskSampleHits [ 0 ] ) ; ssSetTimeOfNextSampleHitPtr ( rtS , &
mdlTimeOfNextSampleHit [ 0 ] ) ; } ssSetSolverMode ( rtS ,
SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS , ( ( void * ) & rtB ) ) ;
( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof ( B ) ) ; } { real_T * x
= ( real_T * ) & rtX ; ssSetContStates ( rtS , x ) ; ( void ) memset ( ( void
* ) x , 0 , sizeof ( X ) ) ; } { void * dwork = ( void * ) & rtDW ;
ssSetRootDWork ( rtS , dwork ) ; ( void ) memset ( dwork , 0 , sizeof ( DW )
) ; } { static DataTypeTransInfo dtInfo ; ( void ) memset ( ( char_T * ) &
dtInfo , 0 , sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS , & dtInfo ) ;
dtInfo . numDataTypes = 23 ; dtInfo . dataTypeSizes = & rtDataTypeSizes [ 0 ]
; dtInfo . dataTypeNames = & rtDataTypeNames [ 0 ] ; dtInfo . BTransTable = &
rtBTransTable ; dtInfo . PTransTable = & rtPTransTable ; dtInfo .
dataTypeInfoTable = rtDataTypeInfoTable ; } UM3_InitializeDataMapInfo ( ) ;
ssSetIsRapidAcceleratorActive ( rtS , true ) ; ssSetRootSS ( rtS , rtS ) ;
ssSetVersion ( rtS , SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS ,
"UM3" ) ; ssSetPath ( rtS , "UM3" ) ; ssSetTStart ( rtS , 0.0 ) ; ssSetTFinal
( rtS , 10.0 ) ; ssSetStepSize ( rtS , 0.001 ) ; ssSetFixedStepSize ( rtS ,
0.001 ) ; { static RTWLogInfo rt_DataLoggingInfo ; rt_DataLoggingInfo .
loggingInterval = ( NULL ) ; ssSetRTWLogInfo ( rtS , & rt_DataLoggingInfo ) ;
} { { static int_T rt_LoggedStateWidths [ ] = { 1 , 1 , 1 , 1 } ; static
int_T rt_LoggedStateNumDimensions [ ] = { 1 , 1 , 1 , 1 } ; static int_T
rt_LoggedStateDimensions [ ] = { 1 , 1 , 1 , 1 } ; static boolean_T
rt_LoggedStateIsVarDims [ ] = { 0 , 0 , 0 , 0 } ; static BuiltInDTypeId
rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE , SS_DOUBLE , SS_DOUBLE ,
SS_DOUBLE } ; static int_T rt_LoggedStateComplexSignals [ ] = { 0 , 0 , 0 , 0
} ; static RTWPreprocessingFcnPtr rt_LoggingStatePreprocessingFcnPtrs [ ] = {
( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) } ; static const char_T *
rt_LoggedStateLabels [ ] = { "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" } ;
static const char_T * rt_LoggedStateBlockNames [ ] = { "UM3/Integrator1" ,
"UM3/PID Controller/Integrator/Continuous/Integrator" ,
"UM3/PID Controller/Filter/Cont. Filter/Filter" , "UM3/Integrator" } ; static
const char_T * rt_LoggedStateNames [ ] = { "" , "" , "" , "" } ; static
boolean_T rt_LoggedStateCrossMdlRef [ ] = { 0 , 0 , 0 , 0 } ; static
RTWLogDataTypeConvert rt_RTWLogDataTypeConvert [ ] = { { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } } ; static
int_T rt_LoggedStateIdxList [ ] = { 0 , 1 , 2 , 3 } ; static RTWLogSignalInfo
rt_LoggedStateSignalInfo = { 4 , rt_LoggedStateWidths ,
rt_LoggedStateNumDimensions , rt_LoggedStateDimensions ,
rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert , rt_LoggedStateIdxList
} ; static void * rt_LoggedStateSignalPtrs [ 4 ] ; rtliSetLogXSignalPtrs (
ssGetRTWLogInfo ( rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . h0f4j1q5in ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtX . fy0c4gclul ;
rt_LoggedStateSignalPtrs [ 2 ] = ( void * ) & rtX . gxzzgbuesd ;
rt_LoggedStateSignalPtrs [ 3 ] = ( void * ) & rtX . c5ifb254qh ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) ,
"xFinal" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS , & statesInfo2 )
; } { static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetPeriodicStatesInfo ( rtS , & periodicStatesInfo ) ; } { static
ssJacobianPerturbationBounds jacobianPerturbationBounds ;
ssSetJacobianPerturbationBounds ( rtS , & jacobianPerturbationBounds ) ; } {
static ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 4 ] ;
ssSetNumNonContDerivSigInfos ( rtS , 0 ) ; ssSetNonContDerivSigInfos ( rtS ,
( NULL ) ) ; ssSetSolverInfo ( rtS , & slvrInfo ) ; ssSetSolverName ( rtS ,
"ode3" ) ; ssSetVariableStepSolver ( rtS , 0 ) ;
ssSetSolverConsistencyChecking ( rtS , 0 ) ; ssSetSolverAdaptiveZcDetection (
rtS , 0 ) ; ssSetSolverRobustResetMethod ( rtS , 0 ) ;
ssSetSolverStateProjection ( rtS , 0 ) ; ssSetSolverMassMatrixType ( rtS , (
ssMatrixType ) 0 ) ; ssSetSolverMassMatrixNzMax ( rtS , 0 ) ;
ssSetModelOutputs ( rtS , MdlOutputs ) ; ssSetModelUpdate ( rtS , MdlUpdate )
; ssSetModelDerivatives ( rtS , MdlDerivatives ) ; ssSetTNextTid ( rtS ,
INT_MIN ) ; ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; ssSetContStateDisabled ( rtS ,
contStatesDisabled ) ; } ssSetChecksumVal ( rtS , 0 , 75812088U ) ;
ssSetChecksumVal ( rtS , 1 , 2620852328U ) ; ssSetChecksumVal ( rtS , 2 ,
3631817683U ) ; ssSetChecksumVal ( rtS , 3 , 913047697U ) ; { static const
sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo
rt_ExtModeInfo ; static const sysRanDType * systemRan [ 1 ] ;
gblRTWExtModeInfo = & rt_ExtModeInfo ; ssSetRTWExtModeInfo ( rtS , &
rt_ExtModeInfo ) ; rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo ,
systemRan ) ; systemRan [ 0 ] = & rtAlwaysEnabled ;
rteiSetModelMappingInfoPtr ( ssGetRTWExtModeInfo ( rtS ) , &
ssGetModelMappingInfo ( rtS ) ) ; rteiSetChecksumsPtr ( ssGetRTWExtModeInfo (
rtS ) , ssGetChecksums ( rtS ) ) ; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS )
, ssGetTPtr ( rtS ) ) ; } slsaDisallowedBlocksForSimTargetOP ( rtS ,
mr_UM3_GetSimStateDisallowedBlocks ) ; slsaGetWorkFcnForSimTargetOP ( rtS ,
mr_UM3_GetDWork ) ; slsaSetWorkFcnForSimTargetOP ( rtS , mr_UM3_SetDWork ) ;
rt_RapidReadMatFileAndUpdateParams ( rtS ) ; if ( ssGetErrorStatus ( rtS ) )
{ return rtS ; } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 2 ; void MdlOutputsParameterSampleTime (
int_T tid ) { MdlOutputsTID2 ( tid ) ; }
