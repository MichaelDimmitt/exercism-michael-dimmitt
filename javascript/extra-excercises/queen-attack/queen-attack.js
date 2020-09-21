//
// This is only a SKELETON file for the 'Queen Attack' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class QueenAttack {
    
    constructor({ white, black } =  { white: [0, 3], black: [7, 3] } ) {
        if(JSON.stringify(white) === JSON.stringify(black)){throw 'Queens cannot share the same space'}
        this.white = white;
        this.black = black;
        
    }

    toString() {
      let board = [
        '_ _ _ _ _ _ _ _',// 14 - 6 = 8, 0,2,4,6,8,10,12,14
        '_ _ _ _ _ _ _ _',
        '_ _ _ _ _ _ _ _',
        '_ _ _ _ _ _ _ _',
        '_ _ _ _ _ _ _ _',
        '_ _ _ _ _ _ _ _',
        '_ _ _ _ _ _ _ _',
        '_ _ _ _ _ _ _ _\n'
      ]
      // even numbers
      // [7, 7], black: [0, 0]
      const w = this.white
      const b = this.black
      const setCharAt = (str,index,chr) => {
        if(index > str.length-1) return str;
        return str.substring(0,index) + chr + str.substring(index+1);
      }
      board[w[0]] = setCharAt(board[w[0]],w[1]*2,'W');
      board[b[0]] = setCharAt(board[b[0]],b[1]*2,'B');
      
      return board.join('\n');

    }

    canAttack() {
        const w = this.white
        const b = this.black

        const xDiff = w[0] - b[0]
        const yDiff = w[1] - b[1]
        return xDiff === 0 || yDiff === 0 || xDiff === yDiff || xDiff === (yDiff * -1)
    }
}
