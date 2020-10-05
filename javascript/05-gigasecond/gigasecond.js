const SECOND = 1000;
// const BILLION = 10e8 // Math.pow(10,9)

const ONE_GIGA_SECOND = (1e9 * SECOND)

export const gigasecond = (inputDate) => 
  new Date(inputDate.getTime() + ONE_GIGA_SECOND );