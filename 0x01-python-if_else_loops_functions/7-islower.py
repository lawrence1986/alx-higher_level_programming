#!/usr/bin/python3
# Compiled by: Lawrence Maduabuchi
# Date: 6/6/2023
def islower(c):
    """This function checks for lowercase characters."""
    if ord(c) >= 97 and ord(c) <= 122:
        return True
    else:
        return False
