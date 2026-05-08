# Lens Scintillation

MATLAB scripts for studying scintillation behavior of partially coherent and partially polarized beams through a lens or focusing system.

The code varies source parameters such as `Ax`, `Ay`, `Bxy`, `delta_xx`, `delta_yy`, `delta_xy`, and `sigma_S`, then plots scintillation-related quantities at the input and focus.

## Contents

- `Scin20221101_*.m` and `Scin20221102_*.m`: parameter sweeps for scintillation with different `Bxy` and coherence-width cases.
- `Scin20221118_A_Bxy_030609.m`: later scintillation variant varying amplitude and correlation parameters.
- `AxAy.m`: explores dependence on field amplitudes `Ax` and `Ay`.
- `Bxy20221031_Bxy.m`: explores dependence on correlation coefficient `Bxy`.
- `delta.m` and `deltaij.m`: correlation-width calculations.
- `sigmaS.m`: effective beam-width related calculations.
- `ThreeD_AxAy_unequ.m`: 3D visualization for unequal amplitude cases.
- `figures/`: exported EPS figures from earlier analysis.

## Requirements

- MATLAB
- No external toolbox requirements are documented in the scripts.

## How to Run

Open MATLAB in the repository folder and run an individual script, for example:

```matlab
Scin20221102_Bxy_030609
```

Most scripts define parameters internally and generate plots directly.

## Notes

This repository preserves exploratory MATLAB analysis scripts. File names reflect the original experiment dates and parameter cases.
