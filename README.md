# clojure-install

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Wrapper and Utility for Clojure

## System Requirements

* JDK
* Maven
* Clojure
* Git

Our script will download Maven and Clojure automatically. Hence, you don't need to manage dependency issue except JDK itself.

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

Remember to set **PATH** variable by yourself. Later, call Clojure with *clojure.bat*.

### Unix

Download [clojure-install](https://raw.githubusercontent.com/cwchentw/clojure-install/master/clojure-install).

Run *clojure-install* without parameter to install Clojure to default location:

```
$ clojure-install
```

Default installation path is **$HOME***/clojure*, e.g. */home/user/clojure*.

Run the script with parameter to install Clojure to some specific prefix:

```
> clojure-install.bat $HOME/opt
```

In this case, Clojure will be installed to **$HOME***/opt/clojure*, e.g. */home/user/opt/clojure*.

Remember to set **PATH** variable by yourself. Later, call Clojure with *clojure*.

## Known Issues or Bugs

Currently, our script fails to compile Clojure with system Maven.

## Copyright

Copyright (c) 2020 Michael Chen. Licnesed under MIT.
