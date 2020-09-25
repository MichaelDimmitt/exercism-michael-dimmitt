//
// This is only a SKELETON file for the 'Resistor Color Duo' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

const colorHashMap = {
  black: 0,
  brown: 1,
  red: 2,
  orange: 3,
  yellow: 4,
  green: 5,
  blue: 6,
  violet: 7,
  grey: 8,
  white: 9
}

const colorHashMapPlus1 = {
  black: 1,
  brown: 2,
  red: 3,
  orange: 4,
  yellow: 5,
  green: 6,
  blue: 7,
  violet: 8,
  grey: 9,
  white: 10
}

export const decodedValue = ([code1, code2, ...rest]) => {
  try {
    const recursiveResult = handleErrantInput(code1, code2, rest)
    if(recursiveResult === 'no recursion, continue'){
      return (colorHashMap[code1] * 10) + colorHashMap[code2]
    }
    else { 
      return recursiveResult 
    }
  }catch(error){
    console.log({error})
    throw error
  }
};

const handleErrantInput = (code1, code2, rest) => {
  if( !(colorHashMapPlus1[code1] && colorHashMapPlus1[code2]) ){
    if( rest.length === 0 ){ throw 'codes provided are not valid!' }
    else if ( colorHashMapPlus1[code1] ) { return decodedValue([code1, ...rest]) }
    else if ( colorHashMapPlus1[code2] ) { return decodedValue([code2, ...rest])}
    else if(rest.length === 1){ throw 'codes provided are not valid!' }
    else { return decodedValue([...rest]) }
  }
  return 'no recursion, continue';
}
