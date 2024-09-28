

class HandsReponse {
    hands Hand[]
}

class Hand {
    isRealHand bool
    heldUp bool
    numberFingers int
}

function HandsHoldingUpNumbers(arg: image) -> HandsReponse {
    client "openai/gpt-4o"
    prompt #"
        {{ ctx.output_format }}

        {{ _.role('user') }}
        {{ arg }}
    "#
}

enum UpType {
    FullyUp @alias(k0) @description(#"
        intentionally meant to count
    "#)
    HalfUp @alias(k1) @description(#"
       counts as a half vote
    "#)
    Down @alias(k2) @description(#"
        its not intended to count
    "#)

    @@alias(FingerVisibility)
}

class HandDescription {
    thumbUp UpType
    indexFingerUp UpType
    middleFingerUp UpType
    ringFingerUp UpType
    pinkyFingerUp UpType
}

function DescribeHand(arg: image, num_hands: int) -> HandDescription[] {
    client "openai/gpt-4o"
    prompt #"
        There are atleast {{ num_hands }} hands in the image.

        {{ ctx.output_format }}

        {{ _.role('user') }}
        {{ arg }}
    "#
}

test TestName {
  functions [HandsHoldingUpNumbers]
  args {
    arg {
        url "https://imgs.xkcd.com/comics/standards.png"
    }
  }
}


test TestName1 {
  functions [DescribeHand]
  args {
    num_hands 1
    arg {
        file "./num1.png"
    }
  }
}


test TestName1 {
  functions [HandsHoldingUpNumbers]
  args {
    arg {
        file "./num1.png"
    }
  }
}


test TestName2 {
  functions [DescribeHand]
  args {
    num_hands 2
    arg {
        file "./num2.png"
    }
  }
}

test TestName2 {
  functions [HandsHoldingUpNumbers]
  args {
    arg {
        file "./num2.png"
    }
  }
}


test TestName3 {
  functions [HandsHoldingUpNumbers]
  args {
    arg {
        file "./num3.png"
    }
  }
}

test TestName3 {
  functions [DescribeHand]
  args {
    num_hands 3
    arg {
        file "./num3.png"
    }
  }
}


test TestName4 {
  functions [HandsHoldingUpNumbers]
  args {
    arg {
        file "./num4.png"
    }
  }
}
