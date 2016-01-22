import { quoteSource } from "./quotes";

export var Quote = {
  generate: function(){	
  	let sourceLength = quoteSource.length;
  	function* new_quote() {
  		let randomNumber = Math.floor(Math.random()*sourceLength);
  		yield quoteSource[randomNumber].quote;
  		yield quoteSource[randomNumber].name;
  		yield* new_quote();
  	}

  	var iter = new_quote(quoteSource);

  	$("#quoteButton").click(event => {
			let newQuoteText = iter.next().value;
			let newQuoteGenius = iter.next().value;
      let timeAnimation = 500;
      let quoteContainer = $('#quoteContainer');
      //fade out animation with callback
      quoteContainer.fadeOut(timeAnimation, function(){
        quoteContainer.html('');
				quoteContainer.append('<p>'+newQuoteText+'</p>'+'<p id="quoteGenius">'+'-								'+newQuoteGenius+'</p>');
        
        //fadein animation.
        quoteContainer.fadeIn(timeAnimation);
      });  
		});  	
  }
}
