TEMPLATE = app
TARGET = bacon2dtest

QT += qml quick

SOURCES += main.cpp

RESOURCES += bacon2dtest.qrc

OTHER_FILES += bacon2dtest.apparmor \
               bacon2dtest.desktop \
               bacon2dtest.png

#specify where the config files are installed to
config_files.path = /bacon2dtest
config_files.files += $${OTHER_FILES}
message($$config_files.files)
INSTALLS+=config_files

# Default rules for deployment.
include(../deployment.pri)

