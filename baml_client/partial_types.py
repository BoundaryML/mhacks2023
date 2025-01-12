###############################################################################
#
#  Welcome to Baml! To use this generated code, please run the following:
#
#  $ pip install baml
#
###############################################################################

# This file was generated by BAML: please do not edit it. Instead, edit the
# BAML files and re-generate this code.
#
# ruff: noqa: E501,F401
# flake8: noqa: E501,F401
# pylint: disable=unused-import,line-too-long
# fmt: off
import baml_py
from enum import Enum
from pydantic import BaseModel, ConfigDict
from typing import Dict, List, Optional, Union

from . import types

###############################################################################
#
#  These types are used for streaming, for when an instance of a type
#  is still being built up and any of its fields is not yet fully available.
#
###############################################################################


class Experience(BaseModel):
    
    
    role: Optional[str] = None
    company: Optional[str] = None

class Hand(BaseModel):
    
    
    isRealHand: Optional[bool] = None
    heldUp: Optional[bool] = None
    numberFingers: Optional[int] = None

class HandDescription(BaseModel):
    
    
    thumbUp: Optional[types.UpType] = None
    indexFingerUp: Optional[types.UpType] = None
    middleFingerUp: Optional[types.UpType] = None
    ringFingerUp: Optional[types.UpType] = None
    pinkyFingerUp: Optional[types.UpType] = None

class HandsReponse(BaseModel):
    
    
    hands: List["Hand"]

class Resume(BaseModel):
    
    
    name: Optional[str] = None
    email: Optional[str] = None
    experience: List["Experience"]
    skills: List[Optional[str]]
