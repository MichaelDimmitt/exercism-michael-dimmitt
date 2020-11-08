export const toRna = (dna) => {
  return dna.replace(validLettersRegex, (nuc) => dnaRnaTranscriber[nuc]);
};

const validLettersRegex = /./g;

const dnaRnaTranscriber = {
  'G': 'C',
  'C': 'G',
  'T': 'A',
  'A': 'U'
}
