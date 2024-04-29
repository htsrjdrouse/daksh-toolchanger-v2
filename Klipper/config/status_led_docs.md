### LED CONFIGS


<details><summary>t0_dock_state</summary>

```  
[led_effect t0_dock_state]
   autostart:              false
   frame_rate:             24
   leds:
       neopixel:t0_led
   layers:
     static  10 1 top (0.5,0.5,0.5)
```
</details>

<details><summary>t0_lock_state</summary>

```  
[led_effect t0_lock_state]
     autostart:              false
     frame_rate:             24
     leds:
         neopixel:t0_led
     layers:
       static  10 1 top (0,0.5,0)

```
</details>

<details><summary>t1_dock_state</summary>

```  
[led_effect t1_dock_state]
    autostart:              false
    frame_rate:             24
    leds:
        neopixel:t1_led
    layers:
      static  10 1 top (0.5,0.5,0.5)
```
</details>

<details><summary>t1_lock_state</summary>

```
[led_effect t1_lock_state]
   autostart:              false
   frame_rate:             24
   leds:
       neopixel:t1_led
   layers:
     static  10 1 top (0,0.5,0)
```
</details>

<details><summary>led_effect t0_error_blink</summary>

```      
[led_effect t0_error_blink]
   autostart:              false
   frame_rate:             24
   leds:
       neopixel:t0_led
   layers:
      strobe 1 2 add (1.0,0,0)
```

</details>

<details><summary>led_effect t1_error_blink</summary>

```      
[led_effect t1_error_blink]
   autostart:              false
   frame_rate:             24
   leds:
      neopixel:t1_led
   layers:
      strobe 1 2 add (1.0,0,0)
```
</details>

<details><summary>led_effect t0_heating</summary>

```
[led_effect t0_heating]
   autostart:              false
   frame_rate:             24
   leds:
       neopixel:t0_led
   layers:
       breathing  3 0 screen (0.5,0.6,0.05)
```
</details>

<details><summary>led_effect t1_heating</summary>

```
      
[led_effect t1_heating]
   autostart:              false
   frame_rate:             24
   leds:
      neopixel:t1_led
   layers:
      breathing  3 0 screen (0.5,0.6,0.05)

```
</details>

<details><summary>led_effect t0_idle</summary>

```

[led_effect t0_idle]
   autostart:              false
   frame_rate:             24
   leds:
       neopixel:t0_led
   layers:
      static  10 1 top (0,1,0.7) 
      #static  10 1 top (0.5,0.5,0.5)

```
</details>

<details><summary>led_effect t1_idle</summary>

```

      
[led_effect t1_idle]
   autostart:              false
   frame_rate:             24
   leds:
      neopixel:t1_led
   layers:
      static  10 1 top (0,1,0.7) 

```
</details>

### LED MACROS


<details><summary>LED_ALL_EFFECT_STOP</summary>

```

[gcode_macro LED_ALL_EFFECT_STOP]
gcode:

   SET_LED_EFFECT EFFECT=t{params.T}_lock_state STOP=1
   SET_LED_EFFECT EFFECT=t{params.T}_error_blink  STOP=1
   SET_LED_EFFECT EFFECT=t{params.T}_dock_state STOP=1
   SET_LED_EFFECT EFFECT=t{params.T}_heating STOP=1
   SET_LED_EFFECT EFFECT=t{params.T}_idle STOP=1

```
</details>

<details><summary>SET_STATUS_LED_NOT_IN_USE</summary>

```

[gcode_macro SET_STATUS_LED_NOT_IN_USE]
   gcode:
     LED_ALL_EFFECT_STOP T={params.T}

```
</details>

<details><summary>SET_STATUS_LED_HEATING</summary>

```
   
[gcode_macro SET_STATUS_LED_HEATING]
gcode:
  LED_ALL_EFFECT_STOP T={params.T}
  SET_LED_EFFECT EFFECT=t{params.T}_heating

```
</details>

<details><summary>SET_STATUS_LED_IDLE</summary>

```


[gcode_macro SET_STATUS_LED_IDLE]
gcode:
 LED_ALL_EFFECT_STOP T={params.T}
 SET_LED_EFFECT EFFECT=t{params.T}_idle
       
```
</details>

<details><summary>SET_STATUS_LED_LOCK</summary>

```
        
[gcode_macro SET_STATUS_LED_LOCK]
gcode:
   LED_ALL_EFFECT_STOP T={params.T}
   SET_LED_EFFECT EFFECT=t{params.T}_lock_state  

```
</details>

<details><summary>SET_STATUS_LED_DOCK</summary>

```



[gcode_macro SET_STATUS_LED_DOCK]
gcode:
  LED_ALL_EFFECT_STOP T={params.T}
  {% if printer["gcode_macro VARIABLES_LIST"]["print_status"]|int < 1 %}
     SET_LED_EFFECT EFFECT=t{params.T}_dock_state 
  {% else %}
      SET_STATUS_LED_IDLE T={params.T}
  {% endif %}
  
```
</details>

<details><summary>SET_STATUS_LED_ERROR_START</summary>

```
  
[gcode_macro SET_STATUS_LED_ERROR_START]
gcode:
   LED_ALL_EFFECT_STOP T={params.T}
   SET_LED_EFFECT EFFECT=t{params.T}_error_blink  

```
</details>
   
