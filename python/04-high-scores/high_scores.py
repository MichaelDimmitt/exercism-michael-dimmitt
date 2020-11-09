import bisect

def latest(scores):
    # return scores.pop()
    return scores[-1]

# Input lists are not sorted so best conceivable runtime is O(n)
def personal_best(scores):
    return max(scores)

def personal_top_three(scores):
    return sorted(scores, reverse=True)[:3]