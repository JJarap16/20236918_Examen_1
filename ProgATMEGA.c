#include <stdint.h>

int main()
{
  volatile uint8_t* mcucr_reg = (volatile uint8_t*) 0x55;

  volatile uint8_t* pinc_reg = (volatile uint8_t*) 0x26;
  volatile uint8_t* ddrc_reg = (volatile uint8_t*) 0x27;
  volatile uint8_t* portc_reg = (volatile uint8_t*) 0x28;

  volatile uint8_t* ddrb_reg = (volatile uint8_t*) 0x24;
  volatile uint8_t* portb_reg = (volatile uint8_t*) 0x25;
  
  *mcucr_reg |= (1<<4); //Configura en alta el bit 4 del registro MCUCR

  *ddrc_reg &= ~(1<<2); //Configura en baja el bit 2 de registro DDRC (conf. como entrada)
  *portc_reg |= (1<<2); //Configura en alta el bit 2 de PORTC (PC2) +5v

  *ddrb_reg |= (1<<5);   //Configura en alta el bit 5 de registro DDRB (conf. como salida)
  *portb_reg &= ~(1<<5); //Configura en baja el bit 5 de PORTB (PB5) 0v

  while(1)
  {
    uint8_t pinc2_val = *pinc_reg & 0b00000100;

    if(pinc2_val == 0b00000100)
    {
      *portb_reg |= (1<<5); //Coloca en alta el bit 5 de PORTB (PB5)
    }
    else
    {
      *portb_reg &= ~(1<<5);//Coloca en baja el bit 5 de PORTB (PB5)
    }

  }
  
  return 0;
}
