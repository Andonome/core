These config files make the First Blood RPG books look and act the way they do.

# Usage

Edit 'main.tex', and input your tex files by writing `\include{my_file.tex}.

You can include pseudo-randomo creatures in your adventure by summoning the names from monsters.tex.  For example, to place a random elf in your game, just write `\elf`, and an elf will be magically summoned unto your character sheet.

For more details on the syntax, have a look at examples in *Adventures in Fenestra*.

# Texnical Details

This thing's handled as a subtree in the other documments, so changing it will change all First Blood books.

Personally, I keep it in a directory by the others.  This allows you to do:

> git subtree -P config pull ../config master

The configs also have one branch per repo, so when writing Adventures in Fenestra ('aif'), you can do a push to just that branch:

> git subtree -P config push ../config aif


