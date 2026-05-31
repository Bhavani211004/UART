<h1 align="center">📡 UART RTL Design in Verilog</h1>

<h3 align="center">
Universal Asynchronous Receiver Transmitter (UART) <br>
Designed & Verified using Verilog HDL and Vivado
</h3>

<p align="center">
<img src="https://img.shields.io/badge/Language-Verilog-blue.svg"/>
<img src="https://img.shields.io/badge/Tool-Xilinx%20Vivado-green.svg"/>
<img src="https://img.shields.io/badge/Simulation-Passed-success.svg"/>
<img src="https://img.shields.io/badge/RTL-UART-orange.svg"/>
</p>

---

## 🚀 Project Overview

This project implements a complete **UART (Universal Asynchronous Receiver Transmitter)** protocol in **Verilog HDL**.

UART is one of the most widely used serial communication protocols for transmitting and receiving data between digital systems.

This design includes:

✅ UART Transmitter (TX)  
✅ UART Receiver (RX)  
✅ Baud Rate Generator  
✅ Top-Level Integration  
✅ Testbench Verification  
✅ Functional Simulation in Vivado  

---

# 📘 UART Architecture

The following flowchart illustrates the UART TX and RX FSM operation along with UART frame format.

<p align="center">
  <img width="500" height="750" alt="uart" src="https://github.com/user-attachments/assets/80b3f930-45c0-4e38-987c-1d1804036c31" />

</p>

---
# Simulation Results

## Waveform Output

Shows UART transmission and reception of multiple data bytes.

<img width="1631" height="630" alt="Scope" src="https://github.com/user-attachments/assets/933bc222-06c8-440f-a3da-3081633a3854" />


---

## Console Output

Verification from testbench showing transmitted data equals received data.
<img width="572" height="237" alt="Console" src="https://github.com/user-attachments/assets/2e0a67af-febd-4c93-ac75-e714e89a8ea3" />

Example:
```text
sent = 42   received = 42
sent = 43   received = 43
sent = 44   received = 44
sent = 45   received = 45
sent = 46   received = 46
```


# ⚙️ Project Files
---
```bash
UART/
│
├── UART_top.v        # Top module
├── UART_Tx.v         # UART transmitter
├── UART_Rx.v         # UART receiver
├── baud_gen.v        # Baud rate generator
├── UART_top_tb.v     # Testbench
│
├── images/
│   ├── uart.png
│   ├── Scope.png
│   └── Console.png
│
└── README.md

````
# Simulation Verification

Verified successfully in Vivado Behavioral Simulation.

### Observed:
- Transmitted bytes are correctly received
- `data_in == data_out`
- `busy` asserted during transmission
- Receiver reconstructs serial data correctly

---

# Tools Used
- Verilog HDL
- Xilinx Vivado Simulator

---

# Result
UART transmitter and receiver were successfully designed and verified through simulation.

✔ Correct Serial Transmission  
✔ Correct Data Reception  
✔ Functional Verification Passed  

---

## Author
**Lakshmi Bhavani Katta**
