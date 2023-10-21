/*
 * template_poloha.c
 *
 * Real-Time Workshop code generation for Simulink model "template_poloha.mdl".
 *
 * Model Version              : 1.46
 * Real-Time Workshop version : 7.0  (R2007b)  02-Aug-2007
 * C source code generated on : Sun Jan 01 02:45:50 2006
 */

#include "template_poloha.h"
#include "template_poloha_private.h"
#include <stdio.h>
#include "template_poloha_dt.h"

/* options for Real-Time Windows Target board 0 */
static double RTWinBoardOptions0[] = {
  0.0,
};

/* list of Real-Time Windows Target boards */
const int RTWinBoardCount = 1;
RTWINBOARD RTWinBoards[1] = {
  { "Humusoft/MF624", 4294967295U, 1, RTWinBoardOptions0 },
};

/* Block signals (auto storage) */
BlockIO_template_poloha template_poloha_B;

/* Continuous states */
ContinuousStates_template_poloh template_poloha_X;

/* Solver Matrices */

/* A and B matrices used by ODE3 fixed-step solver */
static const real_T rt_ODE3_A[3] = {
  1.0/2.0, 3.0/4.0, 1.0
};

static const real_T rt_ODE3_B[3][3] = {
  { 1.0/2.0, 0.0, 0.0 },

  { 0.0, 3.0/4.0, 0.0 },

  { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
};

/* Block states (auto storage) */
D_Work_template_poloha template_poloha_DWork;

/* Real-time model */
RT_MODEL_template_poloha template_poloha_M_;
RT_MODEL_template_poloha *template_poloha_M = &template_poloha_M_;

/* This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 3;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y,x,
                nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  template_poloha_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  template_poloha_output(0);
  template_poloha_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++)
    hB[i] = h * rt_ODE3_B[1][i];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  template_poloha_output(0);
  template_poloha_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++)
    hB[i] = h * rt_ODE3_B[2][i];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model output function */
void template_poloha_output(int_T tid)
{
  /* local block i/o variables */
  real_T rtb_TransferFcn;
  real_T rtb_AnalogInput;

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(template_poloha_M)) {
    template_poloha_M->Timing.t[0] = rtsiGetT(&template_poloha_M->solverInfo);
  }

  if (rtmIsMajorTimeStep(template_poloha_M)) {
    /* set solver stop time */
    rtsiSetSolverStopTime(&template_poloha_M->solverInfo,
                          ((template_poloha_M->Timing.clockTick0+1)*
      template_poloha_M->Timing.stepSize0));
  }                                    /* end MajorTimeStep */

  {
    real_T currentTime;

    /* Clock: '<S2>/Clock' */
    template_poloha_B.Clock = template_poloha_M->Timing.t[0];
    if (rtmIsMajorTimeStep(template_poloha_M) &&
        template_poloha_M->Timing.TaskCounters.TID[1] == 0) {
      /* Step: '<Root>/Step2' */
      currentTime = template_poloha_M->Timing.t[1];
      if (currentTime < template_poloha_P.Step2_Time) {
        rtb_AnalogInput = template_poloha_P.Step2_Y0;
      } else {
        rtb_AnalogInput = template_poloha_P.Step2_YFinal;
      }

      /* Switch: '<S4>/SwitchControl' incorporates:
       *  Constant: '<S4>/Constant'
       */
      if (template_poloha_P.Constant_Value >
          template_poloha_P.SwitchControl_Threshold) {
        template_poloha_B.SwitchControl = rtb_AnalogInput;
      } else {
        template_poloha_B.SwitchControl = 0.0;
      }

      /* S-Function Block: <S3>/Encoder Input */
      {
        ENCODERINPARM parm;
        parm.quad = (QUADMODE) 2;
        parm.index = (INDEXPULSE) 1;
        parm.infilter = template_poloha_P.EncoderInput_InputFilter;
        RTBIO_DriverIO(0, ENCODERINPUT, IOREAD, 1,
                       &template_poloha_P.EncoderInput_Channels,
                       &rtb_AnalogInput, &parm);
      }

      /* Gain: '<S3>/Gain' */
      template_poloha_B.Gain = template_poloha_P.Gain_Gain * rtb_AnalogInput;

      /* Gain: '<S3>/Gain1' incorporates:
       *  Sum: '<S3>/Sum'
       *  UnitDelay: '<S3>/Unit Delay'
       */
      template_poloha_B.Gain1 = (template_poloha_B.Gain -
        template_poloha_DWork.UnitDelay_DSTATE) * template_poloha_P.Gain1_Gain;
    }

    /* Outputs for atomic SubSystem: '<Root>/Riadenie' */
    if (rtmIsMajorTimeStep(template_poloha_M) &&
        template_poloha_M->Timing.TaskCounters.TID[1] == 0) {
      /* Sum: '<S5>/Sum3' */
      template_poloha_B.Sum3 = template_poloha_B.SwitchControl -
        template_poloha_B.Gain;

      /* Gain: '<S5>/Gain1' incorporates:
       *  Gain: '<S5>/Gain3'
       *  Sum: '<S5>/Sum2'
       */
      template_poloha_B.Gain1_n = (template_poloha_P.Gain3_Gain *
        template_poloha_B.Sum3 - template_poloha_B.Gain1) *
        template_poloha_P.Gain1_Gain_j;

      /* Gain: '<S5>/Gain2' */
      template_poloha_B.Gain2 = template_poloha_P.Gain2_Gain *
        template_poloha_B.Gain1;
    }

    /* Integrator: '<S5>/Integrator' */
    rtb_TransferFcn = template_poloha_X.Integrator_CSTATE;

    /* Sum: '<S5>/Sum4' */
    rtb_TransferFcn -= template_poloha_B.Gain2;

    /* Saturate: '<S5>/Saturation' */
    template_poloha_B.Saturation = rt_SATURATE(rtb_TransferFcn,
      template_poloha_P.Saturation_LowerSat,
      template_poloha_P.Saturation_UpperSat);

    /* TransferFcn Block: '<S5>/Transfer Fcn' */
    rtb_TransferFcn = template_poloha_P.TransferFcn_C_d*
      template_poloha_X.TransferFcn_CSTATE_b;

    /* end of Outputs for SubSystem: '<Root>/Riadenie' */
    if (rtmIsMajorTimeStep(template_poloha_M) &&
        template_poloha_M->Timing.TaskCounters.TID[1] == 0) {
      /* Switch: '<S2>/Switch' incorporates:
       *  Constant: '<S2>/Mm*1'
       *  Gain: '<S2>/Gain'
       */
      if (template_poloha_B.Clock >= template_poloha_P.Switch_Threshold) {
        rtb_AnalogInput = template_poloha_P.Mm1_Value;
      } else {
        rtb_AnalogInput = template_poloha_P.Gain_Gain_g *
          template_poloha_B.Saturation;
      }

      /* S-Function Block: <S2>/Analog Output */
      {
        {
          ANALOGIOPARM parm;
          parm.mode = (RANGEMODE) template_poloha_P.AnalogOutput_RangeMode;
          parm.rangeidx = template_poloha_P.AnalogOutput_VoltRange;
          RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                         &template_poloha_P.AnalogOutput_Channels,
                         &rtb_AnalogInput, &parm);
        }
      }

      /* S-Function Block: <S1>/Analog Input */
      {
        ANALOGIOPARM parm;
        parm.mode = (RANGEMODE) template_poloha_P.AnalogInput_RangeMode;
        parm.rangeidx = template_poloha_P.AnalogInput_VoltRange;
        RTBIO_DriverIO(0, ANALOGINPUT, IOREAD, 1,
                       &template_poloha_P.AnalogInput_Channels, &rtb_AnalogInput,
                       &parm);
      }

      /* Sum: '<S1>/Sum' incorporates:
       *  Constant: '<S1>/Mm*2'
       */
      template_poloha_B.Sum = rtb_AnalogInput + template_poloha_P.Mm2_Value;

      /* Gain: '<S1>/Gain' */
      template_poloha_B.Gain_f = template_poloha_P.Gain_Gain_b *
        template_poloha_B.Sum;
    }

    /* TransferFcn Block: '<Root>/Transfer Fcn' */
    template_poloha_B.TransferFcn = template_poloha_P.TransferFcn_C*
      template_poloha_X.TransferFcn_CSTATE;

    /* Clock: '<Root>/Clock' */
    template_poloha_B.Clock_c = template_poloha_M->Timing.t[0];
    if (rtmIsMajorTimeStep(template_poloha_M) &&
        template_poloha_M->Timing.TaskCounters.TID[1] == 0) {
    }
  }

  UNUSED_PARAMETER(tid);
}

