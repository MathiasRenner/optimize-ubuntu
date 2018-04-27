# Optimize Ubuntu

**THIS SOFTWARE IS NOT READY TO USE YET - ALPHA STATUS**

This project ships a script that optimizes Ubuntu against the following goals:

  - Maximize usability by installing apps that most users require regularly
  - Maximize security and the user's privacy
  - Minimize the occurrence of errors in a long term

These goals are based on the values of [Bitleaf – Sustainable IT Solutions](https://www.bitleaf.de).


## How to use

For Ubuntu **18.04**, copy these commands into your terminal and run them: 

```
sudo apt install -y curl 
sudo curl -s https://raw.githubusercontent.com/bitleaf/optimize-ubuntu/master/optimize-ubuntu-18-04.sh -o /tmp/optim.sh
sudo bash /tmp/optim.sh
```

For Ubuntu **<= 17.10**, run this command: 
```
sudo apt install -y curl && curl -s https://raw.githubusercontent.com/bitleaf/optimize-ubuntu/master/optimize-ubuntu-16-04.sh | bash
```


## License

![](https://www.gnu.org/graphics/gplv3-127x51.png)

The project is licensed unter the GPLv3.

Copyright (C) Mathias Renner

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

See <http://www.gnu.org/licenses/> fore more information.
