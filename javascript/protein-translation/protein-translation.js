//
// This is only a SKELETON file for the 'Protein Translation' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

// AUG	Methionine
// UUU, UUC	Phenylalanine
// UUA, UUG	Leucine
// UCU, UCC, UCA, UCG	Serine
// UAU, UAC	Tyrosine
// UGU, UGC	Cysteine
// UGG	Tryptophan
// UAA, UAG, UGA	STOP

const protiens = [
  'Methionine',
  'Phenylalanine',
  'Leucine',
  'Serine',
  'Tyrosine',
  'Cysteine',
  'Tryptophan'
]

const protienHashMap = {
  AUG: protiens[0],
  UUU: protiens[1],
  UUC: protiens[1],
  UUA: protiens[2],
  UUG: protiens[2],
  UCU: protiens[3],
  UCC: protiens[3],
  UCA: protiens[3],
  UCG: protiens[3],
  UAU: protiens[4],
  UAC: protiens[4],
  UGU: protiens[5],
  UGC: protiens[5],
  UGG: protiens[6],
  UAA: false,
  UAG: false,
  UGA: false
}
// const stopHashMap = {
// }

export  const translate = (codonString) => {
  const codonArray = codonString ? codonString.match(/.{1,3}/g) : []

  let protienArray = getProtienUsingLoop(codonArray)
  // let protienArray = getProtienUsingReduce(codonArray)
  return protienArray
};

const getProtienUsingReduce = (codonArray, stopFlag = false) => {
  const protienArray  = codonArray.reduce( (acc, codon) => {
    if(stopFlag){ return acc }
    const protien = protienHashMap[codon]
    
    if(protien){ acc.push(protien) }
    else if (protien === false) { stopFlag = true; }
    else { throw('Invalid codon') }
    
    return acc;
  },
  []);
  return protienArray;
}

const getProtienUsingLoop = (codonArray, stopFlag = false) => {
  let protienArray = []
  for( let i = 0; !stopFlag && i < codonArray.length; i++ ) {
    const protien = protienHashMap[codonArray[i]]
    if(protien){ protienArray.push(protien) }
    else if (protien === false) { stopFlag = true; }
    else { throw('Invalid codon') }
  }
  return protienArray;
}
  