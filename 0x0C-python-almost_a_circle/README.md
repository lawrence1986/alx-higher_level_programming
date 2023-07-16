## 0x0C. Python - Almost a circle
GENERAL 📖📖📖:
What is Unit testing and how to implement it in a large project
How to serialize and deserialize a Class
How to write and read a JSON file
What is *args and how to use it
What is **kwargs and how to use it
How to handle named arguments in a function
RESOURCES:
args/kwargs
JSON encoder and decoder
unittest module
Python test cheatsheet
INTRODUCTION TO FILES 📕📕📕:
models/rectangle.py: Write the class Rectangle that inherits from BaseWhy private attributes with getter/setter? Why not directly public attribute?Because we want to protect attributes of our class. With a setter, you are able to validate what a developer is trying to assign to a variable. So after, in your class you can “trust” these attributes.
models/rectangle.py: Update the class Rectangle by adding validation of all setter methods and instantiation (id excluded)
models/rectangle.py: Update the class Rectangle by adding the public method def area(self) that returns the area value of the Rectangle instance.
models/rectangle.py: Update the class Rectangle by adding the public method def display(self) that prints in stdout the Rectangle instance with the character # - you don’t need to handle x and y here.
models/rectangle.py: Update the class Rectangle by overriding the str method so that it returns [Rectangle] (<id>) <x>/<y> - <width>/<height>
models/rectangle.py: Update the class Rectangle by improving the public method def display(self) to print in stdout the Rectangle instance with the character # by taking care of x and y
models/rectangle.py: Update the class Rectangle by adding the public method def update(self, *args) that assigns an argument to each attributeThis type of argument is called a “no-keyword argument” - Argument order is super important.
models/rectangle.py: Update the class Rectangle by updating the public method def update(self, *args) by changing the prototype to update(self, *args, **kwargs) that assigns a key/value argument to attributesThis type of argument is called a “key-worded argument”. Argument order is not important.
models/square.py: Write the class Square that inherits from RectangleAs you know, a Square is a special Rectangle, so it makes sense this class Square inherits from Rectangle. Now you have a Square class who has the same attributes and same methods.
models/square.py: Update the class Square by adding the public getter and setter size
models/square.py: Update the class Square by adding the public method def update(self, *args, **kwargs) that assigns attributes
models/rectangle.py: Update the class Rectangle by adding the public method def to_dictionary(self) that returns the dictionary representation of a RectangleThis dictionary must contain
models/square.py: Update the class Square by adding the public method def to_dictionary(self) that returns the dictionary representation of a SquareThis dictionary must contain
models/base.py: JSON is one of the standard formats for sharing data representation.Update the class Base by adding the static method def to_json_string(list_dictionaries) that returns the JSON string representation of list_dictionaries
models/base.py: Update the class Base by adding the class method def save_to_file(cls, list_objs) that writes the JSON string representation of list_objs to a file
models/base.py: Update the class Base by adding the static method def from_json_string(json_string) that returns the list of the JSON string representation json_string
models/base.py: Update the class Base by adding the class method def create(cls, **dictionary) that returns an instance with all attributes already set
models/base.py: Update the class Base by adding the class method def load_from_file(cls) that returns a list of instances
models/: Update the class Base by adding the class methods def save_to_file_csv(cls, list_objs) and def load_from_file_csv(cls) that serializes and deserializes in CSV
FILES 📑📑📑:
models/rectangle.py

Write the class Rectangle that inherits from Base

Why private attributes with getter/setter? Why not directly public attribute?

Because we want to protect attributes of our class. With a setter, you are able to validate what a developer is trying to assign to a variable. So after, in your class you can “trust” these attributes.

