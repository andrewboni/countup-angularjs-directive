Original blog post here: http://www.andrewboni.com/2014/09/03/a-countupjs-angularjs-directive/

# About
This is an AngularJS directive for the [countUp.js library](http://inorganik.github.io/countUp.js/).

# Dependencies
- AngularJS
- countUp.js  

# Installation
Install via Bower:
```bash
bower install -S countup-angularjs-directive
```
or NPM:
```bash
npm install countup-angularjs-directive
```

Then, add the module name to your `app.js` or `app.coffee` file:
```coffeescript
modules = [
  ...
  'ngCountup'
  ...
]
angular.module('myApp', modules).run(...)
```

...and include the file `dist/countup-angularjs-directive.min.js` somewhere on your page, after `angular` and `countUp`.

Like so:
```html
   <head>
       <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
       <script src="js/app.js"></script>
       <script src="../bower_components/countUp.js/countUp.min.js"></script>
       <script src="../dist/countup-angularjs-directive.min.js"></script>
   </head>
```

# Usage
```html
<h1 count-up id="opens" ng-model="dynamicStats.opens"></h1>
```

Note that you need the attribute `count-up`, `ng-model`, as well as an `id`. The `count-up` attribute is self explanatory, while the `ng-model` is the numerical value to apply the countUp effect to. The `id` is necessary for countUp itself- it doesn't matter what the name of the `id` is.

Optionally, you can configure the number of decimals and the animation length (in seconds) like so:

```html
<h1 count-up id="opens" ng-model="dynamicStats.opens" data-num-decimals="2" data-animation-length="10"></h1>
```

This directive is a work in progress- there are probably a ton of optimzations that can be made. If you have any suggestions, please submit a pull request!