/* Model update function */
void template_poloha_update(int_T tid)
{
  if (rtmIsMajorTimeStep(template_poloha_M) &&
      template_poloha_M->Timing.TaskCounters.TID[1] == 0) {
    /* Update for UnitDelay: '<S3>/Unit Delay' */
    template_poloha_DWork.UnitDelay_DSTATE = template_poloha_B.Gain;
  }

  if (rtmIsMajorTimeStep(template_poloha_M)) {
    rt_ertODEUpdateContinuousStates(&template_poloha_M->solverInfo);
  }

  /* Update absolute time for base rate */
  if (!(++template_poloha_M->Timing.clockTick0))
    ++template_poloha_M->Timing.clockTickH0;
  template_poloha_M->Timing.t[0] = template_poloha_M->Timing.clockTick0 *
    template_poloha_M->Timing.stepSize0 + template_poloha_M->Timing.clockTickH0 *
    template_poloha_M->Timing.stepSize0 * 4294967296.0;
  if (rtmIsMajorTimeStep(template_poloha_M) &&
      template_poloha_M->Timing.TaskCounters.TID[1] == 0) {
    /* Update absolute timer for sample time: [0.004s, 0.0s] */
    if (!(++template_poloha_M->Timing.clockTick1))
      ++template_poloha_M->Timing.clockTickH1;
    template_poloha_M->Timing.t[1] = template_poloha_M->Timing.clockTick1 *
      template_poloha_M->Timing.stepSize1 +
      template_poloha_M->Timing.clockTickH1 *
      template_poloha_M->Timing.stepSize1 * 4294967296.0;
  }

  UNUSED_PARAMETER(tid);
}

