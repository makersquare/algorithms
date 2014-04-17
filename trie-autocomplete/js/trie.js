var Node = function(options) {
  options || (options = {});
  this.value = options.value; // The character this node holds
  this.parent = options.parent; // Parent node.
  this.children = options.children || {}; // Hash of character to object
  this.stop = options.stop; // Boolean. If true, this node stops a word.
};

var Trie = function() {
  this.head = new Node();

  // Inserts string into the Trie.
  this.insert = function(string) {
    if (!string || string.length === 0) {
      return;
    }

    this._insert(string, 0, this.head);
  };

  // Recursive function. Go through each character of the string recursively. At
  // each character, decide whether a child node exists or if we need to add a
  // new node.
  //
  // Base case:
  //   - At the end of the string. (Have gone through each character)
  //
  // Recursive case:
  //   - Add a new node if needed.
  //   - Keep on going donw.
  //
  this._insert = function(string, index, node) {
    var char = string[index];
    var atEnd = (string.length - 1) === index;

    if (node.children[char]) {
      child = node.children[char];
      if (atEnd) {
        // Base case: we're at the end of our string. Mark this node as a stop
        // node and stop recursing.
        child.stop = true;
      } else {
        this._insert(string, index+1, child);
      }
    } else {
      // The node for this char does not exist. Insert a new node.
      var newNode = new Node({value: char, parent: node, stop: atEnd});
      node.children[char] = newNode;

      // If we were at the end of our string, we're done. But not at the end of
      // the string, keep on going.
      if (!atEnd) {
        this._insert(string, index+1, newNode);
      }
    }
  };

  // Returns true if string is in the trie. Returns false otherwise.
  this.includes = function(string) {
    if (!string || string.length === 0) {
      // Blank never exists.
      return false;
    }

    return this._includes(string, this.head);
  };

  // Recursive function. Returns true if string is in the trie. Returns false
  // otherwise.
  this._includes = function(substring, node) {
    // TODO: Implement this function.
    return false;
  };

  // Search for all strings that have 'prefix' as the prefix.
  //
  // Returns Array of Strings.
  this.search = function(prefix) {
    var startingNode = this.findLastNode(prefix);
    var innerStrings = this.iterate(startingNode);

    var strings = [];

    if (prefix) {
      // Strip last character, because iterate() includes it.
      prefix = prefix.substring(0, prefix.length - 1);
    } else {
      // prefix was undefined
      prefix = "";
    }

    for (var i in innerStrings) {
      strings.push(prefix + innerStrings[i]);
    }
    return strings;
  };

  // Find the node that correspond to the last character in the string.
  //
  // Returns Node.
  this.findLastNode = function(string) {
    if (!string || string.length === 0) {
      return this.head;
    }

    return this._findLastNode(string, this.head);
  };

  // Recursive function.
  //
  // Base case:
  //   - No children nodes to continue traversal. Must mean string does not
  //     exist.
  //   - At the end of the string. Node exists, so return the current node.
  //
  // Recursive case:
  //   - Go down the correct child node.
  //
  this._findLastNode = function(string, node) {
    if (!node) {
      // If node is falsey, then the (original) string does not exist in the
      // Trie.
      return null;
    }

    if (string.length === 0) {
      // Done! This is the node.
      return node;
    }

    return this._findLastNode(string.substring(1, string.length), node.children[string[0]]);
  }

  // Given a node, return all the strings that are part of this node.
  //
  // Returns Array of Strings.
  this.iterate = function(node) {
    // TODO: Implement this function.
    return [];
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

