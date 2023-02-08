cmake_minimum_required(VERSION 3.14)

project(DashBord_Digital VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Quick)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick)




add_subdirectory(VheicleDataSender)
add_subdirectory(DatatetKM)
add_subdirectory(user)
set(PROJECT_SOURCES
        main.cpp
        qml.qrc
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(DashBord_Digital
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )

else()
    if(ANDROID)
        add_library(DashBord_Digital SHARED
            ${PROJECT_SOURCES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(DashBord_Digital
          ${PROJECT_SOURCES}
        )
    endif()
endif()

target_link_libraries(DashBord_Digital
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)
target_link_directories(DashBord_Digital PUBLIC VheicleDataSender/)
target_link_libraries(DashBord_Digital PUBLIC VheicleDataSender)
target_link_directories(DashBord_Digital PUBLIC DatatetKM/)
target_link_libraries(DashBord_Digital PUBLIC DatatetKM)

target_include_directories(DashBord_Digital PUBLIC user/)
target_link_libraries(DashBord_Digital PUBLIC user)

set_target_properties(DashBord_Digital PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS DashBord_Digital
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
find_package(Qt6 REQUIRED COMPONENTS Sql)

#find_package(Qt6 REQUIRED COMPONENTS import QtMultimedia)
#find_package(Qt6 REQUIRED COMPONENTS Multimedia)


target_link_libraries(DashBord_Digital PRIVATE Qt6::Sql)
find_package(Qt6 REQUIRED COMPONENTS QuickControls2)
target_link_libraries(DashBord_Digital PRIVATE Qt6::QuickControls2)

#target_link_libraries(DashBord_Digital PRIVATE Qt6::Multimedia)
#target_link_libraries(DashBord_Digital PRIVATE Qt6::Multimedia)

#find_package(Qt6 REQUIRED COMPONENTS import QtQuick.Extras)
#target_link_libraries(DashBord PRIVATE Qt6::import QtQuick.Extras)

find_package(Qt6 COMPONENTS Widgets REQUIRED)
target_link_libraries(DashBord_Digital PRIVATE Qt6::Widgets)



#add_definitions(-DSQL_SUPPORT)

#find_package(Qt6Sql REQUIRED)
#target_link_libraries(DatatetKM PRIVATE Qt6::Sql)
#target_link_libraries(DashBord_Digital Qt6::Sql)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(DashBord_Digital)
    qt_finalize_executable(DashBord_Digital)
endif()
