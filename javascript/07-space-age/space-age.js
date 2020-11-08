export const age = (planet, inputSeconds) => {
  if(earthScalar[planet]){
    const EARTH_YEAR_IN_SECONDS = 31557600
    
    const planetSeconds = inputSeconds / earthScalar[planet]
    const planetYears = ( planetSeconds / EARTH_YEAR_IN_SECONDS ).toFixed(2)
    
    return Number(planetYears)
  }
  
};

// Earth: 1.0 Earth years, 365.25 Earth days, or 31,557,600 seconds
const orbitalPeriods = {
  earth: 1,
  mercury: 0.2408467,
  venus: 0.61519726,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132
}
