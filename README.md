# Language Game

## Game Description
The player will see a word in language „one“ on the screen. While this word is displayed, a word in language „two“ will fall down on the screen. The player will have to choose if the falling word is the correct translation or a wrong translation. The player needs to answer, before the word reaches the bottom of the screen. A counter that gives the player feedback should be included.

## Work process
**Time invested**  ~ 8h
**Time planing**:
 1. architecting and modeling — 30min
 2. working on file reader (writing first draft version, refactoring) — 1h
 3. implementing Models — 30min
 4. implementing game logic — 3h
 5. design — 30min
 6. tests and refactoring — 2-3h
 7. documenting - 20min
 
 ## Game logic
 It was decided to have a maximum of 4 attempts to give a wrong answer (fail) until the game is finished. Every 4th question is wrong. User fails if correct translation is marked as incorrect or incorrect one is marked as correct.
 
 ## Restrictions due to time limit
 1. There was no animation implemented for failing words, so the user has unlimited time to decide wether translation is correct or not.
 2. The frequency of showing wrong translation is hardoced to be 4.
 3. No design support for iPhone X
 4. The gameplay is very limited, no ability to restart game
 
 ## Things to be improved
 1. Implement animation so that user has limit time for providing answer
 2. Provide interface for changing wrong answers limit (Inject wrongAnswer limit so you can initialise maximum number of fail answers)
 3. Randomise the frequency of showing wrong translation
 4. Write more tests for checking game UX, check when buttons are allowed to be pressed, check when the game should be finished.
