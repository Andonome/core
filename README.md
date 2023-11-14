# BIND

BIND is an open-source, grunge-fantasy, tabletop RPG.

|             Downloads                |         Questions             |
|:-------------------------------------|:------------------------------|
| [Core Book][core download]           | [Wiki][wiki]                  | 
| [Character Sheets][resources]        | [Email an idea][issuesEmail]  |
| [Condensed Rules][rules summary]     | [Issues Board][board]         |
| [Introduction Module][intro module]  |                               |

# Setting

Ever play an RPG, and get really pedantic thoughts?

>>>
You finally arrive in the little hamlet of Encworth, exhausted from your fight with the Manticore, and still tending your wounds from the first day's battle with the cockatrice.

The farmer's children stop their work, and come over to ask a thousand questions.
>>>

Sorry, whut?
This land has 'wandering monsters', ready to turn people into stone, and *then* eat them.
How does anyone raise a family here?
Who put all these traps down here?
How do people trade?

The world emerged as a series of answers to pedantic questions.
This is the fantasy world where dragons plan for inflation, and gnolls have a day-rate.

## Related Books

- For a short introduction module, grab a copy of [Escape from the Horde][intro module], and the pre-gen [character handouts][intro handouts].
- For personalized character creation, snatch the [players' guide][stories].
- To craft your own section of a monster-ridden world, open the [Book of Judgement][judgement].

# Rules

All rules are geared towards fast resolutions and player choices.

- One roll resolves almost everything.
    * You roll for dangerous actions, so when characters fail, the danger occurs.
    * If the first character couldn't 'lift the gate', the second has to take the same dice result and add their own Bonuses.  Luck won't help the weak.
- Combat works similarly.
    * Attack and defence are the same roll.
    * If you miss, the enemy damages you.
    * No initiative rolls - just go!
    * Whoever has the most Action Points can interrupt and demand to go first.
- GMs don't roll much, so they can focus on orchestration.
- Spellcasters spend Mana Points.

# Compiling

The dependencies are

- `texlive-full`
- `git`
- `git-lfs`
- `inkscape`
- `make`

To make the document,

1. type `make`.
2. Take the pdf to your local, friendly, printing store.

For more detailed instructions, see the wiki on [setting up](https://gitlab.com/bindrpg/core/-/wikis/dev/startup).

# Get Involved

The book is under an open source licence, so whoever plays it decides how it gets to work.
If you want to get involved, there are a number of ways to contribute:

- Emailing ideas [here][issuesEmail] and they will appear on the [issues board][board].
- Posting ideas directly on the [board][board].
- Join the project, and start fixing issues.
- Playtesting.
- Contributing art.
- Or if you don't like how I'm handling the book, fork it and make your own.

[core download]: https://gitlab.com/bindrpg/core/-/jobs/artifacts/master/raw/core.pdf?job=build
[resources]: https://gitlab.com/bindrpg/core/-/jobs/artifacts/master/raw/resources.pdf?job=build
[wiki]: https://gitlab.com/bindrpg/core/-/wikis/home
[aif]: https://gitlab.com/bindrpg/aif
[cs]: https://gitlab.com/bindrpg/core/-/blob/ods/calc_cs/bind_cs.ods
[board]: https://gitlab.com/bindrpg/core/issues
[issuesEmail]: mailto:incoming+bindrpg-core-16324687-issue-@incoming.gitlab.com
[rules summary]: https://gitlab.com/bindrpg/config/-/jobs/artifacts/master/raw/rules.pdf
[intro module]: https://gitlab.com/bindrpg/oneshot/-/jobs/artifacts/master/raw/oneshot_horde_escape.pdf?job=build
[intro handouts]: https://gitlab.com/bindrpg/oneshot/-/jobs/artifacts/master/raw/oneshot_handouts.pdf?job=build
[stories]: https://gitlab.com/bindrpg/stories/-/jobs/artifacts/master/raw/stories.pdf?job=build
[judgement]: https://gitlab.com/bindrpg/judgement/-/jobs/artifacts/master/raw/judgement.pdf?job=build
