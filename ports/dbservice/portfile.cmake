# portfile.cmake
include(vcpkg_common_functions)

# Point to the local project directory
vcpkg_from_path(
    OUT_SOURCE_PATH SOURCE_PATH
    PATH "C:\Users\evfan\source\repos\Calibration\DBService"
)

# Configure and build with CMake
vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

# Remove debug include files if not needed
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# Install license file
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)   