#$LOAD_PATH.unshift('.')

require 'erb'

require_relative 'VarDef'
require_relative 'Function'
require_relative 'StructDef'
require_relative 'MethodDef'

require_relative 'IfStatement'
require_relative 'ReturnStatement'
require_relative 'WhileStatement'

require_relative 'BinaryExpression'
require_relative 'CallExpression'

require_relative 'Name'
require_relative 'BooleanLiteral'
require_relative 'CharacterLiteral'
require_relative 'IntegerLiteral'
require_relative 'FloatingPointLiteral'

require_relative 'Gen'

require_relative 'Test1'
require_relative 'Test2'

g1a = Gen::Test1a.new(10)
g1b = Gen::Test1b.new(20)

puts g1a.val
puts g1b.val

g2 = Gen::Test2.new(30)

puts g2.val


e0 = CharacterLiteral.new("t");
puts e0.render();

# expression
e1 = IntegerLiteral.new("4");
e2 = IntegerLiteral.new("1");
e3 = IntegerLiteral.new("2");

e4 = BinaryExpression.new("+", e1, e2);
e5 = BinaryExpression.new('/', e3, e4);

e6 = Expression.new(e5);

puts e6.render

name = Name.new("x");


# Call Expression
call = CallExpression.new("sin")
call.args.add(name)
call.args.add(e1)

e7 = BinaryExpression.new("+", e2, call)
puts e7.render

# If/While Statement

cmp = BinaryExpression.new('<', name, e3)

ifStmt = IfStatement.new(cmp, e5)
puts ifStmt.render

whileStmt = WhileStatement.new(cmp, e5)
puts whileStmt.render

# var x: int = 2 / (4 + 1);

v = VarDef.new("a", "int", e5)
puts v.renderSource()

# return 4 + 1;

rs = ReturnStatement.new(e4)
puts rs.render


# def add (x: float, y: float): float {
#   return x + y;
# }

f = Function.new("add", "float")
f.params.add("x", "float")
f.params.add("y", "float")

puts f.renderHeader
puts f.renderSource


fm = Function.new("main", "int")

puts fm.renderHeader
puts fm.renderSource


s = StructDef.new("Complex")
puts s.renderSource

m = MethodDef.new("Complex", "conj", "double")
m.params.add("self", "Complex*")
m.params.add("x", "float")
m.params.add("y", "float")
puts m.renderSource

