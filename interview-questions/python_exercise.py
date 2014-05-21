#!/usr/bin/python

# from python_exercise_answers import with_recipient

# implement this decorator
@with_recipient("bob")
def say_hello(recipient, sender=None):
    print "Hello {recipient}!".format(recipient=recipient)
    if sender:
        print "My name is {sender}.".format(sender=sender)

# implement a unit test for the say_hello function

# implement a unit test for the with_recipient decorator

if __name__ == "__main__":
    say_hello("alice")
