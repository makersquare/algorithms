var Map = require("../map");

describe("Map", function(){
  describe("findPath", function(){
    beforeEach(function(done){
      this.map = new Map();
      this.map.addCity("c1");
      this.map.addCity("c2");
      this.map.addCity("c3");
      this.map.addCity("c4");
      this.map.addCity("c5");
      this.map.addCity("c6");
      this.map.addCity("c7");
      this.map.addCity("c8");
      this.map.addCity("c9");
      done();
    });


    describe("cities that are disconnected", function(){
      it("returns null", function(){
        var distance = this.map.findPath("c1", "c2")
        expect(distance).toBeNull();
      });
    });

    describe("start and end point are the same", function(){
      it("returns 0", function(){
        var distance = this.map.findPath("c1", "c1")
        expect(distance).toEqual(0)
      });
    });

    describe("cities that are directly connected", function(){
      beforeEach(function(done){
        this.map.addRoad("c1", "c2", 100);
        this.map.addRoad("c1", "c3", 200);
        this.map.addRoad("c2", "c3", 150);
        done();
      });

      it("returns the distance between the cities", function(){
        expect(this.map.findPath("c1", "c2")).toEqual(100);
        expect(this.map.findPath("c2", "c3")).toEqual(150);
      });

      it("connects cities in the reverse order", function(){
        expect(this.map.findPath("c3", "c1")).toEqual(200);
      });
    });

    describe("cities with complex connections", function(){
      beforeEach(function(done){
        this.map.addRoad("c1", "c2", 100);
        this.map.addRoad("c1", "c3", 100);
        this.map.addRoad("c1", "c4", 100);
        this.map.addRoad("c2", "c5", 100);
        this.map.addRoad("c2", "c6", 100);
        this.map.addRoad("c3", "c7", 100);
        this.map.addRoad("c3", "c8", 100);
        this.map.addRoad("c8", "c9", 100);
        done();
      });

      describe("cities connected with no cycles", function(){
        it("finds all existing connections", function(){
          expect(this.map.findPath("c1", "c9")).toEqual(300);
          expect(this.map.findPath("c1", "c6")).toEqual(200);
          expect(this.map.findPath("c9", "c6")).toEqual(500);
        });

        it("finds new paths", function(){
          this.map.addCity("c10");
          this.map.addCity("c11");
          this.map.addRoad("c10", "c11", 150);
          expect(this.map.findPath("c10", "c11")).toEqual(150);
          expect(this.map.findPath("c1", "c11")).toBeNull();
          this.map.addRoad("c4", "c10", 200);
          expect(this.map.findPath("c1", "c11")).toEqual(450);
        });
      });

      describe("cities with cycles", function(){
        beforeEach(function(done){
          this.map.addCity("c10");
          this.map.addCity("c11");
          this.map.addCity("c12");
          this.map.addCity("c13");
          this.map.addRoad("c8", "c7", 50);
          this.map.addRoad("c10", "c1", 50);
          this.map.addRoad("c10", "c3", 50);
          this.map.addRoad("c4", "c3", 50);
          this.map.addRoad("c4", "c11", 50);
          this.map.addRoad("c12", "c11", 50);
          this.map.addRoad("c12", "c13", 50);
          this.map.addRoad("c13", "c2", 50);
          this.map.addRoad("c11", "c13", 75);
          done();
        });

        it("finds best paths", function(){
          expect(this.map.findPath("c5", "c9")).toEqual(500);
          expect(this.map.findPath("c12", "c8")).toEqual(250);
        });

        it("finds best path after alterations", function(){
          this.map.addRoad("c1", "c12", 25);
          this.map.addRoad("c2", "c12", 25);
          expect(this.map.findPath("c5", "c9")).toEqual(450);
          expect(this.map.findPath("c12", "c8")).toEqual(225);
        });
      });
    });
  });
});