import sys
import random

def validate(addresses):
    for i in range(len(addresses)):
        if i == addresses[i]:
            return False
    return True

def has_loops(addresses):
    sequence = [False] * len(addresses)
    for addr in addresses:
        sequence[addr] = True

    for s in sequence:
        if not s:
            return True
    return False

def shuffle_address(size):
    addresses = [a for a in range(1, size)]
    memory = [0] * size
    cursor = 0
    rand_index = random.randint(0,len(addresses)-1)
    while addresses:
        while cursor == addresses[rand_index]:
            rand_index = random.randint(0, len(addresses)-1)
        memory[cursor] = addresses.pop(rand_index)
        if len(addresses) <= 1:
            break
        cursor = memory[cursor]
        rand_index = random.randint(0, len(addresses)-1)
    memory[memory[cursor]] = addresses.pop()
    return memory


if __name__ == '__main__':
    size = int(sys.argv[1])

    addresses = shuffle_address(size)

    is_valid = validate(addresses)
    looping  = has_loops(addresses)
    if is_valid and not looping:
        print('/'.join(str(addr) for addr in addresses))
        sys.exit(0)
    else:
        print('Ops...', sys.stderr)
        sys,exit(1)
