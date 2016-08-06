# astley-rm
Rickroll whoever tries to desert your *NIX system, even root.

### How it works
An alias that redirects each call of *rm* to *astley-rm.sh* is set in the global rc file of your console. This step is automatically made by the *astley-rm-config.sh* script, that edits by default /etc/profile and /etc/bash.bashrc. If you want to do this manually, here is the code:

```bash
# lines added by /usr/bin/astley-rm-config
alias rm='/usr/bin/astley-rm'
alias sudo='sudo '
```

*astley-rm.sh* then checks if the *rm* call is "malicious", namely if the *recursive* and the *force* options are used at the same time. If that happens, the *rickroll()* function in the script is called, causing http://youtu.be/dQw4w9WgXcQ to be opened in the default browser. You can always edit the function to achieve a different behaviour.

### Installation
If you are using Arch Linux based distro, here is the [link](https://aur.archlinux.org/packages/astleyrm/) to the AUR package. However, the PKGBUILD is also in this repository.

If you are on a different type of system, you need to download or clone this repository, *cd* into it and:

- Set up the aliases above or give execute permissions and execute *astley-rm-config.sh* as above (*-h* flag prints help).
- Give execute permissions to *astley-rm.sh* and place it in */usr/bin*, as *astley-rm*.
