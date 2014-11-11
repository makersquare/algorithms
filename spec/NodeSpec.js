describe("Node", function () {
    var node;

    beforeEach(function() {
      node = new Node();
    });

    describe("add", function () {
      it("should add a child with a given value", function () {
        node.add('a');
        expect(node.children).toBeTruthy();
      })
      it("should not create duplicate children", function () {
        node.add('a');
        node.add('a');
        expect(node.children.length).toEqual(1);
      })
    })

    describe("getchild", function () {
      it("should return a Node, if it is a direct child", function () {
        node.add('a');
        expect(node.getChild('a')).toBeTruthy();
      })
    })
});

