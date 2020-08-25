QT += core gui widgets xml quick

CONFIG += c++11

greaterThan(QT_MAJOR_VERSION, 5)





HEADERS += \
    DomReader.h \
    Project.h \
    welcome.h

SOURCES += \
    DomReader.cpp \
    Project.cpp \
    main.cpp \
    welcome.cpp


FORMS +=

RESOURCES += \
    resource.qrc
