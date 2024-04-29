## ktcc derived macros

### Required and Optional G-code macros

The required macros change how Klipper uses those commands to make use of the toolchanger. They are all backwards compatible. This macros are highly recommended to be included.

The optional macros are to add more commands for higher compatibility with for example RRF G-code.

> [!NOTE]
> You can add the whole directory to the printer.cfg by adding the relative path to the macros directory for example:

```
[include toolchanger/g-code_macros/*.cfg]
```

<br>
