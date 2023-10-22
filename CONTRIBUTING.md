# Contributing to Climator

Thank you for your interest in contributing to Climator! We welcome contributions from the community to help improve and grow this project. All kinds of contributions are valuable to us. In this guide, we will cover how you can quickly onboard and make your first contribution.

## Submitting an issue


Before submitting a new issue, please search the existing [issues](https://github.com/droidbg/climator/issues). Maybe an issue already exists and might inform you of workarounds. Otherwise, you can give new information.

While we want to fix all the [issues](https://github.com/droidbg/climator/issues), before fixing a bug we need to be able to reproduce and confirm it. Please provide us with a minimal reproduction scenario using a repository or [Gist](https://gist.github.com/). Having a live, reproducible scenario gives us the information without asking questions back & forth with additional questions like:

- 3rd-party libraries being used and their versions (mainly providers, but not exclusively)
- a use-case that fails

Without said minimal reproduction, we won't be able to investigate all [issues](https://github.com/droidbg/climator/issues), and the issue might not be resolved.

You can open a new issue with this [issue form](https://github.com/droidbg/climator/issues/new).


## Setup Guide

#### ✨ Before Starting, we would kindly request you to give a star to our repo ⭐️ .

Climator is written in Flutter. In order to setup and run the project locally, you need to have an Android emulator, IOS Simulator or a real device.

Running the project is as simple as:

```
$ git clone git@github.com:droidbg/Climater.git

```
## Add API_KEY in dev.env

Sign In here : https://home.openweathermap.org/ 
<br>
After email verification you will get a mail with API key .
Like this: 
```
Dear Customer!


Thank you for subscribing to Free OpenWeatherMap!

API key:
- Your API key is ......
- Within the next couple of hours, it will be activated and ready to use

```
Add this `API Key` in `dev.env` file.

## Add pre commit

```
$ bash pre-commit
```

## Run App
```
$ flutter pub get

$ flutter run
```




If you are contributing for any specific issue, make sure to reference the issue in your PR so that we can help with additional information.



#### Still Facing issue, comment here: https://github.com/droidbg/Climater/discussions/7  , we will try to solve it .
