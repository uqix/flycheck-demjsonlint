(require 'flycheck)

(flycheck-define-checker json-demjsonlint
  "A JSON syntax and style checker using jsonlint from demjson.

See URL `https://github.com/dmeranda/demjson'."
  :command ("demjsonlint" source)
  :error-patterns
  ((warning line-start
            (file-name)
            ":" line
            ":" column ": Warning: "
            (message) line-end)
   (error line-start
          (file-name)
          ":" line
          ":" column ": Error: "
          (message) line-end))
  :error-filter
  (lambda (errors)
    (flycheck-sanitize-errors errors))
  :modes json-mode)


;;;###autoload
(defun flycheck-demjsonlint-setup ()
  "Setup Flycheck demjsonlint.
Add `json-demjsonlint' to `flycheck-checkers'."
  (interactive)
  (add-to-list 'flycheck-checkers 'json-demjsonlint))

(provide 'flycheck-demjsonlint)
