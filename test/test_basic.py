from .context import GeneralPythonTemplate
import unittest

def increment(num_input):
	return num_input+1
	
class BasicTest(unittest.TestCase):
	def test(self):
		self.assertEqual(increment(3),4)
