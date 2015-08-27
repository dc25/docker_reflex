# dockerfile_for_haskell

This repository holds a Dockerfile and a collection of scripts that are used by the Dockerfile.  The Dockerfile is used to build a Haskell development environment.

The resulting environment contains the following

* Compilers
  * ghc 7.8.4  (built from source using haskell-platform, disabled by default)
  * ghc 7.10.2 (built from source using ghc 7.8.4)
  * haste 0.5.0 (built from source using ghc 7.8.4)
  * ghcjs ( the most recent as of time of image creation ; built from source using ghc 7.10.2 )  
  * typescript (via npm)
* Haskell development tools
  * cabal 1.22.6  (built from source)
  * ghc-mod & ghc-modi (built from source)
  * hdevtools (via cabal)
  * ghcid (via cabal)
  * hlint (via cabal)
  * stack (from fpcomplete via apt-get)
* Editors
  * vim (via apt-get; with Haskell related extensions)
    * pathogen (cloned from github)
    * syntastic (cloned from github)
    * vim-hdevtools (cloned from github)
    * vim2hs (cloned from github)
  * atom (from atom.io; with Haskell related extensions)
    * language-haskell  (via apm)
    * haskell-ghc-mod  (via apm)
    * ide-haskell  (via apm)
    * autocomplete-haskell`(via apm)
* Miscelaneous
  * sshd (via apt-get)
  * tmux (via apt-get)

Edit the personalize script before building the development environment.  The most important thing you need to change in the personalize script is the public key value near the top.  This will allow passwordless ssh login from the host machine.

Use docker to build the development environment :

    docker build -t ghc .

Use docker to run the development environment :

    docker run -v <hostDirectory>:<pathToHostDirectoryInContainer> ghc 

Use docker to identify the ip address of the running container:

    docker ps -q | xargs dockr inspect --format '{{ .NetworkSettings.IPAddress }}'

Use ssh/tmux to log in to the running container:

    ssh -l root <ipAddress> -X -t 'tmux a || tmux || /bin/bash'

Use tmux to create new 'panes' in the terminal.

| Keystrokes ---> | Effect |
|:-------------|:-------|
| ^b %         | split screen vertically |
| ^b "         | split screen horizontally |
| ^b o         | move to next pane |

Have fun!

For more (probably too much) detail, see [here](http://dc25.github.io/myBlog/2015/08/27/building-and-using-haste-0.5.0-in-docker.html) and [here](http://dc25.github.io/myBlog/haskell/ghcjs/docker/2015/08/05/installing-and-using-ghcjs-in-a-docker-image.html)


