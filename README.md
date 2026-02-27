# rc2014
Assembly and BASIC Programs for the RC2014 family

## Orton 3C RC2014
### Dice
- allows you to roll an arbitrary "die" from d2-d255 by setting the input switches
  - currently there is a bug that if at any point the input switches are all set to 0 then it crashes
- based on Fast RND, and an extension of D6 Fast RND
- all of the random routines require you to set your own starting random seed, which must be > 0
### D6 Fast RND
- produces a result in the range 1-6, thus simulating a regular die
- based on Fast RND below
- all of the random routines require you to set your own starting random seed, which must be > 0
### Fast RND
- This is directly copied from [Z80 info](https://www.z80.info/pseudo-random.txt), with only the output routine added for the Orton 3C
- To quote the original:
> An 8-bit pseudo-random number generator, using a similar method to the Spectrum ROM, without the overhead of the Spectrum ROM.
> R = random number seed
> an integer in the range [1, 256]
> R -> (33*R) mod 257
> S = R - 1
> an 8-bit unsigned integer
- all of the random routines require you to set your own starting random seed, which must be > 0
### Fibonacci
- This is a Fibonacci sequence for the Orton 3C RC2014.
- It requires the I/O module
- Obviously, the output doesn't make much sense above 255, but is a nice Blinkenlights routine
- I originally wrote this code for a Soviet 8080 Microtrainer - see my [video](https://youtu.be/7Rhykm3Gkuc?si=Io27PC4c3WNNVdF-).

## RC2014 Classic ][

### Giggle
- This is a faithful clone of the Boggle game. You need to apply the rules manually.
- https://instructions.hasbro.com/api/download/04601_en-us_boggle.pdf
### Spy Eyes
- This is adapted from Usborne Computer Spy Games p. 3
- Available from the publisher at https://usborne.com/row/books/computer-and-coding-books
- Has replacement for lack of INKEY$ and PRINT TAB, at least in my Classic ][ BASIC
- Actually more challenging than for example on the BBC, as the PRINT TAB replacement is slower
- This is a good thing, as the original game is too easy
### Subsector
- This is Marc Miller's 1986 BASIC program from Challenge Magazine #25
- It generates an area of space to explore with the Traveller TTRPG
- Minimally adapted from Apple BASIC to Nascom Microsoft BASIC for the RC-2014
- Mainly I removed the disk save routine and get it to just print to console
