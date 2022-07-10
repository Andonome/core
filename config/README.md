These config files make the BIND RPG books look and act the way they do.

# Usage

To make a book, put this config folder into the same directory.

> git subtree add -P config git@gitlab.com:bindrpg/config.git master

Then copy main.tex into your main folder and make a symbolic link to the `.gitignore` file.

> cp config/main.tex .

> cp config/.gitignore .

Edit 'main.tex', and input your tex files by writing `\include{my_file.tex}.

## Creatures

You can include pseudo-randomo creatures in your adventure by summoning the names from monsters.
.  For example, to place a random elf in your game, just write `\elf`, and an elf will be magically summoned unto your adventure.

```
\elf
```

You can give the character a title and name by writing '\npc{symbol}{name}' as an optional argument.
For example:

```
\humanalchemist[\npc{\M}{Rincewind}]

```

This would make a heading called **Rincewind** in bold with a male symbol, and provide pseudo-random alchemist-appropriate stats underneath.

| Syntax | Symbol |
|:------:|:------:|
| \\M    | Male   |
| \\F    | Female |
| \\T    | Team   |
| \\D    | Undead |
| \\N    | Nura   |

For a complete list of all the creatures and characters which can be used, see the 'monsters.tex' file.
For more details on the syntax, have a look at examples in *Adventures in Fenestra*, or read the git's wiki.

# TeXnical Details

This thing's handled as a subtree in the other documments, so changing it will change all BIND books.

Personally, I keep it in a directory by the others.  This allows you to do:

> git subtree -P config pull ../config master

