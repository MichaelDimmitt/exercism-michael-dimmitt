import { decodedValue } from './resistor-color-duo.js';

describe('Resistor Colors', () => {
  test('Brown and black', () => {
    expect(decodedValue(['brown', 'black'])).toEqual(10);
  });

  test('Blue and grey', () => {
    expect(decodedValue(['blue', 'grey'])).toEqual(68);
  });

  test('Yellow and violet', () => {
    expect(decodedValue(['yellow', 'violet'])).toEqual(47);
  });

  test('Orange and orange', () => {
    expect(decodedValue(['orange', 'orange'])).toEqual(33);
  });

  test('Ignore additional colors', () => {
    expect(decodedValue(['green', 'brown', 'orange'])).toEqual(51);
  })
  test('Bad User 😏', () => {
    expect(decodedValue(['gre', 'brown', 'orange'])).toEqual(13);
  })
  test('Throw same error another way', () => {
    expect(
      () => { decodedValue(['gre', 'brwn', 'orange']) }
    ).toThrowError( 'codes provided are not valid!');
  })
});
