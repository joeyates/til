# References

* https://www.varnish-cache.org/docs/4.1/


# Configuration

* /etc/default/varnish

# Debugging

See real time stats:

```
# varnishstat
```

Log requests that aren't getting cached:

```
varnishlog -q "VCL_call eq PASS"
```

## varnishtest
