# YTDL-Helper
A more user-friendly way to use Youtube-DL

## What it does
This script can download MP3 files from Youtube using Youtube-DL and ffmpeg.<br>
It has been made in such a way that less computer savvy people can use it.<br>
When opened for the first time, the script will automatically download and extract the Youtube-DL and ffmpeg files to your computer, so you don't have to do that yourself. Note that for this to work, you will need Windows 10 or later. If you are running Windows 8.x or older, you have to manually install the [Curl](https://curl.se/windows/) tool and add this to your PATH.<br>
Then it will prompt for a Youtube link. This can be anything from a single video to a playlist. This will be automatically downloaded and converted to MP3, though you can change the format to any specified [here](https://github.com/ytdl-org/youtube-dl/blob/master/README.md#format-selection).

## Why it exists
I've had minor struggles, so I imagine what others might encounter. This is supposed to make life easier for everyone though.

## How it exists (also known as credits)
The script has been heavily modified from that made by [@Yuri010](https://github.com/Yuri010).<br>
For downloading the Youtube video files, obviously [Youtube-DL](https://github.com/ytdl-org/youtube-dl) is being used.<br>
For converting the video files, the minimal FFMPEG release package as found [here](https://www.gyan.dev/ffmpeg/builds/) is used.<br>
For downloading and extracting executables, curl and tar are used respectively.
