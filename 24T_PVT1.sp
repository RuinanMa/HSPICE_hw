* 24T DFF 0.5V,SS,70℃

.lib "C:\Users\DELL\Desktop\hspice_hw\library_40\l0040ll_v1p4_1r.lib" SS 

.param SUPPLY = 0.5V  
.param T = 0.0001n    
.temp 70             
.global VSS VDD VPW VNW
.option node list post    
.op                   

*反相器
.subckt INV IN OUT WN=1e-07 WP=2e-07  
XP1 VDD IN OUT VNW p11ll_ckt  W=WP L=4e-08       
XN1 VSS IN OUT VPW n11ll_ckt  W=WN L=4e-08
.ends INV

*传输门
.SUBCKT TX IN CLKP CLKN OUT WN=1e-07 WP=2e-07
XP2 IN CLKP OUT VNW p11ll_ckt W=WP L=4e-08 
XN2 IN CLKN OUT VPW n11ll_ckt W=WN L=4e-08
.ENDS TX


X1 CK CKN INV WN=1.2e-07 WP=2.1e-07    
X2 CKN CKI INV WN=1.2e-07 WP=2.1e-07    

X3 D X INV 
X4 X Y INV 
X5 Y 1 INV 
X6 1 CKI CKN 2 TX 
X7 2 3 INV 
X8 3 A INV 
X9 A CKN CKI 2 TX 
X10 3 CKN CKI 4 TX
X11 4 5 INV 
X12 5 B INV
X13 B CKI CKN 4 TX 
X14 5 Q INV
CL Q O 0.0025PF  $0.002+01*0.0005=0.0025pf


VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0


VIN1 CK 0 PULSE(0 'SUPPLY' 0n 0n 0n 25n 50n) 
VIN2 D 0 PWL(0 0V 40n 0V 40.1n 'SUPPLY' 60n 'SUPPLY' 60.1n 0V 110n 0V 110.1n 'SUPPLY') 

.tran 0.01n 200n
.probe
.end