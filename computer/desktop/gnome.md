# dconf

Manage desktop settings

Dump all:

dconf dump /

Write

dconf write {{path}} {{value}}

String values:

dconf write {{path}} "'{{value}}'"

# Cookbook

## See what changes when settings are changed via another tool

Before:

$ dconf dump / > before.dump

Make changes

After:

$ dconf dump / | diff -U2 before.dump -

## Over network

DISPLAY=:0 dconf write {{path}} {{value}}
