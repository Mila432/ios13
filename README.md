# Overview
This repository contains tools and scripts that will create a somewhat optimal debug environment.


# iPad7,5 / iPad 2018 ..
as of writing, checkra1n beta 0.9.5 is not working with this specific iPad. A workround is to use [0.9.2](https://assets.checkra.in/downloads/macos/0c010ab83414d016d2202f3f67de07d6b62459bc66f841c44f53a9f1a5965b17/checkra1n%20beta%200.9.2.dmg)

![](https://i.imgur.com/TUkxoGo.png)

# debugserver on iOS 13
in order to run debugserver on iOS 13 and being able to attach or launch any process, you need to follow those steps: 

on your mac run `security find-identity -v -p codesigning` and copy whatever is shown there `"iPhone Developer: Mila432 (...)"`

download the `ent.xml` file from scripts and run `codesign --force --sign "iPhone Developer: Mila432 (...)" --entitlements ent.xml -f debugserver`

now copy debugserver to your device `/usr/bin/`