guillaume@ubuntu:~/$ cat 1-main.py
#!/usr/bin/python3
""" 1-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(10, 2)
    print(r1.id)

    r2 = Rectangle(2, 10)
    print(r2.id)

    r3 = Rectangle(10, 2, 0, 0, 12)
    print(r3.id)

guillaume@ubuntu:~/$ ./1-main.py
1
2
12
guillaume@ubuntu:~/$ 
models/rectangle.py

Update the class Rectangle by adding validation of all setter methods and instantiation (id excluded)

guillaume@ubuntu:~/$ cat 2-main.py
#!/usr/bin/python3
""" 2-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    try:
        Rectangle(10, "2")
    except Exception as e:
        print("[{}] {}".format(e.__class__.__name__, e))

    try:
        r = Rectangle(10, 2)
        r.width = -10
    except Exception as e:
        print("[{}] {}".format(e.__class__.__name__, e))

    try:
        r = Rectangle(10, 2)
        r.x = {}
    except Exception as e:
        print("[{}] {}".format(e.__class__.__name__, e))

    try:
        Rectangle(10, 2, 3, -1)
    except Exception as e:
        print("[{}] {}".format(e.__class__.__name__, e))

guillaume@ubuntu:~/$ ./2-main.py
[TypeError] height must be an integer
[ValueError] width must be > 0
[TypeError] x must be an integer
[ValueError] y must be >= 0
guillaume@ubuntu:~/$ 
models/rectangle.py

Update the class Rectangle by adding the public method def area(self) that returns the area value of the Rectangle instance.

guillaume@ubuntu:~/$ cat 3-main.py
#!/usr/bin/python3
""" 3-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(3, 2)
    print(r1.area())

    r2 = Rectangle(2, 10)
    print(r2.area())

    r3 = Rectangle(8, 7, 0, 0, 12)
    print(r3.area())

guillaume@ubuntu:~/$ ./3-main.py
6
20
56
guillaume@ubuntu:~/$ 
models/rectangle.py

Update the class Rectangle by adding the public method def display(self) that prints in stdout the Rectangle instance with the character # - you don’t need to handle x and y here.

guillaume@ubuntu:~/$ cat 4-main.py
#!/usr/bin/python3
""" 4-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(4, 6)
    r1.display()

    print("---")

    r1 = Rectangle(2, 2)
    r1.display()

guillaume@ubuntu:~/$ ./4-main.py
####
####
####
####
####
####
---
##
##
guillaume@ubuntu:~/$ 
models/rectangle.py

Update the class Rectangle by overriding the str method so that it returns [Rectangle] (<id>) <x>/<y> - <width>/<height>

guillaume@ubuntu:~/$ cat 5-main.py
#!/usr/bin/python3
""" 5-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(4, 6, 2, 1, 12)
    print(r1)

    r2 = Rectangle(5, 5, 1)
    print(r2)

guillaume@ubuntu:~/$ ./5-main.py
[Rectangle] (12) 2/1 - 4/6
[Rectangle] (1) 1/0 - 5/5
guillaume@ubuntu:~/$ 
models/rectangle.py

Update the class Rectangle by improving the public method def display(self) to print in stdout the Rectangle instance with the character # by taking care of x and y

guillaume@ubuntu:~/$ cat 6-main.py
#!/usr/bin/python3
""" 6-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(2, 3, 2, 2)
    r1.display()

    print("---")

    r2 = Rectangle(3, 2, 1, 0)
    r2.display()

guillaume@ubuntu:~/$ ./6-main.py | cat -e
$
$
  ##$
  ##$
  ##$
---$
 ###$
 ###$
guillaume@ubuntu:~/$ 
models/rectangle.py
*

Update the class Rectangle by adding the public method def update(self, args) that assigns an argument to each attribute

This type of argument is called a “no-keyword argument” - Argument order is super important.

guillaume@ubuntu:~/$ cat 7-main.py
#!/usr/bin/python3
""" Doc """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(10, 10, 10, 10)
    print(r1)

    r1.update(89)
    print(r1)

    r1.update(89, 2)
    print(r1)

    r1.update(89, 2, 3)
    print(r1)

    r1.update(89, 2, 3, 4)
    print(r1)

    r1.update(89, 2, 3, 4, 5)
    print(r1)

guillaume@ubuntu:~/$ ./7-main.py
[Rectangle] (1) 10/10 - 10/10
[Rectangle] (89) 10/10 - 10/10
[Rectangle] (89) 10/10 - 2/10
[Rectangle] (89) 10/10 - 2/3
[Rectangle] (89) 4/10 - 2/3
[Rectangle] (89) 4/5 - 2/3
guillaume@ubuntu:~/$ 
models/rectangle.py
**

Update the class Rectangle by updating the public method def update(self, *args) by changing the prototype to update(self, *args, kwargs) that assigns a key/value argument to attributes

