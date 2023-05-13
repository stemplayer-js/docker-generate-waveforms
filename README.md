# docker-generate-waveforms

A docker image to generate waveforms using BBC audio waveform

# build

```sh
docker build -t waveform .
```

# run

```sh
docker run -it -v $PWD:/workdir waveform --input mytrack.wav
```

the output will be a json file `mytrack.json` in the same folder