/* Derivatives for root system: '<Root>' */
void template_poloha_derivatives(void)
{
  /* Derivatives for atomic SubSystem: '<Root>/Riadenie' */

  /* Derivatives for Integrator: '<S5>/Integrator' */
  ((StateDerivatives_template_poloh *) template_poloha_M->ModelData.derivs)
    ->Integrator_CSTATE = template_poloha_B.Gain1_n;

  /* TransferFcn Block: '<S5>/Transfer Fcn' */
  {
    ((StateDerivatives_template_poloh *) template_poloha_M->ModelData.derivs)
      ->TransferFcn_CSTATE_b = 0.0;
    ((StateDerivatives_template_poloh *) template_poloha_M->ModelData.derivs)
      ->TransferFcn_CSTATE_b += (template_poloha_P.TransferFcn_A_d)*
      template_poloha_X.TransferFcn_CSTATE_b;
  }

  /* end of Derivatives for SubSystem: '<Root>/Riadenie' */

  /* TransferFcn Block: '<Root>/Transfer Fcn' */
  {
    ((StateDerivatives_template_poloh *) template_poloha_M->ModelData.derivs)
      ->TransferFcn_CSTATE = template_poloha_B.Gain_f;
    ((StateDerivatives_template_poloh *) template_poloha_M->ModelData.derivs)
      ->TransferFcn_CSTATE += (template_poloha_P.TransferFcn_A)*
      template_poloha_X.TransferFcn_CSTATE;
  }
}

