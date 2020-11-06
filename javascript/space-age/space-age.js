export const age = (planet, input) => {
  if(earthScalar[planet]){
    const seconds = 60
    const minutes = 60
    const hours = 24
    const year = 365
    const planetYear = getPlanetYearHandlingLeapYear(planet)
    const leapYearAdjustedScalar = planetYear / 365
    
    const earthYears = ( input  / (seconds * minutes * hours * year ) )
    const planetYears = (earthYears / leapYearAdjustedScalar).toFixed(2)
    
    return Number(planetYears)
  }
  
};

const getPlanetYearHandlingLeapYear = (planet) => {
  // if(planet === 'earth') return 365
  return ( ( 365 * 3 ) + 366 ) * earthScalar[planet] / 4
}


// Earth: 1.0 Earth years, 365.25 Earth days, or 31,557,600 seconds
const earthScalar = {
  earth: 1,
  mercury: 0.2408467,
  venus: 0.61519726,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132
}
