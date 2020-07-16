import pyautogui, time, os
from colorama import *


print('\033c')
print(Fore.YELLOW + """▄▄▌ ▐ ▄▌ ▄ .▄ ▄▄▄· ▄▄▄▄▄▄.▄▄ ·   .▄▄ ·  ▄▄▄· ▄▄▄· • ▌ ▄ ·. 
██· █▌▐███▪▐█▐█ ▀█ ▀•██ ▀▐█ ▀.   ▐█ ▀. ▐█ ▄█▐█ ▀█ ·██ ▐███▪
██▪▐█▐▐▌██▀▀█▄█▀▀█   ▐█.▪▄▀▀▀█▄  ▄▀▀▀█▄ ██▀·▄█▀▀█ ▐█ ▌▐▌▐█·
▐█▌██▐█▌██▌▐▀▐█▪ ▐▌  ▐█▌·▐█▄▪▐█  ▐█▄▪▐█▐█▪·•▐█▪ ▐▌██ ██▌▐█▌
 ▀▀▀▀ ▀▪▀▀▀ · ▀  ▀   ▀▀▀  ▀▀▀▀    ▀▀▀▀ .▀    ▀  ▀ ▀▀  █▪▀▀▀""")
print("\t\t\t\t     " + Fore.RED + "created by " + Fore.MAGENTA + "@TheMasterCH")
print("")
print("")
print("")
try:
    count = int(input(Fore.BLUE + "[?] " + Fore.GREEN + "Enter count of spam: "))
    word = str(input(Fore.BLUE + "[?] " + Fore.GREEN + "Enter spam text: "))
    delay = int(float(input(Fore.BLUE + "[?] " + Fore.GREEN + "Enter delay time(1=1sec): ")))
    count = count + 1
    i = 0
    while True:
        time.sleep(delay)
        str(pyautogui.typewrite(word))
        pyautogui.press("enter")
        i += 1
        if i < count:
            os.system('clear||cls')
            print(Fore.MAGENTA + "Starting next round... ")
            print(Fore.YELLOW + "Count " + Fore.RED + str(i) + Fore.YELLOW + " spamming progress continue..")
        else:
            break
except TypeError:
    print(Fore.RED + "[!] " + Fore.YELLOW + "Look on your spelling your dickhead! ")

except KeyboardInterrupt:
    print(Fore.RED + "[!] " + Fore.YELLOW + "CTRL+C Detected, Quitting! ")
