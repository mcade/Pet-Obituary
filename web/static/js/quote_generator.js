export var Quote = {
  generate: function(){
  	function* someWords() {
		  yield "hello";
		  yield "world";
		}

		for (var word of someWords()) {
		  alert(word);
		}
  }
}