import random
import time
from datetime import datetime
from cryptography import AES
from cryptography import pad

time_now = int(time.time())
random.seed(time_now)
KEY_SIZE = 16
KEY = bytearray(random.getrandbits(8) for _ in range(KEY_SIZE))
BLOCKSIZE = 32

FLAG = b"<< SAMPLE FLAG >>"

cipher = AES.new(KEY, AES.MODE_ECB)
ct = cipher.encrypt(pad(FLAG, BLOCKSIZE)).hex()

print("========================== SUPER SECURE ENCRYPTION ==========================")
print("\n\nCIPHERTEXT:",ct)
print("GENERATED AT:",datetime.fromtimestamp(time_now))
print("\n\n=============================================================================")