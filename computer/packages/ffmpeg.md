```sh
ffmpeg -i {{input filename}} -vf scale=-1:360 -c:v libx264 -crf 18 -preset veryslow -c:a copy {{output filename}}
```

-i - input file
-c:v {{name}} - video codec
-filter:v {{filtergraph}} - create and use a filtergraph
-vf {{filtergraph}} - alias for -filter:v

# filtergraphs

scale=x:y - resize. If x or y is -1, the aspect ratio is maintained.

# Change Format

```sh
ffmpeg -i {{input}}.mpeg -c:v libx264 -c:a copy {{output}}.mpg
```

# Copy a section of video by start and end time


ffmpeg -ss [start] -i in.mp4 -t [duration] -c copy out.mp4

$ cat mylist.txt
file '/path/to/file1'
file '/path/to/file2'
file '/path/to/file3'

$ ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4
