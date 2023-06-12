       IDENTIFICATION DIVISION.
       PROGRAM-ID. cf.

      *> CDDL HEADER
      *> --------------
      *> The contents of this file are subject to the terms of the
      *> Common Development and Distribution License, Version 1.1 only
      *> (the "License").  You may not use this file except in compliance
      *> with the License.
      *>
      *> See the file LICENSE in this distribution for details.
      *> A copy of the CDDL is also available via the Internet at
      *> https://spdx.org/licenses/CDDL-1.1.html
      *>
      *> When distributing Covered Code, include this CDDL HEADER in each
      *> file and include the contents of the LICENSE file from this
      *> distribution.
      *> --------------

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
      *> We store four variables here:
      *> - input unit (c/C or f/F)
      *> - input value (decimal number)
      *> - formatted input (without leading zeroes)
      *> - output value (without leading zeroes)

       01 input-unit PIC X(1) VALUE SPACES.
       01 input-value PIC S9(10)V999 COMP-3.
       01 input-formatted PIC +ZZ9.99.
       01 output-value PIC +ZZ9.99.

       PROCEDURE DIVISION.
       PERFORM 0000-START.

       0000-USAGE.
           DISPLAY "Usage: cf <source: 'c' or 'f'> <value>."
           STOP RUN.

       0000-START.
           ACCEPT input-unit FROM ARGUMENT-VALUE
           IF input-unit = SPACE OR LOW-VALUES THEN
      *> argv[1] should be C or F, but is not set instead.
      *> argv[2] defaults to 0.0.
               PERFORM 0000-USAGE
           ELSE
      *> Cleanup: trim() input-unit
               INSPECT input-unit REPLACING ALL SPACES BY LOW-VALUES
               MOVE FUNCTION UPPER-CASE(input-unit) to input-unit
           END-IF

           ACCEPT input-value FROM ARGUMENT-VALUE
           MOVE input-value TO input-formatted

           IF input-unit = "C" THEN
               COMPUTE output-value = input-value * (9 / 5) + 32
               DISPLAY input-formatted " °C = " output-value " °F"
           ELSE
               COMPUTE output-value = (input-value - 32) * (5 / 9)
               DISPLAY input-formatted " °F = " output-value " °C"
           END-IF

       STOP RUN.
.
