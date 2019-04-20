;;; lsp-lua-emmy.el --- lsp-mode client for EmmyLua-LanguageServer -*- lexical-binding: t -*-

;; Author: phenix3443@gmail.com
;; Maintainer: phenix3443@gmail.com
;; Version: 0.1.0
;; Package-Requires: ((cl-lib "0.6.1") (lsp-mode "6.0") (emacs "24.4"))
;; Homepage: https://github.com/phenix3443/lsp-lua-emmy
;; Keywords: languages tools


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; from

;;; Code:
(require 'cl-lib)
(require 'lsp-mode)

(defvar lsp-lua-emmy-jar-path nil
  "Path to language server directory.

This is the directory containing EmmyLua-LS-all.jar.")

(defun lsp-lua-emmy--find-java()
  "Get the path to java."
  (cond
   ((boundp 'lsp-lua-emmy-java) lsp-lua-emmy-java)
   ((executable-find "java"))
   (t nil))
  )

(defvar lsp-lua-emmy-java
  (lsp-lua-emmy--find-java)
  "Full path to java executeable.

You only need to set this if java is not on your path.")


(defun lsp-lua-emmy--command-string()
  "Return the command to start the server."
  (cond
   ((boundp 'lsp-lua-emmy-jar-path) (list lsp-lua-emmy-java
                                          "-cp"
                                          lsp-lua-emmy-jar-path
                                          "com.tang.vscode.MainKt"))
   (t (error "Cound not find EmmyLua-LS-all.jar"))))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection 'lsp-lua-emmy--command-string)
                  :major-modes '(lua-mode)
                  :server-id 'emmy-lua-ls
                  :notification-handlers
                  (lsp-ht
                   ("emmy/progressReport" 'ignore))))


(provide 'lsp-lua-emmy)

;;; lsp-lua-emmy.el ends here
