import unittest

import GeneralPythonTemplate.core as core

from .context import GeneralPythonTemplate

# https://docs.python.org/3/library/unittest.html


class BasicTest(unittest.TestCase):
    def test(self):
        self.assertEqual(core.add(3, 4), 7)


if __name__ == "__main__":
    unittest.main()
