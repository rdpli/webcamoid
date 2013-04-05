# Webcamoid, webcam capture plasmoid #

[Webcamoid](http://kde-apps.org/content/show.php/Webcamoid?content=144796) is a webcam plasmoid for the KDE desktop environment.

## Features ##

* Take pictures with the webcam.
* Record videos.
* Manages multiple webcams.
* Play/Stop capture, this saves resources while the plasmoid is not in use.
* Written in C++.
* 100% Qt based software, for KDE/Qt purists.
* Custom controls for each webcam.
* Popup applet support (you can embed Webcamoid in the panel).
* Add funny effects to the webcam (requires Frei0r plugins and QImageBlitz).
* +50 effects available.
* Effects with live previews.
* Translated to many languages.
* Stand alone installation mode (use it as a normal program).
* Use custom network and local files as capture devices.
* Capture from desktop.

## Build and install ##

Webcamoid's dependencies are:

* [Qt](https://qt-project.org/) (Qt >= 4.7, Qt5 not sopported)
* [kdelibs](https://projects.kde.org/projects/kde/kdelibs)
* [Frei0r plugins](http://www.piksel.org/frei0r)
* [QImageBlitz](http://download.kde.org/stable/qimageblitz/)

Build dependecies:

* [Wget](http://www.gnu.org/software/wget/wget.html)
* [Bison](http://www.gnu.org/software/bison/bison.html)
* [Flex](http://flex.sourceforge.net)

__NOTE__: Webcamoid uses its own [FFmpeg](http://ffmpeg.org/) versión, you must include its dependencies too.

You can build Webcamoid with the following commands:

    git clone https://github.com/hipersayanX/Webcamoid.git
    qmake
    make -j $(grep -c "^processor" /proc/cpuinfo)
    su -c 'make install'
    kbuildsycoca4

### Custom Streams ###

Webcamoid is not just a webcam capture software. You can, for example, use it to capture from a video, image file, IP cameras, or the desktop.  
If you want to add a new stream, go to the "Configure Custom Streams" option, and click in the "Add" button. Give it a human readable "Device Name" and write the path to the stream in the "URI" field. Here are some examples:

* file:///home/YourHome/Videos/SomeFunnyVideo.ogv
* http://1.2.3.4:1234/mjpg/video.mjpg
* http://www.somesite.com/mjpg/video.mjpg
* rtsp://user:password@livecamera.somesite.com/mpeg4

You can search some online IP cameras [here](http://www.google.com/search?q=filetype:mjpg) and [here](http://www.google.com/search?q=rtsp+ip+cameras+demo)

## Translating ##

Edit the _Webcamoid.pro_ file and add you language code to the _TRANSLATIONS_ macro, then, in the root directory of the project run:

    pylupdate4 -verbose -noobsolete Webcamoid.pro

A _contents/ts/your_lang_code.ts_ will be created. Translate that file to your language using Qt Linguist. Then run the following command:

    lrelease -removeidentical Webcamoid.pro

### Supported languages ###

Some languages are officially supported and other are supported through [Google Translator](http://translate.google.com/).

* Catalan
* Chinese Simplified
* Chinese Traditional
* English (official)
* French
* Galician
* German
* Greek
* Italian
* Japanese (official)
* Korean
* Portuguese
* Russian
* Spanish (official)

## Reporting Bugs ##

Run this command:

    plasma-windowed webcamoid

use Webcamoid until an abnormal event happen, write a list with the following information:

1. Your Webcamoid version.
2. Your distribution name and version (numeric, please).
3. Your KDE and Qt version.
4. Your GCC version.
5. The output of the previous command.
6. Any other useful information.

Send this list to the [issues page](http://github.com/hipersayanX/Webcamoid/issues).