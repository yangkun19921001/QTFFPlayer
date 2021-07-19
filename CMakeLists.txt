cmake_minimum_required(VERSION 3.5)

project(QTFFPlayer VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_PREFIX_PATH "/Users/devyk/Data/qt/install/5/5.14.2/5.14.2/clang_64/lib/cmake")
set(QT_VERSION_MAJOR 5)
set(REQUIRED_LIBS Core Gui Widgets Multimedia OpenGL)
set(REQUIRED_LIBS_QUALIFIED Qt5::Core Qt5::Gui Qt5::Widgets Qt5::Multimedia Qt5::OpenGL)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS ${REQUIRED_LIBS} REQUIRED)
#平台判断
if (WIN32)
    message("Now is windows")
elseif (APPLE)
    message("Now is Apple systens.")
elseif (ANDROID)
    message("Now is ANDROID systens.")
elseif (UNIX)
    message("Now is UNIX systens.")
endif ()

set(TS_FILES QTFFPlayer_zh_CN.ts)
set(FFMPEG_PREFIX_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libs")
message("CMAKE_HOST_SYSTEM_NAME--->${CMAKE_HOST_SYSTEM_NAME}")
message("CMAKE_SYSTEM_NAME--->${CMAKE_SYSTEM_NAME}")

message("FFMPEG_PREFIX_DIR=${FFMPEG_PREFIX_DIR}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/output/)
set(FFMPEG_INCLUDE_DIRS "${FFMPEG_PREFIX_DIR}/include/")
set(FFMPEG_LIB_DIRS "${FFMPEG_PREFIX_DIR}/lib/")

set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(BASE_DIR ${SRC_DIR}/base)
set(DECODE_DIR ${SRC_DIR}/decode)
set(DEMUX_DIR ${SRC_DIR}/demux)
set(RESAMPLE_DIR ${SRC_DIR}/resample)
set(PROXY_DIR ${SRC_DIR}/proxy)
set(WIDGET_DIR ${SRC_DIR}/widget)
set(UTILS_DIR ${SRC_DIR}/utils)

include_directories(${BASE_DIR})
include_directories(${DECODE_DIR})
include_directories(${DEMUX_DIR})
include_directories(${RESAMPLE_DIR})
include_directories(${PROXY_DIR})
include_directories(${WIDGET_DIR})
include_directories(${UTILS_DIR})
include_directories(${FFMPEG_INCLUDE_DIRS})

link_directories(${FFMPEG_LIB_DIRS})


set(PROJECT_SOURCES
        src/main.cpp
        src/mainwindow.cpp
        src/mainwindow.h
        src/mainwindow.ui
        ${TS_FILES}
        src/base/IThread.cpp
        src/base/IObserver.cpp
        src/utils/log4z.cpp
        )
add_library(QTFFPlayer SHARED
        ${PROJECT_SOURCES}
        )
add_executable(QTFFPlayer_GUI
        ${PROJECT_SOURCES}
        )


target_link_libraries(QTFFPlayer PRIVATE
        Qt${QT_VERSION_MAJOR}::Widgets
        #FFmpeg 支持
        avcodec avdevice avfilter avformat avutil swscale swresample
        )

target_link_libraries(QTFFPlayer_GUI PRIVATE
        Qt${QT_VERSION_MAJOR}::Widgets
        #FFmpeg 支持
        avcodec avdevice avfilter avformat avutil swscale swresample
        )


