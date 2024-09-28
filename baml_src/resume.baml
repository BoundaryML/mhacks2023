// Defining a data model.
class Resume {
  name string
  email string
  experience Experience[]
  skills string[]
}

class Experience {
  role string
  company string
}

// Creating a function to extract the resume from a string.
function ExtractResume(resume: image | string) -> Resume {
  client "openai/gpt-4o"
  prompt #"
    {{ _.role('user') }}

    Extract from this content:
    -----------
    {{ resume }}
    ----------

    {{ ctx.output_format }}

    DONT USE QUOTES IN STRINGS
  "#
}

test png_resume {
  functions [ExtractResume]
  args {
    resume {
      file "vai.png"
    }
  }
}

// Testing the function with a sample resume.
test vaibhav_resume {
  functions [ExtractResume]
  args {
    resume #"
      Vaibhav Gupta
      vbv@boundaryml.com

      Experience:
      - Founder at BoundaryML
      - CV Engineer at Google
      - CV Engineer at Microsoft

      Skills:
      - Rust
      - C++
    "#
  }
}
