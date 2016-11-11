# Flycheck checker for [json-mode][json-mode-ref] using jsonlint from [demjson][demjson-ref]

This package provides a [flycheck][flycheck-ref] checker for json-mode using jsonlint from demjson.


## Why another JSON checker

The built in JSON checker uses [zaach/jsonlint][jsonlint-ref] which has no rules support,
but jsonlint from demjson has a set of options let you control which checks are to be performed,
e.g. trailing-comma is allowed in .eslintrc but forbidden in package.json.


## Installation
  0. Uninstall zaach/jsonlint if necessary to avoid conflicts
  1. Install demjson by following [this instruction][installing-demjson-ref]
  2. Drop files demjsonlint/* into your bin dir which is in the PATH
  3. Drop file flycheck-demjsonlint.el into your lisp dir which is in the load-path


## Configuration

```el
(require 'flycheck-demjsonlint)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-demjsonlint-setup))
```

## .demjsonlintrc
  * Format: one record per line, `filename=jsonlint-cmd-options`, e.g. `.eslintrc=-S`
  * Precedence: ~/.demjsonlintrc over demjsonlint-bin-dir/.demjsonlintrc
  * Implementation: demjsonlint is just a wrapper of jsonlint from demjson, jsonlint-cmd-options is passed to jsonlint as is


[demjson-ref]: https://github.com/dmeranda/demjson "demjson"
[json-mode-ref]: https://github.com/joshwnj/json-mode "json-mode"
[jsonlint-ref]: https://github.com/zaach/jsonlint "jsonlint"
[flycheck-ref]: http://www.flycheck.org "Flycheck"
[installing-demjson-ref]: http://deron.meranda.us/python/demjson/install
