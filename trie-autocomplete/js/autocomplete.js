var trie = null;

$(function () {
  var blanks = /^\W*$/;

  function saveDictionary() {
    trie = new Trie();
    var text = $(".textarea").val();
    var strings = text.split(/\W+/);
    for (var i in strings) {
      var string = strings[i].toLowerCase();
      if (!blanks.exec(string)) {
        // Not blank
        trie.insert(strings[i]);
      }
    }

    $("#modified").hide();
    $("#saved").show();
  }

  saveDictionary();

  $(".autocomplete").keyup(function (e) {
    $(".words").empty();

    var val = $(this).val();

    if (val && val.length > 0) {
      var results = trie.search($(this).val());
      for (var i in results) {
        var result = results[i];
        $(".words").append("<li>" + result + "</li>");
      }
    }
  });

  $(".contains").keyup(function (e) {
    var val = $(this).val();

    if (val && val.length > 0) {
      if(trie.includes($(this).val())) {
        $("#contains-result").html("true");
      } else {
        $("#contains-result").html("false");
      }
    } else {
      $("#contains-result").empty();
    }
  });

  $(".save-dictionary").click(saveDictionary);

  $(".textarea").keyup(function () {
    $("#modified").show();
    $("#saved").hide();
  });
});
