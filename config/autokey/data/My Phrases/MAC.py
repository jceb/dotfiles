# create a random MAC address based on the current time
# this allows a generation of 1 MAC address per second plus a random leader that should allow you to type as fast as you can 
import time
import random
t = str(int(time.time()))[-10:]
set_unicast_mac = (1 << 8) - (1 << 1) # least significant bit 0 
set_local_administrated_mac = 1 << 1 # second least significant bit 1
keyboard.send_keys(':'.join([hex(random.randint(0, 255) & set_unicast_mac | set_local_administrated_mac)[2:].rjust(2, '0')] + [ j + k for j, k in zip(t[::2], t[1::2])]))