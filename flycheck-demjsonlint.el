;;; flycheck-demjsonlint.el --- Flychecker for json-mode using jsonlint from demjson

;; Copyright (C) 2016 Zenkie Zhu

;; Author: Zenkie Zhu <451218651@qq.com>
;; Keywords: convenience, tools
;; Homepage: https://github.com/z4139jq/flycheck-demjsonlint
;; Version: 0.1
;; Package-Requires: ((flycheck "30"))

;;; License:

;; Licensed under the MIT license, see:
;; https://github.com/z4139jq/flycheck-demjsonlint/blob/master/LICENSE

;;; Commentary:

;;; This package provides a flycheck checker for json-mode using jsonlint from demjson which support lint rules.
;;; How-To: https://github.com/z4139jq/flycheck-demjsonlint/blob/master/README.md

;;; Code:

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
  (add-to-list 'flycheck-checkers 'json-demjsonlint)
  (let* ((lib-file (locate-library "flycheck-demjsonlint"))
         (lib-dir (file-name-directory lib-file))
         (lint-file (concat lib-dir "demjsonlint")))
    (setq flycheck-json-demjsonlint-executable lint-file)))

(provide 'flycheck-demjsonlint)
;;; flycheck-demjsonlint.el ends here
