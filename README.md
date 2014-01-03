# Typist
Elegant automated typing, for your text rotation needs

## Demo
Soon. For now here's a (really compressed GIF):

![](http://yum.gifsicle.com/e2d959b.gif)

## Setup
You can install Typist via Bower with `bower install Typist` or download `typist.js` and include it the old-fashined way.

### CoffeeScript
```coffeescript
typist = document.querySelectorAll "#typist-element"
new Typist typist,
  letterInterval: 60
  textInterval:   3000
```

### HTML
```html
JavaScript is <strong id="typist-element" data-typist="ugly,not as good an CoffeeScript">great</strong>
```

## Options

<table>
  <tr>
    <th class="name">Name</th>
    <th class="type">Type</th>
    <th class="default">Default</th>
    <th class="desc">Description</th>
  </tr>
  <tr>
    <td>letterInterval</td>
    <td>integer</td>
    <td>60</td>
    <td class="desc">Miliseconds between typing a letter</td>
  </tr>
  <tr>
    <td>textInterval</td>
    <td>integer</td>
    <td>3000</td>
    <td class="desc">Miliseconds between text rotation</td>
  </tr>
</table>

## Requirements
Typist is **framework-agnostic**. No need for jQuery. It's written in **CoffeeScript**, and compiled into JavaScript.

## Source code
All efforts have been made to keep the source as clean and readable as possible.

## Requirements
ShadowScroll is released under an MIT License, so do with it what you will.
