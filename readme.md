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

- Complete! All major refactorings finished. 100% there is major room for improvement in terms of overall design, but rubocop is at zero and I successfully applied refactoring techniques gained from the books above. It's a good step forward at least

#### Lessons learned / Things to work on: 

- TDD coverage was not at 100% due to the `ArrayMaker` class and `WinCheck` module created to assist the public API
- I noticed that, when the project began, methods that would otherwise be private are being tested e.g. `Board#set_cell_coordinates`
- Is it necessary to make those methods private later, after testing, then change tests so that they only test public methods? Find out before starting Chess