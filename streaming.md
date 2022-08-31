These are adhoc notes related to my streaming setup.

# Resolution

When making decisions about recording video and screens, knowing what resolution each device is operating in is important.

## External Monitor - 3008x1253

[LG](https://www.lg.com/us/monitors/lg-38GL950G-B-gaming-monitor) at [Microcenter](https://www.microcenter.com/support/618264/38GL950G_38):
- LGEUSA 38" IPS 38GL950G MONITORG
- 4K UHD
- 21:9 Curved WQHD+ (3840 x 1600) Nano IPS Display
  - Aspect Ratio 12:5 (2.4:1, or 21.6:9;) = 21:9
- On mac, I tend to use the resolution one step before the native/max == 3008x1253

## External Webcam - 1920x1080

[Webcam](https://m.media-amazon.com/images/I/B1Ooy9meheL.pdf) on [amazon](https://www.amazon.com/Angetube-Streaming-Adjustable-Advanced-autofocus/dp/B07RXYG295):
- Angetube Streaming 1080P HD Webcam Built in Adjustable Ring Light and Mic
- Advanced autofocus AF Web Camera
- Adjustable Ring Fill Light: 967 webcam with 3 brightness levels
- Dual Noise Canceling Microphones With Amplifer Chip
- High Quality, Low Bandwidth: Thanks to the H.264 compression encoding
- Video Resolution: 1920x1080, 1280x720, 640x480
- Frame rate: 1080p@30FPS

## Mac Laptop Display - 1680x1050 

- Mac resolution: 1680x1050 

## Mac Laptop Camera - 1680x1050 

- Mac camera: 1280x720

# OBS

## OBS Canvas configurations

External (Desktop):
- 4928x1253 - External Monitor and External Cam 3008+1920
- 2464x1253 - 1/2 External Monitor (3008/2), plus External Cam 
- 1504x1253 - 1/2 External Monitor (3008/2), ie if putting everything including cam in the half monitor width

Laptop:
- 1680x1050 - Mac display 
- 2960x1050 - Mac display, plus mac camera on side

## Misc OBS

OBS mic filters to consider:
- Noise Suppression
- Noice Gate
- Bark of Dog
- Gain
- Compressor

# Other useful things

[VDO.ninja](https://vdo.ninja/) for easily adding people (audio/video) to OBS

[Voicemeter](https://vb-audio.com/Voicemeeter/)

[Audacity](https://www.audacityteam.org/)

## LinkedIn

[Apply for LinkedIn Live Access](https://www.linkedin.com/help/linkedin/answer/a554240)

[Go Live Using a Custom Stream (RTMP)](https://www.linkedin.com/help/linkedin/answer/a564446)
- ie go to [https://www.linkedin.com/video/golive/now/](https://www.linkedin.com/video/golive/now/)
- pick a region
- grab the url and key to pop into OBS streaming preferences or zoom

for Zoom:
- https://zoom.us/profile > settings > meeting > advanced > Allow livestreaming of meetings
- https://zoom.us/profile > schedule meeting > save > live streaming > configure
- click  ...More in the host control > Live on Custom Live Stream Service.
