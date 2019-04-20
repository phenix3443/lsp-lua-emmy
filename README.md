# lsp-lua-emmy

lsp-mode client [EmmyLua-LanguageServer](https://github.com/EmmyLua/EmmyLua-LanguageServer), inspired by [lsp-python-ms](https://github.com/andrew-christianson/lsp-python-ms) .

# Install #
Include lsp-lua-emmy in your config in your preferred manner. A minimal use-package initialization might be:

``` emacs-lisp
(use-package lsp-lua-emmy
  :demand
  :ensure nil
  :load-path "~/github/lsp-lua-emmy"
  :hook (lua-mode . lsp)
  :config
  (setq lsp-lua-emmy-jar-path (expand-file-name "EmmyLua-LS-all.jar" user-emacs-directory))
  )
```