This type of argument is called a “key-worded argument”. Argument order is not important.

guillaume@ubuntu:~/$ cat 8-main.py
#!/usr/bin/python3
""" 8-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(10, 10, 10, 10)
    print(r1)

    r1.update(height=1)
    print(r1)

    r1.update(width=1, x=2)
    print(r1)

    r1.update(y=1, width=2, x=3, id=89)
    print(r1)

    r1.update(x=1, height=2, y=3, width=4)
    print(r1)

guillaume@ubuntu:~/$ ./8-main.py
[Rectangle] (1) 10/10 - 10/10
[Rectangle] (1) 10/10 - 10/1
[Rectangle] (1) 2/10 - 1/1
[Rectangle] (89) 3/1 - 2/1
[Rectangle] (89) 1/3 - 4/2
guillaume@ubuntu:~/$ 
models/square.py

Write the class Square that inherits from Rectangle

As you know, a Square is a special Rectangle, so it makes sense this class Square inherits from Rectangle. Now you have a Square class who has the same attributes and same methods.

guillaume@ubuntu:~/$ cat 9-main.py
#!/usr/bin/python3
""" 9-main """
from models.square import Square

if __name__ == "__main__":

    s1 = Square(5)
    print(s1)
    print(s1.area())
    s1.display()

    print("---")

    s2 = Square(2, 2)
    print(s2)
    print(s2.area())
    s2.display()

    print("---")

    s3 = Square(3, 1, 3)
    print(s3)
    print(s3.area())
    s3.display()

guillaume@ubuntu:~/$ ./9-main.py
[Square] (1) 0/0 - 5
25
#####
#####
#####
#####
#####
---
[Square] (2) 2/0 - 2
4
  ##
  ##
---
[Square] (3) 1/3 - 3
9



 ###
 ###
 ###
guillaume@ubuntu:~/$ 
models/square.py

Update the class Square by adding the public getter and setter size

guillaume@ubuntu:~/$ cat 10-main.py
#!/usr/bin/python3
""" 10-main """
from models.square import Square

if __name__ == "__main__":

    s1 = Square(5)
    print(s1)
    print(s1.size)
    s1.size = 10
    print(s1)

    try:
        s1.size = "9"
    except Exception as e:
        print("[{}] {}".format(e.__class__.__name__, e))

guillaume@ubuntu:~/$ ./10-main.py
[Square] (1) 0/0 - 5
5
[Square] (1) 0/0 - 10
[TypeError] width must be an integer
guillaume@ubuntu:~/$ 
models/square.py
**

Update the class Square by adding the public method def update(self, *args, kwargs) that assigns attributes

guillaume@ubuntu:~/$ cat 11-main.py
#!/usr/bin/python3
""" 11-main """
from models.square import Square

if __name__ == "__main__":

    s1 = Square(5)
    print(s1)

    s1.update(10)
    print(s1)

    s1.update(1, 2)
    print(s1)

    s1.update(1, 2, 3)
    print(s1)

    s1.update(1, 2, 3, 4)
    print(s1)

    s1.update(x=12)
    print(s1)

    s1.update(size=7, y=1)
    print(s1)

    s1.update(size=7, id=89, y=1)
    print(s1)

guillaume@ubuntu:~/$ ./11-main.py
[Square] (1) 0/0 - 5
[Square] (10) 0/0 - 5
[Square] (1) 0/0 - 2
[Square] (1) 3/0 - 2
[Square] (1) 3/4 - 2
[Square] (1) 12/4 - 2
[Square] (1) 12/1 - 7
[Square] (89) 12/1 - 7
guillaume@ubuntu:~/$ 
models/rectangle.py

Update the class Rectangle by adding the public method def to_dictionary(self) that returns the dictionary representation of a Rectangle

This dictionary must contain

guillaume@ubuntu:~/$ cat 12-main.py
#!/usr/bin/python3
""" 12-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(10, 2, 1, 9)
    print(r1)
    r1_dictionary = r1.to_dictionary()
    print(r1_dictionary)
    print(type(r1_dictionary))

    r2 = Rectangle(1, 1)
    print(r2)
    r2.update(**r1_dictionary)
    print(r2)
    print(r1 == r2)

