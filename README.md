# AutoIt Ashley

## AutoIt Help
- [Docs](https://www.autoitscript.com/autoit3/docs/)
- [Keyword Reference](https://www.autoitscript.com/autoit3/docs/keywords.htm)
- [Macro Reference](https://www.autoitscript.com/autoit3/docs/macros.htm)
- [Function Reference](https://www.autoitscript.com/autoit3/docs/functions.htm)
- [User Function Reference](https://www.autoitscript.com/autoit3/docs/libfunctions.htm)

## Rules
There are 9 messages that might send. The customers timezone is used to localize
the rule.

```
:: start of day window ::
9:03-9:28a (no 5s, no 0s)

:: end of day ::
6:57p

1 - immediately
2 - immediately
3 - 1h delay
-----------------
::  if 7 sends before ::end of day::
4 - 2-2.5h delay
5 - 1.5-3h delay
6 - 1m delay
7 - 10-15m delay
-----------------
::  otherwise skip to ::start of day::
8 - immediately
9 - immediately
3 - 1h delay
4 - 3h delay
5 - 4:30p-5:30p
6 - 1m delay
7 - 10-15m delay
```

## Resource Links

[Ashley Graphic](https://publicdomainvectors.org/en/free-clipart/Fashionable-woman-silhouette/58208.html)