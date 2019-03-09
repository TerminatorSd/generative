# !/usr/bin/python3
import os
import stat

filename = './tmpfile.doc'
# mode = 0600|stat.S_IRUSR

# filesystem node specified with different modes
os.mknod(filename)
