# Flycheck checker for [json-mode][json-mode-ref] using jsonlint from [demjson][demjson-ref]

This package provides a [flycheck][flycheck-ref] checker for json-mode using jsonlint from demjson.


## Why another JSON checker

The built in JSON checker uses [zaach/jsonlint][jsonlint-ref] which has no rules support,
but jsonlint from demjson has a set of options let you control which checks are to be performed,
e.g. trailing-comma is allowed in .eslintrc but forbidden in package.json.


## Installation
  0. Uninstall zaach/jsonlint if necessary to avoid conflicts: `npm -g uninstall jsonlint`
  1. Install demjson: `pip install demjson` or `easy_install demjson`, more info at [installing-demjson][installing-demjson-ref]
  2. Install flycheck-demjsonlint which is available from [![MELPA](https://melpa.org/packages/flycheck-demjsonlint-badge.svg)](https://melpa.org/#/flycheck-demjsonlint): `M-x package-install [RET] flycheck-demjsonlint [RET]`.


## Configuration

```el
(require 'flycheck-demjsonlint)
```

## Lint Rules(.demjsonlintrc)
  * Built-in support: .eslintrc, package.json
  * Precedence: ~/.demjsonlintrc over pkg-dir/.demjsonlintrc
  * Format: one record per line, `filename=jsonlint-cmd-options`, e.g. `.eslintrc=-S`
  * Implementation: demjsonlint is just a wrapper of jsonlint from demjson, jsonlint-cmd-options is passed to jsonlint as is


[demjson-ref]: https://github.com/dmeranda/demjson "demjson"
[json-mode-ref]: https://github.com/joshwnj/json-mode "json-mode"
[jsonlint-ref]: https://github.com/zaach/jsonlint "jsonlint"
[flycheck-ref]: http://www.flycheck.org "Flycheck"
[installing-demjson-ref]: http://deron.meranda.us/python/demjson/install
