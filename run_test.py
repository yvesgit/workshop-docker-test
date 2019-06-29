import unittest

import run

class TestRun(unittest.TestCase):

    def test_execute(self):
      self.assertEqual(2, run.execute(1))
    def test_expect_false(self):
      self.assertEqual(3, run.execute(2))

if __name__ == '__main__':
    unittest.main()
