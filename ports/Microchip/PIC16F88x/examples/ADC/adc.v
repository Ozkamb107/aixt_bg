import pin
import adc

a := u16 (0)

pin.setup(pin.c0, pin.output)
pin.setup(pin.c1, pin.output)
pin.setup(pin.c2, pin.output)
pin.setup(pin.c3, pin.output)
pin.setup(pin.c4, pin.output)
pin.setup(pin.c5, pin.output)

pin.write(pin.c0,0)	
pin.write(pin.c1,0)
pin.write(pin.c2,0)
pin.write(pin.c3,0)
pin.write(pin.c4,0)
pin.write(pin.c5,0)


adc.setup()

for{

	a = adc.read(4)
	

	if a >= 1020 {

		pin.high(pin.c0)
        pin.high(pin.c1)
        pin.high(pin.c2)
        pin.high(pin.c3)
        pin.high(pin.c4)
        pin.high(pin.c5)

	}

	else if  a >= 820 {
            
        pin.high(pin.c0)
        pin.high(pin.c1)
        pin.high(pin.c2)
        pin.high(pin.c3)
        pin.high(pin.c4)
        pin.low(pin.c5)
  
    }
        
    else if  a >= 620 {
            
    	pin.high(pin.c0)
    	pin.high(pin.c1)
    	pin.high(pin.c2)
    	pin.high(pin.c3)
    	pin.low(pin.c4)
    	pin.low(pin.c5)   

    }
        
    else if  a >= 420 {
            
        pin.high(pin.c0)
        pin.high(pin.c1)
        pin.high(pin.c2)
        pin.low(pin.c3)
        pin.low(pin.c4)
        pin.low(pin.c5)  
  
    }

	else if  a >= 220 {
            
        pin.high(pin.c0)
        pin.high(pin.c1)
        pin.low(pin.c2)
        pin.low(pin.c3)
        pin.low(pin.c4)
        pin.low(pin.c5)  
   
     }
        
    else if  a >= 120 {
            
        pin.high(pin.c0)
        pin.low(pin.c1)
        pin.low(pin.c2)
        pin.low(pin.c3)
        pin.low(pin.c4)
        pin.low(pin.c5)
      
    }
        
     else {
            
        pin.low(pin.c0)
        pin.low(pin.c1)
        pin.low(pin.c2)
        pin.low(pin.c3)
        pin.low(pin.c4)
        pin.low(pin.c5)       
    }
        

}