guillaume@ubuntu:~/$ ./12-main.py
[Rectangle] (1) 1/9 - 10/2
{'x': 1, 'y': 9, 'id': 1, 'height': 2, 'width': 10}
<class 'dict'>
[Rectangle] (2) 0/0 - 1/1
[Rectangle] (1) 1/9 - 10/2
False
guillaume@ubuntu:~/$ 
models/square.py

Update the class Square by adding the public method def to_dictionary(self) that returns the dictionary representation of a Square

This dictionary must contain

guillaume@ubuntu:~/$ cat 13-main.py
#!/usr/bin/python3
""" 13-main """
from models.square import Square

if __name__ == "__main__":

    s1 = Square(10, 2, 1)
    print(s1)
    s1_dictionary = s1.to_dictionary()
    print(s1_dictionary)
    print(type(s1_dictionary))

    s2 = Square(1, 1)
    print(s2)
    s2.update(**s1_dictionary)
    print(s2)
    print(s1 == s2)

guillaume@ubuntu:~/$ ./13-main.py
[Square] (1) 2/1 - 10
{'id': 1, 'x': 2, 'size': 10, 'y': 1}
<class 'dict'>
[Square] (2) 1/0 - 1
[Square] (1) 2/1 - 10
False
guillaume@ubuntu:~/$ 
models/base.py

JSON is one of the standard formats for sharing data representation.

Update the class Base by adding the static method def to_json_string(list_dictionaries) that returns the JSON string representation of list_dictionaries

guillaume@ubuntu:~/$ cat 14-main.py
#!/usr/bin/python3
""" 14-main """
from models.base import Base
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(10, 7, 2, 8)
    dictionary = r1.to_dictionary()
    json_dictionary = Base.to_json_string([dictionary])
    print(dictionary)
    print(type(dictionary))
    print(json_dictionary)
    print(type(json_dictionary))

guillaume@ubuntu:~/$ ./14-main.py
{'x': 2, 'width': 10, 'id': 1, 'height': 7, 'y': 8}
<class 'dict'>
[{"x": 2, "width": 10, "id": 1, "height": 7, "y": 8}]
<class 'str'>
guillaume@ubuntu:~/$ 
models/base.py

Update the class Base by adding the class method def save_to_file(cls, list_objs) that writes the JSON string representation of list_objs to a file

guillaume@ubuntu:~/$ cat 15-main.py
#!/usr/bin/python3
""" 15-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(10, 7, 2, 8)
    r2 = Rectangle(2, 4)
    Rectangle.save_to_file([r1, r2])

    with open("Rectangle.json", "r") as file:
        print(file.read())

guillaume@ubuntu:~/$ ./15-main.py
[{"y": 8, "x": 2, "id": 1, "width": 10, "height": 7}, {"y": 0, "x": 0, "id": 2, "width": 2, "height": 4}]
guillaume@ubuntu:~/$ 
models/base.py

Update the class Base by adding the static method def from_json_string(json_string) that returns the list of the JSON string representation json_string

guillaume@ubuntu:~/$ cat 16-main.py
#!/usr/bin/python3
""" 16-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    list_input = [
        {'id': 89, 'width': 10, 'height': 4}, 
        {'id': 7, 'width': 1, 'height': 7}
    ]
    json_list_input = Rectangle.to_json_string(list_input)
    list_output = Rectangle.from_json_string(json_list_input)
    print("[{}] {}".format(type(list_input), list_input))
    print("[{}] {}".format(type(json_list_input), json_list_input))
    print("[{}] {}".format(type(list_output), list_output))

guillaume@ubuntu:~/$ ./16-main.py
[<class 'list'>] [{'height': 4, 'width': 10, 'id': 89}, {'height': 7, 'width': 1, 'id': 7}]
[<class 'str'>] [{"height": 4, "width": 10, "id": 89}, {"height": 7, "width": 1, "id": 7}]
[<class 'list'>] [{'height': 4, 'width': 10, 'id': 89}, {'height': 7, 'width': 1, 'id': 7}]
guillaume@ubuntu:~/$ 
models/base.py
**

Update the class Base by adding the class method def create(cls, dictionary) that returns an instance with all attributes already set

