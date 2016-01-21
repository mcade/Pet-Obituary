import "deps/phoenix_html/web/static/js/phoenix_html"
import "babel-polyfill"

import { Quote } from "./quote_generator";

export var App = {
  run: function(){
    Quote.generate()
  }
}

