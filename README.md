# Quadcopter Attitude Control BLDC Motor Simulation: Simulink/Matlab
Designed closed-loop PID + Fuzzy Logic controllers for roll, pitch, and yaw control 
of a quadcopter with BLDC motors and Hall-effect sensor feedback; simulated in MATLAB, demonstrating multi-threaded 
control logic and real-time system design. 

## Tech Stack
- Simulink/Matlab
- Simscape Multibody
- CAD: SolidWorks → STEP → Simscape XML import

## BLDC Motor Parameters
| Parameter | Value |
|---|---|
| Torque constant Kt | 0.0136 N·m/A |
| Back-EMF constant Ke | 0.0136 V·rad/s |
| Phase resistance R | 0.135 Ω |
| Phase inductance L | 0.169 mH |
| Rotor inertia J | 13.5 × 10⁻⁶ kg·m² |

## Files
| File | Description |
|---|---|
| `BLDC_create_1.m` | BLDC motor model: electrical and mechanical transfer functions |
| `quadcopter_bldc_setup.m` | Builds full Simulink model: ESC logic, BLDC dynamics, mixer subsystem |
| `mixer_create.m` | Motor mixing: distributes throttle/roll/pitch/yaw to 4 motor PWM signals |
| `drone_DataFile.m` | Simscape Multibody rigid transform and inertia data (CAD-derived) |
| `Quadcopter_BLDC.slx` | Simulink: BLDC motor + quadcopter dynamics |
| `Quadcopter_BLDC_Mixer.slx` | Simulink: with motor mixing integrated |
| `drone_1.slx` | Full simulation with Simscape Multibody 3D model |
| `drone.xml` | Simscape import XML from SolidWorks CAD |
| `*.STEP` | drone 3D CAD model |

## How to Run
1. Open MATLAB
2. Run `quadcopter_bldc_setup.m` to initialize workspace and open the Simulink model
3. Open `Quadcopter_BLDC_Mixer.slx` or `drone_1.slx` for the full simulation
4. Set roll/pitch/yaw reference inputs and run simulation (5–10s)

## Control Architecture
- **Open loop:** PWM step inputs directly to 4 BLDC motors
- **Closed loop:** PID controllers on each axis → motor mixing → PWM → BLDC dynamics
- **Motor mixing:** `M1 = throttle + 0.2*(roll + pitch - yaw)` (and so on for M2–M4)
- **Steady-state motor speed:** `ω = Veff / (Km²/R + B)`

## System workflow

```
CAD model (STEP)          Motor params (Kt, Ke, R, L, J, B)
      │                              │
      ▼                              ▼
Simscape model ──► Quad dynamics ◄── BLDC model
(drone.xml)       (Euler eqs,        (Electrical +
                   body frame)        mechanical TF)
      │                │                    │
      ▼                ▼                    ▼
Sensors/IMU ──► PID controllers ──► ESC (PWM)
(roll,pitch,yaw  (3 separate loops)  (duty cycle
 feedback)                            → voltage)
      │                │                    │
      │                ▼                    ▼
      │          Motor mixing ──► 4× BLDC motors
      │          (throttle +      (individual
      │           RPY → M1–M4)    PWM cmds)
      │                                     │
      │◄──── feedback (closed loop) ────────┼
                                            ▼
                                    Thrust / attitude
```
