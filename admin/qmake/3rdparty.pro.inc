mac {
    LIBS += -L/usr/local/lib
    INCLUDEPATH += /usr/local/include
}

CONFIG( taglib ) {
    CONFIG += link_pkgconfig
    PKGCONFIG += taglib
    win32:debug:LIBS += tagd.lib    # tagd.lib will precede PKGCONFIG added libs
}

CONFIG( ffmpeg ) {
    mac {
        LIBS += /usr/local/lib/libavcodec.dylib
        LIBS += /usr/local/lib/libavformat.dylib
        LIBS += /usr/local/lib/libavutil.dylib
        LIBS += /usr/local/lib/libswresample.dylib
        DEFINES += HAVE_SWRESAMPLE
    } else {
        CONFIG += link_pkgconfig
        PKGCONFIG += libavformat libavcodec libavutil
        packagesExist(libswresample) {
            PKGCONFIG += libswresample
            DEFINES += HAVE_SWRESAMPLE
        }
        packagesExist(libavresample) {
            PKGCONFIG += libavresample
            DEFINES += HAVE_AVRESAMPLE
        }
    }
}

CONFIG( analytics ) {
    QT += webkit
    DEFINES += LASTFM_ANALYTICS
}

CONFIG( boost ) {
    mac:CONFIG(app_bundle){
        LIBS += /usr/local/lib/libboost_thread-mt.a
    }
    else:unix {
        LIBS += -lboost_thread-mt
    }
}

CONFIG( break ) {
    win32{
        CONFIG += link_pkgconfig
        PKGCONFIG += breakpad
        LIBS += wininet.lib
    }
    else:mac{
        LIBS += -framework Breakpad
    }
}

CONFIG( growl ) {
    mac {
        INCLUDEPATH += -F/Library/Frameworks
        LIBS += -F/Library/Frameworks -framework Growl
    }
}

CONFIG( sparkle ) {
    win32{
        CONFIG += link_pkgconfig

        CONFIG(debug, debug|release) {
            PKGCONFIG += qtsparkle-debug
        }
        else {
            PKGCONFIG += qtsparkle-release
        }
    }
    else:mac{
        INCLUDEPATH += -F/Library/Frameworks
        LIBS += -F/Library/Frameworks -framework Sparkle -Wl -rpath @loader_path/../Frameworks
    }
}

CONFIG( sqlite3 ) {
    win32 {
        CONFIG += link_pkgconfig
        PKGCONFIG += sqlite3
    }
    else:LIBS += -lsqlite3
}

CONFIG( yajl ) {
	win32 {
		CONFIG += link_pkgconfig
		debug:PKGCONFIG += yajl-debug
		release:PKGCONFIG += yajl-release
	}
	else:CONFIG(app_bundle) {
                LIBS += /usr/local/lib/libyajl_s.a
	}
	else:LIBS += -lyajl
}

