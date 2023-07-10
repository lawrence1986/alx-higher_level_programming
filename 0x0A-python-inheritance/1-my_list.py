#!/usr/bin/python3
"""Defines inherited list class MyList."""


class MyList(list):
    """This Implements sorted printing for the built-in list class."""

    def print_sorted(self):
        """This Prints a list in sorted ascending order."""
        print(sorted(self))
