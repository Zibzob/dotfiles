#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""This module's docstring summary line.

This is a multi-line docstring. Paragraphs are separated with blank lines.
Lines conform to 79-column limit.

Module and packages names should be short, lower_case_with_underscores.
Notice that this in not PEP8-cheatsheet.py

Seriously, use flake8. Atom.io with https://atom.io/packages/linter-flake8
is awesome!

See http://www.python.org/dev/peps/pep-0008/ for more PEP-8 details
"""

# Only import modules and packages, no class/functions, and with full name
# rather than relative : 
import package.module # verbose
toto = package.module.func()
from package_name import module # common
toto = module.func()

import os  # STD lib imports first
import sys  # alphabetical

import some_third_party_lib  # 3rd party stuff next
import some_third_party_other_lib  # alphabetical

import local_stuff  # local stuff last
import more_local_stuff
import dont_import_two, modules_in_one_line  # IMPORTANT!
from pyflakes_cannot_handle import *  # and there are other reasons it should be avoided # noqa
# Using # noqa in the line above avoids flake8 warnings about line length!


_a_global_var = 2  # so it won't get imported by 'from foo import *'
_b_global_var = 3

A_CONSTANT = 'ugh.'


# 2 empty lines between top-level funcs + classes
def naming_convention():
    """This is an example of a module level function.

    Function parameters should be documented in the ``Args`` section. The name
    of each parameter is required. The type and description of each parameter
    is optional, but should be included if not obvious.

    If \*args or \*\*kwargs are accepted,
    they should be listed as ``*args`` and ``**kwargs``.

    The format for a parameter is::

        name (type): description
            The description may span multiple lines. Following
            lines should be indented. The "(type)" is optional.

            Multiple paragraphs are supported in parameter
            descriptions.

    Args:
        param1 (int): The first parameter.
        param2 (:obj:`str`, optional): The second parameter. Defaults to None.
            Second line of description should be indented.
        *args: Variable length argument list.
        **kwargs: Arbitrary keyword arguments.

    Returns:
        bool: True if successful, False otherwise.

        The return type is optional and may be specified at the beginning of
        the ``Returns`` section followed by a colon.

        The ``Returns`` section may span multiple lines and paragraphs.
        Following lines should be indented to match the first line.

        The ``Returns`` section supports any reStructuredText formatting,
        including literal blocks::

            {
                'param1': param1,
                'param2': param2
            }

    Raises:
        AttributeError: The ``Raises`` section is a list of all exceptions
            that are relevant to the interface.
        ValueError: If `param2` is equal to `param1`.

    """
    if x == 4:  # x is blue <== USEFUL 1-liner comment (2 spaces before #)
        x, y = y, x  # inverse x and y <== USELESS COMMENT (1 space after #)
    c = (a + b) * (a - b)  # operator spacing should improve readability.
    dict['key'] = dict[0] = {'x': 2, 'cat': 'not a dog'}


class NamingConvention(object):
    """First line of a docstring is short and next to the quotes.

    Class and exception names are CapWords.

    Closing quotes are on their own line
    """

    a = 2
    b = 4
    _internal_variable = 3
    class_ = 'foo'  # trailing underscore to avoid conflict with builtin

    # this will trigger name mangling to further discourage use from outside
    # this is also very useful if you intend your class to be subclassed, and
    # the children might also use the same var name for something else; e.g.
    # for simple variables like 'a' above. Name mangling will ensure that
    # *your* a and the children's a will not collide.
    __internal_var = 4

    # NEVER use double leading and trailing underscores for your own names
    __nooooooodontdoit__ = 0

    # don't call anything (because some fonts are hard to distiguish):
    l = 1
    O = 2
    I = 3

    # some examples of how to wrap code to conform to 79-columns limit:
    def __init__(self, width, height,
                 color='black', emphasis=None, highlight=0):
        if width == 0 and height == 0 and \
           color == 'red' and emphasis == 'strong' or \
           highlight > 100:
            raise ValueError('sorry, you lose')
        if width == 0 and height == 0 and (color == 'red' or
                                           emphasis is None):
            raise ValueError("I don't think so -- values are %s, %s" %
                             (width, height))
        Blob.__init__(self, width, height,
                      color, emphasis, highlight)

    # empty lines within method to enhance readability; no set rule
    short_foo_dict = {'loooooooooooooooooooong_element_name': 'cat',
                      'other_element': 'dog'}

    long_foo_dict_with_many_elements = {
        'foo': 'cat',
        'bar': 'dog'
    }

    # 1 empty line between in-class def'ns
    def foo_method(self, x, y=None):
        """Method and function names are lower_case_with_underscores.

        Always use self as first arg.
        """
        pass

    @classmethod
    def bar(cls):
        """Use cls!"""
        pass

# a 79-char ruler:
# 34567891123456789212345678931234567894123456789512345678961234567897123456789

"""
Common naming convention names:
snake_case
MACRO_CASE
camelCase
CapWords
"""

# Newline at end of file
