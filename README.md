# Introduction to PureScript

This is the repository for the workshop *Introduction to PureScript*, at PureScript Conf 2017 in Boulder, Colorado.

Here, you will find [slides](presentation.md), [source code](src/), and instructions on preparing your computer for the workshop!

# Preparation

First, you should download the contents of this repository to your computer. Then proceed to the following steps.

## 1. Install `npm`

**npm** is a package manager that can be used to install many Javascript and PureScript tools. You can download the package manager here:

 * [NodeJS](https://nodejs.org/download/)

## 2. Install PureScript

You should install the PureScript compiler and command-line tools.

```
npm install -g purescript
```

## 3. Install Pulp

Pulp is a build tool for PureScript that makes it easy to build projects.

```
npm install -g pulp
```

## 4. Install Bower

Bower can download PureScript dependencies.

```
npm install -g bower
```

## 5. Install PureScript Dependencies

This installs the PureScript dependencies specified in `bower.json`.

```bash
bower install
```

## 6. Compile with PureScript

This runs the build process, which will generate a `game.js`.

```bash
pulp build --to game.js
```

## 7. Open HTML to Run Game

On Mac OS X:

```
open game.html
```

On other platforms, manually open the file `game.html`.
