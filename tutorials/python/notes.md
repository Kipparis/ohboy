# General Structure of file <!-- {{{ -->
```python
def _test():				# for testing purpose
    import doctest
    doctest.testmod()

if __name__ == "__main__":  # for execution
    _test()
```
<!-- }}} -->
# Testing <!-- {{{ -->
<!-- }}} -->
# Classes <!-- {{{ -->
## Special Methods <!-- {{{ -->
	+ __bool__ - useful for if x
	+ __format__ - provides str.format()
	+ __init__
	+ etc
<!-- }}} -->
## How variables are inited <!-- {{{ -->
f = FuzzyBool(0.7) <=> {
    FuzzyBool.__new__(FuzzyBool, 0.7)
    fuzzy.__init__()
}
<!-- }}} -->
## Function manipulation <!-- {{{ -->
make function unimplemented
```python
def __add__(self, other):
    raise NotImplementedError()
# more nicely
raise TypeError("unsupported operand type(s) for +: "
                "'{0}' and '{1}'".format(self.__class__.__name__, other.__class__.__name__))
                )
```
calling functions according to input:
```python
functions = dict(a=add_dvd, e=edit_dvd, l=list_dvds, 
				r=remove_dvd, i=import_, x=export, q=quit)
functions[action](db)
```
<!-- }}} -->
<!-- }}} -->
# Lists <!-- {{{ -->

<!-- }}} -->



generator expressions
(expression for item in iterable)
(expression for item in iterable if condition)

def quarters(next_quarter=0.0):
  while True:
    yield next_quarter
    next_quarter += 0.25

generators with control flow
def quarters(next_quarter=0.0):
  while True:
    received = (yield next_quarter)
    if received is None:
      next_quarter += 0.25
    else:
      next_quarter = received

use:
generator = quarters()
x = next(generator)
x = generator.send(1.0)

dynamic code execution
import math
code = '''
def area_of_sphere(r):
  return 4 * math.pi * r ** 2
'''
context = {}
context['math'] = math
exec(code, context)

all we path in context will be available in prog, and vice versa all is stored after
code execution will be available in context. so we can use 
context = globals().copy() to not override current dict

after execution:
area_of_sphere = context["area_of_sphere"]

exec() can handle any amound of code, whereas eval() only single expression
use of function.cache = {} to memoize data

decorators - one who take function and incorporates it with additional functionality and returns it
example:
def positive_result(function):
  def wrapper(*args, **kwargs):
    result = function(*args, **kwargs)
    assert result >= 0, function.__name__ + "() result isn't >= 0"
    return result
  wrapper.__name__ = function.__name__
  wrapper.__doc__ = function.__doc__
  return wrapper

or:
def positive_result(function):
  @functools.wraps(function)
  def wrapper(*args, **kwargs):
    result = function(*args, **kwargs)
    assert result >= 0, function.__name__ + "() result isn't >= 0"
    return result
  return wrapper

decorators with argumets
@bounded(0, 100)
def percent(amount, total):
  return( amount / total) * 100

implementation:
def bounded(min, max):
  def decorator(function):
    @functools.wraps
    def wrapper(*args, **kwargs):
      result = function(*args, **kwargs)
      if result < min: return min
      if result > max: return max
    return wrapper
  return decorator

when assigning object attributes we can use folowing structure
class Point:
    __slots__ = ("x", "y")

    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

it works faster. if subclassing, we have to reimplement __slots__
if empty => __slots__ = ()

creating attributes on fly
class Ords:
    def __getattr__(self, char):
        return ord(char)
        
fast creating constants
Const = collections.namedtuple("_", "min max")(191, 591)
Const.min, Const.max

when accessing attributes first call is __getattribute__(), then __getattr__()

funtors::::::
class Strip:
    def __init__(self, characters):
        self.characters = characters

    def __call__(self, string):
        return string.string(self.characters)

more simple way (and less greedy)
def make_strip_function(characters):
    def strip_function(string):
        return string.strip(characters)
    return strip_function

enother example
class SortKey:
    def __init__(self, *attribute_names):
        self.attribute_names = attribute_names

    def __call__(self, instance):
        values = []
        for attribute_name in self.attribute_names:
            values.append(getattr(instance, attribute_name))
        return values


Context Managers:::
syntax:
with expression as variable:
    suite

