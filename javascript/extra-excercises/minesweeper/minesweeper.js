export const annotate = (input) =>  {
  /*
    const expected = [
      '1*22*1',
      '12*322',
      ' 123*2',
      '112*4*',
      '1*22*2',
      '111111',
    ];
    
    const input = [
      ' *  * ',
      '  *   ',
      '    * ',
      '   * *',
      ' *  * ',
      '      ',
    ];

    problem description: ... given an array of strings. 
    map out connected characters including diagonals.

    solution ideas: 
    1) store 3 variables, aboveRow, currentRow, belowRow.
    when iterating the first row, above row will be undefined.

    try to look back a char if none found handle undefined.

    currentCursorPosition = the value we are investigating.
    buildRow function - will return a single complete string for a row.
  */
  const findMines = (charString) => {
    const regex = /\*/g;
    const found = charString.match(regex);
    return found ? found.length : 0
  }

  const getSlidingWindow = (row, cursorIndex) => {
    // example string: 'abcd'
    // cursor position values:
    // 0, 'ab'
    // 1, 'abc'
    // 2, 'bcd'
    // 3, 'cd'
    const first = cursorIndex-1
    const last = cursorIndex+2
    // input 1 - slice(0, 3)

    // going over on slice does not cause an issue so error no need to handle the error.
    const slidingWindow = 
      cursorIndex === 0 
        ? row.slice(cursorIndex, last) 
        : row.slice(first, last)
    
    return slidingWindow
  }

  const checkRow = ( currentCursorPosition, index ) => {
    const currentRow = input[index]
    if(currentRow === undefined){ return 0 };
    const windowRow = getSlidingWindow(currentRow, currentCursorPosition)
    const minesFound = findMines(windowRow)
    return minesFound
  }
  
  const buildRow = (row, rowIndex = 0) => {
    let currentCursorPosition = 0
    const str = 'banana';

    const res = [...row].map((char, currentCursorPosition) => {
      
      if(char === '*'){
        return char
      }
      else if(char === ' ') {
        const adjacentValuesToSpaces = examineCharacter(currentCursorPosition, rowIndex)
        return adjacentValuesToSpaces
      }
    }).join('')
    return res
  }

  const examineCharacter = (currentCursorPosition, rowIndex) => {
    const adjacentValuesToSpaces = checkRow(currentCursorPosition, rowIndex-1) +
    checkRow(currentCursorPosition, rowIndex) +
    checkRow(currentCursorPosition, rowIndex+1)

    return adjacentValuesToSpaces ? adjacentValuesToSpaces : ' '
  }
  return input.map( (row, index) => {
    return buildRow( row, index ) 
  })

  // const checkAboveRow = ( currentCursorPosition, rowIndex ) => {
  // }
  // const checkBelowRow = ( currentCursorPosition, rowIndex ) => {
  // }
  // const checkCurrentRow = ( currentCursorPosition, rowIndex ) => {
  // }
}


