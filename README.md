# clojure-install

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Wrapper and Utility for Clojure

## 🛑 Project Status: Deprecated & Retired

This project is now **officially archived and no longer maintained**. 

It served its original purpose well by providing a lightweight wrapper to fill the gaps in the early Clojure ecosystem (such as bootstrapping the REPL environment and managing basic dependency paths automatically on Windows and Unix).

With the maturation of the Clojure ecosystem, we highly recommend that users transition to modern, native tools. Specifically, you should check out **[Babashka](https://babashka.org)**—a fast, native Clojure scripting environment that provides instant startup times, deep tool integration, and full cross-platform support without the need for manual heuristic wrappers.

Thank you to everyone who used and supported this project!

## System Requirements

* JDK
* Clojure
* jline 1.x, only for Windows
* (Optional) `rlwrap`, only for Unix

Our script will download Clojure and jline automatically. Hence, you don't need to manage dependency issues except JDK itself.

`rlwrap` support is detected and added automatically if it is available on a host.

We test our scripts against OpenJDK.

## Usage

### Windows

Download [clojure-install.bat](https://raw.githubusercontent.com/cwchentw/clojure-install/master/clojure-install.bat)

Run *clojure-install.bat* without parameter to install Clojure to default location:

```
> clojure-install.bat
```

Default installation path is **%USERPROFILE%***\clojure*, e.g. *C:\Users\user\clojure*.

Run the script with parameter to install Clojure to some specific prefix:

```
> clojure-install.bat %USERPROFILE%\opt
```

In this case, Clojure will be installed to **%USERPROFILE%***\opt\clojure*, e.g. *C:\Users\user\opt\clojure*.

Remember to set **PATH** variable by yourself. Later, call Clojure with *cljrun.bat*.

### Unix

Download [clojure-install](https://raw.githubusercontent.com/cwchentw/clojure-install/master/clojure-install)

Run *clojure-install* without parameter to install Clojure to default location:

```
$ clojure-install
```

Default installation path is **$HOME**/clojure, e.g. */home/user/clojure*.

Run the script with parameter to install Clojure to some specific prefix:

```
$ clojure-install $HOME/opt
```

In this case, Clojure will be installed to **$HOME**/opt/clojure, e.g. */home/user/opt/clojure*.

Remember to set **PATH** variable by yourself. Later, call Clojure with *cljrun*.

## Note

To avoid name collision with official Clojure CLI tools, we name our main scripts *cljrun* on Unix and *cljrun.bat* on Windows.

## For Windows Users

As our *cljrun.bat* script adds jline 1.x support to the REPL environment of Clojure, press *Ctrl + d* to quit its interactive mode.

## For Unix Users

Since our *cljrun* script adds optional `rlwrap` support to the REPL environment of Clojure, press *Ctrl + d* to exit its interactive mode if `rlwrap` is available on the host.

## Known Issues

Currently, our script fails to compile Clojure with system Maven.

On Windows, `Invoke-WebRequest` cmdlet is only supported on PowerShell 3.0 or above. PowerShell 3.0 is available on Windows 8 or Windows 7 with Service Pack 1.

## Copyright

Copyright (c) 2020 ByteBard. Licensed under MIT.
