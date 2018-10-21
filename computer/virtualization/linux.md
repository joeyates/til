# Does my CPU support virtualization?

Paste the following into a shell:

```shell
$ grep vmx /proc/cpuinfo > /dev/null \
  && echo "Intel with virtualization" \
  || echo "Not Intel or Intel without virtualization"
$ grep svm /proc/cpuinfo > /dev/null \
  && echo "AMD with virtualization" \
  || echo "Not AMD or AMD without virtualization"
```

