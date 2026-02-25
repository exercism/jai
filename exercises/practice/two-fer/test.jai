#load "two_fer.jai";

#import "Basic";

main :: () {
    no_name_given();
    test_a_name_given();
    another_name_given();
}

no_name_given :: () {
	assert_eq("One for you, one for me.", two_fer());
}

test_a_name_given :: () {
	assert_eq("One for Alice, one for me.", two_fer("Alice"));
}

another_name_given :: () {
	assert_eq("One for Bob, one for me.", two_fer("Bob"));
}

code_to_string :: (code: Code) -> string #expand {
    PP       :: #import "Program_Print";
    Compiler :: #import "Compiler";
    code_node := Compiler.compiler_get_nodes(code);
    builder: String_Builder;
    PP.print_expression(*builder, code_node);
    return builder_to_string(*builder,, allocator=temp);
}

assert_eq :: (a: Code, b: Code) #expand {
  sa := #run code_to_string(a);
  va := #insert a;
  
  sb := #run code_to_string(b);
  vb := #insert b;
  assert(va == vb, 
    "(left == right)\n  left: %  expr: %\n  right: %  expr: %\n  loc: %\n",
    va, sa, vb, sb,
    #location(a));
}
