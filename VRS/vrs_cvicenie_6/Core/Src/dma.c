/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    dma.c
  * @brief   This file provides code for the configuration
  *          of all the requested memory to memory DMA transfers.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "dma.h"

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/*----------------------------------------------------------------------------*/
/* Configure DMA                                                              */
/*----------------------------------------------------------------------------*/

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

/**
  * Enable DMA controller clock
  */
void MX_DMA_Init(void)
{

  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_DMA1);

   /* DMA interrupt init */
   /* DMA1_Channel6_IRQn interrupt configuration */
   NVIC_SetPriority(DMA1_Channel6_IRQn, 0);
   NVIC_EnableIRQ(DMA1_Channel6_IRQn);
   /* DMA1_Channel7_IRQn interrupt configuration */
   NVIC_SetPriority(DMA1_Channel7_IRQn, 0);
   NVIC_EnableIRQ(DMA1_Channel7_IRQn);

}

/* USER CODE BEGIN 2 */

/* USER CODE END 2 */

