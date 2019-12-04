```sh
ffmpeg -i {{input filename}} -vf scale=-1:360 -c:v libx264 -crf 18 -preset veryslow -c:a copy {{output filename}}
```

-i - input file
-c:v {{name}} - video codec
-filter:v {{filtergraph}} - create and use a filtergraph
-vf {{filtergraph}} - alias for -filter:v

# filtergraphs

scale=x:y - resize. If x or y is -1, the aspect ratio is maintained.