guillaume@ubuntu:~/$ cat 17-main.py
#!/usr/bin/python3
""" 17-main """
from models.rectangle import Rectangle

if __name__ == "__main__":

    r1 = Rectangle(3, 5, 1)
    r1_dictionary = r1.to_dictionary()
    r2 = Rectangle.create(**r1_dictionary)
    print(r1)
    print(r2)
    print(r1 is r2)
    print(r1 == r2)

guillaume@ubuntu:~/$ ./17-main.py
[Rectangle] (1) 1/0 - 3/5
[Rectangle] (1) 1/0 - 3/5
False
False
guillaume@ubuntu:~/$ 
models/base.py

Update the class Base by adding the class method def load_from_file(cls) that returns a list of instances

guillaume@ubuntu:~/$ cat 18-main.py
#!/usr/bin/python3
""" 18-main """
from models.rectangle import Rectangle
from models.square import Square

if __name__ == "__main__":

    r1 = Rectangle(10, 7, 2, 8)
    r2 = Rectangle(2, 4)
    list_rectangles_input = [r1, r2]

    Rectangle.save_to_file(list_rectangles_input)

    list_rectangles_output = Rectangle.load_from_file()

    for rect in list_rectangles_input:
        print("[{}] {}".format(id(rect), rect))

    print("---")

    for rect in list_rectangles_output:
        print("[{}] {}".format(id(rect), rect))

    print("---")
    print("---")

    s1 = Square(5)
    s2 = Square(7, 9, 1)
    list_squares_input = [s1, s2]

    Square.save_to_file(list_squares_input)

    list_squares_output = Square.load_from_file()

    for square in list_squares_input:
        print("[{}] {}".format(id(square), square))

    print("---")

    for square in list_squares_output:
        print("[{}] {}".format(id(square), square))

guillaume@ubuntu:~/$ ./18-main.py
[139785912033120] [Rectangle] (1) 2/8 - 10/7
[139785912033176] [Rectangle] (2) 0/0 - 2/4
---
[139785911764752] [Rectangle] (1) 2/8 - 10/7
[139785911764808] [Rectangle] (2) 0/0 - 2/4
---
---
[139785912058040] [Square] (5) 0/0 - 5
[139785912061848] [Square] (6) 9/1 - 7
---
[139785911764976] [Square] (5) 0/0 - 5
[139785911765032] [Square] (6) 9/1 - 7
guillaume@ubuntu:~/$ 
models/

Update the class Base by adding the class methods def save_to_file_csv(cls, list_objs) and def load_from_file_csv(cls) that serializes and deserializes in CSV

guillaume@ubuntu:~/$ cat 100-main.py
#!/usr/bin/python3
""" 100-main """
from models.rectangle import Rectangle
from models.square import Square

if __name__ == "__main__":

    r1 = Rectangle(10, 7, 2, 8)
    r2 = Rectangle(2, 4)
    list_rectangles_input = [r1, r2]

    Rectangle.save_to_file_csv(list_rectangles_input)

    list_rectangles_output = Rectangle.load_from_file_csv()

    for rect in list_rectangles_input:
        print("[{}] {}".format(id(rect), rect))

    print("---")

    for rect in list_rectangles_output:
        print("[{}] {}".format(id(rect), rect))

    print("---")
    print("---")

    s1 = Square(5)
    s2 = Square(7, 9, 1)
    list_squares_input = [s1, s2]

    Square.save_to_file_csv(list_squares_input)

    list_squares_output = Square.load_from_file_csv()

    for square in list_squares_input:
        print("[{}] {}".format(id(square), square))

    print("---")

    for square in list_squares_output:
        print("[{}] {}".format(id(square), square))

guillaume@ubuntu:~/$ ./100-main.py
[140268695797600] [Rectangle] (1) 2/8 - 10/7
[140268695797656] [Rectangle] (2) 0/0 - 2/4
---
[140268695529008] [Rectangle] (1) 2/8 - 10/7
[140268695528952] [Rectangle] (2) 0/0 - 2/4
---
---
[140268695822520] [Square] (5) 0/0 - 5
[140268695826328] [Square] (6) 9/1 - 7
---
[140268695529232] [Square] (5) 0/0 - 5
[140268695529176] [Square] (6) 9/1 - 7
guillaume@ubuntu:~/$
