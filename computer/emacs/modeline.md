The default modeline:

```elisp
(
  "%e" ; OOM indicator
  mode-line-front-space ; variable spacing
  mode-line-mule-info ; multilingual environment info
  mode-line-client ; identifier for emacsclient frames
  mode-line-modified ; asterisks if modified
  mode-line-remote ; is file remote?
  mode-line-frame-identification ; ?? 
  mode-line-buffer-identification ; the file name
  "   "
  mode-line-position ; `Top|n%|Bottom (line,colum)`
  (vc-mode vc-mode) ; Version control info
  "  "
  mode-line-modes ; list of active amjor and minor modes
  mode-line-misc-info
  mode-line-end-spaces
)
```

* `evil-mode-line-tag` - `<N|I|V>` 
