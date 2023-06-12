# Celsius <-> Fahrenheit converter

Just a one-trick pony.

## Requirements

* A computer.
* GnuCOBOL (`cobc` needs to be available).

## Compilation

* Using `make`: `cd src ; make`.
* Using `cobc`: `cd src ; cobc -x cf.cob`.

## Usage

    % cf <source unit> <source value>

### Example

    % cf c 0
    +  0.00 °C = + 32.00 °F

    % cf f 32
    + 32.00 °F = +  0.00 °C

Note that `cf` rounds to two digits. The maximum supported temperature is 9999999999.99 degress because why not?

## Support

No.

## Contributions

Yes, please.
