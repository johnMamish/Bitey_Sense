#include "main.h"

#define FPB 4000000
#define V_COMP 3.3      //voltage that bite ADC will be compared against.

//the force sensor is put in a resistor-divider circuit with a second resistor
//whose resistance is given by RESISTOR_DIVIDER
#define RESISTOR_DIVIDER 43500

//variable to hold bite ADC result
uint32_t bite = 0;

//global constants for i/o pins
std_digio_gpio_pin_t shift_register_pins[] =
{
    {.port_ref = &LATA, .bitmask = (0x01 << 3), .set_pin = &std_digio_set_pin},
    {.port_ref = &LATA, .bitmask = (0x01 << 4), .set_pin = &std_digio_set_pin}
};

std_digio_gpio_pin_t lcd_register_select =
{
    .port_ref = &LATB,
    .bitmask = (0x01 << 10),
    .set_pin = &std_digio_set_pin
};

std_digio_gpio_pin_t lcd_read_write_select =
{
    .port_ref = &LATB,
    .bitmask = (0x01 << 9),
    .set_pin = &std_digio_set_pin
};

std_digio_gpio_pin_t lcd_clock_pin =
{
    .port_ref = &LATB,
    .bitmask = (0x01 << 8),
    .set_pin = &std_digio_set_pin
};

uint32_t shift_register_space;

std_digio_gpio_port_t shift_register =
{
    .port_ref = &shift_register_space,
    .set_port = &M74HC164B1_shift_register_set_port
};

//globals for lcd
char screenspace[80] =
{
    "          "
    "          "
    "          "
    "          "
    "          "
    "          "
    "          "
    "          "
};

char numspace[32];

//global variable to keep track of time
uint32_t tick = 0;

void main()
{
    //configure all digital I/O as non-analog output.
    ANSELA = 0x00;
    TRISA = 0x00;
    ANSELB = 0x00;
    TRISB = 0x00;

    //Set up timer1 to generate an interrupt every 10 milliseconds
    T1CONbits.SIDL = 0b0;
    T1CONbits.TCKPS = 0b00;     //1:1 divider
    PR1 = (FPB/1000);           //1,000 ticks a second
    T1CONbits.TON = 0b1;
    mT1SetIntPriority(1);

    //setup Analog on analog channels AN5 (RB3)
    ANSELBbits.ANSB3 = 0b1;
    TRISBbits.TRISB3 = 0b1;

    AD1CON1bits.SIDL = 0b0;
    AD1CON1bits.FORM = 0b000;
    AD1CON1bits.SSRC = 0b111;       //auto convert
    AD1CON1bits.CLRASAM = 0b0;
    AD1CON1bits.ASAM = 0b0;

    AD1CON2bits.VCFG = 0b000;
    AD1CON2bits.SMPI = 0b0000;

    AD1CON3bits.ADRC = 0b0;         //clock with PBCLK
    AD1CON3bits.SAMC = 0b11111;     //Sample lasts 31 TAD
    AD1CON3bits.ADCS = 0xff;        //TAD = 512 Tpb
    AD1CON1bits.ADON = 0b1;
    AD1CHSbits.CH0SA = 5;

    //enable ADC interrupts
    mAD1SetIntPriority(1);

    //set up LCD
    //initialize shift register.
    M74HC164B1_designate_pins(&shift_register_pins[0]);
    bitbang_HD44780_designate_pins(&lcd_register_select, &lcd_read_write_select,
                                   &lcd_clock_pin, &shift_register);

    //wait for a while for lcd to initialize internally
    uint32_t wait;
    for(wait = 0; wait < 0x40000; wait++);

    //turn on LCD in 4 line mode.
    bitbang_HD44780_blocking_lcd_command(0b00001100);   //turn on lcd
    bitbang_HD44780_blocking_lcd_command(0b00111000);   //4-line mode
    
    //make diamond character at CGRAM address 0x00.
    bitbang_HD44780_blocking_lcd_command(0x40 | 0);     //insert new character
    bitbang_HD44780_blocking_lcd_data(0b00000);
    bitbang_HD44780_blocking_lcd_data(0b00000);
    bitbang_HD44780_blocking_lcd_data(0b00100);
    bitbang_HD44780_blocking_lcd_data(0b01110);
    bitbang_HD44780_blocking_lcd_data(0b11111);
    bitbang_HD44780_blocking_lcd_data(0b01110);
    bitbang_HD44780_blocking_lcd_data(0b00100);
    bitbang_HD44780_blocking_lcd_data(0b00000);

    //enable interrupts
    INTEnableSystemMultiVectoredInt();
    mAD1IntEnable(1);
    mT1IntEnable(1);

    //start ADC
    AD1CON1bits.SAMP = 0b1;
    
    while(1)
    {
        //pressure sensor info is stored in the bite variable.  We want to get
        //the resistance of the sensor from that.
        double bite_resistance = (RESISTOR_DIVIDER*1024)/((double)bite) - RESISTOR_DIVIDER;
        
        
        //output to screen
        std_string_uint_to_string(numspace, bite, 10);
        std_string_str_cpy(numspace, screenspace);

        std_string_uint_to_string(numspace, (uint32_t)bite_resistance, 10);
        std_string_str_cpy(numspace, screenspace + 20);

        bitbang_HD44780_blocking_refresh_full_screen(screenspace);

        //clear screen
        int16_t i;
        for(i = 0; i < 80; i++)
        {
            screenspace[i] =  ' ';
        }
    }
}

void __ISR(_TIMER_1_VECTOR, ipl1) tick_count()
{
    //increment timer
    tick++;

    mT1ClearIntFlag();
}

void __ISR(_ADC_VECTOR, ipl1) adc_conversion_handler()
{
    //save the value
    bite = ADC1BUF0;
    AD1CON1bits.SAMP = 1;
    
    //clear interrupt flag
    mAD1ClearIntFlag();
}
