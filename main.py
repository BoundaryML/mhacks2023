

from typing import List, Tuple
from baml_client import b
from baml_py.baml_py import BamlImagePy

from baml_client.types import UpType



img = "..."

def num_hands_with_numbers(img: BamlImagePy) -> int:
    response = b.HandsHoldingUpNumbers(img)
    num_hands = 0
    for hand in response.hands:
        if hand.isRealHand and hand.heldUp:
            num_hands += 1
    
    return num_hands

def get_numbers(img: BamlImagePy, num_hands: int) -> List[int]:
    hands = b.DescribeHand(img, num_hands)
    fingers = []
    for hand in hands:
        finger_count = 0
        if hand.thumbUp == UpType.FullyUp:
            finger_count += 1
        if hand.indexFingerUp == UpType.FullyUp:
            finger_count += 1
        if hand.middleFingerUp == UpType.FullyUp:
            finger_count += 1
        if hand.ringFingerUp == UpType.FullyUp:
            finger_count += 1
        if hand.pinkyFingerUp == UpType.FullyUp:
            finger_count += 1
        fingers.append(finger_count)
    return fingers

def main():
    num_hands = num_hands_with_numbers(img)
    if num_hands < 2:
        print("Please hold up at least two hands with some fingers")
        return
    
    numbers = get_numbers(img)
    total = 1
    for number in numbers:
        total *= number
    print(f"Your total is {total}")
