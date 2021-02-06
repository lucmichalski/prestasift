# prestasift
Prestashop code static analysis and vulnerabilities

## Quick run
```sh
$ ./check.sh
```

## Goals
- create terminal ui for validating safe sql statements
- create a hash for each matching result
- validate only not moderated sql statements
- ablility to scroll the file if the sql statement is a variable
- create a config file for loading scanning options
- generate a csv, json output from the results

## References
- https://github.com/gizak/termui
- https://github.com/jroimartin/gocui 
-	https://github.com/xxjwxc/public/tree/master/myclipboard
- https://github.com/xxjwxc/public/tree/master/mycui
- https://github.com/jinzhu/configor
- https://github.com/agrison/go-tablib
- https://github.com/go-gorm/gorm

## Examples of TUI
![alt text](https://raw.githubusercontent.com/xxjwxc/gormt/master/image/gormt/ui_en.gif "gormt cui")
![alt text](https://raw.githubusercontent.com/asciimoo/wuzz/master/docs/images/screencast.gif "wuzz tui")
