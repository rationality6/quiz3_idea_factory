var isEven = function (x){
  return x % 2 == 0;
};

var result = [1, 2, 3, 4].filter(isEven);
// => [2, 4]

console.log(result);
