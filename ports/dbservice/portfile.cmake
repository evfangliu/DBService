# portfile.cmake
include(vcpkg_common_functions)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO evfangliu/dbservice
  REF acd576790ce42ef43d1f4f348bf11ffff02ed59a
  SHA512 9a3bb3480e74dad22a6a14f47271a3be31adf152801bbe97e9ef1f7c6bae239087ae49abe8805010cf6e0bbf1444d455564597d45387c5b696b6b86f20ddeb4a
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)