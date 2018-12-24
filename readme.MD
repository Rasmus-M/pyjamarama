# Pyjamarama

For the TI-99/4A home computer.

Based on the ZX Spectrum disassembly found at http://www.luny.co.uk/

Original game by Chris Hinsley, Mikro-Gen, 1984.

TI-99/4A version developed November-December 2018 by Rasmus Moustgaard.

## Building the game

The xdt99 cross-development tools are required to build the game.
See https://github.com/endlos99/xdt99

Java is required to build the cartridge version.

On Windows, run make.bat to build the game.

## Running the game

There are 3 options for running the game:

* With 32K expansion and disk system: Run E/A#5 DSK1.PYJA1. Includes full game but has no music and a limited ending.
* With 32K expansion, disk system and Supercart: Run E/A#5 DSK1.PYJASC1. Includes everything except the title screen.
* With 32K and 64K physical (non-inverted) cartridge, FinalGROM99, or emulators: Burn and run pyjamarama-8.bin. Includes everything.

## License

My code and game is free to use for non-commercial purposes.

## Acknowledgements

Thanks to:

* Luny for his ZX Spectrum disassembly, which made this project possible. 
  http://www.luny.co.uk/
* Tursi for the use of his VGM compressor and player. 
  http://www.harmlesslion.com/cgi-bin/onesoft.cgi?88
* Ralph for his xdt99 tools.
  https://github.com/endlos99/xdt99

## Contact

Please post comments or questions at:
http://atariage.com/forums/topic/285537-pyjamarama/

Rasmus Moustgaard <rasmus.moustgaard@gmail.com>
