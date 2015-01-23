module.exports = function(){
  var cities = {};

  var getCity = function(name){
    if(!cities[name]){
      cities[name] = new City(name);
    }
    return cities[name];
  };

  var addCity = function(name){
    return getCity(name);
  };

  var findPath = function(city1, city2){
    for(var city in cities){
      cities[city].resetPathVars();
    }
    var start = getCity(city1);
    var finish = getCity(city2);
    start.path = 0;
    citiesToSearch = [getCity(city1)];

    while(citiesToSearch.length){
      var currentCity = findClosestCity(citiesToSearch);
      if(currentCity.name === finish.name){
        return finish.path;
      }

      currentCity.solved = true;

      for(var city in currentCity.neighbors){
        var neighbor = currentCity.neighbors[city].city;
        var distance = currentCity.neighbors[city].distance;
        var containsNeighbor = false;

        if(!neighbor.solved
          && (!neighbor.path || neighbor.path > currentCity.path + distance)){

          neighbor.path = currentCity.path + distance;
          neighbor.parent = currentCity;

          for(var i = 0; i < citiesToSearch.length; i++){
            if(citiesToSearch[i].name === neighbor.name){
              containsNeighbor = true;
            }
          }
          if(!containsNeighbor){
            citiesToSearch.push(neighbor);
          }
        }
      }
    }
    return null;
  };

  var findClosestCity = function(cities){
    cities.sort(function(a, b){
      return a.path - b.path;
    });
    return cities.shift();
  };

  var addRoad = function(city1, city2, distance){
    c1 = getCity(city1);
    c2 = getCity(city2);
    c1.addNeighbor(c2, distance);
    c2.addNeighbor(c1, distance);
  };

  var City = function(name){
    this.name = name;
    this.neighbors = {};
    this.resetPathVars();
  };

  City.prototype.resetPathVars = function(){
    this.parent = null;
    this.path = null;
    this.solved = false;
  };

  City.prototype.addNeighbor = function(otherCity, distance){
    this.neighbors[otherCity.name] = {
      city: otherCity,
      distance: distance
    };
  };

  return {
    addCity: addCity,
    findPath: findPath,
    addRoad: addRoad
  }
}