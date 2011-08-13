# aur-repo 1.0.0

This Script is written for ArchLinux systems which provide a repository
solely containing software from the AUR. The task is to maintain a given
set of packages from the AUR and keep them up to date in the local repo.

## Usage

```
Usage: aur-repo [-n] [command] [options]

  -n : Dry run. Show executed commands but don't run them.

Commands:
  update                    Update the whole repository.
  update package            Force update of the specified package
  add package [mode]        Add new package to the list, 'mode' is the same as
                            in the config file and defaults to 'm'.
  addbuild package [mode]   Same as above plus building the package right away.
  remove package            Remove package from repository and delete all source files.
  info                      Show some info about the repository.
  list                      List all current packages in the repository database.

Config file example:

  REPONAME=my-repo
  GET_FROM_AUR=(
    package1=a
    package2=m
    package3=n
  )

Options:
a ... build always a new package
m ... only build a new package if the PKGBUILD in AUR changed
n ... ignore package (useful if the package at AUR is currently broken)

```