/* Model initialize function */
void template_poloha_initialize(boolean_T firstTime)
{
  (void)firstTime;

  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* non-finite (run-time) assignments */
  template_poloha_P.EncoderInput_InputFilter = rtInf;

  /* initialize real-time model */
  (void) memset((char_T *)template_poloha_M,0,
                sizeof(RT_MODEL_template_poloha));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&template_poloha_M->solverInfo,
                          &template_poloha_M->Timing.simTimeStep);
    rtsiSetTPtr(&template_poloha_M->solverInfo, &rtmGetTPtr(template_poloha_M));
    rtsiSetStepSizePtr(&template_poloha_M->solverInfo,
                       &template_poloha_M->Timing.stepSize0);
    rtsiSetdXPtr(&template_poloha_M->solverInfo,
                 &template_poloha_M->ModelData.derivs);
    rtsiSetContStatesPtr(&template_poloha_M->solverInfo,
                         &template_poloha_M->ModelData.contStates);
    rtsiSetNumContStatesPtr(&template_poloha_M->solverInfo,
      &template_poloha_M->Sizes.numContStates);
    rtsiSetErrorStatusPtr(&template_poloha_M->solverInfo, (&rtmGetErrorStatus
      (template_poloha_M)));
    rtsiSetRTModelPtr(&template_poloha_M->solverInfo, template_poloha_M);
  }

  rtsiSetSimTimeStep(&template_poloha_M->solverInfo, MAJOR_TIME_STEP);
  template_poloha_M->ModelData.intgData.y = template_poloha_M->ModelData.odeY;
  template_poloha_M->ModelData.intgData.f[0] = template_poloha_M->
    ModelData.odeF[0];
  template_poloha_M->ModelData.intgData.f[1] = template_poloha_M->
    ModelData.odeF[1];
  template_poloha_M->ModelData.intgData.f[2] = template_poloha_M->
    ModelData.odeF[2];
  template_poloha_M->ModelData.contStates = ((real_T *) &template_poloha_X);
  rtsiSetSolverData(&template_poloha_M->solverInfo, (void *)
                    &template_poloha_M->ModelData.intgData);
  rtsiSetSolverName(&template_poloha_M->solverInfo,"ode3");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = template_poloha_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    template_poloha_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    template_poloha_M->Timing.sampleTimes =
      (&template_poloha_M->Timing.sampleTimesArray[0]);
    template_poloha_M->Timing.offsetTimes =
      (&template_poloha_M->Timing.offsetTimesArray[0]);

    /* task periods */
    template_poloha_M->Timing.sampleTimes[0] = (0.0);
    template_poloha_M->Timing.sampleTimes[1] = (0.004);

    /* task offsets */
    template_poloha_M->Timing.offsetTimes[0] = (0.0);
    template_poloha_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(template_poloha_M, &template_poloha_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = template_poloha_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    template_poloha_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(template_poloha_M, 5.0);
  template_poloha_M->Timing.stepSize0 = 0.004;
  template_poloha_M->Timing.stepSize1 = 0.004;

  /* external mode info */
  template_poloha_M->Sizes.checksums[0] = (571203852U);
  template_poloha_M->Sizes.checksums[1] = (2881899389U);
  template_poloha_M->Sizes.checksums[2] = (2859968664U);
  template_poloha_M->Sizes.checksums[3] = (569490776U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[2];
    template_poloha_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(&rt_ExtModeInfo,
      &template_poloha_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(&rt_ExtModeInfo, template_poloha_M->Sizes.checksums);
    rteiSetTPtr(&rt_ExtModeInfo, rtmGetTPtr(template_poloha_M));
  }

  template_poloha_M->solverInfoPtr = (&template_poloha_M->solverInfo);
  template_poloha_M->Timing.stepSize = (0.004);
  rtsiSetFixedStepSize(&template_poloha_M->solverInfo, 0.004);
  rtsiSetSolverMode(&template_poloha_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  template_poloha_M->ModelData.blockIO = ((void *) &template_poloha_B);

  {
    int_T i;
    void *pVoidBlockIORegion;
    pVoidBlockIORegion = (void *)(&template_poloha_B.Clock);
    for (i = 0; i < 8; i++) {
      ((real_T*)pVoidBlockIORegion)[i] = 0.0;
    }

    pVoidBlockIORegion = (void *)(&template_poloha_B.Sum3);
    for (i = 0; i < 4; i++) {
      ((real_T*)pVoidBlockIORegion)[i] = 0.0;
    }
  }

  /* parameters */
  template_poloha_M->ModelData.defaultParam = ((real_T *) &template_poloha_P);

  /* states (continuous) */
  {
    real_T *x = (real_T *) &template_poloha_X;
    template_poloha_M->ModelData.contStates = (x);
    (void) memset((char_T *)x,0,
                  sizeof(ContinuousStates_template_poloh));
  }

  /* states (dwork) */
  template_poloha_M->Work.dwork = ((void *) &template_poloha_DWork);
  (void) memset((char_T *) &template_poloha_DWork,0,
                sizeof(D_Work_template_poloha));
  template_poloha_DWork.UnitDelay_DSTATE = 0.0;

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo,0,
                  sizeof(dtInfo));
    template_poloha_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }
}

