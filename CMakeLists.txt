cmake_minimum_required(VERSION 3.16)
project(technofest_gcs VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(apptechnofest_gcs
    main.cpp
)

# Corrected URI to match what main.cpp is looking for
qt_add_qml_module(apptechnofest_gcs
    URI technofest_gcs
    VERSION 1.0
    QML_FILES Main.qml
)

# Link libraries placed at the very bottom
target_link_libraries(apptechnofest_gcs
    PRIVATE
        Qt6::Quick
)