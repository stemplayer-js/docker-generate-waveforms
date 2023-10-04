# docker-generate-waveforms

A docker image to generate waveforms using BBC audio waveform for use with our [Stem player](https://github.com/stemplayer-js/stemplayer-js)

## Usage

```sh
docker build -t stemplayer-js-generate-waveform .
docker run -it -v $PWD:/workdir stemplayer-js-generate-waveform \
    --input source/my-audio.wav \
    --output output
```

the output will be a json file: `output/my-audio.json`
