#include "main.h"

#define FPB 4000000

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
    for(wait = 0; wait < 0x40000; wait++);
    bitbang_HD44780_blocking_lcd_command(0b00111000);   //4-line mode
    for(wait = 0; wait < 0x40000; wait++);
    
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

    while(1)
    {

        bitbang_HD44780_blocking_refresh_full_screen(screenspace);
    }
}
