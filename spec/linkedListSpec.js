var LinkedList = require('../linkedList');

describe("Linked List", function(){
  var linkedList;

  beforeEach(function() {
    linkedList = new LinkedList();
  });

  describe("initialization", function() {
    it("initializes with size 0", function() {
      expect(linkedList.length).toEqual(0);
    });

    it("initializes with first element as undefined", function() {
      expect(linkedList.first()).toEqual(undefined);
    });

    it("initializes with last element as undefined", function() {
      expect(linkedList.last()).toEqual(undefined);
    });
  });

  describe("Adding cards", function() {
    describe("first added card", function() {
      it("increments the size", function() {
        linkedList.push(5);
        expect(linkedList.length).toEqual(1);
      });

      it("changes what the last element is", function() {
        linkedList.push(5);
        expect(linkedList.last()).toEqual(5);
      });

      it("changes what the first element is", function() {
        linkedList.push(5);
        expect(linkedList.first()).toEqual(5);
      })
    });

    describe("adding 2 cards", function() {
      it("increments the size", function() {
        linkedList.push(5);
        linkedList.push(6);
        expect(linkedList.length).toEqual(2);
      });

      it("changes what the last element is", function() {
        linkedList.push(5);
        linkedList.push(6);
        expect(linkedList.last()).toEqual(6);
      });

      it("sets first card to the first pushed card", function() {
        linkedList.push(5);
        linkedList.push(6);
        expect(linkedList.first()).toEqual(5);
      });
    });
  });

  describe("removing cards", function() {
    it("returns undefined if there are no cards", function() {
      expect(linkedList.shift()).toEqual(undefined);
    });

    describe("removing the first card", function() {
      beforeEach(function() {
        linkedList.push(5);
        linkedList.push(10);
      });

      it("decrements the size", function() {
        linkedList.shift();
        expect(linkedList.length).toEqual(1);
      });

      it("returns the first element", function() {
        expect(linkedList.shift()).toEqual(5);
      });
    });

    describe("removing the only card", function() {
      it("sets the tail to undefined", function() {
        linkedList.push(5);
        linkedList.shift();
        expect(linkedList.tail).toBeUndefined();
      });
    });
  });
});
