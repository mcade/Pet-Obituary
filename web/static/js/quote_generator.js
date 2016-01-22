import { quoteSource } from "./quotes";

export var Quote = {
  generate: () => {	
    var uniqueQuotes = quoteSource.slice();
    var i = 0;
    uniqueQuotes.sort(() => { return 0.5 - Math.random() });
  	function* new_quote() {
      try {
        yield uniqueQuotes[i].quote;
        yield uniqueQuotes[i].name;
        yield* new_quote(i++);
      }
      catch(err) {
        console.log("Reshuffle uniqueQuotes array");
        uniqueQuotes.sort(() => { return 0.5 - Math.random() });
        i = 0;
        yield* new_quote(i);
      }
  	}

  	var iter = new_quote(quoteSource);

  	$("#quoteButton").click(event => {
			let newQuoteText = iter.next().value;
			let newQuoteAuthor = iter.next().value;
      let quoteContainer = $('#quoteContainer');
      quoteContainer.fadeOut(500, () => {
        quoteContainer.html('');
				quoteContainer.append('<p>'+newQuoteText+'</p>'+'<p id="quoteAuthor">'+'- '+newQuoteAuthor+'</p>');
        quoteContainer.fadeIn(500);
      });  
		});  	
  }
}
