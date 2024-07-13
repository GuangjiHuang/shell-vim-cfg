class MyStructPrinter:
    def __init__(self, val):
        self.val = val

    def to_string(self):
        # Define how to format your struct here
        return "Field1: {}, Field2: {}".format(self.val['field1'], self.val['field2'])

# Register the printer with GDB
gdb.pretty_printers.append(lambda val: ("my_struct" in str(val.type)) and MyStructPrinter(val))

