from math import floor

from numpy import number
from torch import numel

def digit_to_english(n):
    NAMES = {
        0: 'zero',
        1: 'one',
        2: 'two',
        3: 'three',
        4: 'four',
        5: 'five',
        6: 'six',
        7: 'seven',
        8: 'eight',
        9: 'nine',
    }
    return NAMES[n]


def decade_to_english(n):
    NAMES = {
        2: 'twenty',
        3: 'thirty',
        4: 'forty',
        5: 'fifty',
        6: 'sixty',
        7: 'seventy',
        8: 'eighty',
        9: 'ninety',
    }
    return NAMES[n]


def teen_to_english(n):
    NAMES = {
        10: 'ten',
        11: 'eleven',
        12: 'twelve',
        13: 'thirteen',
        14: 'fourteen',
        15: 'fifteen',
        16: 'sixteen',
        17: 'seventeen',
        18: 'eighteen',
        19: 'nineteen',
    }
    return NAMES[n]


def number_to_english(n):
    ret = ''
    
    if n == 0:
        return 'zero'

    if n >= 1000:
        ret += digit_to_english(floor(n / 1000)) + ' thousand '
        n %= 1000
    
    if n >= 100:
        ret += digit_to_english(floor(n / 100)) + ' hundred '
        n %= 100

    if ret and n != 0:
        ret += 'and '

    if n >= 10:
        if n < 20:
            ret += teen_to_english(n)
            return ret
        else:
            ret += decade_to_english(floor(n / 10)) + ' '
            n %= 10
    
    if n > 0:
        ret += digit_to_english(n)

    return ret

total = sum(len(name.replace(' ', '')) for name in [number_to_english(i) for i in range(1, 1001)])
print(f'The sum of the number of chars for numbers 1 to 1000 is {total}')