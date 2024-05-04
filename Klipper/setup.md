# Set up procedure #


### After installation and modifying the configuration to work with 2 tools instead of 5 initially, here are the operational steps to get the system running: ###

1. Run DOCK_TEST to get the system to find the docks, you may get an error like this:

<img width="1110" alt="doc_test_error" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/34f7820b-7765-4f95-99bd-23b52c98910f">

If this is the case, then you need to test the ATC switch buttons which are the hall sensors that detect the docks. In this case, we need to check both docks (dock0 - QUERY_ATCSWITCH BUTTON=tc0) (dock1 - QUERY_ATCSWITCH BUTTON=tc1). 

<img width="385" alt="dock1_test" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/de97417c-1f99-48fb-8896-21f02463b0e6">

Dock 0 - tests fine

<img width="385" alt="dock2_test" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/140b3a0c-c698-452e-826b-00cff503a48f">

Dock 1 - there is something wrong with the wiring (or sensor) for this one. In my case didn't use the correct pin. 


The hall sensors used are A3144

<img width="386" alt="A3144_hallsensor" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/dea759ff-79a5-4a85-870d-5c8c5ebb8734">

