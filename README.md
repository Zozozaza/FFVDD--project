**FUNCTIONAL AND
FORMAL VERIFICATION
OF DIGITAL DESIGN**
(UE21EC343AB4)

PREPARED BY:

ADI M ------------------PES1UG21EC012        
SUJAL ------------------ PES1UG21EC300       
ADITYA BHARATH ----- PES1UG21EC343       
B M MADHUMITHA --- PES1UG21EC902    
SHARANYA SHETTY----PES1UG21EC909

GUIDED BY :
prof. SUDHEENDRA KUMAR K


1. **INTRODUCTION**

• 1.1 **Overview of the Fibonacci
series design**

The Fibonacci series, a renowned mathematical
sequence, is characterized by each number being
the sum of the two preceding ones. Typically
initiated with 0 and 1, this project delves into the
intricacies of designing and verifying a digital
circuit that systematically generates the Fibonacci
series.


![image](https://github.com/Zozozaza/FFVDD--project/assets/136055978/c032a4ba-6b7b-4982-8707-88137178c69c)

• 1.2 **Purpose of formal and
functional verification**

Formal and functional verification stand as pivotal
pillars in the digital design process. Formal
verification meticulously examines whether the
design aligns with its specified requirements.
Meanwhile, functional verification ensures that the
design adheres to its intended behavior. These
verification processes play a pivotal role in the
early detection and rectification of errors during
the design phase, ultimately mitigating the
likelihood of issues in the final product.

![image](https://github.com/Zozozaza/FFVDD--project/assets/136055978/ac9c224d-b380-48bc-9acb-2960697290be)

An ASMD(Algorithmic State Machine with Datapath)
chart has three states.


• 1.Idle State:
The circuit is in an idle state, indicating that it is not actively computing Fibonacci numbers.
This state is the initial state and represents the system waiting for a ‘start’ signal.


  • 2.Start State:
  When the ‘start’ signal is asserted, the system transitions to the ‘op’ (operation) state. 


• 3.Op State:
In the ‘op’ state, initial values are loaded into three registers: t0, t1, and n.
The t0 and t1 registers are loaded with 0 and 1, representing fib(0) and fib(1), respectively.
The n register is loaded with the desired number of iterations, denoted as "i."


**2. Design Description**

• 2.1 Module breakdown: Inputs, outputs, and internal logic
   
 •   Inputs:

   
input wire clk: Clock signal.

input wire reset: Reset signal.

input wire start: Start signal.

input wire [4:0] i: 5-bit input for the desired number of iterations.


• Outputs:

output reg ready: Output indicating readiness.

output reg done_tick: Output indicating completion.

output wire [19:0] f: 20-bit output representing the Fibonacci series.


Internal Logic:
State Registers:


state_reg: Register holding the current state.

t0_reg, t1_reg: Registers holding the current values for Fibonacci numbers.

n_reg: Register holding the current iteration count.

state_next, t0_next, t1_next, n_next: Registers for the next state and values.


FSMD state & data registers:
The ‘FSMD state & data registers’ block describes how the initialization of the state and data registers occurs when a positive edge of the clock or a positive edge of the reset signal occurs.

-If reset is asserted, it initializes all registers to their initial values.

-Otherwise, it updates the registers based on their respective next values



FSMD next_state logic:
The always @* block determines the next state and updates data registers based on the current state.


Logic specific to each state:
Idle State (idle):
Sets ready to 1 if start is asserted.
Initializes values if start is asserted.
Operation State (op):
Computes Fibonacci numbers until the desired iteration count is reached.
Done State (done):
Sets done_tick to 1.
Resets to the idle state.

Output Assignment:
Assigns the value of t1_reg to the output wire f.


• 2.2 State machine description
The design strategically employs a state machine to orchestrate the iterative process of Fibonacci series generation. This state machine encompasses pivotal states such as initialization, calculation, and output, orchestrating the seamless flow of the design.
The state machine is synchronous, driven by the positive edge of the clock (posedge clk).
The state and data registers are updated in each clock cycle based on the current state and input conditions.
The reset signal initializes the state machine to the idle state and sets initial values for registers


• 2.3 Register and signal declarations
Within this intricately designed system, registers serve as repositories for intermediate values during Fibonacci calculations, while signals facilitate seamless communication between disparate modules. The meticulous declaration of registers and signals is imperative for the precise functioning of the design.


reg [1:0] state_reg, state_next;
Registers to hold the current and next states of the state machine.

reg [19:0] t0_reg, t0_next, t1_reg, t1_next;
Registers to hold the current and next values for t0 and t1.

reg [4:0] n_reg, n_next;
Registers to hold the current and next values for the number of iterations (n).


**3.Verification Methodologies**

• 3.1 Overview of verification methodologies used.

The verification process relies on a multifaceted approach, incorporating formal methods, simulation-based testing, and code coverage analysis. This amalgamation ensures a comprehensive assessment of the design's correctness, covering a spectrum of potential issues.


• 3.2 Explanation of normal testbench and code coverage.

The normal testbench constitutes a dynamic simulation, subjecting the design to diverse scenarios to validate its functionality. Concurrently, code coverage analysis meticulously gauges the extent to which the design's code is exercised during simulation, providing invaluable insights into areas that remain untested.



• Instantiate the Fibonacci module.

This section instantiates the fib module and connects its input and output ports to signals declared in the testbench. This allows the testbench to control the inputs and monitor the outputs of the fib module.


• Clock generation.

This part of the testbench generates a clock signal (clk) by toggling its value every 5 time units. This clock is used to drive the fib module.


• Initial values.

Initializes the input signals (clk, reset, start, and i) to default values.
Performs a reset sequence to ensure the fib module starts from a known state.
Defines several test cases where different values of i are used to test various iterations of the Fibonacci computation.


• Test cases.

This section defines individual test cases by setting values for start and i.
For each test case, it asserts start to initiate the computation and sets the desired value for i.
After a delay of 20 time units (#20), it deasserts start to end the computation.

![image](https://github.com/Zozozaza/FFVDD--project/assets/136055978/78d89217-3dcd-4a52-a52b-9d963a1a582b)

The verification process relies on a multifaceted approach, incorporating formal methods, simulation-based testing, and code coverage analysis. This amalgamation ensures a comprehensive assessment of the design's correctness, covering a spectrum of potential issues.

• 3.3 Layered testbench structure.
A strategic layered testbench structure is implemented to scrutinize individual modules before their integration into the complete system. This methodical approach ensures that each component functions with precision before amalgamation, thus fortifying the overall integrity of the design.


• 4. Testbench Implementations
  •  4.1 Simulation results and analysis![WhatsApp Image 2023-11-18 at 23 33 
 53_7d6c36e6](https://github.com/Zozozaza/FFVDD--project/assets/136055978/d2c8113b-008f-4f63-8884-df12a344dc26)


   ![image](https://github.com/Zozozaza/FFVDD--project/assets/136055978/5161f3c2-10c6-4ab9-9bbc-eec2d08692f8)
    ![WhatsApp Image 2023-11-18 at 23 34 18_fecbb79b](https://github.com/Zozozaza/FFVDD--project/assets/136055978/018e3a00-7603-461d-b521-3f556ca2adb0)

• Simulation result
Fig4.1 gives us the simulation waveform
Fig4.2 represents the waveform for the Fibonacci series, to confirm these values we have fig 4.4 where the input i=5 and hence the output f=5 and in fig 4.5 i=10 and f=55, these values correspond to out waveform hence confirming accuracy of the code.


Fig4.3 shows that when we take a high value for input, we get 0 as an output, this is because we have set an upper limit at i=28 and if i>28 the output for these signals done_tick high, meaning completion.

Analysis
Normal testbench alone is not effective enough in terms of testing and achieving sufficient code coverage.

On the other hand, the layered testbench, with its structured approach, seems to be more successful in reaching the desired level of code coverage.

• 4.2 Purpose and structure
The layered testbench helps to improve the overall dependability of each module by isolating and addressing problems at a specific level.
A layered testbench is a testing approach in which the testbench is divided into several layers, each with a designated function. This architectural approach promotes modularity, reusability, and maintainability in complex verification environments.
Structure

Fibonacci Module (fib):

• The actual hardware module under test. BFM(Bus Functional Model) Layer (fib_bfm):

• Serves as an abstract representation of the communication between the testbench and the hardware module.

• Handles tasks related to resetting the module, processing transactions, and interfacing with the fib_intf interface.

Interface Layer (fib_intf):

• Defines the interface signals that facilitate communication between the testbench and the hardware module.

• Includes clocking blocks (bfm_cb and monitor_cb) for proper synchronization of signals.

Generator Layer (fib_gen):

• Responsible for generating random transactions (fib_trans) for stimulus.

Coverage Layer (fib_cov):

• Defines a coverage group (cov you_inst) to track and analyze the coverage of specific signals in the hardware module.

• Helps assess the effectiveness of the test suite in exercising different parts of the design.

Test Layer (fib_test):

• Orchestrates the overall test flow.

• Instantiates the environment (fib_env) and sets up the necessary parameters.

• Runs the simulation by calling the run task in the environment.

Environment Layer (fib_env):

• Integrates and coordinates various components of the testbench, including the generator, BFM, and coverage group.

• Manages the initialization, execution, and post- processing of the test.

Top-Level Testbench (tb_fib_top):

Instantiates the fib_intf interface, the fib_test program, and the hardware module (fib).

• Controls the

Purpose

Modularity: Each layer is designed to performa specific set of tasks, making it easier to understand, modify, and extend the testbench.

Reusability: Components like the generator, BFM, and coverage group can be reused in other projects or testbenches.

Maintainability: Changes or enhancements to one

layer can be made independently without affecting other layers, making the testbench easier to maintain.

Scalability: As the complexity of the design increases, a layered testbench can be extended by adding more layers or refining existing ones.

Coverage Analysis: The coverage layer provides insights into how well the design has been exercised during simulation, helping identify areas that need additional testing.

**5.Coverage Analysis**
 
 ![image](https://github.com/Zozozaza/FFVDD--project/assets/136055978/d7d2a800-77ed-406f-ba41-8f7148153e4e)


• 5.1 Cover points definition and relevance to the design
Cover points, strategically defined, track specific events or conditions during simulation. These points are intricately selected based on their relevance to critical functionalities within the design, serving as benchmarks for the assessment of testing thoroughness. The cover points within the covergroup cov_inst are associated with specific signals from the fib_trans class (trans). 

A layered testbench provides a structured and organized approach to code coverage, offering benefits in terms of modularity, reusability, hierarchical analysis, scalability, and ease of debugging.

• 5.2 Code coverage metrics and analysis
Code coverage metrics, encompassing statement coverage, branch coverage, and condition coverage, are meticulously employed to quantitatively measure the effectiveness of the testbenches in exercising the entirety of the design code.

**6. Conclusion**

Throughout the project, we successfully designed the Fibonacci series code, implemented comprehensive testbenches, and obtained accurate results using Cadence. In addition, the utilization of layered testbenches proved instrumental, showcasing enhanced code coverage compared to traditional test cases.

Advantages of Layered Testbenches:

1. Modularity:

Inherently modular, focusing on specific verification aspects.

• Facilitates easier understanding, maintenance, and extension.

2. Reusability:

• Enables reuse across various projects or within the same project.

• Promotes time savings and a standardized approach.

3. Scalability:

• Adapts to design complexity by adding new layers.

• Beneficial for managing large and intricate designs.

4. Ease of Debugging:

Simplifies debugging by isolating issues to specific layers.

• Streamlines identification and resolution of problems.

5. Abstraction:

• Offers a higher level of abstraction, enhancing readability.

• Adaptable to changes in design or verification requirements.

In summary, layered testbenches not only improved code coverage but also provided modularity, reusability, scalability, ease of debugging, and abstraction, boosting the efficiency of the verification process.
