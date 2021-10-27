# Squeezelite player for Logitech Media Server on Home Assistant

##  Description
Runs the [Squeezelite][squeezelite] player on home assistant.

Squeezelite requires a Logitech Media Server in your network \
Please visit [Logitech Media Server][Logitech Media Server Addon] page to install the server \
(if required).

## Install
1. Add this url to your hass.io addons repos: \
`https://github.com/pssc/ha-hassio-squeezelite`
2. Update addons list.
3. Install Squeezelite.

## How to use
1. Install add-on.
2. Run
3. Update the config with your own options change name in Logitech Media Server.
4. Check add-on logs for possible outputs and supported parameters.

## Direct Hardware Output
1. Run in Protection mode disabled.
2. Run and look in the logs of the addon-on at the audio output list. Note the name of the output you want to use start with the sysdefault:CARD=X
3. On the config tab "Select Show unused optional configuration options"
for output insert the name noted there.
4. Restart addon and check log output

##  Config parameters

Default/required Config: none

### Option (optional): `name`
Override name for the player (only English Ascii chars are supported)

### Option (optional): `output`
Audio output device. Please check the log after startup for a list of possible outputs \
defult will typically be the HA pulse audio. Using this option casues the addon to use the alsa build \
rather than the pulse audio build.

### Option (optional): `clientmac`
A "dummy mac" to make the player unique otherwise a random one is generated per install.

### Option (optional): `server`
Host or IP to for squeezelite player to connect otherwise autodiscover will be used. \

### Option (optional): `log_level`
Only "none|info||debug|trace" are valid.

### Option (optioal): `options`
Passed to squeezelite on startup after above options are processed

##  Urls
[Add-on link](https://github.com/pssc/ha-addon-squeezelite/) \
[Logitech Media Server Addon](https://github.com/pssc/ha-addon-lms/) \
[Squeezelite](https://github.com/ralph-irving/squeezelite) \

