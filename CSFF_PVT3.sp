*CSFF 1.1 V,TT,25℃
.lib "C:\Users\DELL\Desktop\hspice_hw\library_40\l0040ll_v1p4_1r.lib" TT 

.param SUPPLY = 1.1V 
.param T = 0.0001n    
.temp 25            
.global VSS VDD VPW VNW    
.op                  

.subckt INV IN OUT    
XP1 VDD IN OUT VNW p11ll_ckt  W=2.1e-07 L=4e-08    
XN1 VSS IN OUT VPW n11ll_ckt  W=1.2e-07 L=4e-08
.ends INV

X1 D X INV
X2 X Y INV

XPT1 VDD Y 1 VNW p11ll_ckt  W=2.1e-07 L=4e-08
XPT2 1 CK DN VNW p11ll_ckt  W=2.1e-07 L=4e-08
XNT3 DN CS 2 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XPT4 VDD CK CS VNW p11ll_ckt  W=2.1e-07 L=4e-08
XNT5 CS CK 3 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XNT6 3 QN 2 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XNT7 2 D 0 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XNT8 3 DN 4 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XNT9 4 QI 0 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XPT10 VDD DI 5 VNW p11ll_ckt  W=2.1e-07 L=4e-08
XPT11 5 CS DN VNW p11ll_ckt  W=2.1e-07 L=4e-08
XNT12 DN DI 2 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XI1 DN DI INV
XPT15 5 CS QN VNW p11ll_ckt  W=2.1e-07 L=4e-08
XNT16 QN CK 7 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XNT17 7 DI 0 VPW n11ll_ckt  W=1.2e-07 L=4e-08
XI2 QN Q INV
XI3 QN QI INV
XPT22 VDD QI 8 VNW p11ll_ckt  W=2.1e-07 L=4e-08
XPT23 8 CK QN VNW p11ll_ckt  W=2.1e-07 L=4e-08
XNT24 QN CS 4 VPW n11ll_ckt  W=1.2e-07 L=4e-08
CL Q O 0.0025PF


VVDD VDD 0 'SUPPLY'
VVPW VPW 0 0
VVNW VNW 0 'SUPPLY'
VVSS VSS 0 0


VIN1 CK 0 PULSE(0 'SUPPLY' 0n 0n 0n 25n 50n) 
VIN2 D 0 PWL(0 0V 40n 0V 40.1n 'SUPPLY' 60n 'SUPPLY' 60.1n 0V 110n 0V 110.1n 'SUPPLY') 

.tran 0.01n 200n
.probe
.end