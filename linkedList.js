var Node = function(value, prev, next) {
  this.value = value;
  this.prev = prev;
  this.next = next;
};

var LinkedList = function() {
  this.head = undefined;
  this.tail = undefined;
  this.length = 0
};

LinkedList.prototype.push = function(value) {
  var node = new Node(value);
  if (this.length === 0) {
    this.head = node;
    this.tail = node;
  } else {
    var oldTail = this.tail;
    this.tail = node;
    oldTail.next = node;
    node.prev = oldTail;
  }
  this.length += 1;
};

LinkedList.prototype.first = function() {
  if (this.head) {
    return this.head.value;
  }
};

LinkedList.prototype.last = function() {
  if (this.tail) {
    return this.tail.value;
  }
};

LinkedList.prototype.shift = function() {
  if (this.length === 0) {
    return undefined;
  }
  var curHead = this.head;
  var nextHead = this.head.next;
  this.head = nextHead;
  curHead.next = undefined;
  if (nextHead === undefined) {
    this.tail = undefined;
  } else {
    nextHead.prev = undefined;
  }
  this.length--;
  return curHead.value;
};

LinkedList.prototype.enqueue = LinkedList.prototype.shift;

module.exports = LinkedList;