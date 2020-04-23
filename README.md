# clojure-install

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Wrapper and Utility for Clojure

## System Requirements

* JDK
* Maven
* Clojure

Our script will download Maven and Clojure automatically. Hence, you don't need to manage dependency issue.

We test our script against OpenJDK.

## Usage

### Windows

Download [clojure-install.bat](https://github.com/cwchentw/clojure-install/blob/master/clojure-install.bat)

Run *clojure-install.bat* without parameter to install Clojure to default location:

```
> clojure-install.bat
```

Default installation path is **%USERPROFILE%***\clojure*, e.g. *C:\Users\user\clojure*.

Run the script with parameter to install at a specific prefix:

```
> clojure-install.bat %USERPROFILE%\opt
```

In this case, Clojure will be installed to **%USERPROFILE%***\opt\clojure*, e.g. *C:\Users\user\opt\clojure*.

Remember to set **PATH** variable by yourself. Later, call Clojure with *clojure.bat*.

### Unix

Pending.

## Known Issues or Bugs

Currently, our script fails to compile Clojure with system Maven.

## Copyright

Copyright (c) 2020 Michael Chen. Licnesed under MIT.
