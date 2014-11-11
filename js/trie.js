// Defines the node object
var Node = function(options) {

  // Find the child that matches the given value
  //
  // Returns Node
  this.getChild = function(value) {
    // return a child node where it's value == value
  };

  // Adds a child node with the given value
  this.add = function(value) {

  };
};

var Trie = function() {
  this.head = new Node();

  // Inserts string into the Trie.
  this.insert = function(string) {

  };

  // Recursive function. Helper function for the insert function.
  this._insert = function() {

  };

  // Returns true if string is in the trie. Returns false otherwise.
  this.includes = function(string) {

  };

  // Recursive function. Returns true if string is in the trie. Returns false
  // otherwise.
  this._includes = function() {

  };

  // Search for all strings that have 'prefix' as the prefix.
  //
  // Returns Array of Strings.
  this.search = function(prefix) {

  };

  // Recursive function. Helper function for the search function.
  this._search = function() {

  };

  // Find the node that correspond to the last character in the string.
  //
  // Returns Node.
  this.findLastNode = function(string) {

  };

  // Recursive function. Helper function for the findLastNode function.
  this._findLastNode = function() {

  };

  // Given a node, return all the strings that are part of this node.
  //
  // Returns Array of Strings.
  this.iterate = function(node) {

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

