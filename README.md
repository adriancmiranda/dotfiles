# .files
> Colourful &amp; robust OS X configuration files and utilities.

Installation is done with simple command set (see “building system from scratch” for setup of new system):

```bash
curl --silent https://raw.githubusercontent.com/adriancmiranda/dotfiles/master/install | sh
```

Uninstallation is done with:

```bash
curl --silent https://raw.githubusercontent.com/adriancmiranda/dotfiles/master/uninstall | sh
```

To clone this project (and all its submodules):

```bash
git clone --recursive git://github.com/adriancmiranda/dotfiles.git
```
> As a prerequisite it's assumed you have [~/.ssh](https://help.github.com/articles/checking-for-existing-ssh-keys/) keys installed as this is the one dependency for using [git](http://git-scm.com/download/mac).


Options:

<table>
    <tr>
        <td><code>-h</code>, <code>--help</code></td>
        <td>Help</td>
    </tr>
    <tr>
        <td><code>-l</code>, <code>--list</code></td>
        <td>List of additional applications to install</td>
    </tr>
</table>


## Support

Bugs and issues should be reported via the [issue tracker][issue_tracker].

<!--
||
|| <External_links>
||
l'-->
[issue_tracker]: http://github.com/adriancmiranda/dotfiles/issues "Issue tracker"
[vim_ink]: http://vim.ink/ 
