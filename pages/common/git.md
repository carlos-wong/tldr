# git

> Distributed version control system.
> Homepage: <https://git-scm.com/>.

- Check the Git version:

`git --version`

- Call general help:

`git --help`

- Call help on a command:

`git help {{command}}`

- Execute Git command:

`git {{command}}`

- Skip the comimt is not merge commit when bisect

`git rev-list --all --max-parents=1 |xargs git bisect skip`