open 2 or more context managers in one statement
try:
    with(open(source) as fin, open(target, "w") as fout:


Descriptors:::
Descriptors are classes which provide access control for the attributes of
other classes.

Class Decorators:::
same as func decorators

Abstract Base Classes:::
kind of promise - a promise that any derived class will provide the methods and properties that
the abstract base class specifies
two main groups of abs -- numbers and collections.

example abstract class
class Appliance(metaclass=abc.ABCMeta): # any subclass can be used
  # defines method that _must be_ reimplemented
  @abc.abstractmethod
  def __init__(self, model, price):
    self.__model = model
    self.price = price

  def get_price(self):
    return self.__price

  def set_price(self):
    self.__price = price

  # force reimplementing price property
  price = abc.abstractproperty(get_price, set_price)
  
  @property
  def model(self):
    return self.__model

default using of abc
class Cooker(Appliance):
  def __init__(self, model, price, fuel):
    super().__init__(model, price)
    self.fuel = fuel

  price = property(lambda self: super().price,
                  lambda self, price: super().set_price(price))
  
another example of abc
class TextFilter(metaclass=abc.ABCMeta):
  @abc.abstractproperty
  def is_transformet(self):
    raise NotImplementedError()

  @abc.abstractmethod
  def __call__(self):
    raise NotImplementedError()

register subcluss to python standart abc hierarchy
class SortedList:
  ...
collections.Sequence.register(SortedList)

metaclass that checks that methods are present
class LoadableSaveable(type):
  def __init__(cls, classname, bases, dictionary):
    super().__init__(classname, bases, dictionary)
    assert hasattr(cls, "load") and isinstance(getattr(cls, "load"), collections.Callable),
                      ("class '" + classname + "' must provide a load() method")

cls - instance of calling class
bases - base classes
dictionary - attributes

Functional-Style Programming

mapping - calling function on each item from iterable
list(map(lambda x: x**2, [1, 2, 3, 4]))   # returns: [1, 4, 9, 16]

filtering - taking one iterable and producing another
list(filter(lambda x: x > 0, [1, -2, 3, -4]))   # returns: [1, 3]

reduce - upply function on first two elements, then on result and  third element and etc
functools.reduce(lambda x, y: x * y, [1, 2, 3, 4]) # returns: 24
functools.reduce(operator.mul, [1, 2, 3, 4]) # returns: 24

operator contains all operators

python built-in reducing functions:
all(), any(), max(), min(), sum()

operator module provides the operator.attrgetter() and operator.itemgetter()
if list holds objects with priority attribute, we cat sort the list like this:
  L.sort(key=operator.attrgetter("priority"))

iterate over severa lists:
for valut in itertools.chain(data_list1, data_list2, data_list3):
  total += value
 
Partial Function Application
Creating one function from another but with fixed arguments
example:
enumerate1 = functools.partial(enumerate, start=1)
for lino, line in enumerate1(lines):
  process_line(i, line)


Coroutines:::

Create coroutine = create function that has at least one yield expression.
gaining happens as:
while True:
  match = (yield)
sending happens as:
matcher.send(html)
at the end receiver or whoever calls:
matcher.close()

creating pipelines:
pipeline = get_data(process(reporter()))

======================
Debugging, Testing, and Profiling
======================

Tracebacks should be read from last line. 
Catching all exceptions will lead to when user presses Ctrl+C the
  program will not stop and we lock the user.

Exception chaining
class InvalidDataError(Exception): pass

def process(data):
  try:
    i = int(data)
    ...
  except ValueError as err:
    raise InvalidDataError("Invalid data received") from err

Scientific Debugging:::
1. Think up an explanation
2. Create an experiment to test
3. Tun the experiment
Check the incoming parameters up to call stack. Check local variables
and return value
print(locals(), "\n")

Use of debugger pbd:
> python3 -m pdb my_program.py
orrrrrr
>
import pdb
pdb.set_trace()
Use of debugget idle

Unit Testing:::
E.g. testing individual functions, classes, and methods, to ensure that
they begave as expected.
Key point of TDD is when we want to add a feature - we first write a
test for it.
In functions that doesn't return anything, can be usefull to return fake
objects - thurd-party modules that provide "mock" objects
Python provides two unit testing modules:
  + doctest
  + unittest
Third-party testing tools:
  + nose
  + py.test

Writing doctests:
if __name__ == "__main__":
    import doctest
    doctest.testmod()

For programs:
if __name__ == "__main__":
    main()
then:
python3 -m doctest blocks.py
or module unittest can provide as with testing from file:
import doctest
import unittest
import blocks
suite = unittest.TestSuite()
suite.addTest(doctest.DocTestSuite(blocks))
runner = unittest.TextTestRunner()
print(runner.run(suite))

Unittest module defines four key concepts:
  test fixture - the code necessary to set up a test
  test suite - collection of test cases
  test case - basic unit of testing
  test runner - object that executes one or more test suites

Test suite creatied by inheritace unittest.TestCase class
test case = each method with name starting with "test"
any set up in setUp();
any cleanup in tearDown();
various unittest.TestCase methods:
  assertTrue()
  assertEqual()
  assertAlmostEqual() -- testing floating-point numbers
  assertRaises()
  many more
ends with:
if __name__ == "__main__":
  unittest.main()

when running from another file:
import unittest
import test_Atomic

suite =
unittest.TestLoader().loadTestsFromTestCase(test_Aromic.TestAtomic)
runner = unittest.TextTestRunner()
print(runner.run(suite))

asserting exceptions:
with self.asssertRaises(AttributeError):
  ...


Profiling:::
Best practices:
  prefer tuples to lists when a read-only sequence is needed
  use generators rather than creating large upbles or lists
  use python's built-in data structures
  instead of concatenating strings, turn them into list of strings and
    then join the list of strings into a single string at the end
  when object accessed a large number of times using attribute access,
    it may be better to create and use local variable that refers to the
    object to provide faster access

two modules for investigating the performance of out code:
  timeit - timing small pieces of out code
  cProfile - find bottlenecks

timeit:
if __name__ == "__main__":
  repeats = 1000
  for function in ("func_a", "func_b", "func_c"):
    t = timeit.Timer("{0}(X, Y)".format(function), "from __main__ import
      {0}, X, Y".format(function))
    sec = t.timeit(repeats)/ repeats
    print("{function}() {sec:.6f} sec".format(**locals()))
run it from cli:
python3 -m timeit -n 1000 -s "from MyModule import function_a, X, Y"
  "function_a(X, Y)"

cProfile:
if __name__ == "__main__":
  for function in ("function_a", "function_b", "function_c":
    cProfile.run("for i in range(1000): {0}(X, Y)".format(function))
cli:
python3 -m cProfile programOrModule.py

primitive call == nonrecursive function call
later we can do:
  cProfile.run("function_b()")
  python3 -m cProfile -o profileDataFile programOrModule.py
  and then use pstats


===========================
Processes and Threading====
===========================

subprocess module provides facilities for tunning other programs and
communicating using pipes.

example in grep-p, and grep-p-child, how to create child
how to pass arguments and nicely call same interpreter
how to write and read
how to wait for them and exit

Using the Threading Module

queue.Queue provides:
  + FIFO
  + LIFO
  + PriorityQueue
has garantee that only one thread has access (serialize access)

Threads are created by threading.Thred(callable) or we can pass subclass
of threading.Thread.
Threads are only started by .start() and they will wait until it's
possible.

use:
  + queue.put() to add task
  + queue.get() to get task
  + queue.task_done() complete task
  + queue.join() wait until all tasks are done

example in grep-t.py

could use of multiprocessing module.
it could be faster becouse each processor could be executed on separate
core.
methods to use: 
  + Worker class inherits multiprocessing.Process
  + multiprocessing.JoinableQueue instead of queue.Queue

to use own lock write next:
in class:
  _lock = threading.Lock()
in function
  with self._lock:
    ***
this will ensure that all class objects share the same lock and not
access object at the same time.

other available locks:
  + threading.RLock - can be used again by thread who blocked
  + threading.Semaphore - protect specific number of resources
  + threading.Condition - provides a wait condition

You can't archive best performance becouse CPython enterpreter can
execute Python code on only one processor at a time, even using multiple
threads.

with threading we devise come kind of communication, shared memory (mmap
module), shared files or networking

==============
==NETWORKING==
==============
(p. 465)

UDP is using when it's not necessary to create reliable connection
TCP - reliable connection and stream-oriented protocol

socketserver module handles the communication,
servicing each connection request, either serially or on own separate thread or
process

create server using inheritance from socketserver.Threading(Forking)MixIn and
socketserver.TCPServer (or UDP)
-> server = CarRegistrationServer(("", 9653), RequestHandler)
RequestHandler - class which will handle request
-> server.serve_forever()
at the end of try block with server write saving and shutdown

in handle(self) function read data from self.rfile and write data to
self.wfile

========================
==DATABASE PROGRAMMING==
========================

Pypi contains many database-related packages and interfaces to popular
client/server databases.
More Pythonic way to interact with databases is use of ORM (Object
Relational Mapper) : SQLAlchemy and SQLObject


=======================
==REGULAR EXPRESSIONS==
=======================

every character math one occurance
Special characters have to be escaped: \.^$?+*{}[]()|
[] - character class: means match one of the set.
[0-9] - means range, ^ in the beginning negate condition so
[^0-9] - not a digit.
  example: [\dA-Fa-f] matches any hexadecimal digit.
e{m,n} - e is minimum m and max n times meet in expression
e{m,m} can be write as e{m}
---> Symbol meaning
. any character except newline (or any character with re.DOTALL flag)
\d Unicode digit; [0-9] with re.ASCII flag
\D Unicode nondigit; [^0-9]
\s Unicode whitespace; [ \t\n\r\f\v]
\S Unicode nonwhitespace; [^ --\\--]
\w Unicode "word" character; [a-zA-Z0-9_]
\W Unicode non-"word" character; [^ --\\--]
--->
? means {0,1}
  example: travell?ed matches: traveled, travelled
+ means {1,n} - detecting typos couse by pressing a key too long
    (bevell+ed)
* means {0,n} - leads to unexpected results
??, +?, *? - nongreedily match
