|             Downloads                |         Resources             |
|:-------------------------------------|:------------------------------|
| [Core Book][core download]           | [Wiki][wiki]                  | 
| [Character Sheets][resources]        | [World Wiki][fenwiki]         |
| [Condensed Rules][rules summary]     | [Email an idea][issues email] |
| [Introduction Module][intro module]  | [Issues Board][board]         |


BIND is an open-source, grunge-fantasy, tabletop RPG, which:

- optimizes the crap out of everything (in ways you probably won't notice),
- is an 'adult game' (meaning we all have jobs, and need to set-up-and-go without homework or very much prep),
- will never have any house rules (because anyone can change the source files and reprint the PDF).

# Getting the Book

Download it from the [link][core download], then take it to your local, friendly, print-shop.
Everything in the book has been optimized for reading on paper.
But reading two-columns of blinding-white PDF on a monitor will only give you a headache.

## Compiling the Book Yourself

1. Clone this repo.
1. Install the required packages:
    * For Debian/ Mint/ Ubuntu: `inkscape`, `make`, `texlive-full`, `git-lfs`, and `latexmk`.
    * For Arch Linux: `inkscape`, `make`, `texlive-most`, `git-lfs`, and `texlive-binextra`.
    * For Void Linux: `inkscape`, `make`, `texlive-full`, `git-lfs`, and `texlive-latexmk`.
1. Enter the repo, and do `make all`.

For full instructions on compiling, see the [wiki](https://gitlab.com/bindrpg/core/-/wikis/dev/Compiling).

## Related Books

- For a short introduction module, grab a copy of [Escape from the Horde][intro module].  It comes with a running commentary of the rules, and pre-made character sheets, ready to be torn from the back.
- For character creation, print the [players' guide][stories].
- To craft your own section of a monster-ridden world, open the [Book of Judgement][judgement].

# Rules

All rules are geared towards fast resolutions and player choices.

- One roll resolves almost everything.
    * Roll `2D6 + Attribute + Skill + Bonus`.
        - Bonuses come from weapons, items, or the situation.
    * Players try to roll above the TN ('Tie Number') to achieve something, while avoiding some danger.
        - If they roll above the TN, they succeed.
        - If you roll below the TN, the danger occurs.
        - If you roll equal to the TN, they succeed *but* the danger also occurs.
    * Dice are never re-rolled.
        - If a different character tries the action, they must use the same dice roll.  So if the first character rolled a '5', the second will also have rolled a '5' (but a higher Bonus means they may still succeed).
- Combat works similarly.
    * In combat, attack and defence are the same roll.
        - If you miss, the enemy damages you.
        - Players spend Action Points to determine who goes first, and decide where their character is focussed.
- Spellcasters spend Mana Points.
- GMs don't roll often, so they can focus on interpretation and reaction.

# Get Involved

The book is under an open source licence, you have access to the same files which I do.
Anyone who plays it can change the book with their own rules.
If you want to get involved, there are a number of ways to contribute:

- Emailing ideas [here][issues email] and they will appear on the [issues board][board].
- Posting ideas directly on the [board][board].
- Join the project, and start fixing issues.
- Playtesting.
- Contributing art.
- Or if you don't like how I'm handling the book, fork it and make your own.

[core download]: https://gitlab.com/bindrpg/core/-/jobs/artifacts/master/raw/core.pdf?job=build
[resources]: https://gitlab.com/bindrpg/config/-/jobs/artifacts/master/raw/resources.pdf?job=build
[wiki]: https://gitlab.com/bindrpg/core/-/wikis/home
[aif]: https://gitlab.com/bindrpg/aif
[board]: https://gitlab.com/bindrpg/core/issues
[issues email]: mailto:incoming+bindrpg-core-16324687-issue-@incoming.gitlab.com
[rules summary]: https://gitlab.com/bindrpg/config/-/jobs/artifacts/master/raw/rules.pdf?job=build
[intro module]: https://gitlab.com/bindrpg/oneshot/-/jobs/artifacts/master/raw/oneshot_horde_escape.pdf?job=build
[stories]: https://gitlab.com/bindrpg/stories/-/jobs/artifacts/master/raw/stories.pdf?job=build
[fenwiki]: https://gitlab.com/bindrpg/aif/-/wikis/home
[judgement]: https://gitlab.com/bindrpg/judgement/-/jobs/artifacts/master/raw/judgement.pdf?job=build