/* Model terminate function */
void template_poloha_terminate(void)
{
  /* S-Function Block: <S2>/Analog Output */

  /* no final value should be set */

  /* External mode */
  rtExtModeShutdown(2);
}

/*========================================================================*
 * Start of GRT compatible call interface                                 *
 *========================================================================*/
void MdlOutputs(int_T tid)
{
  template_poloha_output(tid);
}

void MdlUpdate(int_T tid)
{
  template_poloha_update(tid);
}

void MdlInitializeSizes(void)
{
  template_poloha_M->Sizes.numContStates = (3);/* Number of continuous states */
  template_poloha_M->Sizes.numY = (0); /* Number of model outputs */
  template_poloha_M->Sizes.numU = (0); /* Number of model inputs */
  template_poloha_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  template_poloha_M->Sizes.numSampTimes = (2);/* Number of sample times */
  template_poloha_M->Sizes.numBlocks = (31);/* Number of blocks */
  template_poloha_M->Sizes.numBlockIO = (12);/* Number of block outputs */
  template_poloha_M->Sizes.numBlockPrms = (32);/* Sum of parameter "widths" */
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
  /* S-Function Block: <S3>/Encoder Input */
  {
    ENCODERINPARM parm;
    parm.quad = (QUADMODE) 2;
    parm.index = (INDEXPULSE) 1;
    parm.infilter = template_poloha_P.EncoderInput_InputFilter;
    RTBIO_DriverIO(0, ENCODERINPUT, IORESET, 1,
                   &template_poloha_P.EncoderInput_Channels, NULL, &parm);
  }

  /* InitializeConditions for UnitDelay: '<S3>/Unit Delay' */
  template_poloha_DWork.UnitDelay_DSTATE = template_poloha_P.UnitDelay_X0;

  /* InitializeConditions for atomic SubSystem: '<Root>/Riadenie' */

  /* InitializeConditions for Integrator: '<S5>/Integrator' */
  template_poloha_X.Integrator_CSTATE = template_poloha_P.Integrator_IC;

  /* TransferFcn Block: '<S5>/Transfer Fcn' */
  template_poloha_X.TransferFcn_CSTATE_b = 0.0;

  /* end of InitializeConditions for SubSystem: '<Root>/Riadenie' */

  /* TransferFcn Block: '<Root>/Transfer Fcn' */
  template_poloha_X.TransferFcn_CSTATE = 0.0;
}

void MdlStart(void)
{
  /* S-Function Block: <S2>/Analog Output */
  {
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) template_poloha_P.AnalogOutput_RangeMode;
      parm.rangeidx = template_poloha_P.AnalogOutput_VoltRange;
      RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                     &template_poloha_P.AnalogOutput_Channels,
                     &template_poloha_P.AnalogOutput_InitialValue, &parm);
    }
  }

  MdlInitialize();
}

RT_MODEL_template_poloha *template_poloha(void)
{
  template_poloha_initialize(1);
  return template_poloha_M;
}

void MdlTerminate(void)
{
  template_poloha_terminate();
}

/*========================================================================*
 * End of GRT compatible call interface                                   *
 *========================================================================*/
