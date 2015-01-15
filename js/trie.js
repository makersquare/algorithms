// Dsefines the node object
var Node = function(val) {
  this.value = val;
  this.children = [];
  this.isWord = false;
  return this;
};

Node.prototype.isLeaf = function(){
  return !this.children.length;
};

Node.prototype.getChild = function(letter){
  return (this.children.filter(function(child) {
    return child.value == letter;
  }))[0];
};

Node.prototype.add = function(letter){
  var childNode = letterInChildren(this, letter);
  if(!childNode) { // Letter not found add it and use it as childNode
    newNodeIndex = this.children.push(new Node(letter));
    return this.children[newNodeIndex-1];
  }
  return childNode;
};

function letterInChildren(node, letter) {
  var nodeList = node.children.filter(function(v){
    return v.value === letter;
  });

  return nodeList[0] || false;
}

var Trie = function() {
  this.head = new Node();

  // Inserts string into the Trie.
  this.insert = function(string) {
    this._insert(this.head, string);
  };

  // Recursive function. Helper function for the insert function.
  this._insert = function(node, word) { // Works on nodes children
    var letter = word[0];
    word = word.substr(1); //Remove letter at first position in word.

    var childNode = node.add(letter);

    if(word.length) {
      this._insert(childNode, word);
    } else {
      childNode.isWord = true;
    }
  };

  // Returns true if string is in the trie. Returns false otherwise.
  this.includes = function(string) {
    return this._includes(this.head, string);
  };

  // Recursive function. Returns true if string is in the trie. Returns false
  // otherwise.
  this._includes = function(node, word) {
    if(!word) {
      return false;
    }
    var letter = word[0];
    word = word.substr(1);

    node = letterInChildren(node, letter);
    if(node) { // letter was found
      if(word.length) { // If more letters keep looking
        return this._includes(node, word);
      }
      return node.isWord;
    }

    return false;
  };

  // Search for all strings that have 'prefix' as the prefix.
  //
  // Returns Array of Strings.
  this.search = function(prefix) {
    return this._search(this.head, prefix);
  };

  // Recursive function. Helper function for the search function.
  this._search = function(node, prefix) {
    prefix = prefix || "";
    var currentStr = "";

    var node = this._findLastNode(node, prefix);

    var wordCollection = this.iterate(node);
    wordCollection = wordCollection.map(function(value){
      return prefix.substring(0, prefix.length-1) + value;
    });
    return wordCollection;
  };

  // Find the node that correspond to the last character in the string.
  //
  // Returns Node.
  this.findLastNode = function(string) {
    return this._findLastNode(this.head, string);
  };

  // Recursive function. Helper function for the findLastNode function.
  this._findLastNode = function(node, word) {
    while(word){
      var letter = word[0];
      word = word.substr(1);

      node = letterInChildren(node, letter);
      console.log(letter, word, node);
      if(!node)
        return null;
    }
    return node;
  };

  // Given a node, return all the strings that are part of this node.
  //
  // Returns Array of Strings.
  this.iterate = function(node) {
    var wordCollection = [];
    var currentStr = "";

    var node = this._findLastNode(node, "");
    var getWords = function(node) {
      currentStr += node.value || "";

      if(node.isWord)
        wordCollection.push(currentStr);

      node.children.forEach(function(child) {
        getWords(child);
      })
      currentStr = currentStr.substr(0, currentStr.length-1);
    }

    if(node) {
      currentStr += node.value || "";
      if(node.isWord)
        wordCollection.push(currentStr);
      node.children.forEach(getWords);
    }

    return wordCollection;
  };

  // Recursive helper function for .iterate
  this._iterate = function() {

  };

  // You may find this function useful for implementing iterate().
  //
  // Returns true if object is empty. False otherwise.
  this.isEmpty = function (object) {
    for(var i in object) {
      return false;
    }
    return true;
  }
};