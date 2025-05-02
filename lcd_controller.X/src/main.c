#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#include "clock/clock.h"
#include "delay_timer/delay_timer.h"
/*
 * 
 */
static void set_ports(bool RS, bool D7, bool D6, bool D5, bool D4);
static void PORT_init(void);
static void debug_led_on(void);
static void debug_led_off(void);
static void debug_led_tgl(void);


int main() {
    CLOCK_Initialize();
    DelayTimer_Initialize();
    PORT_init();
    
    debug_led_on();
    delay_us(20000);
    
    set_ports(0, 0, 0, 1, 1);
    delay_us(5000);
    set_ports(0, 0, 0, 1, 1);
    delay_us(5000);
    set_ports(0, 0, 0, 1, 1);
    set_ports(0, 0, 0, 1, 0);
    delay_us(5000);
    
    // function set:
    set_ports(0, 0, 0, 1, 0);
    set_ports(0, 1, 1, 0, 0);
    delay_us(5000);
    // display off:
    set_ports(0, 0, 0, 0, 0);
    set_ports(0, 1, 0, 0, 0);
    delay_us(5000);
    // clear display:
    set_ports(0, 0, 0, 0, 0);
    set_ports(0, 0, 0, 0, 1);
    delay_us(5000);
    // Entry Mode Set:
    set_ports(0, 0, 0, 0, 0);
    set_ports(0, 0, 1, 1, 0);
    delay_us(5000);
    // Display On:
    set_ports(0, 0, 0, 0, 0);
    set_ports(0, 1, 1, 1, 1);
    delay_us(5000);
    
    debug_led_off();
    
    while(true) {
        debug_led_tgl();
        delay_us(1000000);
        set_ports(1, 0, 1, 0, 0);
        set_ports(1, 1, 1, 0, 0);
    }

    return (EXIT_SUCCESS);
}

static void set_ports(bool RS, bool D7, bool D6, bool D5, bool D4)
{   
    
    if (RS) {
        PORT_SEC_REGS->GROUP[0].PORT_OUTSET = (1U << 1);
    } else {
        PORT_SEC_REGS->GROUP[0].PORT_OUTCLR = (1U << 1);
    }

    delay_us(1);
    
    PORT_SEC_REGS->GROUP[0].PORT_OUTSET = (1U << 0);

    if (D4) {
        PORT_SEC_REGS->GROUP[0].PORT_OUTSET = (1U << 22);
    } else {
        PORT_SEC_REGS->GROUP[0].PORT_OUTCLR = (1U << 22);
    }
    
    if (D5) {
        PORT_SEC_REGS->GROUP[0].PORT_OUTSET = (1U << 21);
    } else {
        PORT_SEC_REGS->GROUP[0].PORT_OUTCLR = (1U << 21);
    }
    
    if (D6) {
        PORT_SEC_REGS->GROUP[0].PORT_OUTSET = (1U << 23);
    } else {
        PORT_SEC_REGS->GROUP[0].PORT_OUTCLR = (1U << 23);
    }
    
    if (D7) {
        PORT_SEC_REGS->GROUP[1].PORT_OUTSET = (1U << 22);
    } else {
        PORT_SEC_REGS->GROUP[1].PORT_OUTCLR = (1U << 22);
    }
    
    delay_us(1);
    PORT_SEC_REGS->GROUP[0].PORT_OUTCLR = (1U << 0);
    delay_us(1);
}

static void PORT_init(void) 
{
    PORT_SEC_REGS->GROUP[0].PORT_DIRSET = (1U << 0); //E
    PORT_SEC_REGS->GROUP[0].PORT_DIRSET = (1U << 1); //RS
    PORT_SEC_REGS->GROUP[0].PORT_DIRSET = (1U << 22); //D4
    PORT_SEC_REGS->GROUP[0].PORT_DIRSET = (1U << 21); //D5
    PORT_SEC_REGS->GROUP[0].PORT_DIRSET = (1U << 23); //D6
    PORT_SEC_REGS->GROUP[1].PORT_DIRSET = (1U << 22); //D6
    PORT_SEC_REGS->GROUP[0].PORT_DIRSET = (1U << 15); //debug
}

static void debug_led_on(void) 
{
    PORT_SEC_REGS->GROUP[0].PORT_OUTSET = (1U << 15);
}

static void debug_led_off(void) 
{
    PORT_SEC_REGS->GROUP[0].PORT_OUTCLR = (1U << 15);
}

static void debug_led_tgl(void) 
{
    PORT_SEC_REGS->GROUP[0].PORT_OUTTGL = (1U << 15);
}
