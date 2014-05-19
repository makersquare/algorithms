describe("Trie", function () {
  var trie;

  beforeEach(function() {
    trie = new Trie();
  });

  describe("with data", function () {
    beforeEach(function() {
      trie.insert("dog");
      trie.insert("dad");
      trie.insert("dot");
      trie.insert("do");
      trie.insert("bird");
      trie.insert("bird"); // Double-insert
    });

    describe("includes", function () {
      it("should include inserted strings", function () {
        expect(trie.includes("dog")).toBeTruthy();
        expect(trie.includes("dad")).toBeTruthy();
        expect(trie.includes("dot")).toBeTruthy();
        expect(trie.includes("do")).toBeTruthy();
        expect(trie.includes("bird")).toBeTruthy();
      });

      it("should exclude inserted strings", function () {
        expect(trie.includes(undefined)).toBeFalsy();
        expect(trie.includes("")).toBeFalsy();
        expect(trie.includes("d")).toBeFalsy();
        expect(trie.includes("dott")).toBeFalsy();
        expect(trie.includes("bir")).toBeFalsy();
      });
    });

    describe("iterate", function () {
      it("should include correct strings", function () {
        expect(trie.iterate()).toEqual([]);
        expect(trie.iterate(trie.head.children["d"].children["o"].children["g"]).sort()).toEqual(["g"]);
        expect(trie.iterate(trie.head.children["d"].children["o"]).sort()).toEqual(["og", "ot", "o"].sort());
        expect(trie.iterate(trie.head.children["d"]).sort()).toEqual(["dog", "dot", "do", "dad"].sort());
        expect(trie.iterate(trie.head.children["b"]).sort()).toEqual(["bird"].sort());
        expect(trie.iterate(trie.head).sort()).toEqual(["dog", "dot", "do", "dad", "bird"].sort());
      });
    });

    describe("findLastNode", function () {
      it("should find last node", function () {
        expect(trie.findLastNode()).toEqual(trie.head);
        expect(trie.findLastNode("")).toEqual(trie.head);
        expect(trie.findLastNode("d")).toEqual(trie.head.children["d"]);
        expect(trie.findLastNode("do")).toEqual(trie.head.children["d"].children["o"]);
        expect(trie.findLastNode("dog")).toEqual(trie.head.children["d"].children["o"].children["g"]);
        expect(trie.findLastNode("dogs")).toBeNull();
        expect(trie.findLastNode("xyz")).toBeNull();
      });
    });

    describe("search", function () {
      it("should return all strings with the same prefix", function () {
        expect(trie.search("xyz").sort()).toEqual([]);
        expect(trie.search("dog").sort()).toEqual(["dog"].sort());
        expect(trie.search("do").sort()).toEqual(["dog", "dot", "do"].sort());
        expect(trie.search("d").sort()).toEqual(["dog", "dot", "do", "dad"].sort());
        expect(trie.search("").sort()).toEqual(["dog", "dot", "do", "dad", "bird"].sort());
        expect(trie.search().sort()).toEqual(["dog", "dot", "do", "dad", "bird"].sort());
      });
    });
  });

  describe("with blank trie", function () {
    describe("includes", function () {
      it("should be blank", function () {
        expect(trie.includes(undefined)).toBeFalsy();
        expect(trie.includes("")).toBeFalsy();
        expect(trie.includes("xyz")).toBeFalsy();
      });
    });

    describe("iterate", function () {
      it("should be blank", function () {
        expect(trie.iterate()).toEqual([]);
        expect(trie.iterate(trie.head)).toEqual([]);
      });
    });

    describe("findLastNode", function () {
      it("should be blank", function () {
        expect(trie.findLastNode()).toEqual(trie.head);
        expect(trie.findLastNode("xyz")).toBeNull();
      });
    });

    describe("search", function () {
      it("should be blank", function () {
        expect(trie.search("xyz")).toEqual([]);
      });
    });
  });

  describe("isEmpty", function () {
    it("should return true for empty collections", function () {
      expect(trie.isEmpty([])).toBeTruthy();
      expect(trie.isEmpty({})).toBeTruthy();
      expect(trie.isEmpty("")).toBeTruthy();
    });

    it("should return false if not empty", function () {
      expect(trie.isEmpty(["a"])).toBeFalsy();
      expect(trie.isEmpty({a: 4})).toBeFalsy();
      expect(trie.isEmpty("a")).toBeFalsy();
    });
  });
});
