console.log("hi")

let obj = {
  name: "Richard"
}

let bool = true;

console.log('obj: ', obj);
console.log('obj.toString: ', obj.toString);
console.log('obj.constructor: ', obj.constructor);

let str = obj.hasOwnProperty("name")
console.log('str: ', str);

console.log('bool: ', bool);
bool = !bool
console.log('bool: ', bool);
