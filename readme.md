# Connect4

*"Assignment: Build Connect4!"*

## Learning Objectives:

- Build a game of Connect4
- Build it using TDD

### Personal Objective:

- Refactor code using lessons from *Refactoring: Ruby Edition* by Fields Jay, Harvie Shane, Fowler Martin and Beck Kent, and *99 Bottles of OOP* by Sandi Metz, Katrina Owen and TJ Stankus
- Have ZERO Rubocop alerts/warnings of any kind
- Post on TOP Discord to gain feedback. This is vital before attempting CHESS

#### Current status:

- Most major refactoring is complete. Just need to work on that unholy `win_detected?` method in `WinCheck` module
- Possible ways of improving it are:
1. Create a factory method that makes subclasses of `ArrayMaker` e.g. `HorizontalArrayMaker`
 - This subclass is then scanned by `win_check?`
 - That just seems to move the conditional, complicated code elsewhere though
2. Combine all arrays together so they are nested, then `win_check` scans all those arrays in one go
 - The commented wish code on line 14 alludes to this solution