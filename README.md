# Sprockets PostCSS Essentials

Sprockets [PostCSS](https://github.com/postcss/postcss) extension with support for essential features:

* variables — [postcss-simple-vars](https://github.com/postcss/postcss-simple-vars)
* `@import` — [postcss-import](https://github.com/postcss/postcss-import)
* SASS-like nesting — [postcss-nested](https://github.com/postcss/postcss-nested)
* mixins — [postcss-mixins](https://github.com/postcss/postcss-mixins)
* color functions — [postcss-color-function](https://github.com/postcss/postcss-color-function)

## Installation

### Rails

Add `sprockets_postcss_essentials` to your `Gemfile`:

```ruby
gem "sprockets_postcss_essentials", github: "vast/sprockets-postcss-essentials"
```

### Sprockets

If you use a non-Rails framework with Sprockets, connect Sprockets environment with `SprocketsPostcssEssentials`:

```ruby
assets = Sprockets::Environment.new do |env|
  # ...
end

require "sprockets_postcss_essentials"
SprocketsPostcssEssentials.install(assets)
```

## Usage

Write your styles in `.postcss` files:

```scss
/*
* Regular Sprockets directives still work in .postcss files.
*= require foo
*/

@import "core/typography";
@import "core/layout";

/* Define mixins with `@define-mixin` at-rule: */
@define-mixin clearfix {
  &:before, &:after {
    content: "";
    display: table;
  }

  &:after {
    clear: both;
  }
}

/* define $variables like any other CSS property */
$footer-color: color(#03709a, blackness(+20%))

.footer {
  @mixin clearfix; /* include mixin styles */

  color: $footer-color;

  &-logo {
    display: inline-block;
  }
}
```
