export const isPangram = (paragraph) => {  
  return setSolution(paragraph)
  // return regexAttempt(paragraph)
  // return reduceSolution(paragraph)
};

const reduceSolution = (paragraph) => {
  const lc = paragraph.toLowerCase()
  const alphabet = [...Array(26)].map((x,i)=>String.fromCharCode(i + 97))
  return alphabet.reduce( (acc, cur) => 
    acc = acc ? lc.includes(cur) : acc 
    ,true
  )
}

const regexAttempt = (paragraph) => {
  const pangramRegex = /(?=.*a)(?=.*b)(?=.*c)(?=.*d)(?=.*e)(?=.*f)(?=.*g)(?=.*h)(?=.*i)(?=.*j)(?=.*k)(?=.*l)(?=.*m)(?=.*n)(?=.*o)(?=.*p)(?=.*q)(?=.*r)(?=.*s)(?=.*t)(?=.*u)(?=.*v)(?=.*w)(?=.*x)(?=.*y)(?=.*z)./i
  const res2 = pangramRegex.test(paragraph);
  return res2
}

const setSolution = paragraph => new Set(paragraph.toLowerCase().match(/[a-z]/g)).size === 26