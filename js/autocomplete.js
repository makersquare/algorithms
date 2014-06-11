var trie = null;

$(function () {
  var blanks = /^\W*$/;

  function saveDictionary() {
    trie = new Trie();  // create a new trie
    var text = $(".textarea").val(); // grab all the text in the wordbank
    var strings = text.split(/\W+/); // split the words in the wordbank on anything that is a space, puncutation mark or symbol
    for (var i in strings) {  // For each word in strings array
      var string = strings[i].toLowerCase();  // Make each word lowercase
      if (!blanks.exec(string)) { // If string is not blank
        trie.insert(strings[i]);  // Insert it into the trie
      }
    }

    $("#modified").hide();
    $("#saved").show();
  }

  saveDictionary();  // Initially saves the dictionary with the words in the word bank

  $(".autocomplete").keyup(function (e) {  // Autocomplete Function, runs on keyup in autocomplete class
    $(".words").empty(); // Clear the .words class so it shows no words

    var val = $(this).val(); // Takes the value from the autocomplete

    if (val && val.length > 0) {  // If there is a val and its length is greater than 0
      var results = trie.search($(this).val()); // Run trie.search on the val and save as results
      for (var i in results) {  // For each word in the results, post it in the .words class
        var result = results[i];
        $(".words").append("<li>" + result + "</li>");
      }
    }
  });

  $(".contains").keyup(function (e) {  // Contains function, runs on keyup in contains class
    var val = $(this).val();  // Grab the value in the contains class

    if (val && val.length > 0) {  // If there is a val and its length is greater than 0
      if(trie.includes($(this).val())) {  // Runs trie.includes on the val
        $("#contains-result").html("true");  // Marks true if the trie includes val
      } else {
        $("#contains-result").html("false");  // Marks false if trie doesn't include val
      }
    } else {
      $("#contains-result").empty();  // Emptys the true/false marker if there is no val
    }
  });

  $(".save-dictionary").click(saveDictionary);  // Runs save dictionary for new words entered into the wordbank

  $(".textarea").keyup(function () {  // If the wordbank is changed, show that it isn't saved
    $("#modified").show();
    $("#saved").hide();
  });
});
