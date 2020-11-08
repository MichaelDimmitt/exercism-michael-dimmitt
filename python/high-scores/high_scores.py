import bisect

def latest(scores):
    # return scores.pop()
    return scores[len(scores)-1]

# Input lists are not sorted so best conceivable runtime is O(n)
def personal_best(scores):
    return max(scores)

def personal_top_three(scores):
    l = scores
    l.sort(reverse=True)
    
    if len(l) > 3:
      a, b, c, *z = l
      l = [a, b, c]
    return l
