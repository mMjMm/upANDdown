# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-upanddown

CONFIG += sailfishapp

SOURCES += \
    src/harbour-upanddown.cpp

OTHER_FILES += \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    translations/*.ts \
    qml/pages/config.js \
    qml/pages/About.qml \
    harbour-upanddown.desktop \
    qml/harbour-upanddown.qml \
    rpm/harbour-upanddown.yaml \
    rpm/harbour-upanddown.spec \
    rpm/harbour-upanddown.changes.in \
    qml/pages/Buttons.qml \
    qml/pages/SaveAs.qml \
    qml/pages/Settings.qml \
    qml/pages/Counter.qml \
    qml/pages/Counts.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/upanddown-de.ts

