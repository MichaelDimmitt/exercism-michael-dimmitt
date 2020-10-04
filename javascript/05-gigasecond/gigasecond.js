const SECOND = 1000;
const BILLION = 10e8 // Math.pow(10,9)

const GIGA_SECOND = (BILLION * SECOND)

export const gigasecond = (inputDate) => 
  new Date(inputDate.getTime() + GIGA_SECOND );