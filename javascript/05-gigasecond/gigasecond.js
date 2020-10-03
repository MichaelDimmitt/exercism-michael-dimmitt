const second = 1000;
const billion =  1000000000

export const gigasecond = (d) => new Date(d.getTime() + (billion * second));