cmake_minimum_required(VERSION 3.5)

project(QTFFPlayer VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
find_package(QT NAMES Qt6 Qt5 COMPONENTS Widgets LinguistTools REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Widgets LinguistTools REQUIRED)

#平台判断
if(WIN32)
    message("Now is windows")
elseif(APPLE)
    message("Now is Apple systens.")
elseif(ANDROID)
    message("Now is ANDROID systens.")
elseif(UNIX)
    message("Now is UNIX systens.")
endif()

set(FFMPEG_PREFIX_DIR "${CMAKE_CURRENT_SOURCE_DIR}/libs")
message("CMAKE_HOST_SYSTEM_NAME--->${CMAKE_HOST_SYSTEM_NAME}")
message("CMAKE_SYSTEM_NAME--->${CMAKE_SYSTEM_NAME}")

message("FFMPEG_PREFIX_DIR=${FFMPEG_PREFIX_DIR}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/output/)
set(FFMPEG_INCLUDE_DIRS "${FFMPEG_PREFIX_DIR}/include/")
set(FFMPEG_LIB_DIRS "${FFMPEG_PREFIX_DIR}/lib/")

include_directories(${FFMPEG_INCLUDE_DIRS})
link_directories(${FFMPEG_LIB_DIRS})

set(TS_FILES QTFFPlayer_zh_CN.ts)

set(PROJECT_SOURCES
       main.cpp
       mainwindow.cpp
       mainwindow.h
       mainwindow.ui
        ${TS_FILES}
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(QTFFPlayer
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )

    qt_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
else()
    if(ANDROID)
        add_library(QTFFPlayer SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(QTFFPlayer
            ${PROJECT_SOURCES}
        )
    endif()

    qt5_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
endif()



target_link_libraries(QTFFPlayer PRIVATE
    Qt${QT_VERSION_MAJOR}::Widgets
    #FFmpeg 支持
    avcodec avdevice avfilter avformat avutil swscale swresample
    )

set_target_properties(QTFFPlayer PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(QTFFPlayer)
endif()
