  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (template_poloha_P)
    ;%
      section.nData     = 23;
      section.data(23)  = dumData; %prealloc
      
	  ;% template_poloha_P.Mm1_Value
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% template_poloha_P.Step2_Time
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% template_poloha_P.Step2_Y0
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% template_poloha_P.Step2_YFinal
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% template_poloha_P.EncoderInput_InputFilter
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% template_poloha_P.Gain_Gain
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% template_poloha_P.UnitDelay_X0
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% template_poloha_P.Gain1_Gain
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% template_poloha_P.Gain_Gain_g
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% template_poloha_P.Switch_Threshold
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% template_poloha_P.AnalogOutput_InitialValue
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% template_poloha_P.Mm2_Value
	  section.data(12).logicalSrcIdx = 12;
	  section.data(12).dtTransOffset = 11;
	
	  ;% template_poloha_P.Gain_Gain_b
	  section.data(13).logicalSrcIdx = 13;
	  section.data(13).dtTransOffset = 12;
	
	  ;% template_poloha_P.TransferFcn_A
	  section.data(14).logicalSrcIdx = 14;
	  section.data(14).dtTransOffset = 13;
	
	  ;% template_poloha_P.TransferFcn_C
	  section.data(15).logicalSrcIdx = 15;
	  section.data(15).dtTransOffset = 14;
	
	  ;% template_poloha_P.Gain3_Gain
	  section.data(16).logicalSrcIdx = 18;
	  section.data(16).dtTransOffset = 15;
	
	  ;% template_poloha_P.Gain1_Gain_j
	  section.data(17).logicalSrcIdx = 19;
	  section.data(17).dtTransOffset = 16;
	
	  ;% template_poloha_P.Gain2_Gain
	  section.data(18).logicalSrcIdx = 20;
	  section.data(18).dtTransOffset = 17;
	
	  ;% template_poloha_P.Integrator_IC
	  section.data(19).logicalSrcIdx = 21;
	  section.data(19).dtTransOffset = 18;
	
	  ;% template_poloha_P.Saturation_UpperSat
	  section.data(20).logicalSrcIdx = 22;
	  section.data(20).dtTransOffset = 19;
	
	  ;% template_poloha_P.Saturation_LowerSat
	  section.data(21).logicalSrcIdx = 23;
	  section.data(21).dtTransOffset = 20;
	
	  ;% template_poloha_P.TransferFcn_A_d
	  section.data(22).logicalSrcIdx = 24;
	  section.data(22).dtTransOffset = 21;
	
	  ;% template_poloha_P.TransferFcn_C_d
	  section.data(23).logicalSrcIdx = 25;
	  section.data(23).dtTransOffset = 22;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% template_poloha_P.EncoderInput_Channels
	  section.data(1).logicalSrcIdx = 28;
	  section.data(1).dtTransOffset = 0;
	
	  ;% template_poloha_P.AnalogOutput_Channels
	  section.data(2).logicalSrcIdx = 29;
	  section.data(2).dtTransOffset = 1;
	
	  ;% template_poloha_P.AnalogOutput_RangeMode
	  section.data(3).logicalSrcIdx = 30;
	  section.data(3).dtTransOffset = 2;
	
	  ;% template_poloha_P.AnalogOutput_VoltRange
	  section.data(4).logicalSrcIdx = 31;
	  section.data(4).dtTransOffset = 3;
	
	  ;% template_poloha_P.AnalogInput_Channels
	  section.data(5).logicalSrcIdx = 32;
	  section.data(5).dtTransOffset = 4;
	
	  ;% template_poloha_P.AnalogInput_RangeMode
	  section.data(6).logicalSrcIdx = 33;
	  section.data(6).dtTransOffset = 5;
	
	  ;% template_poloha_P.AnalogInput_VoltRange
	  section.data(7).logicalSrcIdx = 34;
	  section.data(7).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% template_poloha_P.Constant_Value
	  section.data(1).logicalSrcIdx = 35;
	  section.data(1).dtTransOffset = 0;
	
	  ;% template_poloha_P.SwitchControl_Threshold
	  section.data(2).logicalSrcIdx = 36;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (template_poloha_B)
    ;%
      section.nData     = 12;
      section.data(12)  = dumData; %prealloc
      
	  ;% template_poloha_B.Clock
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% template_poloha_B.SwitchControl
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% template_poloha_B.Gain
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% template_poloha_B.Gain1
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% template_poloha_B.Sum
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% template_poloha_B.Gain_f
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% template_poloha_B.TransferFcn
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% template_poloha_B.Clock_c
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% template_poloha_B.Sum3
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% template_poloha_B.Gain1_n
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% template_poloha_B.Gain2
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% template_poloha_B.Saturation
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 1;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (template_poloha_DWork)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% template_poloha_DWork.UnitDelay_DSTATE
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% template_poloha_DWork.ToWorkspace_PWORK.LoggedData
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 571203852;
  targMap.checksum1 = 2881899389;
  targMap.checksum2 = 2859968664;
  targMap.checksum3 = 569490776;

