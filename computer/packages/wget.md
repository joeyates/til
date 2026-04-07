# Switches

* --no-clobber - Don't overwrite existing files and don't create `.1` files for later downloads.

# Cookbook

## Scraping

Scrape a path on a site, ignoring links outsite the path and domain:

```bash
wget --recursive --no-clobber --page-requisites --html-extension --convert-links --domains example.com --no-parent http://example.com/path
```

## Pause Between Requests

Pause between requests:

```bash
wget --wait=2 http://example.com
```


## Download Page Assets

Download all assets of a page:

```bash
wget --page-requisites http://example.com
```


