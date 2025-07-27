# Corn tests

This repository contains test cases for the Corn configuration layout.

- The `corn` folder contains input test cases, in two categories:
    - `.pos.corn` files contain positive cases, expected to succeed.
    - `.neg.corn` files contain negative cases, expected to fail.

Each positive case is backed with a JSON file containing the expected output.
Any parser implementations are expected to parse each positive case, and each corresponding JSON file, and perform a deep equality check.
Any difference in equality is considered a test failure. 

For floats, a literal equality check of course cannot be performed. Instead this should be checked within a reasonable margin of error.

Negative tests always include a single value only.