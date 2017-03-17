# Typist
[![CDNJS](https://img.shields.io/cdnjs/v/Typist.svg)](https://cdnjs.com/libraries/Typist)

Elegant automated typing, for your text rotation needs.

We've actually improved our CTR on the **Get Started Now** and **Discover More** buttons by nearly 40% since Typist explained that Positionly is for more than just people, but for more specific types of business.

Typist is fully compatible with **responsive layouts.**

## Setup
You can install Typist via Bower with `bower install typist` or download `typist.js` and include it the old-fashined way.

## Basic Typist

![](https://cldup.com/5UTJrISLOt.gif)

### CoffeeScript
```coffeescript
typist = document.querySelector "#typist-element"
new Typist typist,
  letterInterval: 60
  textInterval:   3000
```

### HTML
```html
JavaScript is <strong id="typist-element" data-typist="ugly,not as good an CoffeeScript">great</strong>
```

### CSS
```CSS
.selectedText {
  background: #f00;
}
```

## Callback + Custom Style Typist

![](https://cldup.com/c3cBS3p30w.gif)

### CoffeeScript
```coffeescript
typist = document.querySelector "#typist-element"
new Typist typist,
  letterInterval: 60
  textInterval:   3000
  onSlide: (text, options) ->
    suffix = options.typist.getAttribute "data-typist-suffix"
    log "#{text} #{suffix}" # ugly since it's JS
```

### HTML
```html
JavaScript is <strong id="typist-element" data-typist="ugly,not as good an CoffeeScript" data-typist-suffix="since it's JS">great</strong>
```

### CSS
```CSS
@keyframes blink {
  0% { opacity: 1.0; }
  50% { opacity: 0.0; }
  100% { opacity: 1.0; }
}

@-webkit-keyframes blink {
  0% { opacity: 1.0; }
  50% { opacity: 0.0; }
  100% { opacity: 1.0; }
}

#typist-element {
  &:after {
    content: " ";
    display: inline-block;
    height: 47px;
    position: relative;
    top: 10px;
    margin-left: 3px;
    margin-right: 7px;
    width: 4px;
    background: #06a44d;
    animation: blink 1s step-start 0s infinite;
    -webkit-animation: blink 1s step-start 0s infinite;
  }
}

.selectedText {
  display: none;
}
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
  <tr>
    <td>selectClassName</td>
    <td>string</td>
    <td>selectedText</td>
    <td class="desc">Select element class name</td>
  </tr>
  <tr>
    <td>onSlide</td>
    <td>function</td>
    <td>null</td>
    <td class="desc">Callback when the slide changes, returns two arguments `text` (current textvariation) and `option` (an object of variables that might be of use, like the `slideIndex` or the typist element itself)</td>
  </tr>
</table>

## Requirements
Typist is **framework-agnostic**. No need for jQuery.

## Source code
All efforts have been made to keep the source as clean and readable as possible.

## Requirements
Typist is released under an MIT License, so do with it what you will.
