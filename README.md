# BasKet Note Pads

## Zorziel's Fork Notes

This is a development version, forked from [KDE/Basket](https://github.com/KDE/basket).  The purpose of this fork is to update a few interface items to make them more compatible with modern KDE Plasma 5+ and dark themes.  I am also learning as I go.. please see upstream for a production-stable version.

## Purpose

This application provides as many baskets as you wish, and you can drag and drop
various objects (text, URLs, images, sounds...)  into its.

Objects can be edited, copied, dragged... So, you can arrange them as you want !

It allows to arrange notes, track to-dos and much more.

## Developers

Basket is build with the Qt5 and KDE Frameworks 5.

## Contact

If you have any questions, or would like to contribute (always welcome!) please
send me an email to the generall KDE development mailing list at
kde-devel@kde.org.

## Building/Installation

To build and install BasKet, follow these steps (this assumes you have the relevant
kf5 and qt5 development libraries and CMake):

```
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=~/.local/kde -DPLUGIN_INSTALL_DIR=~/.local/kde/lib64/qt5/plugins
make -j8
make -j8 install
```

## Flatpak

This application has a flatpak manifest.

```
flatpak-builder build-dir org.kde.basket.yaml
flatpak-builder --run build-dir org.kde.basket.yaml basket
```
