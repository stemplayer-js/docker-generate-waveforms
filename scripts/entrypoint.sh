#!/bin/sh

# non_interactive=0
SEGMENT_TIME=10
BITRATE=128

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Generate segments of mp3s from source wav files."
   echo
   echo "Syntax: scriptTemplate [-help|-input|-output|--segment_time|--bitrate]"
   echo "options:"
   echo "--help         Print this Help."
   echo "--input        The input file."
   echo "--output       The output folder."
   echo "--segment_time The duration of each segment (default 10)"
   echo "--bitrate      Bitrate of each encoded mp3 segment (default 128)"
}

while [ "$1" != "" ]; do
    case $1 in
        --help )            shift
                            Help
                            exit
                            ;;
        --input )           shift
                            INPUT_FILE=$1
                            ;;
        --output )          shift
                            OUTPUT_FOLDER=$1
                            ;;
        --segment_time )    shift
                            SEGMENT_TIME=$1
                            ;;
        --bitrate )         shift
                            BITRATE=$1
                            ;;
        * )                 echo "Invalid parameters."
                            Help
                            exit 1
    esac
    shift
done

if [ -z "$INPUT_FILE" ]
then
      echo "-input is required"
      exit 1
fi

if [ -z "$OUTPUT_FOLDER" ]
then
      OUTPUT_FOLDER=$(dirname "$INPUT_FILE")
fi

echo "Running script using"
echo "  input: $INPUT_FILE"
echo "  output: $OUTPUT_FOLDER"

mkdir -p $OUTPUT_FOLDER



outfile="$OUTPUT_FOLDER/$(basename "$INPUT_FILE").json"

audiowaveform -i "$INPUT_FILE" -o "$outfile" --pixels-per-second 20 --bits 16

echo "Normalising waveform data"
(python /scripts/normalise.py "$outfile")
